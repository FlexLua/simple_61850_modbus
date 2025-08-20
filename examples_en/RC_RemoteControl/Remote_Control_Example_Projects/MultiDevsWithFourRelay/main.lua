-- IEC61850 Ethernet config
mac = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00} -- device MAC (all 0x00 => chip unique MAC)
ip = {192, 168, 0, 111} -- device IP
subm = {255,255,255,0} -- subnet mask
gw = {192, 168, 0, 1} -- gateway
dns = {8,8,8,8} -- DNS
port = 102 -- local port (61850 server)

--------------!! IMPORTANT: Ensure YK_List and MB_List are one-to-one !!------------------

-- IEC61850 remote control data points
YK_List = 
{
	-- Device #1 (4 relay outputs)
	{"RTU/GGIO1.SPCSO1", ".stVal"}, -- coil control, 0 or 1
	{"RTU/GGIO1.SPCSO2", ".stVal"}, -- coil control, 0 or 1
	{"RTU/GGIO1.SPCSO3", ".stVal"}, -- coil control, 0 or 1
	{"RTU/GGIO1.SPCSO4", ".stVal"}, -- coil control, 0 or 1
	-- Device #2 (4 relay outputs)
	{"RTU/GGIO2.SPCSO1", ".stVal"}, -- coil control, 0 or 1
	{"RTU/GGIO2.SPCSO2", ".stVal"}, -- coil control, 0 or 1
	{"RTU/GGIO2.SPCSO3", ".stVal"}, -- coil control, 0 or 1
	{"RTU/GGIO2.SPCSO4", ".stVal"}, -- coil control, 0 or 1
	-- Device #3 (4 relay outputs)
	{"RTU/GGIO3.SPCSO1", ".stVal"}, -- coil control, 0 or 1
	{"RTU/GGIO3.SPCSO2", ".stVal"}, -- coil control, 0 or 1
	{"RTU/GGIO3.SPCSO3", ".stVal"}, -- coil control, 0 or 1
	{"RTU/GGIO3.SPCSO4", ".stVal"}  -- coil control, 0 or 1
}

-- Modbus remote control data points
MB_List = 
{
	-- Device #1 (4 relay outputs)
	{
		-- 9600, no parity, 1 stop bit, func "05", addr 0x08, timeout 100ms, gap 1000ms
		com = {"BAUDRATE_9600","NoneParity","StopBit_1","05",0x08,100,1000},  
		data = 
		{
			{"RTU/GGIO1.SPCSO1",0x0000}, -- write coil, 0/1
			{"RTU/GGIO1.SPCSO2",0x0001}, -- write coil, 0/1
			{"RTU/GGIO1.SPCSO3",0x0002}, -- write coil, 0/1
			{"RTU/GGIO1.SPCSO4",0x0003}  -- write coil, 0/1
		}
	},
	-- Device #2 (4 relay outputs)
	{
		-- 9600, no parity, 1 stop bit, func "05", addr 0x09, timeout 100ms, gap 1000ms
		com = {"BAUDRATE_9600","NoneParity","StopBit_1","05",0x09,100,1000},  
		data = 
		{
			{"RTU/GGIO2.SPCSO1",0x0000}, -- write coil, 0/1
			{"RTU/GGIO2.SPCSO2",0x0001}, -- write coil, 0/1
			{"RTU/GGIO2.SPCSO3",0x0002}, -- write coil, 0/1
			{"RTU/GGIO2.SPCSO4",0x0003}  -- write coil, 0/1
		}
	},
	-- Device #3 (4 relay outputs)
	{
		-- 9600, no parity, 1 stop bit, func "05", addr 0x0A, timeout 100ms, gap 1000ms
		com = {"BAUDRATE_9600","NoneParity","StopBit_1","05",0x0A,100,1000},  
		data = 
		{
			{"RTU/GGIO3.SPCSO1",0x0000}, -- write coil, 0/1
			{"RTU/GGIO3.SPCSO2",0x0001}, -- write coil, 0/1
			{"RTU/GGIO3.SPCSO3",0x0002}, -- write coil, 0/1
			{"RTU/GGIO3.SPCSO4",0x0003}  -- write coil, 0/1
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

-- Convert IEC61850 remote control to Modbus 05 write single coil
function ModbusToIec61850()
	-- query control command
	ret,val = LIB_IEC61850OprNode("YK_RC")
	if ret ~= nil then -- e.g. "RTU/GGIO1.SPCSO1"
		-- find target slave/coil in MB_List
		for i, mb in ipairs(MB_List) do
			for j, data in ipairs(mb.data) do
				if data[1] == ret then
					-- send Modbus 05 via Uart1
					LIB_Uart1SetParam(mb.com[1], mb.com[2], mb.com[3])
					LIB_Uart1BlockSend(LIB_MbRtuMasterSendTrans(mb.com[4], mb.com[5], data[2], val))
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
	-- keep blue on when connected
	if LIB_IEC61850NetIsConnect() == 1 and GreenLedOnCntMs <= 0 and RedLedOnCntMs <= 0 then
		BlueLedOnCntMs = 1000
	else
		BlueLedOnCntMs = 0
	end

	-- receive 485 response and check Modbus 05 success
	recv_flag,recv_tab=LIB_Uart1Recv()
	if recv_flag == 1 then
		result=LIB_MbRtuMasterRecvTrans("05",recv_tab)
		if result > 0 then -- ok
			GreenLedOnCntMs = 100 -- green 0.1s
		else -- fail
			RedLedOnCntMs = 100 -- red 0.1s
		end
	end
end

-- Initialization
LIB_LuaTfLogDisable()
LIB_SysLedConfig("D9","D8") -- map sys red/green
LIB_UsbConfig("CDC")-- enable USB log
LIB_GpioOutputConfig(WDT_PIN,"STANDARD") -- watchdog pin
LIB_GpioOutputConfig(BLED_PIN, "STANDARD")
LIB_GpioOutputConfig(GLED_PIN, "STANDARD")
LIB_GpioOutputConfig(RLED_PIN, "STANDARD")
LIB_GpioWrite(BLED_PIN, 1) -- Blue off
LIB_GpioWrite(GLED_PIN, 1) -- Green off
LIB_GpioWrite(RLED_PIN, 1) -- Red off 
LIB_Uart1Rs485Config("BAUDRATE_9600", RS485_PIN)

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
LIB_IEC61850AddNode("YK_RC", YK_List) -- add control points
LIB_10msTimerConfig("ENABLE") -- 10ms timer
LIB_IEC61850ServerStart("SPI_1",ETHRST_PIN,mac,ip,subm,gw,dns,port,60)
-- auto reboot disabled for RC (no periodic traffic expected)
while(GC(1) == true) do
	-- convert IEC61850 control to Modbus 05
	ModbusToIec61850()
	--LIB_IEC61850NetFixDeamon()
end
