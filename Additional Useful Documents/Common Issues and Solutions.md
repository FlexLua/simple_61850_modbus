# Common Issues and Solutions

## Issue 1: TCP Connection Becomes Invalid After Network Interruption

**Problem Description:**  
After the Ethernet network is abnormally disconnected for some reason (such as unplugging and re-plugging the network cable), the TCP connection becomes invalid, preventing the 61850 protocol converter from being reconnected by the master station.

**Solution:**  
This situation can be recovered through the KeepAlive mechanism. For example, the keepalive time can be seen in the configuration software with a default setting of 60 seconds. Generally, within about 60 seconds, the protocol converter will automatically abandon this invalid TCP connection, and then it can be reconnected to the protocol converter again.

## Issue 2: IEDScout Cannot Connect Despite Correct IP Configuration

**Problem Description:**  
The IP network configuration is correct, but IEDScout still cannot connect.

**Solution:**  
Check the Advanced Parameters in the IEDScout connection parameters. Set the AP Title and AE Qualifier to be consistent with those defined in the protocol converter's rtu.cid file:
- AP Title: 1,3,9999,23
- AE Qualifier: 23

