# Lecture 05: Mixed Reality

## Part 1: Foundational Concepts & Definitions

### The Reality-Virtuality Continuum (Milgram & Kishino, 1994)

A spectrum that describes how much of a user's view consists of real vs. computer-generated content.

- **Real Environment:** Pure, unaltered physical world.
- **Augmented Reality (AR):** Primarily real-world view, with virtual objects overlaid and spatially registered in 3D.
- **Augmented Virtuality (AV):** Primarily a virtual environment, with some real-world elements blended in (less common).
- **Virtual Reality (VR):** A completely synthetic, immersive environment.

### Augmented Reality (AR) – Formal Definition (Azuma, 1997):

- **Combines Real and Virtual:** Real-world and computer-generated content are blended.
- **Interactive in Real-Time:** Users can interact with the virtual elements seamlessly.
- **Registered in 3D:** Virtual objects are accurately aligned and anchored in the real 3D space.

### Core Requirements for AR:

- **Input:** Visual (camera) to capture the real world.
- **Output:** Display to show the blended view.
- **Tracking:** 6 Degrees of Freedom (6DoF) head/device tracking (X, Y, Z position + pitch, yaw, roll orientation) to align virtual content.
- **Processing:** Fast graphics and low latency to maintain the illusion and enable interaction.

---

## Part 2: Display Technologies for AR

The choice of display defines the user experience and the technical challenges.

### 1. Head-Mounted Displays (HMDs)

#### Optical See-Through (e.g., Microsoft HoloLens, Magic Leap)

**How it Works:** A transparent "combiner" (like a semi-silvered mirror) reflects the image from a micro-display into your eye, while allowing you to see the real world directly through it.

**Pros:**

- Direct, lag-free view of the real world.
- Eye can focus naturally at different distances (accommodation).

**Cons:**

- **Occlusion Problem:** Cannot realistically "hide" real objects behind virtual ones (virtual objects appear translucent).
- **Alignment & Brightness:** Virtual content can look "floating" and is hard to see in bright outdoor light.
- **Limited Field of View (FoV):** Often very narrow (~40-50 degrees) compared to human vision (~180 degrees).

#### Video See-Through (e.g., Meta Quest 3 in Passthrough mode)

**How it Works:** Cameras capture the real world, which is then combined with virtual graphics on a standard VR display screen.

**Pros:**

- Full control over the blend – can occlude real objects with virtual ones.
- Can use the camera feed for more accurate computer vision-based tracking.

**Cons:**

- **Parallax Error:** The camera is not exactly where your eye is, causing a slight mismatch in perspective.
- **Motion Sickness Risk:** Latency between head movement and updated video feed can cause discomfort.
- **Fixed Focus:** Everything appears on a single screen plane, conflicting with the eye's natural focus cues (Vergence-Accommodation Conflict).

**General HMD Challenges:** Weight/comfort, limited FoV, brightness, safety concerns (especially if video feed fails), and the "social acceptance" hurdle of wearing bulky gear.

### 2. Heads-Up Displays (HUDs)

**Common Use:** Vehicles (cars, aircraft). Information (speed, navigation) is projected onto the windshield.

**Key Difference:** Often 2D and not spatially aligned with the 3D world (information is fixed on the glass, not on the road). This is technically Assisted Reality, not true 3D AR.

### 3. Handheld/Smartphone AR

**Metaphor:** The screen acts as a "magic window" or viewfinder into an augmented world.

**Advantage:** Ubiquitous, no special hardware needed.

**Limitations:**

- No True 3D Stereo View (except with add-ons like Cardboard).
- Parallax Issues: The screen is not aligned with your eye's viewpoint.
- One-Handed & Occluded: You have to hold the device up, blocking part of your natural view.

**Primary Challenge:** Tracking – doing robust 6DoF tracking with a single moving camera is hard.

---

## Part 3: The Heart of AR – Tracking & Localization

This is the most critical technical problem. Stable, accurate 6DoF tracking is what makes virtual objects feel "stuck" in the real world.

### 1. Sensor-Based: GPS + IMU

**How:** Fuses coarse absolute position (GPS, ~1-10m accuracy) with precise relative orientation (IMU - gyroscope, accelerometer, magnetometer).

**Pros:** Works outdoors at a large scale; requires no pre-mapping.

**Cons:** Low accuracy and precision; doesn't work indoors (no GPS). Needs additional data (like a 3D building model) for meaningful object placement.

**Use Case:** Large-scale, outdoor AR (Pokémon GO, geolocated historical overlays).

### 2. Vision-Based Tracking

The goal is to compute the device's pose (position & orientation) relative to the environment.

#### A. Marker-Based Tracking

**How:** Uses predefined, high-contrast visual patterns (fiducial markers, e.g., QR-like patterns) or known images (image targets). The system detects the marker and calculates the camera's pose relative to it.

**Pros:** Simple, robust, and very accurate.

**Cons:** Requires prepared markers/objects; only works where markers are present. Breaks immersion.

#### B. Markerless / Natural Feature Tracking (e.g., SIFT, SURF, ORB)

**How:** Algorithms detect distinctive keypoints (corners, edges) in the environment that are invariant to scale and rotation. By matching these features between the current camera view and a known reference, the system can compute its pose.

**Pros:** Can use any textured, feature-rich environment. More flexible than markers.

**Cons:** Requires an initial reference (a photo or map). Can fail in low-texture environments (blank walls).

#### C. SLAM (Simultaneous Localization and Mapping)

The Gold Standard for Modern Mobile AR (ARKit, ARCore).

**How:** Simultaneously builds a sparse 3D map of unknown surroundings and tracks the device's position within that map. It does this by tracking feature points across sequential video frames and using motion parallax to estimate depth.

**Key Capabilities of Modern SLAM (ARKit/ARCore):**

- **Plane Detection:** Automatically finds horizontal (tables, floors) and vertical (walls) surfaces.
- **Light Estimation:** Measures ambient light to cast realistic virtual shadows.
- **Anchors:** Allows virtual objects to be persistently "placed" in the world.

**Pros:** Works in unknown environments, no markers needed, enables true spatial interaction.

**Cons:** Computationally intensive; requires good camera and motion sensors.

#### D. Active Depth Sensing (Stereo/Depth Cameras)

**Hardware:** Specialized sensors like Stereo Cameras (two cameras) or Depth Cameras (e.g., Time-of-Flight - ToF, Structured Light as in iPad Pro).

**How:** Provides a depth map – a per-pixel distance measurement – alongside the color image.

**Pros:** Provides direct, accurate 3D data; greatly simplifies tasks like occlusion and object placement.

**Cons:** Requires expensive, specialized hardware not found in most phones; higher power consumption.

---

## Part 4: Interaction & Applications

### Interaction in AR

- **Direct Touch:** On handheld/screen-based AR.
- **3D Gestures:** Hand tracking (optical with cameras, or with sensors like the Leap Motion).
- **Dedicated Controllers:** Like VR controllers, providing precise 6DoF input.
- **Gaze & Dwell:** Using head direction to point, combined with a timer or trigger.
- **Voice Commands:** Natural for hands-free interaction, especially with HMDs.

### Application Domains (Still Seeking a "Killer App")

- **Industrial & Maintenance:** Overlaying repair instructions, wiring diagrams, or part numbers directly onto machinery (e.g., Werklich).
- **Retail & Design:** Visualizing furniture (IKEA Place) or new paint in your home before buying.
- **Education & Training:** Interactive 3D models for anatomy, history, or mechanics.
- **Gaming:** From Pokémon GO (location-based) to more immersive tabletop or room-scale games.
- **Navigation:** Arrow overlays on streets or indoor pathfinding (still largely prototypical).
- **Healthcare:** "X-ray vision" for vein finding, surgical planning, or visualizing medical scans over a patient.

### Spatial AR / Projection Mapping

**Concept:** Instead of displaying graphics on a screen worn by the user, project them directly onto the real-world objects. The user sees the augmentation without any HMD.

**Use Cases:** Artistic installations on buildings, interactive floors/tables, industrial guidance (projecting assembly outlines directly onto a workpiece).

**Challenges:** Requires very bright projectors (often lasers), precise projector calibration, and known object geometry.

---

## Part 5: The Mobile VR Footnote

- Devices like Meta Quest are mobile VR platforms (untethered, self-contained).
- They become AR-capable via their video see-through cameras (e.g., "Passthrough" mode).
- Their inside-out tracking (using onboard cameras) is a form of SLAM, allowing for room-scale 6DoF movement.
- A core unsolved problem in mobile VR/AR is locomotion – moving through virtual spaces larger than your physical room (solved via teleportation, "redirected walking" techniques).

---

## Synthesis & Key Takeaways

**AR is Defined by Alignment:** The core magic is the stable 3D registration of virtual content in the real world. If it jitters or floats, the illusion breaks.

**The Display Determines the Experience:**

- HMDs offer immersion but have social/comfort tradeoffs.
- Handheld is accessible but limited and tiring.
- Spatial Projection is shared and seamless but static and complex.

**Tracking is the Hardest Problem:** From simple (markers) to complex (SLAM), the method chosen dictates where and how well AR works. Modern phone-based AR (ARKit/ARCore) uses SLAM to enable markerless, interactive experiences.

**Interaction is Still Evolving:** We lack a standard, intuitive way to interact with 3D holograms. Solutions borrow from touch (direct), VR (controllers), and new paradigms (hand tracking, gaze).

**It's a Solution in Search of Problems:** While gaming and filters are popular, the most compelling and valuable uses of AR are in enterprise and industrial contexts (training, maintenance, design), where it solves real productivity and safety problems.

**The Future is Hybrid (MR):** The line between AR and VR is blurring. Devices that can seamlessly switch between opaque (VR) and transparent (AR) modes, understanding and interacting with the full reality-virtuality continuum, represent the next major step.

---

