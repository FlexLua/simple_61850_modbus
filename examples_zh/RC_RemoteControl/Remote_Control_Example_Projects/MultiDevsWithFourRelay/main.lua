--IEC61850 以太网端口信息配置
mac = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00} --自身mac地址(全0x00时采用芯片全球唯一mac地址)
ip = {192, 168, 0, 111} --自身ip地址 
subm = {255,255,255,0} --子网掩码
gw = {192, 168, 0, 1} --路由器地址
dns = {8,8,8,8} --dns地址
port = 102 --本机(61850 server)端口号

--------------!!重点：用户需确保下面的YK_List和MB_List一一对应!!------------------

--IEC61850 遥控 数据点定义
YK_List = 
{
	--1号 Modbus IO 输出控制单元（包含4路IO输出控制）
	{"RTU/GGIO1.SPCSO1", ".stVal"}, --开关量IO输出控制，0或1
	{"RTU/GGIO1.SPCSO2", ".stVal"}, --开关量IO输出控制，0或1
	{"RTU/GGIO1.SPCSO3", ".stVal"}, --开关量IO输出控制，0或1
	{"RTU/GGIO1.SPCSO4", ".stVal"}, --开关量IO输出控制，0或1
	--2号 Modbus IO 输出控制单元（包含4路IO输出控制）
	{"RTU/GGIO2.SPCSO1", ".stVal"}, --开关量IO输出控制，0或1
	{"RTU/GGIO2.SPCSO2", ".stVal"}, --开关量IO输出控制，0或1
	{"RTU/GGIO2.SPCSO3", ".stVal"}, --开关量IO输出控制，0或1
	{"RTU/GGIO2.SPCSO4", ".stVal"}, --开关量IO输出控制，0或1
	--3号 Modbus IO 输出控制单元（包含4路IO输出控制）
	{"RTU/GGIO3.SPCSO1", ".stVal"}, --开关量IO输出控制，0或1
	{"RTU/GGIO3.SPCSO2", ".stVal"}, --开关量IO输出控制，0或1
	{"RTU/GGIO3.SPCSO3", ".stVal"}, --开关量IO输出控制，0或1
	{"RTU/GGIO3.SPCSO4", ".stVal"}  --开关量IO输出控制，0或1
}

--Modbus 遥控 数据点定义
MB_List = 
{
	--1号 Modbus IO 输出控制单元（包含4路IO输出控制）
	{
		--9600,无校验,1位停止位,功能码"05",modbus地址0x08,应答最长等待100ms,分包间隔时间1000ms
		com = {"BAUDRATE_9600","NoneParity","StopBit_1","05",0x08,100,1000},  
		data = 
		{
			{"RTU/GGIO1.SPCSO1",0x0000}, --开关量IO输出控制，写线圈，0或1
			{"RTU/GGIO1.SPCSO2",0x0001}, --开关量IO输出控制，写线圈，0或1
			{"RTU/GGIO1.SPCSO3",0x0002}, --开关量IO输出控制，写线圈，0或1
			{"RTU/GGIO1.SPCSO4",0x0003}  --开关量IO输出控制，写线圈，0或1
		}
	},
	--2号 Modbus IO 输出控制单元（包含4路IO输出控制）
	{
		--9600,无校验,1位停止位,功能码"05",modbus地址0x09,应答最长等待100ms,分包间隔时间1000ms
		com = {"BAUDRATE_9600","NoneParity","StopBit_1","05",0x09,100,1000},  
		data = 
		{
			{"RTU/GGIO2.SPCSO1",0x0000}, --开关量IO输出控制，写线圈，0或1
			{"RTU/GGIO2.SPCSO2",0x0001}, --开关量IO输出控制，写线圈，0或1
			{"RTU/GGIO2.SPCSO3",0x0002}, --开关量IO输出控制，写线圈，0或1
			{"RTU/GGIO2.SPCSO4",0x0003}  --开关量IO输出控制，写线圈，0或1
		}
	},
	--3号 Modbus IO 输出控制单元（包含4路IO输出控制）
	{
		--9600,无校验,1位停止位,功能码"05",modbus地址0x0A,应答最长等待100ms,分包间隔时间1000ms
		com = {"BAUDRATE_9600","NoneParity","StopBit_1","05",0x0A,100,1000},  
		data = 
		{
			{"RTU/GGIO3.SPCSO1",0x0000}, --开关量IO输出控制，写线圈，0或1
			{"RTU/GGIO3.SPCSO2",0x0001}, --开关量IO输出控制，写线圈，0或1
			{"RTU/GGIO3.SPCSO3",0x0002}, --开关量IO输出控制，写线圈，0或1
			{"RTU/GGIO3.SPCSO4",0x0003}  --开关量IO输出控制，写线圈，0或1
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

--将Iec61850主站下发的遥控信号，转换为Modbus 05功能码写从机线圈操作
function ModbusToIec61850()
	--查询是否收到遥控指令
	ret,val = LIB_IEC61850OprNode("YK_RC")
	if ret ~= nil then --ret的值类似为："RTU/GGIO1.SPCSO1"
		--遍历MB_List中定义的所有485从机，查找出是哪个从机需要执行遥控指令
		for i, mb in ipairs(MB_List) do
			--遍历某个从机下面的所有线圈
			for j, data in ipairs(mb.data) do
				--判断是不是需要控制的那个线圈
				if data[1] == ret then
					--通过 Uart1 口下发modbus 05数据指令包
					LIB_Uart1SetParam(mb.com[1], mb.com[2], mb.com[3])
					LIB_Uart1BlockSend(LIB_MbRtuMasterSendTrans(mb.com[4], mb.com[5], data[2], val))
				end
			end

		end
	end
end

--定义10毫秒定时器的回调函数，函数名字必须是LIB_10msTimerCallback
function LIB_10msTimerCallback()
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

	--接收485返回的数据，并判断05写单个线圈是否成功
	recv_flag,recv_tab=LIB_Uart1Recv()
	if recv_flag == 1 then
		result=LIB_MbRtuMasterRecvTrans("05",recv_tab)
		if result > 0 then --成功
			GreenLedOnCntMs = 100 --绿灯闪0.1秒
		else --失败
			RedLedOnCntMs = 100 --红灯闪0.1秒
		end
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
--添加所有需要的61850遥控数据点
LIB_IEC61850AddNode("YK_RC", YK_List)
--使能系统10毫秒定时器开始工作
LIB_10msTimerConfig("ENABLE")
--设置W5500以太网模块SPI的MISO,MOSI,CLK,CS占用D1D2D3D4引脚，RST占用D5引脚
--并开启IEC61850 MMS Server服务(TCP Server)，keepalive=60秒,禁止SNTP请求
LIB_IEC61850ServerStart("SPI_1",ETHRST_PIN,mac,ip,subm,gw,dns,port,60)--,{192,168,0,105},123,30)
--设置如果连续7200秒没收到对端任何消息，自动重启整个系统
--LIB_IEC61850NetAutoFixCfg(7200, "SYS_REBOOT") --删除这行代码，因为对端连续7200秒不下发控制指令也是正常情况
--进入大循环中
while(GC(1) == true)
do

	--将Iec61850主站下发的遥控信号，转换为Modbus 05功能码写从机线圈操作
	ModbusToIec61850()

	--LIB_IEC61850NetFixDeamon()
end