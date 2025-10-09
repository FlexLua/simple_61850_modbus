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
	{"RTU/GGIO8.AnIn1", ".mag.f", "FLOAT32"}, --FLOAT, 1_UPS_Power_Analog_Input Voltage
	{"RTU/GGIO8.AnIn2", ".mag.f", "FLOAT32"}, --FLOAT, 1_UPS_Power_Analog_Output Voltage
	{"RTU/GGIO8.Inc3", ".stVal", "INT32"}, --INT32, 1_UPS_Power_Analog_Load
	{"RTU/GGIO8.AnIn4", ".mag.f", "FLOAT32"}, --FLOAT, 1_UPS_Power_Analog_Battery Voltage
	{"RTU/GGIO8.Inc5", ".stVal", "INT32"}, --INT32, 1_UPS_Power_Analog_Temperature
	{"RTU/GGIO8.AnIn6", ".mag.f", "FLOAT32"}, --FLOAT, 1_UPS_Power_Analog_Input Frequency
};

--IEC61850 YX_RS DataPoints
YX_List={
	{"RTU/GGIO7.Ind1", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 1
	{"RTU/GGIO7.Ind2", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 2
	{"RTU/GGIO7.Ind3", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 3
	{"RTU/GGIO7.Ind4", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 4
	{"RTU/GGIO7.Ind5", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 5
	{"RTU/GGIO7.Ind6", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 6
	{"RTU/GGIO7.Ind7", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 7
	{"RTU/GGIO7.Ind8", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 8
	{"RTU/GGIO7.Ind9", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 9
	{"RTU/GGIO7.Ind10", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 10
	{"RTU/GGIO7.Ind11", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 11
	{"RTU/GGIO7.Ind12", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 12
	{"RTU/GGIO7.Ind13", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 13
	{"RTU/GGIO7.Ind14", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 14
	{"RTU/GGIO7.Ind15", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 15
	{"RTU/GGIO7.Ind16", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 16
	{"RTU/GGIO7.Ind17", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 17
	{"RTU/GGIO7.Ind18", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 18
	{"RTU/GGIO7.Ind19", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 19
	{"RTU/GGIO7.Ind20", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 20
	{"RTU/GGIO7.Ind21", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 21
	{"RTU/GGIO7.Ind22", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 22
	{"RTU/GGIO7.Ind23", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 23
	{"RTU/GGIO7.Ind24", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 24
	{"RTU/GGIO7.Ind25", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 25
	{"RTU/GGIO7.Ind26", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 26
	{"RTU/GGIO7.Ind27", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 27
	{"RTU/GGIO7.Ind28", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 28
	{"RTU/GGIO7.Ind29", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 29
	{"RTU/GGIO7.Ind30", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 30
	{"RTU/GGIO7.Ind31", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 31
	{"RTU/GGIO7.Ind32", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 32
	{"RTU/GGIO7.Ind33", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 33
	{"RTU/GGIO7.Ind34", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 34
	{"RTU/GGIO7.Ind35", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 35
	{"RTU/GGIO7.Ind36", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 36
	{"RTU/GGIO7.Ind37", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 37
	{"RTU/GGIO7.Ind38", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 38
	{"RTU/GGIO7.Ind39", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 39
	{"RTU/GGIO7.Ind40", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 40
	{"RTU/GGIO7.Ind41", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 41
	{"RTU/GGIO7.Ind42", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 42
	{"RTU/GGIO7.Ind43", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 43
	{"RTU/GGIO7.Ind44", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 44
	{"RTU/GGIO7.Ind45", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 45
	{"RTU/GGIO7.Ind46", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 46
	{"RTU/GGIO7.Ind47", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 47
	{"RTU/GGIO7.Ind48", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 48
	{"RTU/GGIO7.Ind49", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 49
	{"RTU/GGIO7.Ind50", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 50
	{"RTU/GGIO7.Ind51", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 51
	{"RTU/GGIO7.Ind52", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 52
	{"RTU/GGIO7.Ind53", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 53
	{"RTU/GGIO7.Ind54", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 54
	{"RTU/GGIO7.Ind55", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 55
	{"RTU/GGIO7.Ind56", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 56
	{"RTU/GGIO7.Ind57", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 57
	{"RTU/GGIO7.Ind58", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 58
	{"RTU/GGIO7.Ind59", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 59
	{"RTU/GGIO7.Ind60", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 60
	{"RTU/GGIO7.Ind61", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 61
	{"RTU/GGIO7.Ind62", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 62
	{"RTU/GGIO7.Ind63", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 63
	{"RTU/GGIO7.Ind64", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 64
	{"RTU/GGIO7.Ind65", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 65
	{"RTU/GGIO7.Ind66", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 66
	{"RTU/GGIO7.Ind67", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 67
	{"RTU/GGIO7.Ind68", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 68
	{"RTU/GGIO7.Ind69", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 69
	{"RTU/GGIO7.Ind70", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 70
	{"RTU/GGIO7.Ind71", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 71
	{"RTU/GGIO7.Ind72", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 72
	{"RTU/GGIO7.Ind73", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 73
	{"RTU/GGIO7.Ind74", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 74
	{"RTU/GGIO7.Ind75", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 75
	{"RTU/GGIO7.Ind76", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 76
	{"RTU/GGIO7.Ind77", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 77
	{"RTU/GGIO7.Ind78", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 78
	{"RTU/GGIO7.Ind79", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 79
	{"RTU/GGIO7.Ind80", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 80
	{"RTU/GGIO7.Ind81", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 81
	{"RTU/GGIO7.Ind82", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 82
	{"RTU/GGIO7.Ind83", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 83
	{"RTU/GGIO7.Ind84", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 84
	{"RTU/GGIO7.Ind85", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 85
	{"RTU/GGIO7.Ind86", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 86
	{"RTU/GGIO7.Ind87", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 87
	{"RTU/GGIO7.Ind88", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 88
	{"RTU/GGIO7.Ind89", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 89
	{"RTU/GGIO7.Ind90", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 90
	{"RTU/GGIO7.Ind91", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 91
	{"RTU/GGIO7.Ind92", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 92
	{"RTU/GGIO7.Ind93", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 93
	{"RTU/GGIO7.Ind94", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 94
	{"RTU/GGIO7.Ind95", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 95
	{"RTU/GGIO7.Ind96", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 96
	{"RTU/GGIO7.Ind97", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 97
	{"RTU/GGIO7.Ind98", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 98
	{"RTU/GGIO7.Ind99", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 99
	{"RTU/GGIO7.Ind100", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 100
	{"RTU/GGIO7.Ind101", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 101
	{"RTU/GGIO7.Ind102", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 102
	{"RTU/GGIO7.Ind103", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 103
	{"RTU/GGIO7.Ind104", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 104
	{"RTU/GGIO7.Ind105", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 105
	{"RTU/GGIO7.Ind106", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 106
	{"RTU/GGIO7.Ind107", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 107
	{"RTU/GGIO7.Ind108", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 108
	{"RTU/GGIO7.Ind109", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 109
	{"RTU/GGIO7.Ind110", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 110
	{"RTU/GGIO7.Ind111", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 111
	{"RTU/GGIO7.Ind112", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 112
	{"RTU/GGIO7.Ind113", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 113
	{"RTU/GGIO7.Ind114", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 114
	{"RTU/GGIO7.Ind115", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 115
	{"RTU/GGIO7.Ind116", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 116
	{"RTU/GGIO7.Ind117", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 117
	{"RTU/GGIO7.Ind118", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 118
	{"RTU/GGIO7.Ind119", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 119
	{"RTU/GGIO7.Ind120", ".stVal"}, --1_UPS_Power_Fault_Fault Status Bit 120
	{"RTU/GGIO6.Ind1", ".stVal"}, --1_UPS_Power_Switch_Overload
	{"RTU/GGIO6.Ind2", ".stVal"}, --1_UPS_Power_Switch_Power State
	{"RTU/GGIO6.Ind3", ".stVal"}, --1_UPS_Power_Switch_Test
	{"RTU/GGIO6.Ind4", ".stVal"}, --1_UPS_Power_Switch_Reserved
	{"RTU/GGIO6.Ind5", ".stVal"}, --1_UPS_Power_Switch_System Fault
	{"RTU/GGIO6.Ind6", ".stVal"}, --1_UPS_Power_Switch_Working Mode
	{"RTU/GGIO6.Ind7", ".stVal"}, --1_UPS_Power_Switch_Battery Voltage
	{"RTU/GGIO6.Ind8", ".stVal"}, --1_UPS_Power_Switch_Mains Fault
	{"RTU/GGIO6.Ind9", ".stVal"}, --1_UPS_Power_Switch_Charging Fault
	{"RTU/GGIO6.Ind10", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 1
	{"RTU/GGIO6.Ind11", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 2
	{"RTU/GGIO6.Ind12", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 3
	{"RTU/GGIO6.Ind13", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 4
	{"RTU/GGIO6.Ind14", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 5
	{"RTU/GGIO6.Ind15", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 6
	{"RTU/GGIO6.Ind16", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 7
	{"RTU/GGIO6.Ind17", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 8
	{"RTU/GGIO6.Ind18", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 9
	{"RTU/GGIO6.Ind19", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 10
	{"RTU/GGIO6.Ind20", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 11
	{"RTU/GGIO6.Ind21", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 12
	{"RTU/GGIO6.Ind22", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 13
	{"RTU/GGIO6.Ind23", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 14
	{"RTU/GGIO6.Ind24", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 15
	{"RTU/GGIO6.Ind25", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 16
	{"RTU/GGIO6.Ind26", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 17
	{"RTU/GGIO6.Ind27", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 18
	{"RTU/GGIO6.Ind28", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 19
	{"RTU/GGIO6.Ind29", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 20
	{"RTU/GGIO6.Ind30", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 21
	{"RTU/GGIO6.Ind31", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 22
	{"RTU/GGIO6.Ind32", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 23
	{"RTU/GGIO6.Ind33", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 24
	{"RTU/GGIO6.Ind34", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 25
	{"RTU/GGIO6.Ind35", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 26
	{"RTU/GGIO6.Ind36", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 27
	{"RTU/GGIO6.Ind37", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 28
	{"RTU/GGIO6.Ind38", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 29
	{"RTU/GGIO6.Ind39", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 30
	{"RTU/GGIO6.Ind40", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 31
	{"RTU/GGIO6.Ind41", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 32
	{"RTU/GGIO6.Ind42", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 33
	{"RTU/GGIO6.Ind43", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 34
	{"RTU/GGIO6.Ind44", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 35
	{"RTU/GGIO6.Ind45", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 36
	{"RTU/GGIO6.Ind46", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 37
	{"RTU/GGIO6.Ind47", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 38
	{"RTU/GGIO6.Ind48", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 39
	{"RTU/GGIO6.Ind49", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 40
	{"RTU/GGIO6.Ind50", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 41
	{"RTU/GGIO6.Ind51", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 42
	{"RTU/GGIO6.Ind52", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 43
	{"RTU/GGIO6.Ind53", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 44
	{"RTU/GGIO6.Ind54", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 45
	{"RTU/GGIO6.Ind55", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 46
	{"RTU/GGIO6.Ind56", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 47
	{"RTU/GGIO6.Ind57", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 48
	{"RTU/GGIO6.Ind58", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 49
	{"RTU/GGIO6.Ind59", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 50
	{"RTU/GGIO6.Ind60", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 51
	{"RTU/GGIO6.Ind61", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 52
	{"RTU/GGIO6.Ind62", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 53
	{"RTU/GGIO6.Ind63", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 54
	{"RTU/GGIO6.Ind64", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 55
	{"RTU/GGIO6.Ind65", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 56
	{"RTU/GGIO6.Ind66", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 57
	{"RTU/GGIO6.Ind67", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 58
	{"RTU/GGIO6.Ind68", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 59
	{"RTU/GGIO6.Ind69", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 60
	{"RTU/GGIO6.Ind70", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 61
	{"RTU/GGIO6.Ind71", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 62
	{"RTU/GGIO6.Ind72", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 63
	{"RTU/GGIO6.Ind73", ".stVal"}, --1_UPS_Power_Switch_Circuit Switch 64
};




YC_MB_List={
	--1_UPS_Power_Analog
	{
		--9600,NoneParity,StopBit_1,Func "03",modbus addr 0x01,wait time 2000ms,package time 100ms
		com = {"BAUDRATE_9600","NoneParity","StopBit_1","03",0x01,2000,100},
		data =
		{
			{"RTU/GGIO8.AnIn1",0x0000,"U_AB",1}, --Input Voltage
			{"RTU/GGIO8.AnIn2",0x0001,"U_AB",1}, --Output Voltage
			{"RTU/GGIO8.Inc3",0x0002,"U_AB",0}, --Load
			{"RTU/GGIO8.AnIn4",0x0003,"U_AB",1}, --Battery Voltage
			{"RTU/GGIO8.Inc5",0x0004,"S_AB",0}, --Temperature
			{"RTU/GGIO8.AnIn6",0x0005,"U_AB",1}, --Input Frequency
		}
	},
};

YX_MB_List={
	--1_UPS_Power_Fault
	{
		--9600,NoneParity,StopBit_1,Func "01",modbus addr 0x01,wait time 1000ms,package time 100ms
		com = {"BAUDRATE_9600","NoneParity","StopBit_1","01",0x01,1000,100},
		data =
		{
			{"RTU/GGIO7.Ind1",1,"BIT",0}, --Fault Status Bit 1
			{"RTU/GGIO7.Ind2",2,"BIT",0}, --Fault Status Bit 2
			{"RTU/GGIO7.Ind3",3,"BIT",0}, --Fault Status Bit 3
			{"RTU/GGIO7.Ind4",4,"BIT",0}, --Fault Status Bit 4
			{"RTU/GGIO7.Ind5",5,"BIT",0}, --Fault Status Bit 5
			{"RTU/GGIO7.Ind6",6,"BIT",0}, --Fault Status Bit 6
			{"RTU/GGIO7.Ind7",7,"BIT",0}, --Fault Status Bit 7
			{"RTU/GGIO7.Ind8",8,"BIT",0}, --Fault Status Bit 8
			{"RTU/GGIO7.Ind9",9,"BIT",0}, --Fault Status Bit 9
			{"RTU/GGIO7.Ind10",10,"BIT",0}, --Fault Status Bit 10
			{"RTU/GGIO7.Ind11",11,"BIT",0}, --Fault Status Bit 11
			{"RTU/GGIO7.Ind12",12,"BIT",0}, --Fault Status Bit 12
			{"RTU/GGIO7.Ind13",13,"BIT",0}, --Fault Status Bit 13
			{"RTU/GGIO7.Ind14",14,"BIT",0}, --Fault Status Bit 14
			{"RTU/GGIO7.Ind15",15,"BIT",0}, --Fault Status Bit 15
			{"RTU/GGIO7.Ind16",16,"BIT",0}, --Fault Status Bit 16
			{"RTU/GGIO7.Ind17",17,"BIT",0}, --Fault Status Bit 17
			{"RTU/GGIO7.Ind18",18,"BIT",0}, --Fault Status Bit 18
			{"RTU/GGIO7.Ind19",19,"BIT",0}, --Fault Status Bit 19
			{"RTU/GGIO7.Ind20",20,"BIT",0}, --Fault Status Bit 20
			{"RTU/GGIO7.Ind21",21,"BIT",0}, --Fault Status Bit 21
			{"RTU/GGIO7.Ind22",22,"BIT",0}, --Fault Status Bit 22
			{"RTU/GGIO7.Ind23",23,"BIT",0}, --Fault Status Bit 23
			{"RTU/GGIO7.Ind24",24,"BIT",0}, --Fault Status Bit 24
			{"RTU/GGIO7.Ind25",25,"BIT",0}, --Fault Status Bit 25
			{"RTU/GGIO7.Ind26",26,"BIT",0}, --Fault Status Bit 26
			{"RTU/GGIO7.Ind27",27,"BIT",0}, --Fault Status Bit 27
			{"RTU/GGIO7.Ind28",28,"BIT",0}, --Fault Status Bit 28
			{"RTU/GGIO7.Ind29",29,"BIT",0}, --Fault Status Bit 29
			{"RTU/GGIO7.Ind30",30,"BIT",0}, --Fault Status Bit 30
			{"RTU/GGIO7.Ind31",31,"BIT",0}, --Fault Status Bit 31
			{"RTU/GGIO7.Ind32",32,"BIT",0}, --Fault Status Bit 32
			{"RTU/GGIO7.Ind33",33,"BIT",0}, --Fault Status Bit 33
			{"RTU/GGIO7.Ind34",34,"BIT",0}, --Fault Status Bit 34
			{"RTU/GGIO7.Ind35",35,"BIT",0}, --Fault Status Bit 35
			{"RTU/GGIO7.Ind36",36,"BIT",0}, --Fault Status Bit 36
			{"RTU/GGIO7.Ind37",37,"BIT",0}, --Fault Status Bit 37
			{"RTU/GGIO7.Ind38",38,"BIT",0}, --Fault Status Bit 38
			{"RTU/GGIO7.Ind39",39,"BIT",0}, --Fault Status Bit 39
			{"RTU/GGIO7.Ind40",40,"BIT",0}, --Fault Status Bit 40
			{"RTU/GGIO7.Ind41",41,"BIT",0}, --Fault Status Bit 41
			{"RTU/GGIO7.Ind42",42,"BIT",0}, --Fault Status Bit 42
			{"RTU/GGIO7.Ind43",43,"BIT",0}, --Fault Status Bit 43
			{"RTU/GGIO7.Ind44",44,"BIT",0}, --Fault Status Bit 44
			{"RTU/GGIO7.Ind45",45,"BIT",0}, --Fault Status Bit 45
			{"RTU/GGIO7.Ind46",46,"BIT",0}, --Fault Status Bit 46
			{"RTU/GGIO7.Ind47",47,"BIT",0}, --Fault Status Bit 47
			{"RTU/GGIO7.Ind48",48,"BIT",0}, --Fault Status Bit 48
			{"RTU/GGIO7.Ind49",49,"BIT",0}, --Fault Status Bit 49
			{"RTU/GGIO7.Ind50",50,"BIT",0}, --Fault Status Bit 50
			{"RTU/GGIO7.Ind51",51,"BIT",0}, --Fault Status Bit 51
			{"RTU/GGIO7.Ind52",52,"BIT",0}, --Fault Status Bit 52
			{"RTU/GGIO7.Ind53",53,"BIT",0}, --Fault Status Bit 53
			{"RTU/GGIO7.Ind54",54,"BIT",0}, --Fault Status Bit 54
			{"RTU/GGIO7.Ind55",55,"BIT",0}, --Fault Status Bit 55
			{"RTU/GGIO7.Ind56",56,"BIT",0}, --Fault Status Bit 56
			{"RTU/GGIO7.Ind57",57,"BIT",0}, --Fault Status Bit 57
			{"RTU/GGIO7.Ind58",58,"BIT",0}, --Fault Status Bit 58
			{"RTU/GGIO7.Ind59",59,"BIT",0}, --Fault Status Bit 59
			{"RTU/GGIO7.Ind60",60,"BIT",0}, --Fault Status Bit 60
			{"RTU/GGIO7.Ind61",61,"BIT",0}, --Fault Status Bit 61
			{"RTU/GGIO7.Ind62",62,"BIT",0}, --Fault Status Bit 62
			{"RTU/GGIO7.Ind63",63,"BIT",0}, --Fault Status Bit 63
			{"RTU/GGIO7.Ind64",64,"BIT",0}, --Fault Status Bit 64
			{"RTU/GGIO7.Ind65",65,"BIT",0}, --Fault Status Bit 65
			{"RTU/GGIO7.Ind66",66,"BIT",0}, --Fault Status Bit 66
			{"RTU/GGIO7.Ind67",67,"BIT",0}, --Fault Status Bit 67
			{"RTU/GGIO7.Ind68",68,"BIT",0}, --Fault Status Bit 68
			{"RTU/GGIO7.Ind69",69,"BIT",0}, --Fault Status Bit 69
			{"RTU/GGIO7.Ind70",70,"BIT",0}, --Fault Status Bit 70
			{"RTU/GGIO7.Ind71",71,"BIT",0}, --Fault Status Bit 71
			{"RTU/GGIO7.Ind72",72,"BIT",0}, --Fault Status Bit 72
			{"RTU/GGIO7.Ind73",73,"BIT",0}, --Fault Status Bit 73
			{"RTU/GGIO7.Ind74",74,"BIT",0}, --Fault Status Bit 74
			{"RTU/GGIO7.Ind75",75,"BIT",0}, --Fault Status Bit 75
			{"RTU/GGIO7.Ind76",76,"BIT",0}, --Fault Status Bit 76
			{"RTU/GGIO7.Ind77",77,"BIT",0}, --Fault Status Bit 77
			{"RTU/GGIO7.Ind78",78,"BIT",0}, --Fault Status Bit 78
			{"RTU/GGIO7.Ind79",79,"BIT",0}, --Fault Status Bit 79
			{"RTU/GGIO7.Ind80",80,"BIT",0}, --Fault Status Bit 80
			{"RTU/GGIO7.Ind81",81,"BIT",0}, --Fault Status Bit 81
			{"RTU/GGIO7.Ind82",82,"BIT",0}, --Fault Status Bit 82
			{"RTU/GGIO7.Ind83",83,"BIT",0}, --Fault Status Bit 83
			{"RTU/GGIO7.Ind84",84,"BIT",0}, --Fault Status Bit 84
			{"RTU/GGIO7.Ind85",85,"BIT",0}, --Fault Status Bit 85
			{"RTU/GGIO7.Ind86",86,"BIT",0}, --Fault Status Bit 86
			{"RTU/GGIO7.Ind87",87,"BIT",0}, --Fault Status Bit 87
			{"RTU/GGIO7.Ind88",88,"BIT",0}, --Fault Status Bit 88
			{"RTU/GGIO7.Ind89",89,"BIT",0}, --Fault Status Bit 89
			{"RTU/GGIO7.Ind90",90,"BIT",0}, --Fault Status Bit 90
			{"RTU/GGIO7.Ind91",91,"BIT",0}, --Fault Status Bit 91
			{"RTU/GGIO7.Ind92",92,"BIT",0}, --Fault Status Bit 92
			{"RTU/GGIO7.Ind93",93,"BIT",0}, --Fault Status Bit 93
			{"RTU/GGIO7.Ind94",94,"BIT",0}, --Fault Status Bit 94
			{"RTU/GGIO7.Ind95",95,"BIT",0}, --Fault Status Bit 95
			{"RTU/GGIO7.Ind96",96,"BIT",0}, --Fault Status Bit 96
			{"RTU/GGIO7.Ind97",97,"BIT",0}, --Fault Status Bit 97
			{"RTU/GGIO7.Ind98",98,"BIT",0}, --Fault Status Bit 98
			{"RTU/GGIO7.Ind99",99,"BIT",0}, --Fault Status Bit 99
			{"RTU/GGIO7.Ind100",100,"BIT",0}, --Fault Status Bit 100
			{"RTU/GGIO7.Ind101",101,"BIT",0}, --Fault Status Bit 101
			{"RTU/GGIO7.Ind102",102,"BIT",0}, --Fault Status Bit 102
			{"RTU/GGIO7.Ind103",103,"BIT",0}, --Fault Status Bit 103
			{"RTU/GGIO7.Ind104",104,"BIT",0}, --Fault Status Bit 104
			{"RTU/GGIO7.Ind105",105,"BIT",0}, --Fault Status Bit 105
			{"RTU/GGIO7.Ind106",106,"BIT",0}, --Fault Status Bit 106
			{"RTU/GGIO7.Ind107",107,"BIT",0}, --Fault Status Bit 107
			{"RTU/GGIO7.Ind108",108,"BIT",0}, --Fault Status Bit 108
			{"RTU/GGIO7.Ind109",109,"BIT",0}, --Fault Status Bit 109
			{"RTU/GGIO7.Ind110",110,"BIT",0}, --Fault Status Bit 110
			{"RTU/GGIO7.Ind111",111,"BIT",0}, --Fault Status Bit 111
			{"RTU/GGIO7.Ind112",112,"BIT",0}, --Fault Status Bit 112
			{"RTU/GGIO7.Ind113",113,"BIT",0}, --Fault Status Bit 113
			{"RTU/GGIO7.Ind114",114,"BIT",0}, --Fault Status Bit 114
			{"RTU/GGIO7.Ind115",115,"BIT",0}, --Fault Status Bit 115
			{"RTU/GGIO7.Ind116",116,"BIT",0}, --Fault Status Bit 116
			{"RTU/GGIO7.Ind117",117,"BIT",0}, --Fault Status Bit 117
			{"RTU/GGIO7.Ind118",118,"BIT",0}, --Fault Status Bit 118
			{"RTU/GGIO7.Ind119",119,"BIT",0}, --Fault Status Bit 119
			{"RTU/GGIO7.Ind120",120,"BIT",0}, --Fault Status Bit 120
		}
	},
	--1_UPS_Power_Switch
	{
		--9600,NoneParity,StopBit_1,Func "02",modbus addr 0x01,wait time 2000ms,package time 100ms
		com = {"BAUDRATE_9600","NoneParity","StopBit_1","02",0x01,2000,100},
		data =
		{
			{"RTU/GGIO6.Ind1",0x0000,"BIT",0}, --Overload
			{"RTU/GGIO6.Ind2",0x0001,"BIT",0}, --Power State
			{"RTU/GGIO6.Ind3",0x0002,"BIT",0}, --Test
			{"RTU/GGIO6.Ind4",0x0003,"BIT",0}, --Reserved
			{"RTU/GGIO6.Ind5",0x0004,"BIT",0}, --System Fault
			{"RTU/GGIO6.Ind6",0x0005,"BIT",0}, --Working Mode
			{"RTU/GGIO6.Ind7",0x0006,"BIT",0}, --Battery Voltage
			{"RTU/GGIO6.Ind8",0x0007,"BIT",0}, --Mains Fault
			{"RTU/GGIO6.Ind9",0x0008,"BIT",0}, --Charging Fault
			{"RTU/GGIO6.Ind10",0x0010,"BIT",0}, --Circuit Switch 1
			{"RTU/GGIO6.Ind11",0x0011,"BIT",0}, --Circuit Switch 2
			{"RTU/GGIO6.Ind12",0x0012,"BIT",0}, --Circuit Switch 3
			{"RTU/GGIO6.Ind13",0x0013,"BIT",0}, --Circuit Switch 4
			{"RTU/GGIO6.Ind14",0x0014,"BIT",0}, --Circuit Switch 5
			{"RTU/GGIO6.Ind15",0x0015,"BIT",0}, --Circuit Switch 6
			{"RTU/GGIO6.Ind16",0x0016,"BIT",0}, --Circuit Switch 7
			{"RTU/GGIO6.Ind17",0x0017,"BIT",0}, --Circuit Switch 8
			{"RTU/GGIO6.Ind18",0x0018,"BIT",0}, --Circuit Switch 9
			{"RTU/GGIO6.Ind19",0x0019,"BIT",0}, --Circuit Switch 10
			{"RTU/GGIO6.Ind20",0x001A,"BIT",0}, --Circuit Switch 11
			{"RTU/GGIO6.Ind21",0x001B,"BIT",0}, --Circuit Switch 12
			{"RTU/GGIO6.Ind22",0x001C,"BIT",0}, --Circuit Switch 13
			{"RTU/GGIO6.Ind23",0x001D,"BIT",0}, --Circuit Switch 14
			{"RTU/GGIO6.Ind24",0x001E,"BIT",0}, --Circuit Switch 15
			{"RTU/GGIO6.Ind25",0x001F,"BIT",0}, --Circuit Switch 16
			{"RTU/GGIO6.Ind26",0x0020,"BIT",0}, --Circuit Switch 17
			{"RTU/GGIO6.Ind27",0x0021,"BIT",0}, --Circuit Switch 18
			{"RTU/GGIO6.Ind28",0x0022,"BIT",0}, --Circuit Switch 19
			{"RTU/GGIO6.Ind29",0x0023,"BIT",0}, --Circuit Switch 20
			{"RTU/GGIO6.Ind30",0x0024,"BIT",0}, --Circuit Switch 21
			{"RTU/GGIO6.Ind31",0x0025,"BIT",0}, --Circuit Switch 22
			{"RTU/GGIO6.Ind32",0x0026,"BIT",0}, --Circuit Switch 23
			{"RTU/GGIO6.Ind33",0x0027,"BIT",0}, --Circuit Switch 24
			{"RTU/GGIO6.Ind34",0x0028,"BIT",0}, --Circuit Switch 25
			{"RTU/GGIO6.Ind35",0x0029,"BIT",0}, --Circuit Switch 26
			{"RTU/GGIO6.Ind36",0x002A,"BIT",0}, --Circuit Switch 27
			{"RTU/GGIO6.Ind37",0x002B,"BIT",0}, --Circuit Switch 28
			{"RTU/GGIO6.Ind38",0x002C,"BIT",0}, --Circuit Switch 29
			{"RTU/GGIO6.Ind39",0x002D,"BIT",0}, --Circuit Switch 30
			{"RTU/GGIO6.Ind40",0x002E,"BIT",0}, --Circuit Switch 31
			{"RTU/GGIO6.Ind41",0x002F,"BIT",0}, --Circuit Switch 32
			{"RTU/GGIO6.Ind42",0x0030,"BIT",0}, --Circuit Switch 33
			{"RTU/GGIO6.Ind43",0x0031,"BIT",0}, --Circuit Switch 34
			{"RTU/GGIO6.Ind44",0x0032,"BIT",0}, --Circuit Switch 35
			{"RTU/GGIO6.Ind45",0x0033,"BIT",0}, --Circuit Switch 36
			{"RTU/GGIO6.Ind46",0x0034,"BIT",0}, --Circuit Switch 37
			{"RTU/GGIO6.Ind47",0x0035,"BIT",0}, --Circuit Switch 38
			{"RTU/GGIO6.Ind48",0x0036,"BIT",0}, --Circuit Switch 39
			{"RTU/GGIO6.Ind49",0x0037,"BIT",0}, --Circuit Switch 40
			{"RTU/GGIO6.Ind50",0x0038,"BIT",0}, --Circuit Switch 41
			{"RTU/GGIO6.Ind51",0x0039,"BIT",0}, --Circuit Switch 42
			{"RTU/GGIO6.Ind52",0x003A,"BIT",0}, --Circuit Switch 43
			{"RTU/GGIO6.Ind53",0x003B,"BIT",0}, --Circuit Switch 44
			{"RTU/GGIO6.Ind54",0x003C,"BIT",0}, --Circuit Switch 45
			{"RTU/GGIO6.Ind55",0x003D,"BIT",0}, --Circuit Switch 46
			{"RTU/GGIO6.Ind56",0x003E,"BIT",0}, --Circuit Switch 47
			{"RTU/GGIO6.Ind57",0x003F,"BIT",0}, --Circuit Switch 48
			{"RTU/GGIO6.Ind58",0x0040,"BIT",0}, --Circuit Switch 49
			{"RTU/GGIO6.Ind59",0x0041,"BIT",0}, --Circuit Switch 50
			{"RTU/GGIO6.Ind60",0x0042,"BIT",0}, --Circuit Switch 51
			{"RTU/GGIO6.Ind61",0x0043,"BIT",0}, --Circuit Switch 52
			{"RTU/GGIO6.Ind62",0x0044,"BIT",0}, --Circuit Switch 53
			{"RTU/GGIO6.Ind63",0x0045,"BIT",0}, --Circuit Switch 54
			{"RTU/GGIO6.Ind64",0x0046,"BIT",0}, --Circuit Switch 55
			{"RTU/GGIO6.Ind65",0x0047,"BIT",0}, --Circuit Switch 56
			{"RTU/GGIO6.Ind66",0x0048,"BIT",0}, --Circuit Switch 57
			{"RTU/GGIO6.Ind67",0x0049,"BIT",0}, --Circuit Switch 58
			{"RTU/GGIO6.Ind68",0x004A,"BIT",0}, --Circuit Switch 59
			{"RTU/GGIO6.Ind69",0x004B,"BIT",0}, --Circuit Switch 60
			{"RTU/GGIO6.Ind70",0x004C,"BIT",0}, --Circuit Switch 61
			{"RTU/GGIO6.Ind71",0x004D,"BIT",0}, --Circuit Switch 62
			{"RTU/GGIO6.Ind72",0x004E,"BIT",0}, --Circuit Switch 63
			{"RTU/GGIO6.Ind73",0x004F,"BIT",0}, --Circuit Switch 64
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