-- IEC61850 Ethernet config
mac = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00} -- device MAC (all 0x00 => chip unique MAC)
ip = {192, 168, 0, 111} -- device IP
subm = {255,255,255,0} -- subnet mask
gw = {192, 168, 0, 1} -- gateway
dns = {8,8,8,8} -- DNS
port = 102 -- local port (61850 server)

--------------!! IMPORTANT: Ensure YX_List and MB_List are one-to-one !!------------------

-- IEC61850 remote signaling data points
YX_List = 
{
	-- Modbus IO input monitor #1 (4 inputs)
	{"RTU/GGIO1.Ind1", ".stVal"}, -- binary IO input, 0 or 1
	{"RTU/GGIO1.Ind2", ".stVal"}, -- binary IO input, 0 or 1
	{"RTU/GGIO1.Ind3", ".stVal"}, -- binary IO input, 0 or 1
	{"RTU/GGIO1.Ind4", ".stVal"}, -- binary IO input, 0 or 1
	-- Modbus IO input monitor #2 (4 inputs)
	{"RTU/GGIO2.Ind1", ".stVal"}, -- binary IO input, 0 or 1
	{"RTU/GGIO2.Ind2", ".stVal"}, -- binary IO input, 0 or 1
	{"RTU/GGIO2.Ind3", ".stVal"}, -- binary IO input, 0 or 1
	{"RTU/GGIO2.Ind4", ".stVal"}, -- binary IO input, 0 or 1
	-- Modbus IO input monitor #3 (4 inputs)
	{"RTU/GGIO3.Ind1", ".stVal"}, -- binary IO input, 0 or 1
	{"RTU/GGIO3.Ind2", ".stVal"}, -- binary IO input, 0 or 1
	{"RTU/GGIO3.Ind3", ".stVal"}, -- binary IO input, 0 or 1
	{"RTU/GGIO3.Ind4", ".stVal"}  -- binary IO input, 0 or 1
}

-- Modbus remote signaling data points
MB_POLL_TIME_MS = 5000 -- min poll period for all RS485 devices (ms); may be longer if comms are slow
MB_INTERVAL_MS = 100 -- min interval between RS485 transactions (ms)
MB_List = 
{
	-- Unit #1 (4 inputs)
	{
		-- 9600, no parity, 1 stop bit, func "01", addr 0x05, timeout 100ms, gap 1000ms
		com = {"BAUDRATE_9600","NoneParity","StopBit_1","01",0x05,100,1000},  
		data = 
		{
			{"RTU/GGIO1.Ind1",0x0000,"BIT",0}, -- read coil, 0/1
			{"RTU/GGIO1.Ind2",0x0001,"BIT",0}, -- read coil, 0/1
			{"RTU/GGIO1.Ind3",0x0002,"BIT",0}, -- read coil, 0/1
			{"RTU/GGIO1.Ind4",0x0003,"BIT",0}  -- read coil, 0/1
		}
	},
	-- Unit #2 (4 inputs)
	{
		-- 9600, no parity, 1 stop bit, func "01", addr 0x06, timeout 100ms, gap 1000ms
		com = {"BAUDRATE_9600","NoneParity","StopBit_1","01",0x06,100,1000},  
		data = 
		{
			{"RTU/GGIO2.Ind1",0x0000,"BIT",0}, -- read coil, 0/1
			{"RTU/GGIO2.Ind2",0x0001,"BIT",0}, -- read coil, 0/1
			{"RTU/GGIO2.Ind3",0x0002,"BIT",0}, -- read coil, 0/1
			{"RTU/GGIO2.Ind4",0x0003,"BIT",0}  -- read coil, 0/1
		}
	},
	-- Unit #3 (4 inputs)
	{
		-- 9600, no parity, 1 stop bit, func "01", addr 0x07, timeout 100ms, gap 1000ms
		com = {"BAUDRATE_9600","NoneParity","StopBit_1","01",0x07,100,1000},  
		data = 
		{
			{"RTU/GGIO3.Ind1",0x0000,"BIT",0}, -- read coil, 0/1
			{"RTU/GGIO3.Ind2",0x0001,"BIT",0}, -- read coil, 0/1
			{"RTU/GGIO3.Ind3",0x0002,"BIT",0}, -- read coil, 0/1
			{"RTU/GGIO3.Ind4",0x0003,"BIT",0}  -- read coil, 0/1
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

-- Use Modbus 01/02 to read coils/discretes and sync to IEC61850
function ModbusToIec61850()
	for i, mb in ipairs(MB_List) do
		LIB_ModbusToJsonConfig(4096)
		for j, data in ipairs(mb.data) do
			LIB_ModbusToJsonAdd(data[2], data[3], data[4], data[1])
		end
		LIB_ModbusToJsonSend(mb.com[1], mb.com[2], mb.com[3], mb.com[4], mb.com[5], mb.com[6], mb.com[7])
		while(GC(1) == true) do
			Finish,Data,Err = LIB_ModbusToJsonFinishCheck()
			if Finish == 1 then
				if Data == "null" then -- RS485 error
					RedLedOnCntMs = 100 -- red 0.1s
					print(string.format("MB_LIST[%d]:", i)..Err)
				else -- success
					GreenLedOnCntMs = 100 -- green 0.1s
					print(string.format("MB_LIST[%d]:", i)..Data)
					for k, yx in ipairs(YX_List) do
						Json_Val_0_1 = LIB_JsonExDotParse(Data, "$."..yx[1], "Int32")
						if Json_Val_0_1 ~= nil then
							LIB_IEC61850OprNode("YX_RS", yx[1]..yx[2], Json_Val_0_1)
						else
							print("json parse "..yx[1].." error")
						end
					end
				end
				DelayMs(MB_INTERVAL_MS)
				break
			end
		end
	end
end

-- 10ms timer callback (must be named LIB_10msTimerCallback)
function LIB_10msTimerCallback()
	UpdatePeriodCntMs = UpdatePeriodCntMs + 10
	DelayMsCnt = DelayMsCnt + 10
	LIB_GpioToggle(WDT_PIN) -- watchdog
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
	if LIB_IEC61850NetIsConnect() == 1 and GreenLedOnCntMs <= 0 and RedLedOnCntMs <= 0then
		BlueLedOnCntMs = 1000
	else
		BlueLedOnCntMs = 0
	end
end

-- Initialization
LIB_LuaTfLogDisable()
LIB_SysLedConfig("D9","D8") -- map sys red/green LEDs
LIB_UsbConfig("CDC")-- enable USB log
LIB_GpioOutputConfig(WDT_PIN,"STANDARD") -- watchdog pin
LIB_GpioOutputConfig(BLED_PIN, "STANDARD")
LIB_GpioOutputConfig(GLED_PIN, "STANDARD")
LIB_GpioOutputConfig(RLED_PIN, "STANDARD")
LIB_GpioWrite(BLED_PIN, 1) -- Blue off
LIB_GpioWrite(GLED_PIN, 1) -- Green off
LIB_GpioWrite(RLED_PIN, 1) -- Red off 
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
LIB_IEC61850AddNode("YX_RS", YX_List) -- add points
LIB_10msTimerConfig("ENABLE") -- enable 10ms timer
LIB_IEC61850ServerStart("SPI_1",ETHRST_PIN,mac,ip,subm,gw,dns,port,60)
--LIB_IEC61850NetAutoFixCfg(7200, "SYS_REBOOT") -- auto reboot
while(GC(1) == true) do
	if UpdatePeriodCntMs > MB_POLL_TIME_MS then
		UpdatePeriodCntMs = 0
		ModbusToIec61850()
	end
	--LIB_IEC61850NetFixDeamon()
end