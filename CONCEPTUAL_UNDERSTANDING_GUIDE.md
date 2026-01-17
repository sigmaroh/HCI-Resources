# HCI Exam - Conceptual Understanding Guide

**Important:** Exam questions focus on **understanding the bigger picture**, not memorizing details!

Example:
- ✅ "How does GPS work?" (high-level understanding)
- ❌ "How many satellites does GPS have?" (minute detail)

---

## 🎯 How to Prepare for Conceptual Questions

### Focus On:
1. **Core Principles** - Why does it work this way?
2. **Big Picture** - How do components fit together?
3. **Comparisons** - How is X different from Y?
4. **Applications** - When would you use this?
5. **Trade-offs** - What are pros and cons?

### Don't Worry About:
- Exact numbers (unless fundamental to concept)
- Specific brand names
- Minor technical specifications
- Every implementation detail

---

## 📚 Lecture 1: Big Issues - Conceptual Overview

### "Explain User-Centered Design"
**High-level answer:**
- Design process that puts users at the center
- Involves users throughout: research → design → test → iterate
- Goal: Create systems that match user needs and abilities
- Key: Testing with real users, not just designer assumptions
- Example: Testing a mobile app with elderly users reveals different needs than testing with young users

**NOT needed:** Specific UCD model names, exact number of iterations

### "What is Fitts' Law and why is it important?"
**High-level answer:**
- Principle: Time to reach a target depends on distance and size
- Closer and bigger targets = faster to select
- Design implication: Put frequently used buttons large and close
- Example: Corners of screen are easy targets (infinite size in that direction)
- Explains why mobile touch targets need minimum size

**NOT needed:** Exact formula, specific pixel measurements

### "Why is consistency important in interface design?"
**High-level answer:**
- Users learn patterns and expect them to repeat
- Inconsistency causes confusion and errors
- Reduces learning time and cognitive load
- Example: Back button always in same place, same function
- Trade-off: Sometimes consistency conflicts with optimization

---

## 📍 Lecture 2: Networks & Location - Conceptual Overview

### "How does GPS work?"
**High-level answer:**
- Satellites broadcast time-stamped signals
- Receiver calculates distance from time delay (speed of light)
- Needs signals from multiple satellites (trilateration)
- More satellites = better accuracy and 3D position
- Limitations: Needs clear sky, poor indoors, uses battery

**NOT needed:** Exact number of satellites (24), specific frequencies, orbital details

### "How is indoor positioning different from outdoor?"
**High-level answer:**
- GPS doesn't work indoors (signal blocked by buildings)
- Must use alternative signals: Wi-Fi, Bluetooth, cellular
- Methods: Signal strength mapping (fingerprinting), or ranging
- Generally less accurate than GPS
- Requires infrastructure (Wi-Fi access points, BLE beacons)

**NOT needed:** Exact accuracy numbers, specific RSSI values

### "Explain Wi-Fi positioning"
**High-level answer:**
- Uses existing Wi-Fi access points
- Two approaches:
  1. Fingerprinting: Pre-map signal strengths, match current readings
  2. Trilateration: Estimate distance from signal strength
- Advantages: Works indoors, uses existing infrastructure
- Limitations: Requires dense AP coverage, signal interference

**NOT needed:** Specific algorithms, exact dBm values

### "What are privacy concerns with location tracking?"
**High-level answer:**
- Location reveals personal information (home, work, habits)
- Can be used for surveillance, stalking
- Aggregated data can identify individuals
- Solutions: Opt-in consent, anonymization, data minimization
- Regulations: GDPR requires explicit consent

---

## 📱 Lecture 3: I/O on Small Screens - Conceptual Overview

### "What is the fat finger problem?"
**High-level answer:**
- Finger touch area larger than small UI elements
- Hard to accurately select small targets
- Solutions:
  - Make touch targets bigger (minimum size guidelines)
  - Increase spacing between targets
  - Use zoom or magnification
  - Predictive: Enlarge likely targets
- Example: Mobile keyboard keys need to be large enough

**NOT needed:** Exact minimum pixel sizes (good to know ~44-48 pixels, but principle matters more)

### "Explain the thumb zone concept"
**High-level answer:**
- One-handed phone use: Only thumb available
- Reachable areas vary by phone size and hand
- Three zones:
  - Easy reach (bottom corners)
  - Stretch reach (top corners opposite thumb)
  - Hard/impossible reach (far top)
- Design implication: Put important controls in easy reach zone
- Example: Many apps put navigation at bottom for accessibility

### "Why is text input challenging on mobile devices?"
**High-level answer:**
- Small virtual keyboard = fat finger problem
- Limited screen space (keyboard covers content)
- No tactile feedback like physical keyboard
- Solutions:
  - Autocorrect (but can cause errors)
  - Predictive text
  - Swipe/gesture typing
  - Voice input as alternative
- Trade-offs: Accuracy vs speed vs screen space

---

## 🌐 Lecture 4: Ubicomp & IoT - Conceptual Overview

### "What is ubiquitous computing?"
**High-level answer:**
- Computing everywhere, embedded in environment
- Technology becomes invisible/calm (fades to background)
- Context-aware: Systems respond to environment
- Many devices working together vs one desktop computer
- Example: Smart home - lights, thermostat, locks all computing but not "computers"

**NOT needed:** Mark Weiser's exact quotes, specific dates

### "Explain IoT architecture"
**High-level answer:**
- Layered approach from devices to applications:
- Bottom: Sensors/actuators (perception layer) - gather/act on data
- Middle: Networks (communication) - move data around
- Above: Processing/storage (middleware) - make sense of data
- Top: Applications (user services) - what users interact with
- Each layer has different concerns (power, bandwidth, processing)

### "Compare Bluetooth and Zigbee for IoT"
**High-level answer:**

**Bluetooth/BLE:**
- Common in smartphones/wearables
- Point-to-point or star topology
- Low power, short range
- Good for: Fitness trackers, headphones

**Zigbee:**
- Mesh networking (devices relay for each other)
- Very low power, longer range through mesh
- More devices per network
- Good for: Home automation, sensor networks

**Trade-offs:** BLE works with phones easily, Zigbee better for large device networks

**NOT needed:** Exact ranges in meters, specific power consumption numbers, protocol version details

### "What is edge computing and why use it?"
**High-level answer:**
- Processing data at device/local gateway vs sending to cloud
- Benefits:
  - Lower latency (faster response)
  - Works offline
  - Privacy (data stays local)
  - Reduces bandwidth use
- Trade-offs: Less computing power than cloud, harder to manage
- Example: Smart camera doing face detection locally vs sending all video to cloud

---

## 🥽 Lecture 5: Mixed Reality - Conceptual Overview

### "What's the difference between AR, VR, and MR?"
**High-level answer:**

**VR (Virtual Reality):**
- Completely virtual environment
- User fully immersed, can't see real world
- Example: Gaming, training simulations

**AR (Augmented Reality):**
- Virtual content overlaid on real world
- Can still see real environment
- Example: Pokémon GO, AR navigation

**MR (Mixed Reality):**
- Real and virtual objects interact
- Virtual objects respond to real environment
- More sophisticated than simple overlay
- Example: Virtual furniture placed in real room, stays in place

**Spectrum:** Real World → AR → MR → VR (increasing virtuality)

### "How does AR tracking work?"
**High-level answer:**
- System needs to know where device is and what it's looking at
- Two main approaches:
  1. Marker-based: Use printed markers/QR codes to anchor content
  2. Markerless: Recognize features in environment (SLAM)
- SLAM: Simultaneously maps environment and tracks position
- Uses cameras, sensors (accelerometer, gyroscope)
- Challenge: Accurate alignment between virtual and real

**NOT needed:** Specific algorithm names, exact sensor specifications

### "What causes motion sickness in VR and how to reduce it?"
**High-level answer:**
- **Cause:** Mismatch between visual motion and vestibular (inner ear)
  - Eyes see movement, but body feels stationary
  - Brain gets conflicting signals
- **Solutions:**
  - Reduce latency (faster response)
  - Higher frame rate (smoother motion)
  - Stable reference frame (cockpit, static elements)
  - Avoid artificial rotation (use teleportation)
  - Gradual exposure (build tolerance)

**NOT needed:** Exact millisecond latency thresholds

### "What is 6DOF tracking?"
**High-level answer:**
- Six degrees of freedom: Three rotation + three translation
- Rotation: Pitch (up/down), yaw (left/right), roll (tilt)
- Translation: Move forward/back, left/right, up/down
- Full 6DOF allows natural movement in VR
- Contrast with 3DOF (rotation only - less immersive)
- Example: Room-scale VR needs 6DOF to walk around

---

## 📊 Lecture 6: Case Studies - Conceptual Overview

### "How do you analyze an HCI case study?"
**High-level answer:**
- Ask key questions:
  - What problem were they solving?
  - Who were the users?
  - What design process did they use?
  - What worked and what didn't?
  - Why did it succeed or fail?
  - What can we learn?
- Look for: User involvement, iteration, testing, context
- Consider: Technology choices, usability, adoption

### "What makes HCI projects successful?"
**High-level answer:**
- User-centered approach (involve users, not just assume)
- Iterative design (test and refine, not one-shot)
- Solving real user needs (not technology looking for problem)
- Appropriate technology (right tool for job)
- Considering context (how actually used, not just lab)
- Accessibility and inclusion
- Privacy and trust

### "Why do HCI projects fail?"
**High-level answer:**
- Ignoring users (designer assumptions wrong)
- No real need (cool technology but no problem solved)
- Poor usability (confusing, difficult to use)
- Context mismatch (doesn't fit actual use situation)
- Privacy/trust issues (users don't feel safe)
- Poor performance (slow, unreliable)
- Lack of testing (problems found too late)

---

## 🖥️ Lecture 7: ISS Intro - Conceptual Overview

### "Compare resistive and capacitive touch"
**High-level answer:**

**Resistive:**
- Pressure-sensitive (any stylus works)
- Single touch only
- Less durable, less accurate
- Cheaper
- Use: Industrial, medical (works with gloves)

**Capacitive:**
- Detects electrical charge (conductive stylus needed)
- Multi-touch capable
- More durable, accurate
- More expensive
- Use: Smartphones, tablets, modern displays

**Trade-off:** Resistive more versatile input, capacitive better UX

### "What's different about horizontal vs vertical interactive surfaces?"
**High-level answer:**

**Horizontal (Tabletops):**
- Natural for collaboration (face-to-face)
- No single orientation (content needs rotation)
- Can place physical objects on it
- Reach limitations (arm length)
- Good for: Planning, design, games

**Vertical (Walls):**
- Large viewing area
- Single orientation
- Fatigue from vertical touch ("gorilla arm")
- Can interact from distance
- Good for: Presentations, visualization, public displays

### "What is territoriality on interactive tables?"
**High-level answer:**
- How users organize space around them
- Three zones:
  - Personal territory: "My" workspace (in front of me)
  - Group territory: "Our" shared space (center)
  - Storage territory: Temporary parking (edge, corners)
- Affects collaboration: Respect personal space, share group space
- Design consideration: Support both individual and shared work

**NOT needed:** Exact distance measurements for zones

### "What are challenges of multi-user interaction?"
**High-level answer:**
- Technical: Identifying which user doing what
- Coordination: Preventing conflicts (reaching for same thing)
- Awareness: Knowing what others are doing
- Equity: Everyone gets fair access
- Transitions: Moving between individual and group work
- Social: Turn-taking, interruptions, communication

---

## ⚙️ Lecture 8: ISS Technology - Conceptual Overview

### "How does FTIR touch detection work?"
**High-level answer:**
- Total internal reflection: Light bounces inside acrylic sheet
- Finger touch frustrates reflection (light escapes at touch point)
- Camera below sees bright spots where touches occur
- Infrared used (invisible to users)
- Advantages: High contrast, accurate multi-touch
- Use: High-quality interactive tabletops

**NOT needed:** Exact refractive index, specific IR wavelengths

### "Explain the computer vision pipeline for touch detection"
**High-level answer:**
- Process camera images to find touches:
  1. Capture frame from camera
  2. Remove noise, normalize brightness
  3. Subtract background (remove static elements)
  4. Threshold (separate touches from non-touches)
  5. Find blobs (connected regions = touches)
  6. Track over time (match touches between frames)
  7. Classify (identify gesture, user, etc.)
- Runs continuously for real-time interaction
- Challenge: Fast enough for low latency

### "What are fiducial markers used for?"
**High-level answer:**
- Trackable patterns (like enhanced QR codes)
- System detects: Which marker, where it is, orientation
- Uses:
  - Tangible interfaces (physical objects control digital)
  - Multiple object tracking
  - User identification (personalization)
  - Mode switching
- Example: Physical tokens on table represent data, moving them manipulates display

### "Why is calibration important?"
**High-level answer:**
- Ensures accuracy of touch detection and display alignment
- Types:
  - Camera calibration: Correct lens distortion
  - Touch calibration: Map camera coordinates to display coordinates
  - Color calibration: Accurate color reproduction
- Without calibration: Touches detected in wrong place
- Needs regular recalibration (equipment shifts over time)

### "What are performance requirements for interactive surfaces?"
**High-level answer:**
- **Latency:** Response delay should be imperceptible
  - Target: Under 50ms total (touch to display)
  - Lower is better for natural feel
- **Frame rate:** Smooth motion
  - Camera: 60+ fps to detect fast motion
  - Display: 60+ Hz for smooth visuals
- **Accuracy:** Touches detected in right place
- Trade-offs: Higher performance requires more processing power

**NOT needed:** Exact millisecond values (but knowing ~50ms for latency shows understanding)

---

## 🎯 Example High-Level Questions & Answers

### "How would you choose between GPS and Wi-Fi positioning?"
**Conceptual answer:**
- Consider context:
  - Outdoors + open sky → GPS better (more accurate)
  - Indoors + Wi-Fi available → Wi-Fi positioning
  - Remote areas → GPS (no Wi-Fi infrastructure)
  - Battery constrained → Consider trade-offs (both use power)
- Think about requirements:
  - Need high accuracy? GPS outdoors, dense Wi-Fi indoors
  - Need to work everywhere? GPS (but not indoors)
  - Want to use existing infrastructure? Wi-Fi
- Example: Navigation app uses GPS outdoors, switches to Wi-Fi in mall

### "When would you use VR vs AR?"
**Conceptual answer:**
- **Use VR when:**
  - Need full immersion (complete focus)
  - Creating entirely different environment
  - Example: Flight simulator, architectural walkthrough
  
- **Use AR when:**
  - Need to see real world simultaneously
  - Enhancing real environment with information
  - Example: Maintenance instructions, navigation overlay

- **Trade-offs:**
  - VR more immersive but isolating
  - AR keeps context but less immersive

### "Why use edge computing instead of cloud for IoT?"
**Conceptual answer:**
- **Edge benefits:**
  - Faster response (no network round-trip)
  - Privacy (data stays local)
  - Works offline
  - Saves bandwidth
  
- **Cloud benefits:**
  - More processing power
  - Easier updates
  - Centralized data analysis
  
- **Decision factors:**
  - Real-time critical? → Edge (e.g., autonomous car)
  - Heavy processing? → Cloud
  - Privacy sensitive? → Edge
  - Many devices, big data? → Cloud

---

## 💡 Thinking Framework for Any Question

When asked "How does X work?" or "Explain X":

1. **Big picture first**: What is it? What's it for?
2. **Main principle**: Core idea in one sentence
3. **Key components**: What are the main parts?
4. **How they work together**: Process or interaction
5. **Example**: Real-world case to illustrate
6. **Trade-offs/limitations**: Nothing is perfect

### Example: "How does multi-touch work?"

1. **Big picture**: Detecting multiple simultaneous touch points
2. **Main principle**: Sense each touch independently
3. **Key components**: Touch sensor, controller, software
4. **How they work**: Sensor detects touches, controller identifies each point, software interprets gestures
5. **Example**: Pinch-to-zoom uses two touch points moving closer/apart
6. **Trade-offs**: More complex/expensive than single-touch, needs capacitive technology

---

## 🎓 Key Takeaways

### Focus Your Study On:
✅ **Understanding principles** (how and why things work)  
✅ **Comparing alternatives** (when to use what)  
✅ **Real-world applications** (concrete examples)  
✅ **Trade-offs** (advantages and disadvantages)  
✅ **Design implications** (what does this mean for UX)

### Don't Stress About:
❌ Exact numbers (unless core to concept)  
❌ Specific technical details  
❌ Every implementation variant  
❌ Minor specifications  

### If Asked a Detail You Don't Know:
- **Start with what you do know** (the concept)
- **Explain the principle** (why it matters)
- **Be honest**: "I don't recall the exact number, but the principle is..."
- **Think aloud**: Show your reasoning

---

## 🚀 Final Advice

**The exam tests whether you understand HCI concepts**, not whether you memorized slides.

**Good answers show:**
- Grasp of core principles
- Ability to explain in your own words
- Use of relevant examples
- Understanding of trade-offs
- Connection between topics

**Remember:**
- It's okay to think before answering
- Use examples from daily life
- Draw diagrams if helpful
- Explain your reasoning
- Show you understand the "why" not just the "what"

**You've got this! Focus on understanding, and you'll do great! 🌟**

