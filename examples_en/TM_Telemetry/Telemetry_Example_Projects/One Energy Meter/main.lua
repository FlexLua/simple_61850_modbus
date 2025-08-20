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
    -- Energy meter #1 (TP613)
    {"RTU/GGIO1.AnIn1", ".mag.f", "FLOAT32"}, -- float, line voltage Uab
    {"RTU/GGIO1.AnIn2", ".mag.f", "FLOAT32"}, -- float, line voltage Ubc
    {"RTU/GGIO1.AnIn3", ".mag.f", "FLOAT32"}, -- float, line voltage Uca
    {"RTU/GGIO1.AnIn4", ".mag.f", "FLOAT32"}, -- float, line voltage avg ULLAvg
    {"RTU/GGIO1.AnIn5", ".mag.f", "FLOAT32"}, -- float, phase voltage Uan
    {"RTU/GGIO1.AnIn6", ".mag.f", "FLOAT32"}, -- float, phase voltage Ubn
    {"RTU/GGIO1.AnIn7", ".mag.f", "FLOAT32"}, -- float, phase voltage Ucn
    {"RTU/GGIO1.AnIn8", ".mag.f", "FLOAT32"}, -- float, phase voltage avg ULNavg
    {"RTU/GGIO1.AnIn9", ".mag.f", "FLOAT32"}, -- float, current Ia
    {"RTU/GGIO1.AnIn10", ".mag.f", "FLOAT32"}, -- float, current Ib
    {"RTU/GGIO1.AnIn11", ".mag.f", "FLOAT32"}, -- float, current Ic
    {"RTU/GGIO1.AnIn12", ".mag.f", "FLOAT32"}, -- float, three-phase current avg IAvg
    {"RTU/GGIO1.AnIn13", ".mag.f", "FLOAT32"}, -- float, zero-sequence current In
    {"RTU/GGIO1.AnIn14", ".mag.f", "FLOAT32"}, -- float, frequency F
    {"RTU/GGIO1.AnIn15", ".mag.f", "FLOAT32"}, -- float, total power factor PF
    {"RTU/GGIO1.AnIn16", ".mag.f", "FLOAT32"}, -- float, total active power P
    {"RTU/GGIO1.AnIn17", ".mag.f", "FLOAT32"}, -- float, total reactive power Q
    {"RTU/GGIO1.AnIn18", ".mag.f", "FLOAT32"}, -- float, total apparent power S
    {"RTU/GGIO1.AnIn19", ".mag.f", "FLOAT32"}, -- float, phase-A PF (PFa)
    {"RTU/GGIO1.AnIn20", ".mag.f", "FLOAT32"}, -- float, phase-B PF (PFb)
    {"RTU/GGIO1.AnIn21", ".mag.f", "FLOAT32"}, -- float, phase-C PF (PFc)
    {"RTU/GGIO1.AnIn22", ".mag.f", "FLOAT32"}, -- float, phase-A active power Pa
    {"RTU/GGIO1.AnIn23", ".mag.f", "FLOAT32"}, -- float, phase-B active power Pb
    {"RTU/GGIO1.AnIn24", ".mag.f", "FLOAT32"}, -- float, phase-C active power Pc
    {"RTU/GGIO1.AnIn25", ".mag.f", "FLOAT32"}, -- float, phase-A reactive power Qa
    {"RTU/GGIO1.AnIn26", ".mag.f", "FLOAT32"}, -- float, phase-B reactive power Qb
    {"RTU/GGIO1.AnIn27", ".mag.f", "FLOAT32"}, -- float, phase-C reactive power Qc
    {"RTU/GGIO1.AnIn28", ".mag.f", "FLOAT32"}, -- float, phase-A apparent power Sa
    {"RTU/GGIO1.AnIn29", ".mag.f", "FLOAT32"}, -- float, phase-B apparent power Sb
    {"RTU/GGIO1.AnIn30", ".mag.f", "FLOAT32"} -- float, phase-C apparent power Sc
}

-- Modbus telemetry data points
MB_POLL_TIME_MS = 5000 -- min poll period for all RS485 devices (ms)
MB_INTERVAL_MS = 100 -- min interval between RS485 transactions (ms)
MB_List =
{
	-- Energy meter #1 (TP613)
	{
		-- 115200, no parity, 1 stop bit, func "03", addr 0xff, timeout 1000ms, gap 100ms
		com = {"BAUDRATE_115200","NoneParity","StopBit_1","03",0xff,1000,100},
		data =
		{
			{"RTU/GGIO1.AnIn1", 0x0064, "F_ABCD", 3}, -- Uab, 3 decimals
			{"RTU/GGIO1.AnIn2", 0x0066, "F_ABCD", 3}, -- Ubc, 3 decimals
			{"RTU/GGIO1.AnIn3", 0x0068, "F_ABCD", 3}, -- Uca, 3 decimals
			{"RTU/GGIO1.AnIn4", 0x006A, "F_ABCD", 3}, -- ULLAvg, 3 decimals
			{"RTU/GGIO1.AnIn5", 0x006C, "F_ABCD", 3}, -- Uan, 3 decimals
			{"RTU/GGIO1.AnIn6", 0x006E, "F_ABCD", 3}, -- Ubn, 3 decimals
			{"RTU/GGIO1.AnIn7", 0x0070, "F_ABCD", 3}, -- Ucn, 3 decimals
			{"RTU/GGIO1.AnIn8", 0x0072, "F_ABCD", 3}, -- ULNavg, 3 decimals
			{"RTU/GGIO1.AnIn9", 0x0074, "F_ABCD", 3}, -- Ia, 3 decimals
			{"RTU/GGIO1.AnIn10", 0x0076, "F_ABCD", 3}, -- Ib, 3 decimals
			{"RTU/GGIO1.AnIn11", 0x0078, "F_ABCD", 3}, -- Ic, 3 decimals
			{"RTU/GGIO1.AnIn12", 0x007A, "F_ABCD", 3}, -- IAvg, 3 decimals
			{"RTU/GGIO1.AnIn13", 0x007C, "F_ABCD", 3}, -- In, 3 decimals
			{"RTU/GGIO1.AnIn14", 0x007E, "F_ABCD", 3}, -- F, 3 decimals
			{"RTU/GGIO1.AnIn15", 0x0080, "F_ABCD", 3}, -- PF, 3 decimals
			{"RTU/GGIO1.AnIn16", 0x0082, "F_ABCD", 3}, -- P, 3 decimals
			{"RTU/GGIO1.AnIn17", 0x0084, "F_ABCD", 3}, -- Q, 3 decimals
			{"RTU/GGIO1.AnIn18", 0x0086, "F_ABCD", 3}, -- S, 3 decimals
			{"RTU/GGIO1.AnIn19", 0x0088, "F_ABCD", 3}, -- PFa, 3 decimals
			{"RTU/GGIO1.AnIn20", 0x008A, "F_ABCD", 3}, -- PFb, 3 decimals
			{"RTU/GGIO1.AnIn21", 0x008C, "F_ABCD", 3}, -- PFc, 3 decimals
			{"RTU/GGIO1.AnIn22", 0x008E, "F_ABCD", 3}, -- Pa, 3 decimals
			{"RTU/GGIO1.AnIn23", 0x0090, "F_ABCD", 3}, -- Pb, 3 decimals
			{"RTU/GGIO1.AnIn24", 0x0092, "F_ABCD", 3}, -- Pc, 3 decimals
			{"RTU/GGIO1.AnIn25", 0x0094, "F_ABCD", 3}, -- Qa, 3 decimals
			{"RTU/GGIO1.AnIn26", 0x0096, "F_ABCD", 3}, -- Qb, 3 decimals
			{"RTU/GGIO1.AnIn27", 0x0098, "F_ABCD", 3}, -- Qc, 3 decimals
			{"RTU/GGIO1.AnIn28", 0x009A, "F_ABCD", 3}, -- Sa, 3 decimals
			{"RTU/GGIO1.AnIn29", 0x009C, "F_ABCD", 3}, -- Sb, 3 decimals
			{"RTU/GGIO1.AnIn30", 0x009E, "F_ABCD", 3}  -- Sc, 3 decimals
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

-- Read Modbus and sync to IEC61850
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
				else
					GreenLedOnCntMs = 100 -- green 0.1s
					print(string.format("MB_LIST[%d]:", i)..Data)
					for k, yc in ipairs(YC_List) do
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
LIB_Uart1Rs485Config("BAUDRATE_115200", RS485_PIN) -- RS485

-- RGB blink 3 times
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
LIB_IEC61850AddNode("YC_RM", YC_List) -- add 61850 points
LIB_10msTimerConfig("ENABLE") -- enable 10ms timer
-- start IEC61850 MMS Server (TCP), keepalive=60s, SNTP disabled
LIB_IEC61850ServerStart("SPI_1",ETHRST_PIN,mac,ip,subm,gw,dns,port,60)
--LIB_IEC61850NetAutoFixCfg(7200, "SYS_REBOOT") -- auto reboot after 7200s idle
while(GC(1) == true) do
	if UpdatePeriodCntMs > MB_POLL_TIME_MS then
		UpdatePeriodCntMs = 0
		ModbusToIec61850()
	end
	--LIB_IEC61850NetFixDeamon()
end