# Lecture 06: Case Studies

## Part 1: Inside the Amazon Dash Button – The Prototypical IoT Device

This case study reveals the core challenges and clever solutions for simple, single-purpose IoT devices.

### The Device & Its Problem:

**What it was:** A small, single-button device for instantly re-ordering a specific product (e.g., laundry detergent).

**The Core IoT Dilemma (Chicken-and-Egg):**

- The device needs WiFi credentials to connect to the internet.
- It has no screen, keyboard, or complex UI to enter those credentials.
- How do you configure a device that can't be configured through traditional means?

### Clever Configuration Solutions:

Manufacturers use "out-of-band" or side-channel communication to bootstrap the device onto the network.

**Local Hotspot Method (Used with Android):**

- The Dash Button boots up as a WiFi Access Point (AP), creating its own temporary network (e.g., "Dash-Button-XXXX").
- The user's phone connects to this hotspot.
- A companion app on the phone sends the home WiFi's SSID and password to the Dash via this direct connection.
- The Dash then shuts down its hotspot and reboots as a WiFi client using the provided credentials to join the home network.

**Side-Channel / Audio Method (Used with iOS):**

- iOS historically restricted apps from creating ad-hoc WiFi networks.
- Solution: The iOS app plays an ultrasound (inaudible to humans) containing the encrypted WiFi configuration.
- The Dash Button's built-in microphone listens for this specific sound pattern, decodes it, and extracts the WiFi credentials.
- The Dash then connects to the WiFi network.

**Key Takeaway:** IoT setup requires creative thinking to bypass the lack of a traditional UI, often using the smartphone as a secure configuration proxy through non-standard channels (temporary networks or even sound).

---

## Part 2: Tweaks Without Root Access – Exploiting OS Loopholes

These cases show how developers work within (or around) mobile OS restrictions to add powerful functionality.

### 1. NetGuard: User-Level Network Filtering

- **The Restriction:** Android blocks normal apps from monitoring or filtering all network traffic for security reasons (requires root).
- **The Loophole:** Android grants VPN apps deep system-level access to inspect and route network packets.
- **The Exploit:** NetGuard acts as a local VPN. Instead of routing traffic to a remote server, it intercepts the traffic locally, filters it (blocking ads/trackers), and then passes it on. It "tricks" Android into granting deep access by using the VPN permission model.

### 2. PixOff: AMOLED Power Saving

- **The Physics:** AMOLED screens power each pixel individually. A black pixel is off and consumes no power.
- **The Tweak:** PixOff overlays a semi-transparent black layer or pattern on the screen. By turning pixels off, it reduces overall screen power consumption.
- **Why LCDs Don't Benefit:** LCDs use a constant backlight. Even if a pixel shows black, the backlight behind it is still on, so no power is saved by this method.

### 3. Repurposing Old Devices (e.g., Haven)

- **Kiosk Mode:** Locks the device to a single app (e.g., a dedicated music player or digital photo frame), turning an old phone into a simple appliance.
- **Room Surveillance (Haven):** Uses the phone's existing sensors (camera, microphone, accelerometer) as a security system. It can detect motion, sound, or even vibrations (like someone trying to move the device) and send alerts. This is a powerful example of using ubiquitous hardware for an unintended but valuable purpose.

### 4. Macro/Automation Apps (e.g., MacroDroid, Automate)

These apps create visual programming environments to automate tasks (e.g., "When I connect to my car Bluetooth, turn on GPS and open Spotify").

They operate by simulating user inputs and reacting to system events (triggers). They push the boundaries of what's possible without root, but can lead to complex, fragile setups and potential self-lockout.

**Key Takeaway:** Mobile platforms are complex. Clever developers find and exploit permission models (VPN), hardware traits (AMOLED), and sensor access to create powerful tools that work within the sandbox, often for privacy, power saving, or automation.

---

## Part 3: COVID-19 Contact Tracing – Privacy by Design

This is a masterclass in designing a decentralized system that balances public health utility with strong privacy guarantees.

### The Core Decentralized, Privacy-Preserving Protocol:

1. **Randomized Broadcasts:** Every phone constantly generates and broadcasts random, rotating identifiers via Bluetooth Low Energy (BLE). It also listens for identifiers from nearby phones.
2. **Local Storage:** Each phone stores only the identifiers it has broadcast and heard over the last 14 days, locally on the device.
3. **Positive Case Reporting:** If a user tests positive, they can voluntarily upload only their own list of recently broadcast identifiers to a public health server. No location data or contact lists are uploaded.
4. **Exposure Checking:** Every phone periodically downloads the list of "positive" identifiers from the server. It checks this list locally against its own log of "heard" identifiers.
5. **Exposure Notification:** If a match is found (meaning the phone was near a positive case), the user is notified of a potential exposure, without revealing who the contact was or where it happened.

### Why This Design is Brilliant:

- **Privacy:** The health authority learns nothing about who an infected person met. Users learn nothing about who exposed them. No central tracking database is created.
- **Decentralization:** Matching happens on the user's device, not on a central server.
- **Security:** The random, changing identifiers prevent long-term tracking of individuals via Bluetooth.

**Key Takeaway:** It demonstrates that even for critical, large-scale systems, it is possible to architect solutions where data stays on the user's device and privacy is the default, not an afterthought.

---

## Part 4: Apple AirTags & "Find My" – A Multi-Technology Tracking Network

AirTags showcase the sophisticated use of multiple wireless technologies to create a seamless user experience and a massive, privacy-conscious crowdsourced tracking network.

### The Three Wireless Technologies:

1. **Bluetooth Low Energy (BTLE):** The workhorse. The AirTag broadcasts a public key. Any nearby Apple device (iPhone, iPad, Mac) in the "Find My" network detects this signal, notes its own location (GPS), encrypts that location with the AirTag's public key, and uploads the encrypted packet to iCloud. The helper device cannot decrypt the location; only the AirTag owner can.
2. **Ultra-Wideband (UWB) – (iPhone 11+):** For precision finding in the last few meters. It provides direction and distance ("12 feet to your left") like a digital compass pointing to the tag.
3. **NFC:** As a fallback. If a lost AirTag is found by someone (even with an Android phone), tapping it with their phone will read an NFC message with a lost-and-found URL (if the owner has marked it lost).

### The "Find My" Network Magic:

It's a privacy-preserving, crowdsourced mesh. Your iPhone anonymously helps locate other people's lost devices, and their devices help locate yours. The system uses public-key cryptography so that only the owner can decrypt their item's location history.

### The Major Issue: Stalking & Malicious Use

**The Problem:** The very feature that makes them great for finding keys makes them dangerous for tracking people without their consent.

**Apple's Mitigations:** iPhones now detect if an unknown AirTag is moving with you over time and alert you. AirTags also play a sound after being separated from their owner for a period.

**The Gap:** Android users need a separate app ("Tracker Detect") and are not protected by the seamless, background detection that iOS provides.

**Key Takeaway:** A powerful, user-centric feature (finding lost items via a global network) introduces a new threat model (covert tracking). It highlights the constant tension between utility, privacy-by-design, and the need for cross-platform security protections.

---

## Part 5: Mobile Card Emulation (MCE) – Your Phone as a Secure Card

This examines how phones emulate contactless smart cards (for payment, transit, access) and the security models involved.

### Two Primary Technical Modes:

**Host Card Emulation (HCE):**

- The card emulation runs as software on the phone's main processor (in a secure sandbox).
- **Pros:** Flexible, easier for developers.
- **Cons:** Less secure, as malware on the main OS could potentially interfere with the transaction.

**Secure Element (SE) Mode:**

- Uses a dedicated, isolated, tamper-resistant hardware chip (the Secure Element) – similar to the chip in a physical credit card.
- **Pros:** Extremely secure. The transaction secrets never leave the hardened chip.
- **Cons:** Harder to implement, requires cooperation with chip manufacturers/carriers. (Apple Pay uses this model exclusively).

### The Complexity of Mobile Payments:

It's not just about emulating a card. The system involves a chain of trust: the phone's secure hardware, the payment terminal, the card network (Visa/Mastercard), the bank, the merchant, and often a "wallet" app (Google/Apple Pay) acting as a broker. Debugging failures in this chain is notoriously difficult.

**Key Takeaway:** Turning a general-purpose computer into a highly secure financial token is a massive engineering challenge. It requires hardware-level security (SE) for true trust, and involves navigating a complex ecosystem of banks, networks, and device manufacturers.

---

## Part 6: Computational Photography – Software Beating Physics

This case shows how mobile limitations (tiny lenses, small sensors) are overcome not with better hardware, but with smarter software and algorithms.

### Core Techniques:

**Multi-frame Fusion / Burst Processing:** Taking a rapid burst of many photos and combining them.

- **For Low Light (Night Mode):** Averages multiple shots to reduce noise, using AI to align frames and compensate for hand shake (using the IMU for motion data).
- **For Super-Resolution / Super-Zoom:** Slight sub-pixel shifts between frames (from natural hand tremor or Optical Image Stabilization motors) provide extra data. Algorithms merge these to create a final image with more detail than the sensor's native resolution.

**Artificial Bokeh (Portrait Mode):** Uses data from multiple cameras (or a single camera with focus pixels) to estimate a depth map. It then artificially blurs the background, mimicking a large-aperture DSLR lens.

### The Ethical Edge: "AI" Hallucination

**The Samsung Moon Controversy:** Allegations that Samsung's "Space Zoom" uses AI to recognize a blurry moon shape and overlay or enhance it with pre-existing, unrealistic details – essentially fabricating parts of the image.

**The Philosophical Question:** At what point does "enhancement" become synthesis or forgery? Computational photography blurs the line between capturing reality and creating it.

**Key Takeaway:** Mobile photography is now a computational discipline. The "best" camera phone is often the one with the best software algorithms, not necessarily the biggest sensor. This shift raises important questions about the authenticity of digital images.

---

## Overall Synthesis

These case studies demonstrate that mobile and ubiquitous systems are about ingenious solutions to constrained problems:

- Solving the IoT setup problem with side-channels.
- Achieving privacy in mass surveillance with cryptography.
- Building a global finding network with multi-radio devices and clever crypto.
- Bypassing OS restrictions for user empowerment.
- Overcoming hardware limits with computational smarts.

They highlight recurring themes: privacy-by-design, the use of hybrid wireless technologies, security vs. usability tradeoffs, and the power of software to redefine hardware capabilities.

---

