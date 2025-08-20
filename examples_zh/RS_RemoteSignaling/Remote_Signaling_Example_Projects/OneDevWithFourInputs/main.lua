--IEC61850 以太网端口信息配置
mac = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00} --自身mac地址(全0x00时采用芯片全球唯一mac地址)
ip = {192, 168, 0, 111} --自身ip地址 
subm = {255,255,255,0} --子网掩码
gw = {192, 168, 0, 1} --路由器地址
dns = {8,8,8,8} --dns地址
port = 102 --本机(61850 server)端口号

--------------!!重点：用户需确保下面的YX_List和MB_List一一对应!!------------------

--IEC61850 遥信 数据点定义
YX_List = 
{
	--1号 Modbus IO 输入监测单元（包含4路输入监测）
	{"RTU/GGIO1.Ind1", ".stVal"}, --开关量IO输入监测，0或1
	{"RTU/GGIO1.Ind2", ".stVal"}, --开关量IO输入监测，0或1
	{"RTU/GGIO1.Ind3", ".stVal"}, --开关量IO输入监测，0或1
	{"RTU/GGIO1.Ind4", ".stVal"}  --开关量IO输入监测，0或1
}

--Modbus 遥信 数据点定义
MB_POLL_TIME_MS = 5000 --设置轮询下面所有485设备的最小周期时间: 5000ms(5秒)，如果某个设备通信不畅，实际时间可能更长
MB_INTERVAL_MS = 100 --设置和每个485通信的最小间隔时间
MB_List = 
{
	--1号 Modbus IO 输入监测单元（包含4路输入监测）
	{
		--9600,无校验,1位停止位,功能码"01",modbus地址0x05,应答最长等待100ms,分包间隔时间1000ms
		com = {"BAUDRATE_9600","NoneParity","StopBit_1","01",0x05,100,1000},  
		data = 
		{
			{"RTU/GGIO1.Ind1",0x0000,"BIT",0}, --开关量IO输入监测，读线圈，返回0或1
			{"RTU/GGIO1.Ind2",0x0001,"BIT",0}, --开关量IO输入监测，读线圈，返回0或1
			{"RTU/GGIO1.Ind3",0x0002,"BIT",0}, --开关量IO输入监测，读线圈，返回0或1
			{"RTU/GGIO1.Ind4",0x0003,"BIT",0}  --开关量IO输入监测，读线圈，返回0或1
		}
	}
}

--引脚定义
WDT_PIN = "D11"
BLED_PIN = "D7"
GLED_PIN = "D8"
RLED_PIN = "D9"
ETHRST_PIN = "D5"
RS485_PIN = "D0"

--全局变量定义
UpdatePeriodCntMs = 0 --Modbus轮询周期计时器变量(单位:ms)
DelayMsCnt = 0
BlueLedOnCntMs = 0
GreenLedOnCntMs = 0
RedLedOnCntMs = 0

--延时n毫秒函数
function DelayMs(n)
	DelayMsCnt = 0
	while DelayMsCnt < n do
		GC(1)
	end
end

--01/02功能码读取Modbus从机线圈状态或离散输入状态并同步给Iec61850
function ModbusToIec61850()
	--逐个轮询MB_List中定义的所有485从机
	for i, mb in ipairs(MB_List) do
		LIB_ModbusToJsonConfig(4096)
		--添加某个485从机下的所有modbus遥测数据点(寄存器)
		for j, data in ipairs(mb.data) do
			LIB_ModbusToJsonAdd(data[2], data[3], data[4], data[1])
		end
		--根据已配置的通信参数, 通过RS485向该485从机获取上面添加的modbus遥测数据
		LIB_ModbusToJsonSend(mb.com[1], mb.com[2], mb.com[3], mb.com[4], mb.com[5], mb.com[6], mb.com[7])
		-- 等待RS485通信结束
		while(GC(1) == true)
		do
			Finish,Data,Err = LIB_ModbusToJsonFinishCheck()
			if Finish == 1 then
				if Data == "null" then --485通信错误
					RedLedOnCntMs = 100 --红灯闪0.1秒
					print(string.format("MB_LIST[%d]:", i)..Err) --打印日志
				else --成功收到485数据，并生成json字符串形如:{"RTU/GGIO1.Ind1":0, "RTU/GGIO1.Ind2":0, "RTU/GGIO1.Ind3":1...}
					GreenLedOnCntMs = 100 --绿灯闪0.1秒
					print(string.format("MB_LIST[%d]:", i)..Data)
					for k, yx in ipairs(YX_List) do --遍历某个485从机中的所有61850数据点
						--判断该json中是否包含类似yx[1] = "RTU/GGIO1.Ind1"的值，并解析出0或1值
						Json_Val_0_1 = LIB_JsonExDotParse(Data, "$."..yx[1], "Int32")
						if Json_Val_0_1 ~= nil then
							--更新61850数据点,例如 "RTU/GGIO1.Ind1.stVal"
							LIB_IEC61850OprNode("YX_RS", yx[1]..yx[2], Json_Val_0_1)
						else
							print("json parse "..yx[1].." error")
						end
					end
				end
				DelayMs(MB_INTERVAL_MS) --延时100ms
				break --跳出while循环
			end
		end
	end
end

--定义10毫秒定时器的回调函数，函数名字必须是LIB_10msTimerCallback
function LIB_10msTimerCallback()
	UpdatePeriodCntMs = UpdatePeriodCntMs + 10
	DelayMsCnt = DelayMsCnt + 10
	--喂狗
	LIB_GpioToggle(WDT_PIN)
	--led灯闪烁时长处理
	if BlueLedOnCntMs > 0 then
		BlueLedOnCntMs = BlueLedOnCntMs - 10
		LIB_GpioWrite(BLED_PIN, 0) --Blue led 亮 
	else
		LIB_GpioWrite(BLED_PIN, 1) --Blue led 灭
	end
	if GreenLedOnCntMs > 0 then
		GreenLedOnCntMs = GreenLedOnCntMs - 10
		LIB_GpioWrite(GLED_PIN, 0) --Green led 亮
	else
		LIB_GpioWrite(GLED_PIN, 1) --Green led 灭
	end
	if RedLedOnCntMs > 0 then
		RedLedOnCntMs = RedLedOnCntMs - 10
		LIB_GpioWrite(RLED_PIN, 0) --Red led 亮
	else
		LIB_GpioWrite(RLED_PIN, 1) --Red led 灭
	end
	--61850处于连接状态时且其它颜色灯不占用时，蓝灯一直亮
	if LIB_IEC61850NetIsConnect() == 1 and GreenLedOnCntMs <= 0 and RedLedOnCntMs <= 0then
		BlueLedOnCntMs = 1000
	else
		BlueLedOnCntMs = 0
	end
end

--以下代码开始初始化
LIB_LuaTfLogDisable()
--将sys red led和sys green led配置成D9和D8
LIB_SysLedConfig("D9","D8")
LIB_UsbConfig("CDC")--开启usb打印功能
--配置D11控制看门狗喂狗引脚
LIB_GpioOutputConfig(WDT_PIN,"STANDARD")
--配置D7,D8,D9控制三色RGB灯的B,G,R引脚
LIB_GpioOutputConfig(BLED_PIN, "STANDARD")
LIB_GpioOutputConfig(GLED_PIN, "STANDARD")
LIB_GpioOutputConfig(RLED_PIN, "STANDARD")
LIB_GpioWrite(BLED_PIN, 1) --Blue led 灭
LIB_GpioWrite(GLED_PIN, 1) --Green led 灭
LIB_GpioWrite(RLED_PIN, 1) --Red led 灭 
--RS485接口初始化
LIB_Uart1Rs485Config("BAUDRATE_115200", RS485_PIN)

--RGB灯闪3下
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
--添加所有需要的61850遥信数据点
LIB_IEC61850AddNode("YX_RS", YX_List)
--使能系统10毫秒定时器开始工作
LIB_10msTimerConfig("ENABLE")
--设置W5500以太网模块SPI的MISO,MOSI,CLK,CS占用D1D2D3D4引脚，RST占用D5引脚
--并开启IEC61850 MMS Server服务(TCP Server)，keepalive=60秒,禁止SNTP请求
LIB_IEC61850ServerStart("SPI_1",ETHRST_PIN,mac,ip,subm,gw,dns,port,60)--,{192,168,0,105},123,30)
--设置如果连续7200秒没收到对端任何消息，自动重启整个系统
--LIB_IEC61850NetAutoFixCfg(7200, "SYS_REBOOT")
--进入大循环中
while(GC(1) == true)
do
	--每隔MB_POLL_TIME_MS毫秒更新一次遥测和数据点的值
	if UpdatePeriodCntMs > MB_POLL_TIME_MS then
		UpdatePeriodCntMs = 0
		
		--01/02功能码读取Modbus从机线圈状态或离散输入状态并同步给Iec61850
		ModbusToIec61850()
	end
	--LIB_IEC61850NetFixDeamon()
end