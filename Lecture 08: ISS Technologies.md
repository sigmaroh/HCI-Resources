# Lecture 08: ISS Technologies

## Part 1: Output Technologies – Creating the Experience

The goal is to present digital information integrated with or within a physical space. Different technologies create different types of experiences.

### 1. Head-Mounted Displays (HMDs)

**Role:** Create personal, immersive interactive spaces (VR/AR/MR).

**Recap from Lecture 5:** They provide a viewport controlled by the user's head movement (6DoF tracking). They are ideal for creating a sense of "presence" in a virtual or augmented environment but isolate the user from the shared physical space.

### 2. Screens & Projection

**Role:** Create shared interactive surfaces (tabletops, walls) or large-scale visual backdrops for spaces.

**Types:**

- **LCD/OLED Displays:** Direct-view screens. Used for high-resolution, bright surfaces. Can be tiled for very large displays (video walls).
- **Projection Screens:** Front or rear projection onto a surface. More scalable to very large sizes, but ambient light can wash out the image. Enables projection mapping (spatial AR) directly onto objects.

### 3. Stereoscopic Screens (3D Displays)

**Goal:** Create a sense of depth on a 2D surface, enhancing visualization for 3D data or virtual scenes.

**Two Main Methods:**

- **Autostereoscopic (No Glasses):** Uses a lenticular lens or parallax barrier over the screen to direct different pixel columns to each eye. Limitation: Typically single-user with a limited "sweet spot."
- **Glasses-Based:**
  - **Shutter Glasses:** The display alternates left/right images at high speed, and synchronized glasses block one eye at a time.
  - **Polarized Glasses:** The projector displays left/right images with different polarizations, and glasses filter them to the correct eye. Allows for collaborative 3D viewing (multiple users with glasses).

### 4. Active Tangibles

**Concept:** The physical objects used for input can also provide output (feedback), making them true bidirectional interfaces.

**Examples:**

- **Actibles:** Objects with embedded LEDs, speakers, or vibration motors that can change state, provide confirmation, or display information.
- **Tangible Bots:** Small robots that can move, change shape, or orient themselves on the surface to represent data or guide interaction.

**Significance:** Closes the interaction loop in the physical world, making the digital state of the system manifest and manipulable through the objects themselves.

### 5. Sound Zones

**Concept:** Using audio beamforming (arrays of speakers) to create localized "bubbles" of sound in space. Only a person standing in a specific spot can hear the audio.

**Is it an ISS?** Arguably, yes. It turns an empty space into an interactive auditory display. Different zones could contain different information or instructions, navigated by moving one's body. It's a non-visual, ambient form of spatial interaction.

---

## Part 2: Input Technologies – Sensing Interaction

This is the core of ISS: detecting touch, objects, and people in space.

### A. Touch Sensing (for Surfaces)

#### 1. Resistive Touch

**How it works:** Two flexible, conductive layers separated by tiny spacers. Pressing pushes them together, completing a circuit. The controller measures the voltage to find the X,Y coordinate.

**Pros:** Cheap, works with any stylus (including gloved fingers). Rugged.

**Cons:** No true multi-touch (can detect two points but inaccurately). Lower clarity (multiple layers). Less durable (flexing layers).

#### 2. Capacitive Touch

**How it works:** Measures the disturbance in a screen's electrostatic field caused by a conductive object (like a finger).

- **Surface Capacitive:** One conductive layer. Good for single-touch kiosks. Doesn't work with gloves.
- **Projected Capacitive (P-Cap):** The standard in smartphones. A grid of electrodes. Two types:
  - **Self-Capacitance:** Measures the capacitance of each row/column individually. Good for simple multi-touch.
  - **Mutual Capacitance:** Measures the capacitance between each row-column intersection. This allows for true, high-fidelity multi-touch and even hover detection.

**Pros:** Excellent multi-touch, high clarity, durable glass front.

**Cons:** Requires conductive input (bare finger or special stylus). More complex electronics.

#### 3. Optical Touch

A family of techniques using cameras and light.

- **Frustrated Total Internal Reflection (FTIR):** Infrared (IR) LEDs shine into the edge of an acrylic sheet. Light reflects internally. A finger touching the surface "frustrates" this reflection, scattering IR light downwards, where a camera sees the bright touch point. Excellent for multi-touch.
- **Diffuse Illumination (DI):** IR LEDs shine onto the top of the surface. A camera sees the bright reflections of objects (fingers, tokens) on it. Can detect objects, not just touch.
- **IR Grid/Frame:** An array of IR LEDs and sensors around the bezel creates a grid of light beams over the surface. Touches interrupt beams, locating the point. Used for very large, rugged displays.
- **Laser Rangefinder (LiDAR):** Scans a laser beam across the surface. Measures time-of-flight to calculate the distance to any object on the surface. Excellent for very large screens (building-sized).
- **In-Cell Sensing (Samsung SUR40):** A custom LCD where each pixel is also a light sensor. It can "see" shadows and reflections of objects on the screen, enabling detection of hands, fingers, and passive tokens without external cameras. Limited by ambient light.

### B. Tangible/Object Sensing (for Surfaces)

- **Passive Tokens (e.g., ReactIVision, AruCo):** Tokens have printed fiducial markers (unique visual patterns). A camera (often from an FTIR/DI setup) sees the marker, identifies it (ID), and calculates its position and rotation on the surface.
- **Active Tangibles with "Inside-Out" Tracking:** The token itself contains a camera. It looks down at a special dotted pattern printed on or beneath the surface. By tracking its movement over this known pattern (like an optical mouse), it can compute its own position and orientation and transmit it wirelessly (e.g., via Bluetooth). This removes the need for an external overhead camera.

### C. Pen/Stylus Input

- **Basic:** Most capacitive screens can detect a conductive stylus that simulates a fingertip.
- **Advanced (Apple Pencil, Wacom):** Use a combination of capacitive coupling and a dedicated wireless protocol to transmit extra data: pressure, tilt, rotation, and a unique ID. This requires special hardware in the screen/tablet.
- **Camera-in-Pen (Anoto):** The pen contains a tiny camera that scans a nearly invisible dot pattern printed on paper. By tracking its movement over this unique pattern, it knows its exact position on the page, enabling digital ink on physical paper.

### D. Depth Cameras (for Spaces)

These sensors provide a depth map – a per-pixel distance measurement – turning a 2D image into 3D data.

#### 1. Geometry-Based (Stereo)

**Principle:** Use two viewpoints to triangulate distance.

**Methods:**

- **Stereo Matching (Two Cameras):** Like human eyes. Software finds the same point in both images and calculates depth from the disparity (shift). (e.g., Intel RealSense D400 series).
- **Structured Light:** Projects a known pattern (speckles or stripes like a Gray code) onto the scene. A single camera observes how the pattern deforms on objects. The deformation reveals depth. (e.g., Original Microsoft Kinect v1).

#### 2. Time-of-Flight (ToF)

**Principle:** Measures the time for a light pulse (usually IR) to travel to an object and back.

**Practical Implementation (Phase Measurement):** Instead of a single pulse, the IR light is modulated (rapidly turned on/off). The sensor measures the phase shift between the emitted and reflected light wave. This phase difference corresponds to distance. More robust than direct pulse timing. (e.g., Microsoft Kinect v2, modern phone LiDAR).

#### 3. Post-Processing & Use

- **Depth-Color Alignment:** Combining the depth map with a color image from a separate RGB camera requires calibration to know their relative position (extrinsic parameters) and lens properties (intrinsic parameters).
- **Point Clouds:** The fundamental 3D data structure. Each (x, y) pixel in the depth map, with its z (depth) value and corresponding (r, g, b) color, becomes a 3D point (x, y, z, r, g, b). A collection of these is a "point cloud," a digital 3D snapshot of the scene.

**Application in ISS:** Depth cameras turn any space into an interactive one. They can segment users from the background, skeleton tracking for full-body interaction, detect gestures, and ignore the display surface itself to focus on objects above it (as shown in the "filter" example).

### E. 6DoF Tracking (for High-Precision Spaces)

**Purpose:** To get the exact position and orientation of objects (controllers, HMDs, props) in a room with sub-millimeter accuracy.

**Outside-In Tracking (e.g., Vicon, OptiTrack):**

- **Setup:** Multiple high-speed, calibrated infrared cameras mounted around the room.
- **Method 1 (Passive):** Track reflective markers on the object. Cameras see bright dots, software triangulates their 3D position. Unique constellations of markers identify the object and its orientation.
- **Method 2 (Active):** Track powered LED markers (which can be uniquely pulsed for ID).

**Inside-Out Tracking (e.g., HTC Vive Lighthouse):**

- Inverse setup: The room has fixed "lighthouse" emitters that sweep the space with IR lasers. The tracked object has photosensors. By measuring the precise timing of when each sensor is hit by the laser sweeps, the object can calculate its own pose. This is technically inside-out because the computation is on the object.

**Fundamental Math:** All methods boil down to triangulation. With 2+ cameras seeing the same point(s), you can compute its 3D location. With 3+ non-collinear points on a rigid object, you can compute its full 6D pose.

---

## Synthesis & Key Takeaways

**Technology Dictates Interaction:** The choice of input tech defines what's possible.

- Capacitive enables fine multi-touch.
- Optical (FTIR/DI) enables objects and touch.
- Depth Cameras enable whole-body, surface-agnostic interaction.
- 6DoF Tracking enables precise, room-scale manipulation.

**The Surface/Space Duality:**

- Surfaces are about planar, high-resolution, direct manipulation (touch, tangibles).
- Spaces are about volumetric, embodied, indirect manipulation (depth cams, 6DoF tracking).

**The Trend is Fusion:** Modern systems combine multiple technologies. A tabletop might use DI for tangibles and a depth camera overhead for gestures. A VR system uses inside-out cameras for head tracking and 6DoF controllers.

**From Sensing to Understanding:** The raw data (touch points, depth maps, marker positions) is just the beginning. The real challenge is the software layer that interprets this data as gestures, intentions, and semantic interactions (e.g., "the user is placing the 'filter' token on the 'photo' token to apply an effect").

**Trade-offs are Everywhere:**

- **Accuracy vs. Cost:** A Vicon system is incredibly accurate but costs tens of thousands. A Kinect is "good enough" for many applications and costs a few hundred.
- **Simplicity vs. Richness:** Resistive touch is simple but limited. A multi-camera DI system is complex but can track dozens of objects.
- **Infrastructure vs. Mobility:** Outside-in tracking requires a fixed lab. Inside-out tracking (like on Quest) is mobile but can lose tracking.

In summary, ISS technologies are a toolbox for building experiences that bridge the digital and physical. The art lies in selecting and combining the right sensors and displays to support the desired human interaction—whether it's a collaborative tabletop, an immersive cave, or a responsive architectural space.

---