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
	-- Temp & Humi Sensor #1
	{"RTU/GGIO1.AnIn1", ".mag.f", "FLOAT32"}, -- float, humidity
	{"RTU/GGIO1.AnIn2", ".mag.f", "FLOAT32"}, -- float, temperature
	-- Temp & Humi Sensor #2
	{"RTU/GGIO2.AnIn1", ".mag.f", "FLOAT32"}, -- float, humidity
	{"RTU/GGIO2.AnIn2", ".mag.f", "FLOAT32"}, -- float, temperature
    -- Energy Meter #1 (model: TP613)
    {"RTU/GGIO3.AnIn1", ".mag.f", "FLOAT32"}, -- float, line voltage Uab
    {"RTU/GGIO3.AnIn2", ".mag.f", "FLOAT32"}, -- float, line voltage Ubc
    {"RTU/GGIO3.AnIn3", ".mag.f", "FLOAT32"}, -- float, line voltage Uca
    {"RTU/GGIO3.AnIn4", ".mag.f", "FLOAT32"}, -- float, line voltage avg ULLAvg
    {"RTU/GGIO3.AnIn5", ".mag.f", "FLOAT32"}, -- float, phase voltage Uan
    {"RTU/GGIO3.AnIn6", ".mag.f", "FLOAT32"}, -- float, phase voltage Ubn
    {"RTU/GGIO3.AnIn7", ".mag.f", "FLOAT32"}, -- float, phase voltage Ucn
    {"RTU/GGIO3.AnIn8", ".mag.f", "FLOAT32"}, -- float, phase voltage avg ULNavg
    {"RTU/GGIO3.AnIn9", ".mag.f", "FLOAT32"}, -- float, current Ia
    {"RTU/GGIO3.AnIn10", ".mag.f", "FLOAT32"}, -- float, current Ib
    {"RTU/GGIO3.AnIn11", ".mag.f", "FLOAT32"}, -- float, current Ic
    {"RTU/GGIO3.AnIn12", ".mag.f", "FLOAT32"}, -- float, 3-phase current avg IAvg
    {"RTU/GGIO3.AnIn13", ".mag.f", "FLOAT32"}, -- float, zero-sequence current In
    {"RTU/GGIO3.AnIn14", ".mag.f", "FLOAT32"}, -- float, frequency F
    {"RTU/GGIO3.AnIn15", ".mag.f", "FLOAT32"}, -- float, total power factor PF
    {"RTU/GGIO3.AnIn16", ".mag.f", "FLOAT32"}, -- float, total active power P
    {"RTU/GGIO3.AnIn17", ".mag.f", "FLOAT32"}, -- float, total reactive power Q
    {"RTU/GGIO3.AnIn18", ".mag.f", "FLOAT32"}, -- float, total apparent power S
    {"RTU/GGIO3.AnIn19", ".mag.f", "FLOAT32"}, -- float, phase-A PF (PFa)
    {"RTU/GGIO3.AnIn20", ".mag.f", "FLOAT32"}, -- float, phase-B PF (PFb)
    {"RTU/GGIO3.AnIn21", ".mag.f", "FLOAT32"}, -- float, phase-C PF (PFc)
    {"RTU/GGIO3.AnIn22", ".mag.f", "FLOAT32"}, -- float, phase-A active power Pa
    {"RTU/GGIO3.AnIn23", ".mag.f", "FLOAT32"}, -- float, phase-B active power Pb
    {"RTU/GGIO3.AnIn24", ".mag.f", "FLOAT32"}, -- float, phase-C active power Pc
    {"RTU/GGIO3.AnIn25", ".mag.f", "FLOAT32"}, -- float, phase-A reactive power Qa
    {"RTU/GGIO3.AnIn26", ".mag.f", "FLOAT32"}, -- float, phase-B reactive power Qb
    {"RTU/GGIO3.AnIn27", ".mag.f", "FLOAT32"}, -- float, phase-C reactive power Qc
    {"RTU/GGIO3.AnIn28", ".mag.f", "FLOAT32"}, -- float, phase-A apparent power Sa
    {"RTU/GGIO3.AnIn29", ".mag.f", "FLOAT32"}, -- float, phase-B apparent power Sb
    {"RTU/GGIO3.AnIn30", ".mag.f", "FLOAT32"}, -- float, phase-C apparent power Sc
	-- Transformer Temperature #1
	{"RTU/GGIO4.AnIn1", ".mag.f", "FLOAT32"}, -- float, phase A temperature
	{"RTU/GGIO4.AnIn2", ".mag.f", "FLOAT32"}, -- float, phase B temperature
	{"RTU/GGIO4.AnIn3", ".mag.f", "FLOAT32"}  -- float, phase C temperature
}

-- Modbus telemetry data points
MB_POLL_TIME_MS = 5000 -- set minimum polling cycle for all 485 devices: 5000ms (5s), actual time may be longer if device communication is poor
MB_INTERVAL_MS = 100 -- set minimum interval between each 485 communication
MB_List =
{
	-- Temp & Humi Sensor #1
	{
		-- 4800 bps, no parity, 1 stop bit, func "03", addr 0x01, timeout 100ms, gap 1000ms
		com = {"BAUDRATE_4800","NoneParity","StopBit_1","03",0x01,100,1000},  
		data = 
		{
			{"RTU/GGIO1.AnIn1",0x0000,"S_AB",1}, -- humidity, 1 decimal (S_AB integer × 0.1)
			{"RTU/GGIO1.AnIn2",0x0001,"S_AB",1}  -- temperature, 1 decimal (S_AB integer × 0.1)
		}
	},
	-- Temp & Humi Sensor #2
	{
		-- 4800 bps, no parity, 1 stop bit, func "03", addr 0x02, timeout 100ms, gap 1000ms
		com = {"BAUDRATE_4800","NoneParity","StopBit_1","03",0x02,100,1000},  
		data = 
		{
			{"RTU/GGIO2.AnIn1",0x0000,"S_AB",1}, -- humidity, 1 decimal (S_AB integer × 0.1)
			{"RTU/GGIO2.AnIn2",0x0001,"S_AB",1}  -- temperature, 1 decimal (S_AB integer × 0.1)
		}
	},
	-- Energy Meter #1 (model: TP613)
	{
		-- 115200 bps, no parity, 1 stop bit, func "03", addr 0xff, timeout 1000ms, gap 100ms
		com = {"BAUDRATE_115200","NoneParity","StopBit_1","03",0xff,1000,100},
		data =
		{
			{"RTU/GGIO3.AnIn1", 0x0064, "F_ABCD", 3}, -- line voltage Uab, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn2", 0x0066, "F_ABCD", 3}, -- line voltage Ubc, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn3", 0x0068, "F_ABCD", 3}, -- line voltage Uca, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn4", 0x006A, "F_ABCD", 3}, -- line voltage avg ULLAvg, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn5", 0x006C, "F_ABCD", 3}, -- phase voltage Uan, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn6", 0x006E, "F_ABCD", 3}, -- phase voltage Ubn, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn7", 0x0070, "F_ABCD", 3}, -- phase voltage Ucn, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn8", 0x0072, "F_ABCD", 3}, -- phase voltage avg ULNavg, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn9", 0x0074, "F_ABCD", 3}, -- current Ia, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn10", 0x0076, "F_ABCD", 3}, -- current Ib, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn11", 0x0078, "F_ABCD", 3}, -- current Ic, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn12", 0x007A, "F_ABCD", 3}, -- 3-phase current avg IAvg, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn13", 0x007C, "F_ABCD", 3}, -- zero-sequence current In, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn14", 0x007E, "F_ABCD", 3}, -- frequency F, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn15", 0x0080, "F_ABCD", 3}, -- total power factor PF, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn16", 0x0082, "F_ABCD", 3}, -- total active power P, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn17", 0x0084, "F_ABCD", 3}, -- total reactive power Q, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn18", 0x0086, "F_ABCD", 3}, -- total apparent power S, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn19", 0x0088, "F_ABCD", 3}, -- phase-A PF (PFa), 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn20", 0x008A, "F_ABCD", 3}, -- phase-B PF (PFb), 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn21", 0x008C, "F_ABCD", 3}, -- phase-C PF (PFc), 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn22", 0x008E, "F_ABCD", 3}, -- phase-A active power Pa, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn23", 0x0090, "F_ABCD", 3}, -- phase-B active power Pb, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn24", 0x0092, "F_ABCD", 3}, -- phase-C active power Pc, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn25", 0x0094, "F_ABCD", 3}, -- phase-A reactive power Qa, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn26", 0x0096, "F_ABCD", 3}, -- phase-B reactive power Qb, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn27", 0x0098, "F_ABCD", 3}, -- phase-C reactive power Qc, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn28", 0x009A, "F_ABCD", 3}, -- phase-A apparent power Sa, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn29", 0x009C, "F_ABCD", 3}, -- phase-B apparent power Sb, 3 decimals (F_ABCD float)
			{"RTU/GGIO3.AnIn30", 0x009E, "F_ABCD", 3}  -- phase-C apparent power Sc, 3 decimals (F_ABCD float)
		}
	},
	-- Transformer #1
	{
		-- 115200 bps, no parity, 1 stop bit, func "03", addr 0x02, timeout 100ms, gap 1000ms
		com = {"BAUDRATE_115200","NoneParity","StopBit_1","03",0x02,100,1000},  
		data = 
		{
			{"RTU/GGIO4.AnIn1",0x0030,"U_AB",2}, -- phase A temperature, 2 decimals (U_AB integer × 0.01)
			{"RTU/GGIO4.AnIn2",0x0031,"U_AB",2}, -- phase B temperature, 2 decimals (U_AB integer × 0.01)
			{"RTU/GGIO4.AnIn3",0x0032,"U_AB",2}  -- phase C temperature, 2 decimals (U_AB integer × 0.01)
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

-- Global variables
UpdatePeriodCntMs = 0 -- Modbus polling cycle counter (ms)
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
				if Data == "null" then -- RS485 communication error
					RedLedOnCntMs = 100 -- red LED flash 0.1s
					print(string.format("MB_LIST[%d]:", i)..Err) -- print log
				else -- successfully received 485 data, generated json string like: {"RTU/GGIO1.AnIn1":28.12, "RTU/GGIO1.AnIn2":26.50, "RTU/GGIO1.AnIn3":27.38...}
					GreenLedOnCntMs = 100 -- green LED flash 0.1s
					print(string.format("MB_LIST[%d]:", i)..Data)
					for k, yc in ipairs(YC_List) do -- iterate all 61850 data points in this 485 slave
						if yc[3] == "FLOAT32" then
							-- check if json contains value like yc[1] = "RTU/GGIO1.AnIn1", parse float value
							Json_Val_Float32 = LIB_JsonExDotParse(Data, "$."..yc[1], "Number")
							if Json_Val_Float32 ~= nil then
								-- update 61850 data point, e.g. "RTU/GGIO1.AnIn1.mag.f"
								LIB_IEC61850OprNode("YC_RM", yc[1]..yc[2], Json_Val_Float32)
							else
								print("json parse "..yc[1].." error")
							end
						elseif yc[3] == "INT32" then
							-- check if json contains value like yc[1] = "RTU/GGIO1.Inc1", parse int value
							Json_Val_Int32 = LIB_JsonExDotParse(Data, "$."..yc[1], "Int32")
							if Json_Val_Int32 ~= nil then
								-- update 61850 data point, e.g. "RTU/GGIO1.Inc.stVal"
								LIB_IEC61850OprNode("YC_RM", yc[1]..yc[2], Json_Val_Int32)
							else
								print("json parse "..yc[1].." error")
							end
						end
					end
				end
				DelayMs(MB_INTERVAL_MS) -- delay 100ms
				break -- break while loop
			end
		end
	end
end


-- Define 10ms timer callback function, function name must be LIB_10msTimerCallback
function LIB_10msTimerCallback()
	UpdatePeriodCntMs = UpdatePeriodCntMs + 10
	DelayMsCnt = DelayMsCnt + 10
	-- Watchdog feed
	LIB_GpioToggle(WDT_PIN)
	-- LED flash duration handling
	if BlueLedOnCntMs > 0 then
		BlueLedOnCntMs = BlueLedOnCntMs - 10
		LIB_GpioWrite(BLED_PIN, 0) -- Blue LED on
	else
		LIB_GpioWrite(BLED_PIN, 1) -- Blue LED off
	end
	if GreenLedOnCntMs > 0 then
		GreenLedOnCntMs = GreenLedOnCntMs - 10
		LIB_GpioWrite(GLED_PIN, 0) -- Green LED on
	else
		LIB_GpioWrite(GLED_PIN, 1) -- Green LED off
	end
	if RedLedOnCntMs > 0 then
		RedLedOnCntMs = RedLedOnCntMs - 10
		LIB_GpioWrite(RLED_PIN, 0) -- Red LED on
	else
		LIB_GpioWrite(RLED_PIN, 1) -- Red LED off
	end
	-- Blue LED stays on when 61850 is connected and other color LEDs are not occupied
	if LIB_IEC61850NetIsConnect() == 1 and GreenLedOnCntMs <= 0 and RedLedOnCntMs <= 0 then
		BlueLedOnCntMs = 1000
	else
		BlueLedOnCntMs = 0
	end
end

-- Start initialization
LIB_LuaTfLogDisable()
LIB_UsbConfig("CDC") -- enable USB print function
-- Configure D11 to control watchdog feed pin
LIB_GpioOutputConfig(WDT_PIN,"STANDARD")
-- Configure D7,D8,D9 to control RGB LED B,G,R pins
LIB_GpioOutputConfig(BLED_PIN, "STANDARD")
LIB_GpioOutputConfig(GLED_PIN, "STANDARD")
LIB_GpioOutputConfig(RLED_PIN, "STANDARD")
LIB_GpioWrite(BLED_PIN, 1) -- Blue LED off
LIB_GpioWrite(GLED_PIN, 1) -- Green LED off
LIB_GpioWrite(RLED_PIN, 1) -- Red LED off 
-- RS485 interface initialization
LIB_Uart1Rs485Config("BAUDRATE_115200", RS485_PIN)

-- RGB LED flash 3 times
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
-- Add all required 61850 telemetry data points
LIB_IEC61850AddNode("YC_RM", YC_List)
-- Enable system 10ms timer to start working
LIB_10msTimerConfig("ENABLE")
-- Configure W5500 Ethernet module SPI: MISO,MOSI,CLK,CS use D1D2D3D4 pins, RST uses D5 pin
-- and start IEC61850 MMS Server service (TCP Server), keepalive=60s, disable SNTP request
LIB_IEC61850ServerStart("SPI_1",ETHRST_PIN,mac,ip,subm,gw,dns,port,60)--,{192,168,0,105},123,30)
-- Auto restart system if no message received for 7200 seconds
--LIB_IEC61850NetAutoFixCfg(7200, "SYS_REBOOT")
-- Enter main loop
while(GC(1) == true)
do
	-- Update telemetry and data point values every MB_POLL_TIME_MS milliseconds
	if UpdatePeriodCntMs > MB_POLL_TIME_MS then
		UpdatePeriodCntMs = 0
		
		-- Read Modbus slave data and sync to IEC61850
		ModbusToIec61850()
	end
	--LIB_IEC61850NetFixDeamon()
end