--Global parameters
Poll_Time = 5000
Reserve = 0
dns = {8,8,8,8} --dns server ip
gw = {192, 168, 0, 1} --route ip
ip = {192, 168, 0, 111} --ip
keepalive_time = 60
mac = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00} --mac
net_autofix_enable = 0
net_autofix_time = 7200
net_autofix_way = "SYS_REBOOT"
port = 102 --Port(61850 server)
sntp_enable = 0
sntp_interval = 60
sntp_ip = {192,168,0,105}
sntp_port = 123
subm = {255,255,255,0} --sub mask addr


--------------!!IMPORTANT: Users must ensure Y?_List and Y?_MB_List correspond one-to-one!!------------------


--IEC61850 YC_RM DataPoints
YC_List={
	{"RTU/GGIO10.AnIn1", ".mag.f", "FLOAT32"}, --FLOAT, 10_TH_Sensor_Humidity
	{"RTU/GGIO10.AnIn2", ".mag.f", "FLOAT32"}, --FLOAT, 10_TH_Sensor_Temperature
	{"RTU/GGIO1.AnIn1", ".mag.f", "FLOAT32"}, --FLOAT, 1_TH_Sensor_Humidity
	{"RTU/GGIO1.AnIn2", ".mag.f", "FLOAT32"}, --FLOAT, 1_TH_Sensor_Temperature
	{"RTU/GGIO2.AnIn1", ".mag.f", "FLOAT32"}, --FLOAT, 2_TH_Sensor_Humidity
	{"RTU/GGIO2.AnIn2", ".mag.f", "FLOAT32"}, --FLOAT, 2_TH_Sensor_Temperature
	{"RTU/GGIO3.AnIn1", ".mag.f", "FLOAT32"}, --FLOAT, 3_TH_Sensor_Humidity
	{"RTU/GGIO3.AnIn2", ".mag.f", "FLOAT32"}, --FLOAT, 3_TH_Sensor_Temperature
	{"RTU/GGIO4.AnIn1", ".mag.f", "FLOAT32"}, --FLOAT, 4_TH_Sensor_Humidity
	{"RTU/GGIO4.AnIn2", ".mag.f", "FLOAT32"}, --FLOAT, 4_TH_Sensor_Temperature
	{"RTU/GGIO5.AnIn1", ".mag.f", "FLOAT32"}, --FLOAT, 5_TH_Sensor_Humidity
	{"RTU/GGIO5.AnIn2", ".mag.f", "FLOAT32"}, --FLOAT, 5_TH_Sensor_Temperature
	{"RTU/GGIO6.AnIn1", ".mag.f", "FLOAT32"}, --FLOAT, 6_TH_Sensor_Humidity
	{"RTU/GGIO6.AnIn2", ".mag.f", "FLOAT32"}, --FLOAT, 6_TH_Sensor_Temperature
	{"RTU/GGIO7.AnIn1", ".mag.f", "FLOAT32"}, --FLOAT, 7_TH_Sensor_Humidity
	{"RTU/GGIO7.AnIn2", ".mag.f", "FLOAT32"}, --FLOAT, 7_TH_Sensor_Temperature
	{"RTU/GGIO8.AnIn1", ".mag.f", "FLOAT32"}, --FLOAT, 8_TH_Sensor_Humidity
	{"RTU/GGIO8.AnIn2", ".mag.f", "FLOAT32"}, --FLOAT, 8_TH_Sensor_Temperature
	{"RTU/GGIO9.AnIn1", ".mag.f", "FLOAT32"}, --FLOAT, 9_TH_Sensor_Humidity
	{"RTU/GGIO9.AnIn2", ".mag.f", "FLOAT32"}, --FLOAT, 9_TH_Sensor_Temperature
};




YC_MB_List={
	--10_TH_Sensor
	{
		--4800,NoneParity,StopBit_1,Func "03",modbus addr 10,wait time 1000ms,package time 100ms
		com = {"BAUDRATE_4800","NoneParity","StopBit_1","03",10,1000,100},
		data =
		{
			{"RTU/GGIO10.AnIn1",0x0000,"S_AB",1}, --Humidity
			{"RTU/GGIO10.AnIn2",0x0001,"S_AB",1}, --Temperature
		}
	},
	--1_TH_Sensor
	{
		--4800,NoneParity,StopBit_1,Func "03",modbus addr 0x01,wait time 1000ms,package time 100ms
		com = {"BAUDRATE_4800","NoneParity","StopBit_1","03",0x01,1000,100},
		data =
		{
			{"RTU/GGIO1.AnIn1",0x0000,"S_AB",1}, --Humidity
			{"RTU/GGIO1.AnIn2",0x0001,"S_AB",1}, --Temperature
		}
	},
	--2_TH_Sensor
	{
		--4800,NoneParity,StopBit_1,Func "03",modbus addr 2,wait time 1000ms,package time 100ms
		com = {"BAUDRATE_4800","NoneParity","StopBit_1","03",2,1000,100},
		data =
		{
			{"RTU/GGIO2.AnIn1",0x0000,"S_AB",1}, --Humidity
			{"RTU/GGIO2.AnIn2",0x0001,"S_AB",1}, --Temperature
		}
	},
	--3_TH_Sensor
	{
		--4800,NoneParity,StopBit_1,Func "03",modbus addr 3,wait time 1000ms,package time 100ms
		com = {"BAUDRATE_4800","NoneParity","StopBit_1","03",3,1000,100},
		data =
		{
			{"RTU/GGIO3.AnIn1",0x0000,"S_AB",1}, --Humidity
			{"RTU/GGIO3.AnIn2",0x0001,"S_AB",1}, --Temperature
		}
	},
	--4_TH_Sensor
	{
		--4800,NoneParity,StopBit_1,Func "03",modbus addr 4,wait time 1000ms,package time 100ms
		com = {"BAUDRATE_4800","NoneParity","StopBit_1","03",4,1000,100},
		data =
		{
			{"RTU/GGIO4.AnIn1",0x0000,"S_AB",1}, --Humidity
			{"RTU/GGIO4.AnIn2",0x0001,"S_AB",1}, --Temperature
		}
	},
	--5_TH_Sensor
	{
		--4800,NoneParity,StopBit_1,Func "03",modbus addr 5,wait time 1000ms,package time 100ms
		com = {"BAUDRATE_4800","NoneParity","StopBit_1","03",5,1000,100},
		data =
		{
			{"RTU/GGIO5.AnIn1",0x0000,"S_AB",1}, --Humidity
			{"RTU/GGIO5.AnIn2",0x0001,"S_AB",1}, --Temperature
		}
	},
	--6_TH_Sensor
	{
		--4800,NoneParity,StopBit_1,Func "03",modbus addr 6,wait time 1000ms,package time 100ms
		com = {"BAUDRATE_4800","NoneParity","StopBit_1","03",6,1000,100},
		data =
		{
			{"RTU/GGIO6.AnIn1",0x0000,"S_AB",1}, --Humidity
			{"RTU/GGIO6.AnIn2",0x0001,"S_AB",1}, --Temperature
		}
	},
	--7_TH_Sensor
	{
		--4800,NoneParity,StopBit_1,Func "03",modbus addr 7,wait time 1000ms,package time 100ms
		com = {"BAUDRATE_4800","NoneParity","StopBit_1","03",7,1000,100},
		data =
		{
			{"RTU/GGIO7.AnIn1",0x0000,"S_AB",1}, --Humidity
			{"RTU/GGIO7.AnIn2",0x0001,"S_AB",1}, --Temperature
		}
	},
	--8_TH_Sensor
	{
		--4800,NoneParity,StopBit_1,Func "03",modbus addr 8,wait time 1000ms,package time 100ms
		com = {"BAUDRATE_4800","NoneParity","StopBit_1","03",8,1000,100},
		data =
		{
			{"RTU/GGIO8.AnIn1",0x0000,"S_AB",1}, --Humidity
			{"RTU/GGIO8.AnIn2",0x0001,"S_AB",1}, --Temperature
		}
	},
	--9_TH_Sensor
	{
		--4800,NoneParity,StopBit_1,Func "03",modbus addr 9,wait time 1000ms,package time 100ms
		com = {"BAUDRATE_4800","NoneParity","StopBit_1","03",9,1000,100},
		data =
		{
			{"RTU/GGIO9.AnIn1",0x0000,"S_AB",1}, --Humidity
			{"RTU/GGIO9.AnIn2",0x0001,"S_AB",1}, --Temperature
		}
	},
};




--Pin definitions
WDT_PIN = "D11"
BLED_PIN = "D7"
GLED_PIN = "D8"
RLED_PIN = "D9"
ETHRST_PIN = "D5"
RS485_PIN = "D0"

--Global variable definitions
UpdatePeriodCntMs = 0 --Modbus polling cycle timer variable (unit: ms)
DelayMsCnt = 0
WaitMsCnt = 0
BlueLedOnCntMs = 0
GreenLedOnCntMs = 0
RedLedOnCntMs = 0

--Delay n milliseconds function
function DelayMs(n)
	DelayMsCnt = 0
	while DelayMsCnt < n do
		GC(1)
	end
end

--Read Modbus slave 03 telemetry data and sync to IEC61850 master
function ModbusToIec61850_YC()
	--Poll all 485 slaves defined in YC_MB_List one by one
	for i, mb in ipairs(YC_MB_List) do
		LIB_ModbusToJsonConfig(4096)
		--Add all modbus telemetry data points (registers) under a 485 slave
		for j, data in ipairs(mb.data) do
			LIB_ModbusToJsonAdd(data[2], data[3], data[4], data[1])
		end
		--Get modbus telemetry data from 485 slave via RS485 based on configured communication parameters
		LIB_ModbusToJsonSend(mb.com[1], mb.com[2], mb.com[3], mb.com[4], mb.com[5], mb.com[6], mb.com[7])
		-- Wait for RS485 communication to end
		while(GC(1) == true)
		do
			Finish,Data,Err = LIB_ModbusToJsonFinishCheck()
			if Finish == 1 then
				if Data == "null" then --485 communication error
					RedLedOnCntMs = 100 --Red LED flash 0.1s
					print(string.format("YC_MB_List[%d]:", i)..Err) --Print log
				else --Successfully received 485 data, generated JSON string like: {"RTU/GGIO1.AnIn1":28.12, "RTU/GGIO1.AnIn2":26.50, "RTU/GGIO1.AnIn3":27.38...}
					GreenLedOnCntMs = 100 --Green LED flash 0.1s
					print(string.format("YC_MB_List[%d]:", i)..Data)
					for k, yc in ipairs(YC_List) do --Traverse all 61850 data points in a 485 slave
						if yc[3] == "FLOAT32" then
							--Check if JSON contains value like yc[1] = "RTU/GGIO1.AnIn1" and parse float value
							Json_Val_Float32 = LIB_JsonExDotParse(Data, "$."..yc[1], "Number")
							if Json_Val_Float32 ~= nil then
								--Update 61850 data point, e.g. "RTU/GGIO1.AnIn1.mag.f"
								LIB_IEC61850OprNode("YC_RM", yc[1]..yc[2], Json_Val_Float32)
							else
								print("json parse "..yc[1].." error")
							end
						elseif yc[3] == "INT32" then
							--Check if JSON contains value like yc[1] = "RTU/GGIO1.Inc1" and parse integer value
							Json_Val_Int32 = LIB_JsonExDotParse(Data, "$."..yc[1], "Int32")
							if Json_Val_Int32 ~= nil then
								--Update 61850 data point, e.g. "RTU/GGIO1.Inc.stVal"
								LIB_IEC61850OprNode("YC_RM", yc[1]..yc[2], Json_Val_Int32)
							else
								print("json parse "..yc[1].." error")
							end
						end
					end
				end
				DelayMs(mb.com[7]) --Delay mb.com[7] (communication interval time ms per packet)
				break --Break out of while loop
			end
		end
	end
end

-- Function to extract specified bit
function getBitValue(value, bitStr)
    -- Extract number n from string "BITn"
    local bitIndex = tonumber(bitStr:match("BIT(%d+)"))
    if bitIndex == nil or bitIndex < 0 or bitIndex > 15 then
        print("bitStr must be BIT0 ~ BIT15")
    end

    -- Extract the bit, right shift then AND with 1
    local bitValue = (value >> bitIndex) & 1
    return bitValue
end

--Function code 01/02 read Modbus slave coil status or discrete input status, 03/04 read bit value in 16-bit register, sync to IEC61850 master
function ModbusToIec61850_YX()
	--Poll all 485 slaves defined in YX_MB_List one by one
	for i, mb in ipairs(YX_MB_List) do
		--03/04 read bit value in 16-bit register
		if mb.com[4] == "03" or mb.com[4] == "04" then
			--Configure serial communication, mb.com[1]: baud rate, mb.com[2]: parity, mb.com[3]: stop bits
			LIB_Uart1SetParam( mb.com[1], mb.com[2], mb.com[3])
			last_reg_value = 0
			last_reg_addr = 99999
			--Get status value 0 or 1 for each bit one by one
			for j, data in ipairs(mb.data) do
				--Only read registers that haven't been read before
				if last_reg_addr ~= data[2] then
					last_reg_value = 0
					--mb.com[4]: function code, mb.com[5]: device mb address, data[2]: register address, 1: read 1 register
					LIB_Uart1BlockSend(LIB_MbRtuMasterSendTrans( mb.com[4], mb.com[5], data[2], 1))
					last_reg_addr = data[2]
					WaitMsCnt = 0
					while WaitMsCnt < mb.com[6] do --Maximum response wait time (ms)
						recv_flag, recv_tab = LIB_Uart1Recv()
						if recv_flag == 1 then
							result,content = LIB_MbRtuMasterRecvTrans(mb.com[4], recv_tab)
							if result> 0 then
								GreenLedOnCntMs = 100 --Green LED flash 0.1s
								--Get value of 1 16-bit register
								last_reg_value = content[1]
								--Get the desired bit value (0 or 1) from this 16-bit register
								bit_val = getBitValue(last_reg_value, data[3]) --data[3]: "BIT0"~"BIT15"
								--Update 61850 data point, e.g. "RTU/GGIO1.Ind1.stVal"
								LIB_IEC61850OprNode("YX_RS", data[1]..".stVal", bit_val)
							else
								RedLedOnCntMs = 100 --Red LED flash 0.1s
								print(string.format("YX_MB_List.data[%d]: modbus send fail, re=%d", j, result))
							end
							DelayMs(mb.com[7]) --Delay mb.com[7] (minimum communication interval time ms per packet)
							break
						end
					end
					
					if WaitMsCnt >= mb.com[6] then --Communication timeout
						RedLedOnCntMs = 100 --Red LED flash 0.1s
						print(string.format("YX_MB_List.data[%d]: modbus send timeout!", j))
					end
				--This register has been read before
				else
					--Get the desired bit value (0 or 1) from the previously read 16-bit register
					bit_val = getBitValue(last_reg_value, data[3]) --data[3]: "BIT0"~"BIT15"
					--Update 61850 data point, e.g. "RTU/GGIO1.Ind1.stVal"
					LIB_IEC61850OprNode("YX_RS", data[1]..".stVal", bit_val)
				end
			end
		--01/02 read coils or read discrete inputs
		else
			LIB_ModbusToJsonConfig(4096)
			--Add all modbus telemetry data points (registers) under a 485 slave
			for j, data in ipairs(mb.data) do
				LIB_ModbusToJsonAdd(data[2], data[3], data[4], data[1])
			end
			--Get modbus telemetry data from 485 slave via RS485 based on configured communication parameters
			LIB_ModbusToJsonSend(mb.com[1], mb.com[2], mb.com[3], mb.com[4], mb.com[5], mb.com[6], mb.com[7])
			-- Wait for RS485 communication to end
			while(GC(1) == true)
			do
				Finish,Data,Err = LIB_ModbusToJsonFinishCheck()
				if Finish == 1 then
					if Data == "null" then --485 communication error
						RedLedOnCntMs = 100 --Red LED flash 0.1s
						print(string.format("YX_MB_List[%d]:", i)..Err) --Print log
					else --Successfully received 485 data, generated JSON string like: {"RTU/GGIO1.Ind1":0, "RTU/GGIO1.Ind2":0, "RTU/GGIO1.Ind3":1...}
						GreenLedOnCntMs = 100 --Green LED flash 0.1s
						print(string.format("YX_MB_List[%d]:", i)..Data)
						for k, yx in ipairs(YX_List) do --Traverse all 61850 data points in a 485 slave
							--Check if JSON contains value like yx[1] = "RTU/GGIO1.Ind1" and parse 0 or 1 value
							Json_Val_0_1 = LIB_JsonExDotParse(Data, "$."..yx[1], "Int32")
							if Json_Val_0_1 ~= nil then
								--Update 61850 data point, e.g. "RTU/GGIO1.Ind1.stVal"
								LIB_IEC61850OprNode("YX_RS", yx[1]..yx[2], Json_Val_0_1)
							else
								print("json parse "..yx[1].." error")
							end
						end
					end
					DelayMs(mb.com[7]) --Delay mb.com[7] (communication interval time ms per packet)
					break --Break out of while loop
				end
			end
		end
	end
end

--Convert IEC61850 master remote control signal to Modbus 05 function code write slave coil operation
function ModbusToIec61850_YK()
	--Check if remote control command received
	ret,val = LIB_IEC61850OprNode("YK_RC")
	if ret ~= nil then --ret value like: "RTU/GGIO1.SPCSO1"
		--Traverse all 485 slaves defined in YK_MB_List to find which slave needs to execute remote control command
		for i, mb in ipairs(YK_MB_List) do
			--Traverse all coils under a slave
			for j, data in ipairs(mb.data) do
				--Check if this is the coil that needs to be controlled
				if data[1] == ret then
					--Send modbus 05 data command packet via Uart1 port
					LIB_Uart1SetParam(mb.com[1], mb.com[2], mb.com[3])
					LIB_Uart1BlockSend(LIB_MbRtuMasterSendTrans(mb.com[4], mb.com[5], data[2], val))
					DelayMs(mb.com[7]) --Delay mb.com[7] (communication interval time ms per packet)
				end
			end

		end
	end
end

--Convert IEC61850 master remote adjustment value (float) to Modbus 10 function code write slave 2 registers operation
function ModbusToIec61850_YT()
	--Check if remote adjustment command received
	ret, float32_val = LIB_IEC61850OprNode("YT_RR")
	if ret ~= nil then --ret value like: "RTU/GGIO1.SPCSO1"
		--Traverse all 485 slaves defined in YT_MB_List to find which slave needs to execute remote control command
		for i, mb in ipairs(YT_MB_List) do
			--Traverse all remote adjustment data points under a slave
			for j, data in ipairs(mb.data) do
				--Check if this is the remote adjustment data point that needs to be controlled
				if data[1] == ret then
					--Send modbus 10 data command packet via Uart1 port, continuously write 2 16-bit registers, implement F_ABCD or F_CDBA type data transmission and writing
					LIB_Uart1SetParam(mb.com[1], mb.com[2], mb.com[3])
					--Convert IEEE-754 float to two binary 16-bit data
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
					--Send in modbus 10 function code (write multiple registers) data format, continuously write two registers
					LIB_Uart1BlockSend(LIB_MbRtuMasterSendTrans(mb.com[4], mb.com[5], data[2], tab))
					DelayMs(mb.com[7]) --Delay mb.com[7] (communication interval time ms per packet)
				end
			end
		end
	end
end


--Define 10ms timer callback function, function name must be LIB_10msTimerCallback
function LIB_10msTimerCallback()
	UpdatePeriodCntMs = UpdatePeriodCntMs + 10
	DelayMsCnt = DelayMsCnt + 10
	WaitMsCnt = WaitMsCnt + 10
	--Feed watchdog
	LIB_GpioToggle(WDT_PIN)
	--LED flash duration handling
	if BlueLedOnCntMs > 0 then
		BlueLedOnCntMs = BlueLedOnCntMs - 10
		LIB_GpioWrite(BLED_PIN, 0) --Blue LED on 
	else
		LIB_GpioWrite(BLED_PIN, 1) --Blue LED off
	end
	if GreenLedOnCntMs > 0 then
		GreenLedOnCntMs = GreenLedOnCntMs - 10
		LIB_GpioWrite(GLED_PIN, 0) --Green LED on
	else
		LIB_GpioWrite(GLED_PIN, 1) --Green LED off
	end
	if RedLedOnCntMs > 0 then
		RedLedOnCntMs = RedLedOnCntMs - 10
		LIB_GpioWrite(RLED_PIN, 0) --Red LED on
	else
		LIB_GpioWrite(RLED_PIN, 1) --Red LED off
	end
	--Blue LED stays on when 61850 is connected and other color LEDs are not occupied
	if LIB_IEC61850NetIsConnect() == 1 and GreenLedOnCntMs <= 0 and RedLedOnCntMs <= 0 then
		BlueLedOnCntMs = 1000
	else
		BlueLedOnCntMs = 0
	end
end

--Initialization code starts below
LIB_LuaTfLogDisable()
LIB_UsbConfig("CDC")--Enable USB print function
--Configure sys red LED and sys green LED to D9 and D8
LIB_SysLedConfig("D9","D8")
--Configure D11 to control watchdog feed pin
LIB_GpioOutputConfig(WDT_PIN,"STANDARD")
--Configure D7,D8,D9 to control B,G,R pins of three-color RGB LED
LIB_GpioOutputConfig(BLED_PIN, "STANDARD")
LIB_GpioOutputConfig(GLED_PIN, "STANDARD")
LIB_GpioOutputConfig(RLED_PIN, "STANDARD")
LIB_GpioWrite(BLED_PIN, 1) --Blue LED off
LIB_GpioWrite(GLED_PIN, 1) --Green LED off
LIB_GpioWrite(RLED_PIN, 1) --Red LED off 
--RS485 interface initialization
LIB_Uart1Rs485Config("BAUDRATE_115200", RS485_PIN)

--RGB LED flash 3 times
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

--Add all required 61850 data points
if YC_List ~= nil then
	LIB_IEC61850AddNode("YC_RM", YC_List)
end
if YX_List ~= nil then
	LIB_IEC61850AddNode("YX_RS", YX_List)
end
if YK_List ~= nil then
	LIB_IEC61850AddNode("YK_RC", YK_List)
end
if YT_List ~= nil then
	LIB_IEC61850AddNode("YT_RR", YT_List)
end
--Enable system 10ms timer to start working
LIB_10msTimerConfig("ENABLE")
--Set W5500 Ethernet module SPI MISO,MOSI,CLK,CS occupy D1D2D3D4 pins, RST occupy D5 pin
--And enable IEC61850 MMS Server service (TCP Server)
if sntp_enable == 1 then
	LIB_IEC61850ServerStart("SPI_1",ETHRST_PIN,mac,ip,subm,gw,dns,port,keepalive_time,sntp_ip,sntp_port,sntp_interval)
else
	LIB_IEC61850ServerStart("SPI_1",ETHRST_PIN,mac,ip,subm,gw,dns,port,keepalive_time)
end
if net_autofix_enable == 1 then
		--Set if no message received from peer for net_autofix_time seconds continuously, automatically restart entire system or restart network
	LIB_IEC61850NetAutoFixCfg(net_autofix_time, net_autofix_way)
end
--Enter main loop
while(GC(1) == true)
do
		--Update telemetry and telemetry data point values every Poll_Time milliseconds
	if UpdatePeriodCntMs > Poll_Time then
		UpdatePeriodCntMs = 0
		
		if YC_MB_List ~=nil then
			--Read Modbus slave telemetry data and sync data to IEC61850 master
			ModbusToIec61850_YC()
		end
		if YX_MB_List ~=nil then
			--Read Modbus slave telemetry data and sync data to IEC61850 master
			ModbusToIec61850_YX()
		end
	end
	if YK_MB_List ~=nil then
		--Receive remote control commands from IEC61850 master and sync to modbus slave
		ModbusToIec61850_YK()
	end
	if YT_MB_List ~=nil then
		--Receive remote adjustment data from IEC61850 master and sync to modbus slave
		ModbusToIec61850_YT()
	end
	if net_autofix_enable == 1 then
		LIB_IEC61850NetFixDeamon()
	end
end