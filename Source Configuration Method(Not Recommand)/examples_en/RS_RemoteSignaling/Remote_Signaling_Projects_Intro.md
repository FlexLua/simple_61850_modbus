# Remote Signaling Case Guide (Binary Input Acquisition, Modbus Function Code 01/02)

This section introduces various remote signaling (status acquisition) scenarios. Each case’s project files can be found in the provided “Example Project Files.” Choose the closest match and modify as needed.

[TOC]

### Case 1: Acquire one device with 4 IO input channels

#### (1) Modify `main.lua`

##### Configure `YX_List`

```lua
-- IEC61850 remote signaling data point definitions
YX_List = 
{
	-- Modbus IO input monitor #1 (4 input channels)
	{"RTU/GGIO1.Ind1", ".stVal"}, -- binary IO input, 0 or 1
	{"RTU/GGIO1.Ind2", ".stVal"}, -- binary IO input, 0 or 1
	{"RTU/GGIO1.Ind3", ".stVal"}, -- binary IO input, 0 or 1
	{"RTU/GGIO1.Ind4", ".stVal"}  -- binary IO input, 0 or 1
}
```

##### Configure `MB_List`

```lua
-- Modbus remote signaling data point definitions
MB_List = 
{
	-- Modbus IO input monitor #1 (4 inputs)
	{
		-- 9600 bps, no parity, 1 stop bit, function code "01", modbus address 0x05, max response 100 ms, inter-packet 1000 ms
		com = {"BAUDRATE_9600","NoneParity","StopBit_1","01",0x05,100,1000},  
		data = 
		{
			{"RTU/GGIO1.Ind1",0x0000,"BIT",0}, -- read coil, returns 0 or 1
			{"RTU/GGIO1.Ind2",0x0001,"BIT",0}, -- read coil, returns 0 or 1
			{"RTU/GGIO1.Ind3",0x0002,"BIT",0}, -- read coil, returns 0 or 1
			{"RTU/GGIO1.Ind4",0x0003,"BIT",0}  -- read coil, returns 0 or 1
		}
	}
}
```

<small>Note: Lua syntax — no trailing comma after the last `}`.</small>

#### (2) Modify `rtu.cid`

##### Define logical node (IO monitor, 4 channels)

```xml
<LNodeType desc="IO monitor (4 channels)" id="GGIO_TYPE_4IO" lnClass="GGIO">
  <DO desc="Mode" name="Mod" type="ENC_Mod" />
  <DO desc="Behavior" name="Beh" type="ENS_Beh" />
  <DO desc="Health" name="Health" type="ENS_Health" />
  <DO desc="Nameplate" name="NamPlt" type="LPL_2_NamPlt" />
  <DO desc="Signaling input 1" name="Ind1" type="SPS_State" />
  <DO desc="Signaling input 2" name="Ind2" type="SPS_State" />
  <DO desc="Signaling input 3" name="Ind3" type="SPS_State" />
  <DO desc="Signaling input 4" name="Ind4" type="SPS_State" />
</LNodeType>
```

##### Add logical node instance

```xml
<LN desc="IO monitor #1 (4 ch)" lnClass="GGIO" lnType="GGIO_TYPE_4IO" inst="1" prefix="" />
```

##### Configure DataSet

```xml
<DataSet name="YX_RS" desc="YX_RS">
  <FCDA ldInst="RTU" lnClass="GGIO" fc="ST" lnInst="1" doName="Ind1" daName="stVal" />
  <FCDA ldInst="RTU" lnClass="GGIO" fc="ST" lnInst="1" doName="Ind2" daName="stVal" />
  <FCDA ldInst="RTU" lnClass="GGIO" fc="ST" lnInst="1" doName="Ind3" daName="stVal" />
  <FCDA ldInst="RTU" lnClass="GGIO" fc="ST" lnInst="1" doName="Ind4" daName="stVal" />
</DataSet>
```

<small>DataSet is for the Report service and is optional.</small>

### Case 2: Acquire multiple devices, each with 4 IO input channels

Repeat the configuration for devices #1, #2, and #3 in both `YX_List` and `MB_List`, and declare corresponding LNs/instances/DataSet entries in `rtu.cid` as shown in the original examples, with comments translated.
