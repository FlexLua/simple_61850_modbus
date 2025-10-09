# Case Introduction (Electric Meter)



## 1. Function Implementation

Collect data from a relatively complex RS485 interface electric meter device, and report to the 61850 master station.
> This electric meter device contains a large number of data points, all of which are telemetry type, so we only need one device model (YC_RM telemetry).



## 2. Device RS485 Communication Parameters

Electric Meter Device No.2: 115200 baud, no parity, 1 stop bit



## 3. Device Modbus Data Point Table



### The following data points use Modbus 03 Read Holding Registers function code



|Data Point Address|Name|Modbus Data Type|Additional Notes|61850 Data Type|
|:----|:----|:----|:----|:----|
|0064H|Line Voltage Uab|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|0066H|Line Voltage Ubc|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|0068H|Line Voltage Uca|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|006AH|Line Voltage Average ULLAvg|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|006CH|Phase Voltage Uan|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|006EH|Phase Voltage Ubn|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|0070H|Phase Voltage Ucn|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|0072H|Phase Voltage Average ULNavg|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|0074H|Current Ia|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|0076H|Current Ib|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|0078H|Current Ic|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|007AH|Three-Phase Current Average IAvg|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|007CH|Zero Sequence Current In|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|007EH|Line Frequency F|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|0080H|Total Power Factor PF|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|0082H|Total Active Power P|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|0084H|Total Reactive Power Q|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|0086H|Total Apparent Power S|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|0088H|Phase A Power Factor PFa|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|008AH|Phase B Power Factor PFb|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|008CH|Phase C Power Factor PFc|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|008EH|Phase A Active Power Pa|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|0090H|Phase B Active Power Pb|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|0092H|Phase C Active Power Pc|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|0094H|Phase A Reactive Power Qa|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|0096H|Phase B Reactive Power Qb|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|0098H|Phase C Reactive Power Qc|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|009AH|Phase A Apparent Power Sa|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|009CH|Phase B Apparent Power Sb|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|
|009EH|Phase C Apparent Power Sc|F_ABCD (32-bit float)|Keep 3 decimal places| YC_RM Telemetry-Float|



## 4. How to Use This Case

- Copy the init folder in this case to completely overwrite the init folder in the FLEXLUA_61850 software directory, then click Generate in Step 4 of the software to generate the required 3 files (main.lua, model.cfg, rtu.cid).
- The main.lua and model.cfg files need to be placed into the protocol converter through the USB-C port. The rtu.cid file can be provided to 61850 master station developers for device import.



## 5. Testing

In the test folder of this case, there are modbus slave device simulation files. If you have modbus slave and IEDScout testing tool software installed on your computer, they can be used to simulate modbus slave devices and 61850 master station software respectively to complete testing.



### Read Registers (Telemetry) Test Results




![](test/yc_meter.png)
