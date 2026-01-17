# Lecture 04: Ubiquitous Computing & Internet of Things

## Part 1: Core Concepts & Vision

### Ubiquitous Computing (UbiComp)

**Visionary:** Mark Weiser (1991) – "The most profound technologies are those that disappear."

**Goal:** Computing woven into the fabric of everyday life, invisible and intuitive.

**Three Device Classes:**

- **Tabs:** Centimeter-sized, wearable devices (e.g., smart badges, early fitness trackers).
- **Pads:** Decimeter-sized, handheld devices (e.g., smartphones, tablets).
- **Boards:** Meter-sized interactive displays (e.g., smart boards, interactive walls).

**Status Today:** The original vision has largely materialized in terms of device forms. However, the ideal of seamless, calm interaction is still not fully realized (e.g., connecting multiple Bluetooth speakers remains fiddly).

### Internet of Things (IoT)

**Relation to UbiComp:** A popularized subset/marketing term focusing on connectivity in everyday objects.

**Core Idea:** Embed network connectivity and sensors into ordinary physical objects ("things")—light bulbs, refrigerators, trash cans, industrial machines.

**Stated Goals:**

- Automate mundane tasks.
- Increase energy and resource efficiency.
- Enable smarter logistics ("Industry 4.0").

**Other Motivations (Often Unstated):**

- New markets for hardware modules.
- Massive data collection about consumer behavior (e.g., a smart power meter can infer what TV show you're watching from the device's unique power signature).

---

## Part 2: The "Big Four" Issues of UbiComp/IoT

### Power/Energy Supply:

**Problem:** You can't change batteries in thousands of sensors. Wires defeat the purpose.

**Potential Solution:** Energy Harvesting – scavenging tiny amounts of power from sunlight, vibration, temperature differences, or ambient radio waves. Major drawbacks: very low efficiency and the need for energy storage for when the source is absent (e.g., night).

### Interaction & Management:

**Problem:** People struggle to sync two devices. How do you manage a network of hundreds of "smart" things in a home or factory? The setup and control must be nearly automatic ("calm computing").

### Privacy & Security:

**Privacy:** IoT generates vast amounts of intimate data (when you're home, your habits, health metrics from wearables). BLE devices often broadcast this data publicly.

**Security:** IoT devices are notoriously insecure (rare updates, weak defaults). They are prime targets to be hijacked into botnets for large-scale cyberattacks. The tradeoff between security and ease-of-setup is a constant battle.

### Standards (or Lack Thereof):

**Problem:** Wild West of protocols. A Philips Hue bulb doesn't talk to a Samsung smart app. This fragmentation hinders adoption and usability.

**Potential Unifiers:**

- IP-based protocols (everything gets an IP address).
- Matter (a newer, industry-backed standard).
- Physical Web/URIBeacon: The radical idea that every smart object simply broadcasts a URL; you interact with it via your universal web browser. Challenge: mapping physical objects to their digital controls.

---

## Part 3: Key Enabling Technologies

### 1. Wearables & New Interaction

**Definition:** Any body-worn, hands-free device (smartwatches, glasses, trackers).

**The Smartwatch Case Study:**

- **Hardware:** Surprisingly powerful (multi-core CPUs, GBs of storage, BLE, various sensors).
- **Software:** Specialized OS (WatchOS, Wear OS).
- **Interaction Challenges:** Tiny screen requires new paradigms—coarse swipes, shake gestures, voice commands, and cross-device interaction (e.g., start an action on the watch, continue in the air).
- **Primary Use-Cases:** Notifications, quick replies, health/fitness data logging.

### 2. Sensor & Mesh Networks

**Problem with Traditional (Star) Networks:** Low-power sensors have short range. Building a network requires many expensive central hubs/gateways.

**Solution: Mesh Networking**

- **Concept:** Every device can also act as a repeater/hub. Data hops from device to device to reach its destination.
- **Topology:** Dynamic and self-healing.

**Routing Strategies:**

- **Flooding:** Simple but inefficient (broadcast to all).
- **On-Demand (AODV):** Finds a route only when needed.
- **Proactive (OLSR, B.A.T.M.A.N.):** Maintains a constant map of the network.

**Implementations:** ZigBee, BLE Mesh, WiFi-based mesh (e.g., Freifunk).

**Alternative: LPWAN (Low-Power Wide-Area Network)**

- **For:** Stationary, sparse, low-data-rate sensors over long distances (1-10 km).
- **Examples:** LoRaWAN, Sigfox. Used for smart meters, agricultural sensors, street lighting.

### 3. Personal Area Networks (PAN) - Bluetooth Low Energy (BLE)

**The Successor to "Classic" Bluetooth:** Shares the 2.4 GHz band but is a completely redesigned protocol for ultra-low power.

**Key Philosophy:** Optimized for intermittent, small data transfers from sensors, enabling months/years of battery life.

**Communication Model:**

**Two Roles:**

- **Peripheral (Server):** The sensor/device (e.g., heart rate monitor). It advertises its presence.
- **Central (Client):** The controller (e.g., smartphone). It scans for and connects to peripherals.

- **GAP (Generic Access Profile):** Handles advertising and discovery. A device can broadcast data to anyone listening.
- **GATT (Generic Attribute Profile):** Handles the actual data exchange in a structured publish/subscribe model using Services and Characteristics (each with a UUID). This avoids constant polling, saving power.

**Device Complexity Spectrum:**

- **Beacons (e.g., iBeacon):** Only broadcast a static ID (UUID). Used for location micro-triggers.
- **Sensors:** Broadcast or connect to stream data (heart rate, temperature).
- **Bidirectional Devices:** Allow for setting parameters, but are not designed for high-speed streaming.

### 4. Near Field Communication (NFC)

**Essence:** Extremely short-range (~2 cm), simple, and cheap wireless communication. A subset of RFID.

**How it Works:** The reader (phone) powers the passive tag via magnetic induction, enabling bi-directional data exchange.

**Variants:**

- **Simple Tags:** Store data (URLs, contacts). Format: NDEF.
- **Smart Cards:** Have cryptographic functions (e.g., Mifare for access control).
- **Card Emulation:** A phone can mimic an NFC card/token (used for mobile payments like Apple Pay).

**Use Cases:** Tap-to-pay, access control, sharing URLs/contacts, electronic passports.

**Security Considerations:**

- **Simple Tags:** Often writable, can be overwritten with malicious data.
- **Smart Cards:** Use cryptographic keys for read/write access (though some have been cracked).
- **Long-Range Skimming:** With a directed antenna, data can be stolen from up to ~1 meter away without the victim's knowledge.

---

## Synthesis & Key Takeaways

**UbiComp is the Philosophy, IoT is the Implementation:** Weiser dreamed of invisible computing; IoT is the current, often clumsy, attempt to build it by connecting everything.

**The Triumph of Bluetooth Low Energy:** BLE is the killer enabler for personal IoT/wearables. Its power-efficient, service-oriented model (GATT) is perfectly suited for sensor data. Understanding the Central/Peripheral and GAP/GATT model is crucial.

**Connectivity Solves One Problem, Creates Three:**

- It enables new applications.
- But it forces us to solve Power (energy harvesting), Security (insecure botnets), and Complexity (standards war) at a massive scale.

**Interaction Must Become Invisible:** The ultimate goal is for technology to "disappear." This means interactions should be:

- **Context-aware:** The system knows what you need.
- **Minimal or zero-touch:** Using sensors, gestures, or automation.
- **Self-organizing:** Devices form networks (meshes) and discover each other automatically.

**Tradeoffs Are Everywhere:**

- **Security vs. Convenience:** Strong encryption vs. easy pairing.
- **Power vs. Functionality:** A device that lasts a year vs. one that streams data constantly.
- **Open Standards vs. Vendor Lock-in:** Universal compatibility vs. proprietary ecosystems that "just work" together.

**Think Beyond the Screen:** UbiComp/IoT interaction happens through touchpoints everywhere—a vibration on your wrist, a voice command, a tap with your phone, or automatically as you walk into a room.

---