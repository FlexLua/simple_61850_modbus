# Introduction to the GGIO Logical Node

Careful readers may notice that the telemetering, telesignalling, telecontrol, and setpoint examples we provide all use the GGIO logical node type. In fact, if you have special requirements, you can try other logical node types as well. We use GGIO here because GGIO (Generic Process I/O) is a generic logical node in IEC 61850. It is used to describe input/output signals that are not covered by standard LNs, including vendor-defined or general signals. When certain field measurements, binary statuses, or remote control commands do not have a corresponding standard LN, they can be hosted under GGIO.

**📖 Common use cases:**

| **Application type**       | **Function**                                           | **Examples**                  |
| -------------------------- | ------------------------------------------------------ | ----------------------------- |
| **Telesignalling**         | Acquire binary status (On/Off)                         | GGIO1.Ind1, GGIO1.Ind2        |
| **Telemetering**           | Acquire analog values (voltage, current, temperature)  | GGIO1.AnIn1, GGIO1.AnIn2      |
| **Telecontrol (Setpoint)** | Remote control commands, setpoint adjustment           | GGIO1.SPCSO1, GGIO1.AnOut1    |

**📌 Relationship between GGIO and telesignalling, telemetering, setpoint**

| **Concept**            | **Definition**                            | **Representation in IEC 61850**                      | **Common GGIO mapping**          |
| ---------------------- | ----------------------------------------- | ---------------------------------------------------- | -------------------------------- |
| **Telesignalling**     | Remotely acquired **binary status**       | DO of type Ind (Indication)                          | GGIO1.Ind1.stVal                 |
| **Telemetering**       | Remotely acquired **analog value**        | DO of type AnIn (Analog Input)                       | GGIO1.AnIn1.mag.f                |
| **Setpoint (Control)** | Remotely issued **command or setpoint**   | DO of type SPC (Single Point Control) or AnOut       | GGIO1.SPCSO1, GGIO1.AnOut1       |

**📌 Pros and cons of GGIO**

| **Advantages**                              | **Disadvantages**                                       |
| ------------------------------------------- | ------------------------------------------------------- |
| Flexible; can host virtually any signal     | Ambiguous semantics; requires additional documentation  |
| Facilitates compatibility and extensibility | Not ideal for multi-vendor interoperability and auto-modeling |
| Suitable for special/small/temporary devices| Not conducive to consistent project-wide specifications |

**📌 Summary**

- Telesignalling, telemetering, and setpoint are essentially different data types and operation modes of a device.
- In IEC 61850, always prefer standard LNs; use GGIO only when standards do not cover the need.
- GGIO acts as a generic signal container, corresponding to data objects such as Ind (telesignalling), AnIn (telemetering), and SPC/AnOut (setpoint/control).


