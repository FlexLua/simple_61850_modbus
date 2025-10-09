# Enable KeepAlive

In the main.lua code file, find the following line of code:

```lua
LIB_IEC61850ServerStart("SPI_1",ETHRST_PIN,mac,ip,subm,gw,dns,port,60)
```

The example code above has already enabled KeepAlive with a time = 60 seconds. When greater than 0 seconds, it will periodically send KeepAlive probe packets to the peer client. If the probe fails, it will disconnect the TCP connection, which prevents the local machine from maintaining an invalid TCP connection, thus allowing the client to reconnect to the local machine.
