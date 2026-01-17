# Lecture 03/04: I/O on Mobile Devices

## Part 1: Core I/O Challenges & Solutions

Mobile I/O departs radically from the desktop paradigm of keyboard + mouse + large screen. This creates unique challenges, each spurring innovative solutions in both commercial products and research.

### The Fundamental Touchscreen Tradeoffs

- **No Haptic Feedback:** Unlike physical keys, glass provides no tactile confirmation.
- **Occlusion:** Your finger covers the very thing you're trying to interact with.
- **Precision:** Fingers are blunt, making small targets hard to hit.
- **No Hover State:** On a desktop, you can hover a mouse to preview an action. On touch, contact is immediate—the "Midas Touch Problem".
- **Reachability:** Large screens make top corners hard to reach with one hand.

**Key Takeaway:** Porting desktop interfaces directly to mobile fails. We need new, touch-first interaction models.

---

## Part 2: Deep Dive into Solutions for Touch Issues

### 1. Addressing Haptic Feedback

**Goal:** Make the flat glass feel like it has texture or buttons.

**Solutions:**

- **Physical Deformation (Tactus "Phorm"):** Uses fluid-filled micro-channels to create temporary, physical buttons that rise from the screen. Limited by fixed layouts.
- **Electrovibration:** Applies a modulated electrostatic charge to the screen, changing friction under your finger to simulate ridges, edges, or vibrations. Provides dynamic feedback but is single-touch only.

### 2. Solving Occlusion

**Goal:** See what you're interacting with, even when your finger is in the way.

**Solutions:**

- **Predictive Modeling:** Software models the estimated shape of your hand and arm to reposition pop-up menus to a less-occluded area (e.g., above or left of the touch point).
- **Back-of-Device Interaction (NanoTouch):** Places a second touchpad on the device's back. Your index finger on the back controls a "virtual finger" cursor on the screen, making the device feel "transparent." This enables interaction on very small screens.

### 3. Improving Precision

**Goal:** Make it easier to hit small targets or perform precise selections.

**Solutions:**

- **Modeling the User (Perceived Input Point):** Recognizes that people don't touch exactly where they think they do; the perceived touch point varies by finger angle and user. High-resolution touch sensors can even detect fingerprints to estimate the finger's angle and correct the touch point.
- **Offset Cursors (Android Handles):** When selecting text, the precise cursor is offset from your finger, allowing you to see it.
- **Dynamic Magnification (iOS Shift):** When your finger touches near a small target (like a text cursor), a magnified "lens" view appears, letting you place the cursor precisely.
- **Crowdsourced Calibration ("100M Taps"):** By analyzing millions of taps from real users on specific phone models, average touch-offset maps can be built and used to systematically improve accuracy for all users of that device.

### 4. Mitigating the "Midas Touch" Problem (No Hover)

**Universal Solution: The Lift-Off Strategy**

- **Touch Down:** Visual feedback begins (e.g., a button highlights).
- **Drag:** Feedback continues (you can slide off the button to cancel).
- **Lift Off (Touch Up):** The action is finally triggered. This provides a crucial "undo" phase.

**Future: Pre-Touch Sensing:** Many capacitive screens can already detect a finger hovering just above the glass. This data is usually filtered out, but if used, it could enable previews and richer interactions before physical contact.

### 5. Helping Reachability

**Commercial Solutions:** iOS "Reachability" and Android "One-Handed Mode" shift the entire screen contents down toward your thumb. However, precision often suffers because your thumb is now at an extreme, less-controlled angle.

### 6. The Keyboard Problem

**Core Insight:** We can't type precisely, so we must predict and correct.

**Evolution:**

- **Classic QWERTY + Word Prediction:** Tries to guess your word as you type.
- **Gesture Typing (Swype/SwiftKey):** You swipe through letters without lifting your finger. The system interprets the path into words. This turns imprecise touch into a strength.
- **Minimalist (Minuum):** Uses a single line of letters and heavy reliance on prediction, maximizing screen space.

---

## Part 3: Motion as Input and Output

### Motion Input: Sensing Device Movement

**The IMU Triad (9-axis sensor fusion):**

- **Accelerometer (3 DOF):** Measures acceleration (including gravity = "down"). Cannot sense rotation around gravity.
- **Gyroscope (3 DOF):** Measures rate of rotation. Compensates for the accelerometer's weakness.
- **Magnetometer (3 DOF):** Acts as a digital compass ("north"). Easily distorted by metal (requires calibration via figure-8 motions).

**Sensor Fusion Algorithm:** Combines these 9 noisy signals into a stable, absolute 3 DOF orientation. Combined with GPS, you get a full 6 DOF pose.

**Power Tradeoff:** All three sensors running at high frequency consume significant power. Often, only the accelerometer runs at a low rate (~1 Hz) for basic tasks like screen rotation.

**How They're Made: MEMS (Micro-Electro-Mechanical Systems)**

- These are microscopic mechanical structures (springs, weights) etched onto silicon chips.
- No moving parts in the traditional sense: A "gyroscope" measures the Coriolis force on a vibrating weight. A magnetometer uses the Hall effect.

### Beyond the Built-in IMU: Advanced Motion Input

- **Add-on Controllers (e.g., VR controllers):** Combine IMU, buttons, and touchpads for richer 3D interaction.
- **Muscle Sensing (EMG - e.g., Myo):** Detects electrical signals from muscle contractions to infer hand gestures, enabling hands-free control.
- **Free-Air Gestures (e.g., Imaginary Interfaces):** Uses worn cameras to track hand movements in 3D space, turning any surface into an interface.
- **Device Deformation (e.g., PaperPhone):** Bending or flexing the device itself becomes an input, borrowing metaphors from the physical world (e.g., folding a corner to bookmark).
- **"Bumping":** Using the accelerometer to detect when two devices are physically tapped together, initiating a connection or data transfer.

### Motion Output: Beyond Simple Vibration

- **Spatial Vibration Cues:** Using multiple vibration motors in shoes, belts, or vests to convey directional information (e.g., vibrate left side for "turn left").
- **Shape-Changing Devices:** Phones that physically alter their shape, center of gravity, or thickness to convey ambient information (e.g., a "breathing" phone to indicate calm status).

**Direct User Manipulation (Research Frontier):**

- **Galvanic Vestibular Stimulation (GVS):** Applying a tiny current behind the ear to stimulate the balance organ, creating a sensation of leaning or turning.
- **Muscle-Propelled Force Feedback:** Using electrodes to cause involuntary muscle contractions, creating the illusion that a device is physically pushing back against you.

---

## Part 4: Visual I/O & Other Advanced Channels

### Visual Output: Screen Technologies

- **LCD:** Requires a constant-power backlight. Light passes through liquid crystal shutters and color filters. Poor in bright sunlight because the backlight fights ambient light.
- **AMOLED:** Each pixel is its own tiny light source (LED). Allows true blacks, is more power-efficient for dark interfaces, and is generally thinner. The organic materials can degrade over time.
- **E-Ink (Electrophoretic):** Uses charged black/white particles moved by an electric field. Bi-stable—uses power only to change the image. Excellent sunlight readability and ultra-low power, but very slow refresh rates (no video).

### Visual Input: The Camera as a Sensor

**Hardware:** Modern phones use CMOS/APS sensors (cheaper, allows "rolling shutter"). They are inherently greyscale; a Bayer filter (with extra green pixels) creates color.

**Applications:**

- **Barcodes/QR Codes:** A "solved" computer vision problem. QR codes can store URLs, contact info, WiFi passwords, etc.
- **OCR (Optical Character Recognition):** Translates images of text into machine-readable text. Used for document scanning, translation apps, etc.
- **SLAM (Simultaneous Localization and Mapping):** The holy grail for AR. The phone builds a 3D map of its surroundings and tracks its own position within that map in real-time.
- **Object Detection:** Powered by Convolutional Neural Networks (CNNs). A model trained on huge datasets can identify objects (cats, cars, etc.) directly on the device.

### Other Advanced I/O Channels

- **Biometric Sensors:** Fingerprint, heart rate (using optical pulse oximetry), skin conductivity. Raise significant privacy questions.
- **Hand/Body Pose Tracking:** Using external sensors (Leap Motion) or on-device CNNs to track the full skeleton of a hand or body for natural interaction.
- **Grasp Sensing:** Detecting how the user is holding the device (e.g., in a call, browsing, gaming) to infer context and adapt the UI.
- **Facial Expression Analysis:** Very difficult to reliably interpret raw emotions (sadness, anger). Easier to map facial feature points to an avatar (Animoji) or detect broad states like attentiveness.
- **Eye/Gaze Tracking:** Determines where the user is looking, providing a potent pointer and attention monitor. Can also infer cognitive load via pupil dilation.
- **Non-Speech Audio Input:** Using the microphone for purposes other than speech—e.g., identifying music (Shazam) or using specific whistles/tones as commands, typically using Fast Fourier Transform (FFT) to create audio fingerprints.

---

## Synthesis & Key Takeaways

**Mobile I/O is Defined by Constraints:** Limited screen size, no physical keyboard/mouse, and the need for portability force a complete redesign of interaction.

**Solutions are Multi-Faceted:** For every weakness (e.g., touch imprecision), solutions exist at different levels:

- **Hardware:** Better sensors (high-res touch, hover sensing).
- **Software:** Clever algorithms (offset cursors, predictive modeling).
- **Interaction Design:** New paradigms (lift-off strategy, gesture typing).

**Context is King:** Advanced sensors (grasp, camera, IMU) allow the device to understand how and where it's being used, enabling adaptive, intelligent interfaces.

**The Research Frontier is Physical:** The most cutting-edge research explores moving beyond pixels and vibrations to shape-changing devices and direct physiological feedback (GVS, muscle stimulation), blurring the line between the digital and physical self.

**The Camera is the Ultimate Sensor:** It's not just for photos. Combined with CV and ML, it enables OCR, AR (via SLAM), object recognition, and even heart rate monitoring, making it one of the most versatile I/O channels on the device.

---