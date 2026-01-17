# Lecture 02: Location & Networks

## Part 1: Wireless Networks & Multiple Access Methods

### Core Problem: Sharing the Invisible Medium

The radio frequency (RF) spectrum is a shared, limited resource. Many devices must use the same frequency bands without interfering with each other. This requires Multiple Access Methods.

### Key Multiple Access Techniques

#### 1. Time-Division Multiple Access (TDMA)

**Concept:** Divide time into slots. Only one device transmits per slot.

**Variants:**

- **Static TDMA:** Fixed, pre-assigned timeslots (requires precise synchronization).
- **Dynamic TDMA / CSMA/CA:** Used in WiFi. Devices listen before talking:

If the channel is idle, transmit.

Use RTS/CTS (Request to Send / Clear to Send) to solve the "hidden node problem" (where two devices can't hear each other but can interfere at the access point).

  - Wait for an acknowledgment (since detecting collisions during transmission over wireless is nearly impossible).

#### 2. Frequency-Division Multiple Access (FDMA)

**Concept:** Divide the frequency band into sub-channels. Each transmission gets its own frequency slot.

**Advanced Variant: OFDMA (Orthogonal Frequency-Division Multiple Access)**

Used in 4G/5G and modern WiFi.

- Sends data simultaneously over many closely spaced, orthogonal sub-carriers. This is efficient and robust against interference.

#### 3. Code-Division Multiple Access (CDMA)

**Concept:** Spread the signal over a wider bandwidth than necessary using a unique code. Multiple signals can overlap in time and frequency but are separated by their codes.

**Two Main Types:**

Frequency-Hopping Spread Spectrum (FHSS): The transmitter rapidly switches (hops) between many frequencies in a pseudo-random sequence known to the receiver. Used in Bluetooth.

- **Direct-Sequence Spread Spectrum (DSSS):** The data signal is multiplied by a high-rate pseudo-random bit sequence (the "chipping code"), spreading it across a wide band. Used in older WiFi (802.11b).

**Big Picture:** These methods operate primarily at the Physical and Data Link layers (Layers 1 & 2) of the OSI model.

---

## Part 2: Major Wireless Standards

### 1. Bluetooth (WPAN - Wireless Personal Area Network)

**Purpose:** Short-range communication (2-10m) between peripherals (headsets, mice, sensors).

**Key Features:**

- Uses the 2.4 GHz ISM band with Adaptive Frequency Hopping (AFH/FHSS) to avoid interference.
- Complex stack: Spans all 7 OSI layers (spec is over 3000 pages!).

**Two Flavors:**

- **Classic Bluetooth:** For audio, file transfer (higher data rate).
- **Bluetooth Low Energy (BLE):** For sensors, wearables (optimized for very low power, intermittent communication).

**Coexistence with WiFi:** Both use 2.4 GHz. Modern chipsets coordinate to minimize interference.

### 2. WiFi (WLAN - Wireless Local Area Network)

**Purpose:** High-speed local network access, replacement for wired Ethernet.

**Key Features:**

- Based on the IEEE 802.11 family (a/g/n/ac/ax).
- Operates on Layers 1 & 2 only (simpler than Bluetooth).
- Uses CSMA/CA for channel access.
- Modern versions use OFDM/MIMO for high speeds (theoretically up to ~10 Gbit/s).

**Topology:**

- Usually a star/tree with an Access Point (AP).
- WiFi Direct allows device-to-device connections without an AP (but often buggy).

### 3. Cellular Networks (WWAN - Wireless Wide Area Network)

**Purpose:** Ubiquitous wide-area connectivity.

**Evolution & Key Technologies:**

1G: Analog, FDMA. (~9.6 kbit/s)

2G (GSM): Digital, TDMA. (~200 kbit/s) - The first truly global digital standard.

3G (UMTS): Digital, CDMA. (~20 Mbit/s). A hybrid complex system mixing circuit-switched (voice) and packet-switched (data) networks. Much of its complexity is hidden in a separate "baseband" processor.

4G (LTE): All-IP, packet-switched. Uses OFDMA. (~300 Mbit/s). Simplified backend, Voice over LTE (VoLTE).

5G: An evolution of 4G, faster (~2 Gbit/s), but also includes new sub-standards for:

  - Massive IoT (low power, long range).
  - Ultra-Reliable Low Latency Communication (URLLC for cars, factories).
  - Enhanced Mobile Broadband (eMBB).

**Takeaway:** Standards range from simple, layered approaches (WiFi) to immensely complex, all-encompassing systems (Bluetooth, Cellular). Coexistence and interference management (e.g., Bluetooth vs. WiFi) are ongoing challenges.

---

## Part 3: Location Determination

### Three Classes of Location Information

- **Geographic:** Coordinates (Latitude, Longitude). Most precise for mapping.
- **Topological:** Symbolic (Street Address, City). Human-readable.
- **Cell-Based:** Network Identifier (WiFi MAC/SSID, Cell Tower ID). Used for coarse positioning.

**Mapping between classes:**

- **Geocoding:** Topological → Geographic (Find coordinates for an address).
- **Reverse Geocoding:** Geographic → Topological (Find address for coordinates).
- **Cell-ID Lookup:** Cell-Based → Geographic/Topological (Requires a database).

### Methods: The Accuracy vs. Power Tradeoff

| Method | Accuracy | Power Draw | Pros | Cons |
|--------|----------|------------|------|------|
| Satellite (GPS) | ~1-5 m | High | Very accurate, global | Needs sky view, slow cold start |
| WiFi Positioning | ~10-50 m | Medium | Works indoors, faster | Needs WiFi DB, less accurate |
| Cellular Positioning | ~100-1000 m | Low/None | Always on, works everywhere | Very inaccurate |

### How GPS Works: The Big Picture

**Systems:** GPS (USA), GLONASS (Russia), Galileo (EU), BeiDou (China). Modern phones use all for better coverage.

**Core Principle: Time Difference of Arrival (TDOA)**

- Satellites (with atomic clocks) broadcast their position and precise time.
- Your phone measures the tiny time difference when signals from different satellites arrive.
- Using these time differences, it calculates distances to at least 4 satellites.
- The intersection of these distance spheres gives your 3D position (latitude, longitude, altitude).

**Why 4 satellites?** Three for position, and a fourth to correct for the error in your phone's cheap, non-atomic clock.

**Assisted GPS (aGPS):** Uses the cellular network to download satellite almanac data, drastically speeding up the Time To First Fix (TTFF) and improving accuracy indoors.

**Coordinate Systems:** Most of the world uses WGS-84. China uses a deliberately offset system (GCJ-02) for "security," causing misalignment with global maps.

### How Cell-Based Positioning Works

**Basic Idea:** Your phone sees unique IDs of nearby cell towers and WiFi networks. It sends these IDs to a location database (like Google's) which returns the likely coordinates.

**Factors Affecting Accuracy:**

- **Cell Size & Density:** Urban areas with small, dense cells yield better accuracy than rural areas with large cells.
- **Database Quality:** Google's database is vast and accurate but raises privacy concerns (they log your queries). Alternatives exist (OpenCellID, Mozilla) but have less coverage.

**Big Limitation:** Requires an internet connection to query the database. The raw database is too large to store on the device.

---

## Synthesis & Key Takeaways

**Wireless is about Sharing:** Multiple access methods (TDMA, FDMA, CDMA) are fundamental to allowing many devices to share the crowded airwaves without chaos.

**Standards Have Personalities:**

- **Bluetooth** is a "Swiss Army knife" (complex, full-stack, for peripherals).
- **WiFi** is a "high-speed pipe" (simple layers, for local data).
- **Cellular** is an "invisible utility" (immensely complex infrastructure for everywhere connectivity).

**Location is a Multi-Tool System:** No single method is perfect. Modern phones use sensor fusion combining:

- GPS for high accuracy outdoors.
- WiFi/Cell ID for quick fixes and indoor use.
- Inertial Sensors (IMU) to fill in gaps when signals are lost.

**Everything is a Tradeoff:**

- Accuracy vs. Power (GPS vs. Cell ID).
- Performance vs. Privacy (Google's location DB).
- Complexity vs. Functionality (Bluetooth's full stack vs. WiFi's simplicity).

**Think in Layers:** Understanding the OSI model helps separate the physical transmission (modulation, multiple access) from the network logic (addressing, routing) and the application needs (like getting a location fix).

---

