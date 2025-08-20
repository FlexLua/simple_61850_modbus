-- IEC61850 Ethernet config
mac = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00} -- device MAC (all 0x00 => chip unique MAC)
ip = {192, 168, 0, 111} -- device IP
subm = {255,255,255,0} -- subnet mask
gw = {192, 168, 0, 1} -- gateway
dns = {8,8,8,8} -- DNS
port = 102 -- local port (61850 server)

--------------!! IMPORTANT: Ensure YC_List and MB_List are one-to-one !!------------------

-- IEC61850 telemetry data points
YC_List = 
{
	-- Transformer #1
	{"RTU/GGIO1.AnIn1", ".mag.f", "FLOAT32"}, -- float, phase A temperature
	{"RTU/GGIO1.AnIn2", ".mag.f", "FLOAT32"}, -- float, phase B temperature
	{"RTU/GGIO1.AnIn3", ".mag.f", "FLOAT32"},  -- float, phase C temperature
	{"RTU/GGIO1.Inc1", ".stVal", "INT32"}, -- int, phase A sensor RSSI
	{"RTU/GGIO1.Inc2", ".stVal", "INT32"}, -- int, phase B sensor RSSI
	{"RTU/GGIO1.Inc3", ".stVal", "INT32"}  -- int, phase C sensor RSSI

}

-- Modbus telemetry data points
MB_POLL_TIME_MS = 5000 -- min poll period for all RS485 devices (ms); may be longer if comms are slow
MB_INTERVAL_MS = 100 -- min interval between RS485 transactions (ms)
MB_List = 
{
	-- Transformer #1
	{
		-- 115200, no parity, 1 stop bit, func "03", addr 0x02, timeout 100ms, gap 1000ms
		com = {"BAUDRATE_115200","NoneParity","StopBit_1","03",0x02,100,1000},  
		data = 
		{
			{"RTU/GGIO1.AnIn1",0x0030,"U_AB",2}, -- phase A temp, 2 decimals (×0.01)
			{"RTU/GGIO1.AnIn2",0x0031,"U_AB",2}, -- phase B temp, 2 decimals (×0.01)
			{"RTU/GGIO1.AnIn3",0x0032,"U_AB",2}, -- phase C temp, 2 decimals (×0.01)
			{"RTU/GGIO1.Inc1",0x0060,"U_AB",2}, -- RSSI A, int
			{"RTU/GGIO1.Inc2",0x0061,"U_AB",2}, -- RSSI B, int
			{"RTU/GGIO1.Inc3",0x0062,"U_AB",2}  -- RSSI C, int
		}
	}
}

-- Pin definitions
WDT_PIN = "D11"
BLED_PIN = "D7"
GLED_PIN = "D8"
RLED_PIN = "D9"
ETHRST_PIN = "D5"
RS485_PIN = "D0"

-- Globals
UpdatePeriodCntMs = 0 -- Modbus poll period counter (ms)
DelayMsCnt = 0
BlueLedOnCntMs = 0
GreenLedOnCntMs = 0
RedLedOnCntMs = 0

-- Delay n milliseconds
function DelayMs(n)
	DelayMsCnt = 0
	while DelayMsCnt < n do
		GC(1)
	end
end

-- Read Modbus slave data and sync to IEC61850
function ModbusToIec61850()
	-- Poll each RS485 slave defined in MB_List
	for i, mb in ipairs(MB_List) do
		LIB_ModbusToJsonConfig(4096)
		-- Add all Modbus telemetry registers under this slave
		for j, data in ipairs(mb.data) do
			LIB_ModbusToJsonAdd(data[2], data[3], data[4], data[1])
		end
		-- Send per configured params via RS485 to get telemetry
		LIB_ModbusToJsonSend(mb.com[1], mb.com[2], mb.com[3], mb.com[4], mb.com[5], mb.com[6], mb.com[7])
		-- Wait for RS485 to finish
		while(GC(1) == true)
		do
			Finish,Data,Err = LIB_ModbusToJsonFinishCheck()
			if Finish == 1 then
				if Data == "null" then -- RS485 error
					RedLedOnCntMs = 100 -- red LED 0.1s
					print(string.format("MB_LIST[%d]:", i)..Err) -- log
				else -- success
					GreenLedOnCntMs = 100 -- green LED 0.1s
					print(string.format("MB_LIST[%d]:", i)..Data)
					for k, yc in ipairs(YC_List) do -- iterate 61850 points
						if yc[3] == "FLOAT32" then
							Json_Val_Float32 = LIB_JsonExDotParse(Data, "$."..yc[1], "Number")
							if Json_Val_Float32 ~= nil then
								LIB_IEC61850OprNode("YC_RM", yc[1]..yc[2], Json_Val_Float32)
							else
								print("json parse "..yc[1].." error")
							end
						elseif yc[3] == "INT32" then
							Json_Val_Int32 = LIB_JsonExDotParse(Data, "$."..yc[1], "Int32")
							if Json_Val_Int32 ~= nil then
								LIB_IEC61850OprNode("YC_RM", yc[1]..yc[2], Json_Val_Int32)
							else
								print("json parse "..yc[1].." error")
							end
						end
					end
				end
				DelayMs(MB_INTERVAL_MS) -- delay 100ms
				break -- exit while
			end
		end
	end
end

-- 10ms timer callback (must be named LIB_10msTimerCallback)
function LIB_10msTimerCallback()
	UpdatePeriodCntMs = UpdatePeriodCntMs + 10
	DelayMsCnt = DelayMsCnt + 10
	-- watchdog kick
	LIB_GpioToggle(WDT_PIN)
	-- LED blink timing
	if BlueLedOnCntMs > 0 then
		BlueLedOnCntMs = BlueLedOnCntMs - 10
		LIB_GpioWrite(BLED_PIN, 0) -- Blue on 
	else
		LIB_GpioWrite(BLED_PIN, 1) -- Blue off
	end
	if GreenLedOnCntMs > 0 then
		GreenLedOnCntMs = GreenLedOnCntMs - 10
		LIB_GpioWrite(GLED_PIN, 0) -- Green on
	else
		LIB_GpioWrite(GLED_PIN, 1) -- Green off
	end
	if RedLedOnCntMs > 0 then
		RedLedOnCntMs = RedLedOnCntMs - 10
		LIB_GpioWrite(RLED_PIN, 0) -- Red on
	else
		LIB_GpioWrite(RLED_PIN, 1) -- Red off
	end
	-- keep blue on when IEC61850 connected and others idle
	if LIB_IEC61850NetIsConnect() == 1 and GreenLedOnCntMs <= 0 and RedLedOnCntMs <= 0then
		BlueLedOnCntMs = 1000
	else
		BlueLedOnCntMs = 0
	end
end

-- Initialization
LIB_LuaTfLogDisable()
-- map sys red/green LEDs to D9/D8
LIB_SysLedConfig("D9","D8")
LIB_UsbConfig("CDC")-- enable USB log
-- watchdog pin
LIB_GpioOutputConfig(WDT_PIN,"STANDARD")
-- RGB LED pins B,G,R
LIB_GpioOutputConfig(BLED_PIN, "STANDARD")
LIB_GpioOutputConfig(GLED_PIN, "STANDARD")
LIB_GpioOutputConfig(RLED_PIN, "STANDARD")
LIB_GpioWrite(BLED_PIN, 1) -- Blue off
LIB_GpioWrite(GLED_PIN, 1) -- Green off
LIB_GpioWrite(RLED_PIN, 1) -- Red off 
-- RS485 init
LIB_Uart1Rs485Config("BAUDRATE_115200", RS485_PIN)

-- RGB blink x3
for i=1, 3 do
	LIB_GpioWrite(GLED_PIN, 0)
	LIB_DelayMs(100)
	LIB_GpioWrite(GLED_PIN, 1)
	LIB_DelayMs(400)
	
	LIB_GpioWrite(BLED_PIN, 0)
	LIB_DelayMs(100)
	LIB_GpioWrite(BLED_PIN, 1)
	LIB_DelayMs(400)
	
	LIB_GpioWrite(RLED_PIN, 0)
	LIB_DelayMs(100)
	LIB_GpioWrite(RLED_PIN, 1)
	LIB_DelayMs(400)
end
-- add IEC61850 telemetry points
LIB_IEC61850AddNode("YC_RM", YC_List)
-- enable 10ms system timer
LIB_10msTimerConfig("ENABLE")
-- set W5500 SPI pins MISO,MOSI,CLK,CS on D1,D2,D3,D4; RST on D5; start MMS Server
LIB_IEC61850ServerStart("SPI_1",ETHRST_PIN,mac,ip,subm,gw,dns,port,60)
-- auto reboot if no peer msg for 7200s
--LIB_IEC61850NetAutoFixCfg(7200, "SYS_REBOOT")
-- main loop
while(GC(1) == true)
do
	-- update telemetry every MB_POLL_TIME_MS
	if UpdatePeriodCntMs > MB_POLL_TIME_MS then
		UpdatePeriodCntMs = 0
		ModbusToIec61850()
	end
	--LIB_IEC61850NetFixDeamon()
end