# Frequently Asked Questions (FAQ)

## 1. Can it support collecting data from multiple 485 Modbus devices?

**Answer:**  
Yes, it is completely possible to collect data from multiple 485 devices simultaneously, but it is not recommended to have too many. In actual engineering projects, if too many 485 devices are connected on the 485 bus, it's like putting all eggs in one basket. Once one device's 485 interface has a problem, all devices will be unable to communicate.

## 2. What is the maximum number of data points (remote signaling/telemetry) that can be collected?

**Answer:**  
Our protocol converter does not limit the specific number of data points to be collected, but it is limited by the fact that the main.lua code file cannot exceed 1500-2000 lines. Therefore, conservatively estimated, our protocol converter can collect more than 1000 data points.

## 3. What is the upper limit of data points for a single 485 device (remote signaling/telemetry)?

**Answer:**  
125 data points. When we use the configuration tool software to create a device model, if the added data points exceed 125, the software will prompt to establish multiple models for the device, with each model not exceeding 125 data points.

**Important Note:** If the data points you want to collect are all 4-byte integer or floating-point types, the number of data points for a single device model cannot exceed 62!

## 4. Does this 61850 protocol converter device have other functions?

**Answer:**  
61850 to Modbus conversion is just the tip of the iceberg of this device's functionality. Its internal C2M core chip, based on the Lua programming language, integrates a massive library of Lua low-code API functions. However, since you purchased the 61850 protocol converter, the current main.lua code file only involves the use of 61850 and Modbus. Nevertheless, more and richer functions (4G/LoRa/WiFi/Ethernet/Serial communication, sensor acquisition, IO control, PWM control, etc.) will be available on our official website flexlua.com in the future. As of now, the website content is under construction and is expected to be launched at the end of 2025. Interested users can follow our updates.

