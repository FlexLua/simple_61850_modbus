# Enable SNTP Time Synchronization

In the main.lua code file, find the following line of code:

```lua
LIB_IEC61850ServerStart("SPI_1",ETHRST_PIN,mac,ip,subm,gw,dns,port,60)
```

Modify it to the following:

```lua
-- Start IEC61850 MMS Server service (TCP Server), keepalive=60s, enable SNTP request, SNTP server address is 192,168,0,105
LIB_IEC61850ServerStart("SPI_1",ETHRST_PIN,mac,ip,subm,gw,dns,port,60,{192,168,0,105},123,30)
```

You can see that after modification, three parameters `{192,168,0,105},123,30` are added, which means setting the SNTP server address to 192,168,0,105, port number to 123, and requesting time synchronization from the SNTP server every 30 seconds. Users can modify these three parameters according to their actual needs.
