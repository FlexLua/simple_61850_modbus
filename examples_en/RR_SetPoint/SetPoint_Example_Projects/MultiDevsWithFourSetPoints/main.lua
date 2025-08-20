-- IEC61850 Ethernet port config
mac = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00} -- device MAC (all 0x00 => chip unique MAC)
ip = {192, 168, 0, 111} -- device IP address
subm = {255,255,255,0} -- subnet mask
gw = {192, 168, 0, 1} -- gateway address
dns = {8,8,8,8} -- DNS address
port = 102 -- local (61850 server) port

--------------!! IMPORTANT: Ensure YT_List and MB_List are one-to-one !!------------------

-- IEC61850 setpoint data points
YT_List = 
{
	-- Modbus setpoint control unit #1 (4 setpoints)
	{"RTU/GGIO1.SetPnt1", ".setMag.f"}, -- setpoint control, 32-bit float
	{"RTU/GGIO1.SetPnt2", ".setMag.f"}, -- setpoint control, 32-bit float
	{"RTU/GGIO1.SetPnt3", ".setMag.f"}, -- setpoint control, 32-bit float
	{"RTU/GGIO1.SetPnt4", ".setMag.f"}, -- setpoint control, 32-bit float

	-- Modbus setpoint control unit #2 (4 setpoints)
	{"RTU/GGIO2.SetPnt1", ".setMag.f"}, -- setpoint control, 32-bit float
	{"RTU/GGIO2.SetPnt2", ".setMag.f"}, -- setpoint control, 32-bit float
	{"RTU/GGIO2.SetPnt3", ".setMag.f"}, -- setpoint control, 32-bit float
	{"RTU/GGIO2.SetPnt4", ".setMag.f"}, -- setpoint control, 32-bit float

	-- Modbus setpoint control unit #3 (4 setpoints)
	{"RTU/GGIO3.SetPnt1", ".setMag.f"}, -- setpoint control, 32-bit float
	{"RTU/GGIO3.SetPnt2", ".setMag.f"}, -- setpoint control, 32-bit float
	{"RTU/GGIO3.SetPnt3", ".setMag.f"}, -- setpoint control, 32-bit float
	{"RTU/GGIO3.SetPnt4", ".setMag.f"} -- setpoint control, 32-bit float
}

-- Modbus setpoint data points
MB_List = 
{
	-- Modbus setpoint control unit #1 (4 setpoints)
	{
		-- 9600, no parity, 1 stop bit, func "10", addr 0x02, timeout 100ms, gap 1000ms
		com = {"BAUDRATE_9600","NoneParity","StopBit_1","10",0x02,100,1000},  
		data = 
		{
			{"RTU/GGIO1.SetPnt1",0x0000, "F_ABCD"}, -- setpoint control, write 2x16bit regs for 32-bit ABCD float
			{"RTU/GGIO1.SetPnt2",0x0002, "F_ABCD"}, -- setpoint control, write 2x16bit regs for 32-bit ABCD float
			{"RTU/GGIO1.SetPnt3",0x0004, "F_ABCD"}, -- setpoint control, write 2x16bit regs for 32-bit ABCD float
			{"RTU/GGIO1.SetPnt4",0x0006, "F_ABCD"}  -- setpoint control, write 2x16bit regs for 32-bit ABCD float
		}
	},
	-- Modbus setpoint control unit #2 (4 setpoints)
	{
		-- 9600, no parity, 1 stop bit, func "10", addr 0x03, timeout 100ms, gap 1000ms
		com = {"BAUDRATE_9600","NoneParity","StopBit_1","10",0x03,100,1000},  
		data = 
		{
			{"RTU/GGIO2.SetPnt1",0x0000, "F_ABCD"}, -- setpoint control, write 2x16bit regs for 32-bit ABCD float
			{"RTU/GGIO2.SetPnt2",0x0002, "F_ABCD"}, -- setpoint control, write 2x16bit regs for 32-bit ABCD float
			{"RTU/GGIO2.SetPnt3",0x0004, "F_ABCD"}, -- setpoint control, write 2x16bit regs for 32-bit ABCD float
			{"RTU/GGIO2.SetPnt4",0x0006, "F_ABCD"}  -- setpoint control, write 2x16bit regs for 32-bit ABCD float
		}
	},
	-- Modbus setpoint control unit #3 (4 setpoints)
	{
		-- 9600, no parity, 1 stop bit, func "10", addr 0x04, timeout 100ms, gap 1000ms
		com = {"BAUDRATE_9600","NoneParity","StopBit_1","10",0x04,100,1000},  
		data = 
		{
			{"RTU/GGIO3.SetPnt1",0x0000, "F_ABCD"}, -- setpoint control, write 2x16bit regs for 32-bit ABCD float
			{"RTU/GGIO3.SetPnt2",0x0002, "F_ABCD"}, -- setpoint control, write 2x16bit regs for 32-bit ABCD float
			{"RTU/GGIO3.SetPnt3",0x0004, "F_ABCD"}, -- setpoint control, write 2x16bit regs for 32-bit ABCD float
			{"RTU/GGIO3.SetPnt4",0x0006, "F_ABCD"}  -- setpoint control, write 2x16bit regs for 32-bit ABCD float
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

-- Convert IEC61850 setpoint values (float) to Modbus 10 write multiple registers
function ModbusToIec61850()
	-- query setpoint command
	ret, float32_val = LIB_IEC61850OprNode("YT_RR")
	if ret ~= nil then -- ret value like: "RTU/GGIO1.SetPnt1"
		-- find target slave in MB_List
		for i, mb in ipairs(MB_List) do
			-- iterate all setpoint data points for this slave
			for j, data in ipairs(mb.data) do
				-- check if this is the target setpoint
				if data[1] == ret then
					-- send Modbus 10 via Uart1, write 2x16-bit registers for F_ABCD or F_CDBA data
					LIB_Uart1SetParam(mb.com[1], mb.com[2], mb.com[3])
					-- convert IEEE-754 float to two 16-bit binary values
					val1,val2 = LIB_BC("F32_BYTE16", float32_val)
					tab = {}
					if data[3] == "F_ABCD" then
						tab[1] = val1
						tab[2] = val2
					elseif data[3] == "F_CDAB" then
						tab[1] = val2
						tab[2] = val1
					else
						tab[1] = val1
						tab[2] = val2
					end
					-- send as Modbus 10 (write multiple registers), write two registers
					LIB_Uart1BlockSend(LIB_MbRtuMasterSendTrans(mb.com[4], mb.com[5], data[2], tab))
				end
			end
		end
	end
end

-- 10ms timer callback (must be named LIB_10msTimerCallback)
function LIB_10msTimerCallback()
	DelayMsCnt = DelayMsCnt + 10
	-- watchdog
	LIB_GpioToggle(WDT_PIN)
	-- LED timing
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
	-- keep blue on when connected and other LEDs not active
	if LIB_IEC61850NetIsConnect() == 1 and GreenLedOnCntMs <= 0 and RedLedOnCntMs <= 0 then
		BlueLedOnCntMs = 1000
	else
		BlueLedOnCntMs = 0
	end

	-- receive 485 response and check Modbus 10 success
	recv_flag,recv_tab=LIB_Uart1Recv()
	if recv_flag == 1 then
		result=LIB_MbRtuMasterRecvTrans("10",recv_tab)
		if result > 0 then -- success
			GreenLedOnCntMs = 100 -- green 0.1s
		else -- fail
			RedLedOnCntMs = 100 -- red 0.1s
		end
	end
end

-- Initialization
LIB_LuaTfLogDisable()
-- map sys red/green LEDs to D9/D8
LIB_SysLedConfig("D9","D8")
LIB_UsbConfig("CDC") -- enable USB print
-- configure D11 as watchdog pin
LIB_GpioOutputConfig(WDT_PIN,"STANDARD")
-- configure D7,D8,D9 as RGB LED B,G,R pins
LIB_GpioOutputConfig(BLED_PIN, "STANDARD")
LIB_GpioOutputConfig(GLED_PIN, "STANDARD")
LIB_GpioOutputConfig(RLED_PIN, "STANDARD")
LIB_GpioWrite(BLED_PIN, 1) -- Blue off
LIB_GpioWrite(GLED_PIN, 1) -- Green off
LIB_GpioWrite(RLED_PIN, 1) -- Red off 
-- RS485 interface init
LIB_Uart1Rs485Config("BAUDRATE_115200", RS485_PIN)

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
-- add all required 61850 setpoint data points
LIB_IEC61850AddNode("YT_RR", YT_List)
-- enable 10ms timer
LIB_10msTimerConfig("ENABLE")
-- W5500 SPI: MISO,MOSI,CLK,CS on D1D2D3D4, RST on D5
-- start IEC61850 MMS Server (TCP Server), keepalive=60s, disable SNTP
LIB_IEC61850ServerStart("SPI_1",ETHRST_PIN,mac,ip,subm,gw,dns,port,60)
-- auto reboot if no messages for 7200s - commented out as normal for setpoint
--LIB_IEC61850NetAutoFixCfg(7200, "SYS_REBOOT")
-- main loop
while(GC(1) == true) do
	-- convert IEC61850 setpoint values (float) to Modbus 10 write multiple registers
	ModbusToIec61850()
	--LIB_IEC61850NetFixDeamon()
end