--IEC61850 以太网端口信息配置
mac = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00} --自身mac地址(全0x00时采用芯片全球唯一mac地址)
ip = {192, 168, 0, 111} --自身ip地址 
subm = {255,255,255,0} --子网掩码
gw = {192, 168, 0, 1} --路由器地址
dns = {8,8,8,8} --dns地址
port = 102 --本机(61850 server)端口号

--------------!!重点：用户需确保下面的YT_List和MB_List一一对应!!------------------

--IEC61850 遥调 数据点定义
YT_List = 
{
	--1号 Modbus 遥调控制单元（包含4路遥调控制）
	{"RTU/GGIO1.SetPnt1", ".setMag.f"},--遥调控制，32位浮点数型
	{"RTU/GGIO1.SetPnt2", ".setMag.f"},--遥调控制，32位浮点数型
	{"RTU/GGIO1.SetPnt3", ".setMag.f"},--遥调控制，32位浮点数型
	{"RTU/GGIO1.SetPnt4", ".setMag.f"} --遥调控制，32位浮点数型
}

--Modbus 遥调 数据点定义
MB_List = 
{
	--1号 Modbus 遥调控制单元（包含4路遥调控制）
	{
		--9600,无校验,1位停止位,功能码"10",modbus地址0x02,应答最长等待100ms,分包间隔时间1000ms
		com = {"BAUDRATE_9600","NoneParity","StopBit_1","10",0x02,100,1000},  
		data = 
		{
			{"RTU/GGIO1.SetPnt1",0x0000, "F_ABCD"}, --遥调控制，写2个16bit寄存器，构成32位ABCD类型浮点数
			{"RTU/GGIO1.SetPnt2",0x0002, "F_ABCD"}, --遥调控制，写2个16bit寄存器，构成32位ABCD类型浮点数
			{"RTU/GGIO1.SetPnt3",0x0004, "F_ABCD"}, --遥调控制，写2个16bit寄存器，构成32位ABCD类型浮点数
			{"RTU/GGIO1.SetPnt4",0x0006, "F_ABCD"}  --遥调控制，写2个16bit寄存器，构成32位ABCD类型浮点数
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

--将Iec61850主站下发的遥调数值(浮点数)，转换为Modbus 10功能码写从机2个寄存器的操作
function ModbusToIec61850()
	--查询是否收到遥调指令
	ret, float32_val = LIB_IEC61850OprNode("YT_RR")
	if ret ~= nil then --ret的值类似为："RTU/GGIO1.SPCSO1"
		--遍历MB_List中定义的所有485从机，查找出是哪个从机需要执行遥控指令
		for i, mb in ipairs(MB_List) do
			--遍历某个从机下面的所有遥调数据点
			for j, data in ipairs(mb.data) do
				--判断是不是需要控制的那个遥调数据点
				if data[1] == ret then
					--通过 Uart1 口下发modbus 10数据指令包，连续写入2个16位寄存器，实现F_ABCD或F_CDBA类型数据的传输和写入
					LIB_Uart1SetParam(mb.com[1], mb.com[2], mb.com[3])
					--将IEEE-754浮点数转换成两个二进制16位数据
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
					--以modbus 10功能码(写多个寄存器)数据格式发送，连续写入两个寄存器
					LIB_Uart1BlockSend(LIB_MbRtuMasterSendTrans(mb.com[4], mb.com[5], data[2], tab))
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

	--接收485返回的数据，并判断10写多个寄存器指令是否成功
	recv_flag,recv_tab=LIB_Uart1Recv()
	if recv_flag == 1 then
		result=LIB_MbRtuMasterRecvTrans("10",recv_tab)
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
--添加所有需要的61850遥调数据点
LIB_IEC61850AddNode("YT_RR", YT_List)
--使能系统10毫秒定时器开始工作
LIB_10msTimerConfig("ENABLE")
--设置W5500以太网模块SPI的MISO,MOSI,CLK,CS占用D1D2D3D4引脚，RST占用D5引脚
--并开启IEC61850 MMS Server服务(TCP Server)，keepalive=60秒,禁止SNTP请求
LIB_IEC61850ServerStart("SPI_1",ETHRST_PIN,mac,ip,subm,gw,dns,port,60)--,{192,168,0,105},123,30)
--设置如果连续7200秒没收到对端任何消息，自动重启整个系统
--LIB_IEC61850NetAutoFixCfg(7200, "SYS_REBOOT") --删除这行代码，因为对端连续7200秒不下发遥调指令也是正常情况
--进入大循环中
while(GC(1) == true)
do

	--将Iec61850主站下发的遥调数值(浮点数)，转换为Modbus 10功能码写从机2个寄存器的操作
	ModbusToIec61850()

	--LIB_IEC61850NetFixDeamon()
end