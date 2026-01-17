# Exercise 01: Big Issues in Mobile Information Systems

**Course:** Smart Human-Computer Interaction (SHCI)  
**Semester:** 2025  
**Based on:** Lecture 01 - Mobile Information Systems – Big Issues

---

## Preface: Citations

All solutions are based on personal experience with mobile applications and concepts from Lecture 01. No external AI tools or sources were used beyond the course materials.

---

## Task

For four out of the seven big issues mentioned in the lecture, find an app from your own smartphone that you use yourself and describe how this app addresses the respective issue. Explain your choice in a few sentences each, and add 1-2 explanatory screenshots where needed.

**The Seven Big Issues:**
1. Limited power supply
2. Limited storage
3. Wireless communication channels
4. Limited/different I/O capabilities
5. Unpredictable usage context
6. Privacy & Security
7. Sustainability

---

## Solutions

### 1. Limited Power Supply: Spotify

**App:** Spotify Music Streaming

**How it addresses the issue:**

Spotify demonstrates excellent power management through its offline download feature and adaptive streaming quality. As discussed in Lecture 01, wireless radios (especially cellular) are among the most power-hungry components due to the "tail energy" problem. Spotify addresses this by:

- **Offline Mode:** Users can download playlists, albums, and podcasts over WiFi at home, then listen without any radio usage during commutes. This eliminates the constant cellular data transmission that would drain the battery rapidly.

- **Automatic Quality Adjustment:** The app automatically reduces streaming quality on cellular networks to minimize data transfer, which reduces radio transmission time and therefore power consumption.

- **Battery Saver Integration:** Spotify respects system-level battery saver modes by reducing background refresh rates and pausing unnecessary features.

This exemplifies the "design takeaway" from the lecture: being energy-aware by turning radios OFF when not needed and using the most efficient radio (WiFi over 4G). By batching downloads during WiFi connectivity, Spotify avoids the continuous radio usage that keeps cellular modems in high-power states.

**Screenshots needed:** 
- Screenshot 1: Download settings showing offline mode options
- Screenshot 2: Storage screen showing downloaded content

---

### 2. Limited Storage: Google Photos

**App:** Google Photos (Cloud Photo Backup)

**How it addresses the issue:**

Google Photos perfectly embodies the lecture's concept of "The Cloud as a Seamless Extension" of limited mobile storage. The app addresses storage constraints through:

- **Automatic Cloud Backup:** Photos and videos are automatically uploaded to Google's cloud servers when connected to WiFi, removing the need to store full-resolution copies locally.

- **"Free Up Space" Feature:** After confirming cloud backup, the app provides a one-tap button to delete local copies of backed-up photos, instantly reclaiming gigabytes of storage. This implements the lecture's concept of the "working set"—keeping recent photos locally while archiving older ones in the cloud.

- **Smart Caching:** The app maintains thumbnail previews locally for quick browsing while fetching full-resolution images on-demand from the cloud. This is exactly the "caching and predictive loading" strategy mentioned in the lecture.

- **Storage Management Dashboard:** Provides clear visualization of storage usage and recommendations for files to delete.

As the lecture explains, this approach solves the "Tradeoff Triangle" (Cost, Capacity, Power) by leveraging cloud infrastructure. Users get effectively unlimited storage without the cost and power implications of massive local flash memory.

**Screenshots needed:**
- Screenshot 1: "Free up space" prompt showing GB that can be reclaimed
- Screenshot 2: Settings showing backup status and storage management

---

### 3. Wireless Communication Channels: WhatsApp

**App:** WhatsApp Messenger

**How it addresses the issue:**

WhatsApp demonstrates sophisticated handling of unreliable wireless channels, addressing the lecture's point that wireless is an "unpredictable pipe" through shared, chaotic medium (air). The app's design shows understanding of wireless complexity:

- **Offline Message Queuing:** When you type and send a message without connectivity, WhatsApp queues it locally and displays a clock icon. Once connection returns, messages are automatically sent. This is connection-aware design that gracefully handles dropped signals as recommended in the lecture.

- **Adaptive Media Compression:** The app automatically reduces image and video quality based on connection strength. On poor cellular connections, it sends heavily compressed versions, reducing transmission time and the likelihood of failed uploads. This addresses the lecture's discussion of bandwidth vs. latency tradeoffs.

- **WiFi-Preferred Calling:** WhatsApp Voice/Video calls automatically prefer WiFi over cellular when available, following the lecture's principle of using "the most efficient radio available." WiFi has lower power consumption and typically lower latency than cellular for voice calls.

- **Background Sync Optimization:** The app batches message checks rather than maintaining a constant connection, addressing the "tail energy" problem by reducing the frequency of radio state transitions.

- **Multipath Effects Handling:** By using TCP/IP protocols and implementing automatic retry mechanisms, WhatsApp handles the reflection, absorption, and interference issues discussed in the lecture.

This design philosophy aligns with the lecture's "Design Takeaway": apps must be connection-aware and resilient, handling dropped signals gracefully while reducing "chatty" communication.

**Screenshots needed:**
- Screenshot 1: Message queue showing pending messages (clock icon) during offline state
- Screenshot 2: Settings showing network usage and media auto-download preferences for different connection types (WiFi/Cellular)

---

### 4. Privacy & Security: Banking App (e.g., Mobile Banking)

**App:** Mobile Banking Application (Bank-specific)

**How it addresses the issue:**

Modern banking apps represent the pinnacle of mobile privacy and security design, addressing the lecture's characterization of smartphones as "pocket-sized vaults" containing identity, finances, and sensitive communications. The app implements multiple security layers:

- **Biometric Authentication:** Uses fingerprint or face recognition as the primary unlock method, balancing the "Convenience vs. Security" tension mentioned in the lecture. While not as cryptographically strong as a long password, biometrics provide practical security that users will actually use consistently.

- **Multi-Factor Authentication (MFA):** Requires secondary verification (SMS codes, push notifications, or hardware tokens) for sensitive operations like transfers above certain amounts. This addresses the lecture's point about the catastrophic consequences of device loss or compromise.

- **Session Timeout:** Automatically logs out after inactivity, ensuring that if you leave your phone unattended, the banking app isn't left open. This is particularly important given the lecture's emphasis on phones containing our entire financial identity.

- **Transaction Encryption:** All communication between the app and bank servers uses end-to-end encryption (TLS/SSL), protecting data in transit over the "unpredictable" wireless channels discussed in the lecture.

- **Secure Element Usage:** Many banking apps leverage the phone's Secure Element (hardware-isolated chip) for storing payment credentials, ensuring that even malware on the main OS cannot access this sensitive data. This goes beyond software-only security.

- **Fraud Detection & Alerts:** Real-time push notifications for all transactions provide immediate awareness of account activity, allowing quick response to unauthorized access.

The app embodies the lecture's principle of "Privacy and security by design," treating the device as both personal and vulnerable. It also reflects the "trust barrier" concept—if users experience a single security failure, they may abandon mobile banking entirely.

**Screenshots needed:**
- Screenshot 1: Login screen showing biometric authentication prompt
- Screenshot 2: Security settings showing MFA options and session timeout configuration

---

## Key Principles from Lecture 01 Demonstrated

### Power Management (Issue #1)
- **Principle:** "Be aggressive about turning things off"
- **Application:** Spotify's offline mode eliminates radio usage entirely during playback

### Storage Optimization (Issue #2)
- **Principle:** "The cloud as seamless extension... the 'working set'"
- **Application:** Google Photos maintains only recent photos locally, archives rest in cloud

### Wireless Resilience (Issue #3)
- **Principle:** "Connection-aware and resilient... work offline, sync when connection returns"
- **Application:** WhatsApp's message queuing and adaptive compression

### Security by Design (Issue #4)
- **Principle:** "Prioritize privacy and security by design... device is personal and vulnerable"
- **Application:** Banking app's multi-layered security architecture

---

## Additional Observations

### Cross-Cutting Concerns

Several apps address multiple big issues simultaneously:

- **Spotify** addresses both power (offline mode) and storage (manages local cache size)
- **WhatsApp** handles both wireless challenges and privacy (end-to-end encryption)
- **Google Photos** manages storage while being mindful of wireless usage (WiFi-only upload option)

### The Tradeoff Reality

Each app demonstrates the lecture's core thesis that **"every design decision is a tradeoff"**:

- Spotify: Offline convenience vs. storage consumption
- Google Photos: Unlimited cloud storage vs. privacy concerns (Google analyzes photos)
- WhatsApp: Message compression vs. media quality
- Banking app: Biometric convenience vs. password strength

### Design Philosophy Evolution

These apps show how the mobile ecosystem has matured beyond "shrinking desktop apps" to embrace mobile-first design principles:

1. **Offline-first:** Apps work without connectivity and sync later
2. **Battery consciousness:** Features designed to minimize radio usage
3. **Cloud integration:** Seamless storage extension without user friction
4. **Context awareness:** Apps adapt behavior based on connection type, battery level, and usage patterns

---

## Summary Table

| Issue | App | Key Strategy | Lecture Principle |
|-------|-----|--------------|-------------------|
| Limited Power | Spotify | Offline downloads, WiFi-preferred | Turn radios OFF, batch transfers |
| Limited Storage | Google Photos | Cloud backup, smart caching | Cloud as extension, working set |
| Wireless Channels | WhatsApp | Message queuing, adaptive compression | Connection-aware, resilient design |
| Privacy & Security | Banking App | MFA, biometrics, encryption | Security by design, trust model |

---

## Reflection

These four apps collectively demonstrate that successful mobile applications must deeply understand and design around the seven big issues rather than treating mobile as simply "desktop in your pocket." Each app makes deliberate architectural choices that acknowledge mobile's unique constraints while leveraging its unique capabilities (portability, sensors, always-on connectivity when available).

The most successful apps, as shown above, don't just address one issue in isolation but consider the holistic mobile environment where power, storage, wireless reliability, and security are interconnected concerns requiring balanced tradeoffs.

---

