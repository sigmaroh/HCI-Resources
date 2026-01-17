# HCI Exam Preparation - Comprehensive Lecture Notes
**Course:** Smart Human-Computer Interaction (SHCI)  
**Exam Format:** 20-minute oral exam  
- 5 min presentation + 5 min discussion on exercise sheet
- 10 min questions on one randomly selected lecture topic

---

## Lecture 1: Big Issues in HCI

### Overview
This lecture covers fundamental challenges and major topics in Human-Computer Interaction.

### Key Concepts

#### 1. **What is HCI?**
- Study of interaction between humans and computers
- Interdisciplinary field: computer science, psychology, design, ergonomics
- Goal: Create usable, efficient, and enjoyable interactive systems

#### 2. **Core Principles**
- **Usability**: Effectiveness, efficiency, satisfaction
- **User-Centered Design (UCD)**: Design process focused on user needs
- **Iterative Design**: Design, prototype, test, refine cycle

#### 3. **Major Challenges in HCI**
- **Diversity of Users**: Age, abilities, culture, experience levels
- **Context of Use**: Where, when, and how systems are used
- **Technological Evolution**: Keeping pace with rapid tech changes
- **Privacy and Security**: Protecting user data and identity
- **Accessibility**: Designing for users with disabilities

#### 4. **Design Principles**
- **Visibility**: Make functions and options visible
- **Feedback**: Provide immediate and clear feedback
- **Consistency**: Similar operations should work similarly
- **Affordance**: Design should suggest how to use it
- **Error Prevention**: Design to minimize errors
- **Recognition over Recall**: Make objects and actions visible

#### 5. **Evaluation Methods**
- **Usability Testing**: Observing users performing tasks
- **Heuristic Evaluation**: Expert review against usability principles
- **User Surveys and Questionnaires**
- **A/B Testing**: Comparing two design alternatives
- **Analytics and Logging**: Tracking user behavior

#### 6. **Interaction Paradigms**
- **WIMP** (Windows, Icons, Menus, Pointer)
- **Touch and Multi-touch**
- **Gesture-based Interaction**
- **Voice and Conversational UI**
- **Brain-Computer Interfaces**

### Important Terms
- **Fitts' Law**: Time to acquire target = f(distance, size)
- **Hick's Law**: Decision time increases with number of choices
- **Gulf of Execution**: Difference between user's goal and system's actions
- **Gulf of Evaluation**: Difference between system state and user's understanding

### Exam Tips
- Be able to explain UCD process and why it's important
- Know the difference between usability and user experience
- Understand trade-offs in design decisions

---

## Lecture 2: Networks and Location

### Overview
Covers location-based services, positioning technologies, and network-aware applications.

### Key Concepts

#### 1. **Location-Based Services (LBS)**
- **Definition**: Services that use geographic location of device
- **Applications**: Navigation, social networking, advertising, emergency services
- **Context-aware computing**: Adapting to user's location and context

#### 2. **Positioning Technologies**

##### **GPS (Global Positioning System)**
- Satellite-based navigation
- **Advantages**: Global coverage, outdoor accuracy
- **Disadvantages**: Poor indoor performance, battery consumption
- **Accuracy**: 5-10 meters typical

##### **Cell-based Positioning**
- Uses cellular network towers
- **Cell ID**: Basic location from tower
- **Triangulation**: Multiple towers for better accuracy
- **Accuracy**: 100m-several km

##### **Wi-Fi Positioning**
- Uses Wi-Fi access points
- **Fingerprinting**: Map of signal strengths
- **Trilateration**: Distance from multiple APs
- **Accuracy**: 5-15 meters indoors

##### **Bluetooth/BLE Beacons**
- Short-range positioning
- **iBeacon, Eddystone** protocols
- **Use cases**: Indoor navigation, proximity marketing
- **Accuracy**: 1-5 meters

##### **Inertial Sensors**
- **Accelerometer**: Measures acceleration
- **Gyroscope**: Measures rotation
- **Magnetometer**: Measures magnetic field
- **Dead Reckoning**: Track movement from known position

#### 3. **Indoor Positioning Systems (IPS)**
- **Challenges**: No GPS signal, multipath effects
- **Technologies**: Wi-Fi, BLE, UWB, vision-based
- **Applications**: Museums, airports, shopping malls

#### 4. **Privacy and Location**
- **Location Privacy Concerns**: Tracking, surveillance
- **Privacy Protection**: Anonymization, opt-in/opt-out
- **Regulations**: GDPR requirements for location data

#### 5. **Network Characteristics**
- **Bandwidth**: Data transfer rate
- **Latency**: Delay in communication
- **Connectivity**: Continuous vs. intermittent
- **Mobile vs. Fixed networks**

#### 6. **Location Visualization**
- **Maps**: 2D, 3D representations
- **Augmented Reality overlays**
- **Location-based notifications**

### Important Technologies
- **GNSS**: Global Navigation Satellite Systems (GPS, GLONASS, Galileo)
- **RSSI**: Received Signal Strength Indicator
- **ToF**: Time of Flight measurement
- **AoA**: Angle of Arrival
- **UWB**: Ultra-Wideband for precise ranging

### Exam Tips
- Compare different positioning technologies (accuracy, cost, use cases)
- Understand indoor vs. outdoor positioning challenges
- Know privacy implications of location tracking

---

## Lecture 3: I/O on Small Screens

### Overview
Input and output methods for mobile and wearable devices with limited screen space.

### Key Concepts

#### 1. **Challenges of Small Screens**
- **Limited Screen Real Estate**: Less information visible
- **Fat Finger Problem**: Touch targets too small
- **Readability**: Text size and density
- **Context Switching**: Harder to multitask
- **One-handed Operation**: Reachability issues

#### 2. **Touch Input Methods**

##### **Basic Touch Gestures**
- **Tap**: Select/activate
- **Double-tap**: Zoom or select
- **Long press**: Context menu
- **Swipe**: Scroll or navigate
- **Pinch**: Zoom in/out
- **Rotate**: Rotate objects

##### **Advanced Gestures**
- **Edge swipes**: Navigation or menus
- **Multi-finger gestures**: 3-4 finger operations
- **Force touch/3D Touch**: Pressure-sensitive input
- **Haptic feedback**: Tactile response

#### 3. **Text Input on Mobile**

##### **Virtual Keyboards**
- **QWERTY**: Standard layout
- **T9/Predictive**: Word prediction
- **Swype/Gesture typing**: Continuous input
- **Autocorrect**: Error correction

##### **Alternative Input Methods**
- **Voice Input**: Speech-to-text
- **Handwriting Recognition**
- **Eye Tracking**
- **External keyboards**

##### **Design Considerations**
- **Key Size**: Minimum 9mm for touch targets
- **Spacing**: Adequate separation between targets
- **Feedback**: Visual, auditory, haptic

#### 4. **Output/Display Techniques**

##### **Information Presentation**
- **Progressive Disclosure**: Show details on demand
- **Zoomable Interfaces**: Fisheye, semantic zoom
- **Overview+Detail**: Minimap with focus area
- **Scrolling**: Vertical, horizontal, or both

##### **Screen Optimization**
- **Responsive Design**: Adapt to screen size
- **Mobile-First Design**: Start with mobile constraints
- **Content Prioritization**: Most important content first
- **Simplified Navigation**: Hamburger menus, tabs

#### 5. **Wearable Displays**
- **Smartwatches**: Very small screens (1-2 inches)
- **Smart Glasses**: AR overlays
- **Design principles**: Glanceable, minimal interaction

#### 6. **One-Handed Interaction**
- **Thumb Zone**: Reachable area with thumb
- **Safe Zone**: Easy to reach
- **Stretch Zone**: Requires hand adjustment
- **No-Go Zone**: Unreachable without repositioning

#### 7. **Adaptive Interfaces**
- **Context Awareness**: Adapt to usage situation
- **Personalization**: User preferences
- **Dynamic Layout**: Change based on content

### Design Guidelines
- **Touch Target Size**: Minimum 44x44 pixels (iOS), 48x48dp (Android)
- **Font Size**: Minimum 16px for body text
- **Contrast Ratio**: 4.5:1 for normal text
- **Loading Time**: < 3 seconds for mobile

### Exam Tips
- Know the fat finger problem and solutions
- Understand touch gesture vocabulary
- Be familiar with text input challenges on mobile
- Know thumb zone concept for one-handed use

---

## Lecture 4: Ubiquitous Computing and IoT

### Overview
Computing embedded in environment, Internet of Things, and smart environments.

### Key Concepts

#### 1. **Ubiquitous Computing (Ubicomp)**
- **Definition**: Computing everywhere, invisible integration
- **Mark Weiser's Vision**: Calm technology, disappearing into background
- **Paradigm Shift**: From desktop to embedded computing

##### **Characteristics**
- **Context Awareness**: Responds to environment
- **Invisibility**: Technology fades into background
- **Distributed**: Many devices working together
- **Always Available**: Continuous access

#### 2. **Internet of Things (IoT)**
- **Definition**: Network of physical objects with sensors and connectivity
- **Scale**: Billions of connected devices
- **Data Generation**: Massive amounts of sensor data

##### **IoT Architecture Layers**
1. **Perception Layer**: Sensors, actuators
2. **Network Layer**: Communication protocols
3. **Middleware Layer**: Data processing, storage
4. **Application Layer**: User-facing services

#### 3. **Sensors and Actuators**

##### **Common Sensors**
- **Environmental**: Temperature, humidity, pressure
- **Motion**: Accelerometer, gyroscope, magnetometer
- **Proximity**: IR, ultrasonic, capacitive
- **Light**: Ambient light, color sensors
- **Biometric**: Heart rate, fingerprint, facial recognition
- **Location**: GPS, Wi-Fi, BLE

##### **Actuators**
- **Motors**: Movement and positioning
- **Lights**: Visual feedback and ambient
- **Speakers**: Audio output
- **Displays**: Visual information
- **Haptic**: Vibration feedback

#### 4. **Communication Protocols**

##### **Short Range**
- **Bluetooth/BLE**: Low power, 10-100m
- **Zigbee**: Mesh networking, low power
- **NFC**: Very short range (<10cm)
- **RFID**: Identification and tracking

##### **Long Range**
- **Wi-Fi**: High bandwidth, medium range
- **Cellular**: 4G/5G, wide coverage
- **LoRaWAN**: Long range, low power
- **Sigfox**: Ultra-low power, small data

#### 5. **Smart Environments**

##### **Smart Home**
- **Lighting**: Automated, mood-based
- **HVAC**: Temperature control
- **Security**: Cameras, locks, sensors
- **Entertainment**: Connected audio/video
- **Appliances**: Smart refrigerators, ovens

##### **Smart City**
- **Traffic Management**: Adaptive signals, monitoring
- **Parking**: Occupancy sensing
- **Waste Management**: Fill-level monitoring
- **Street Lighting**: Adaptive brightness
- **Environmental Monitoring**: Air quality, noise

##### **Smart Office**
- **Occupancy Sensing**: Space utilization
- **Climate Control**: Zone-based
- **Access Control**: Smart locks
- **Resource Management**: Meeting rooms

#### 6. **Design Challenges**

##### **Technical Challenges**
- **Interoperability**: Different devices, protocols
- **Scalability**: Managing many devices
- **Power Management**: Battery life
- **Reliability**: Continuous operation
- **Latency**: Real-time requirements

##### **Human Factors**
- **Privacy**: Data collection concerns
- **Security**: Vulnerable to attacks
- **Usability**: Complex systems
- **Trust**: Autonomous decision-making
- **Transparency**: Understanding system behavior

#### 7. **Interaction Paradigms**
- **Implicit Interaction**: Automatic, no explicit input
- **Ambient Displays**: Peripheral information
- **Tangible Interfaces**: Physical manipulation
- **Voice Control**: Natural language
- **Gesture Recognition**: Body movement

#### 8. **Edge Computing vs. Cloud**
- **Edge**: Processing at device/local gateway
  - Lower latency
  - Privacy benefits
  - Works offline
- **Cloud**: Centralized processing
  - More computational power
  - Centralized management
  - Requires connectivity

### Important Concepts
- **M2M**: Machine-to-Machine communication
- **Fog Computing**: Processing between edge and cloud
- **Digital Twin**: Virtual representation of physical object
- **Ambient Intelligence**: Smart, responsive environments

### Exam Tips
- Understand difference between ubicomp and traditional computing
- Know IoT architecture layers
- Compare different wireless protocols for IoT
- Understand privacy and security concerns

---

## Lecture 5: Mixed Reality

### Overview
Augmented Reality (AR), Virtual Reality (VR), and Mixed Reality (MR) technologies and applications.

### Key Concepts

#### 1. **Reality-Virtuality Continuum**
- **Real Environment**: Physical world only
- **Augmented Reality (AR)**: Virtual overlays on real world
- **Augmented Virtuality (AV)**: Real elements in virtual world
- **Virtual Reality (VR)**: Fully immersive virtual environment
- **Mixed Reality (MR)**: Blending of real and virtual

#### 2. **Virtual Reality (VR)**

##### **Characteristics**
- **Immersion**: User surrounded by virtual environment
- **Presence**: Feeling of "being there"
- **Interaction**: Natural manipulation of virtual objects

##### **VR Hardware**
- **Head-Mounted Displays (HMD)**: Oculus, HTC Vive, PlayStation VR
- **Display Technology**: LCD, OLED
- **Field of View (FOV)**: Typically 90-120 degrees
- **Tracking**: 6DOF (six degrees of freedom)
- **Controllers**: Hand tracking, haptic feedback
- **Treadmills**: Locomotion in virtual space

##### **VR Challenges**
- **Motion Sickness**: Latency, vestibular conflict
- **Resolution**: Screen door effect
- **Ergonomics**: Weight, comfort
- **Social Isolation**: Disconnected from real world
- **Cost**: High-end equipment expensive

#### 3. **Augmented Reality (AR)**

##### **Characteristics**
- **Overlay**: Virtual content on real world
- **Registration**: Alignment of virtual and real
- **Real-time Interaction**: Responsive to environment
- **3D Integration**: Virtual objects in 3D space

##### **AR Display Types**
- **Handheld**: Smartphone, tablet (camera-based)
- **Head-Mounted**: Microsoft HoloLens, Magic Leap
- **Projection**: SAR (Spatial Augmented Reality)
- **Contact Lenses**: Future technology

##### **AR Tracking Methods**
- **Marker-based**: QR codes, fiducial markers
- **Markerless**: SLAM, feature detection
- **Location-based**: GPS, compass
- **Model-based**: 3D model matching

#### 4. **Mixed Reality (MR)**
- **Definition**: Real and virtual objects coexist and interact
- **Spatial Mapping**: Understanding 3D environment
- **Occlusion**: Virtual objects behind real objects
- **Physics**: Virtual objects respond to real world

#### 5. **Technologies**

##### **Display Technologies**
- **Optical See-Through**: HoloLens (waveguides)
- **Video See-Through**: Camera view with overlay
- **Retinal Projection**: Directly to eye
- **Light Field**: Multiple depths

##### **Tracking and Sensing**
- **Inside-Out Tracking**: Cameras on HMD
- **Outside-In Tracking**: External sensors
- **SLAM**: Simultaneous Localization and Mapping
- **Depth Sensing**: Time-of-Flight, stereo cameras
- **IMU**: Accelerometer, gyroscope, magnetometer

##### **Rendering**
- **Stereoscopic 3D**: Separate images for each eye
- **Frame Rate**: Minimum 60 fps, preferably 90+
- **Latency**: < 20ms for comfort
- **Spatial Audio**: 3D sound positioning

#### 6. **Interaction Techniques**

##### **Input Methods**
- **Gaze**: Eye tracking, dwell time
- **Gesture**: Hand tracking, body movement
- **Voice**: Speech commands
- **Controllers**: 6DOF tracked controllers
- **Tangible**: Physical props

##### **Locomotion in VR**
- **Teleportation**: Jump to locations
- **Walking**: Room-scale, redirected walking
- **Flying/Gliding**: Natural movement
- **Vehicle-based**: Reduces motion sickness

#### 7. **Applications**

##### **Entertainment**
- **Gaming**: Immersive experiences
- **Cinema**: 360-degree video
- **Social VR**: Virtual meetups

##### **Training and Education**
- **Medical Training**: Surgery simulation
- **Industrial Training**: Safety, procedures
- **Education**: Virtual field trips, 3D models

##### **Design and Visualization**
- **Architecture**: Walkthrough designs
- **Product Design**: Prototyping
- **Data Visualization**: 3D data exploration

##### **Healthcare**
- **Therapy**: PTSD, phobias
- **Rehabilitation**: Physical therapy
- **Pain Management**: Distraction therapy

##### **Industrial**
- **Maintenance**: AR instructions
- **Assembly**: Guided procedures
- **Remote Assistance**: Expert guidance

#### 8. **Design Considerations**

##### **User Comfort**
- **Minimize Motion Sickness**: Stable reference, reduce lag
- **Ergonomics**: Weight distribution, ventilation
- **Accessibility**: Adjustable IPD (interpupillary distance)

##### **Usability**
- **Intuitive Interaction**: Natural gestures
- **Clear Feedback**: Visual, audio, haptic
- **Error Recovery**: Easy to undo

##### **Content Design**
- **Scale**: Appropriate object size
- **Placement**: Comfortable viewing angles
- **Persistence**: Anchored vs. following
- **Information Density**: Avoid clutter

### Important Terms
- **6DOF**: Six Degrees of Freedom (3 rotation, 3 translation)
- **IPD**: Interpupillary Distance
- **FOV**: Field of View
- **Latency**: Motion-to-photon delay
- **Cybersickness**: VR-induced motion sickness

### Exam Tips
- Understand reality-virtuality continuum
- Know differences between AR, VR, MR
- Understand tracking technologies
- Be familiar with motion sickness causes and solutions
- Know application domains

---

## Lecture 6: Case Studies

### Overview
Real-world examples of HCI systems, successful and failed projects, lessons learned.

### Key Themes

#### 1. **Case Study Analysis Framework**
When analyzing HCI case studies, consider:
- **Context**: Who, what, where, when, why
- **User Needs**: What problem does it solve?
- **Design Process**: How was it developed?
- **Technology**: What tools/methods used?
- **Challenges**: What went wrong?
- **Outcomes**: Success metrics, lessons learned
- **Impact**: How did it change behavior/practices?

#### 2. **Typical Case Study Categories**

##### **Mobile and Wearable**
- **Fitness Trackers**: Fitbit, Apple Watch
  - Motivation through gamification
  - Privacy concerns with health data
  - Accuracy of sensors

- **Mobile Payment**: Apple Pay, Google Pay
  - Security and convenience balance
  - Adoption challenges
  - User trust

##### **Smart Home Systems**
- **Voice Assistants**: Amazon Alexa, Google Home
  - Natural language understanding
  - Privacy in always-listening devices
  - Multi-user scenarios

- **Nest Thermostat**
  - Learning user preferences
  - Energy savings vs. comfort
  - Manual override options

##### **Accessibility Technologies**
- **Screen Readers**: JAWS, VoiceOver
  - Making web accessible
  - Navigation challenges
  - Rich media accessibility

- **Assistive Input Devices**
  - Eye-tracking systems
  - Switch controls
  - Voice control

##### **Collaborative Systems**
- **Video Conferencing**: Zoom, Teams
  - Remote work enablement
  - Fatigue and engagement
  - Privacy and security

- **Shared Whiteboards**: Miro, Mural
  - Async vs. sync collaboration
  - Learning curve
  - Integration with workflows

##### **Public Interactive Systems**
- **Museum Installations**
  - Engagement vs. education
  - Multi-user interaction
  - Robustness for public use

- **Interactive Kiosks**
  - Accessibility for all users
  - Short interaction time
  - Vandalism resistance

#### 3. **Success Factors**
- **User-Centered Design**: Involving users throughout
- **Iterative Testing**: Multiple rounds of refinement
- **Clear Value Proposition**: Solving real problems
- **Appropriate Technology**: Right tool for the job
- **Accessibility**: Inclusive design
- **Privacy and Security**: User trust
- **Performance**: Speed and reliability

#### 4. **Common Failure Reasons**
- **Poor Usability**: Confusing, difficult to use
- **No Real Need**: Solution looking for problem
- **Technology-Driven**: Cool tech, poor UX
- **Ignoring Context**: Not fit for actual use
- **Privacy Concerns**: Users don't trust system
- **Poor Performance**: Slow, unreliable
- **Lack of User Involvement**: Designers' assumptions wrong

#### 5. **Lessons Learned (General)**
- **Know Your Users**: Research, don't assume
- **Test Early and Often**: Prototypes, not just final product
- **Context Matters**: Lab ≠ real world
- **Iterate**: First design is rarely best
- **Measure Success**: Define metrics upfront
- **Consider Ethics**: Privacy, fairness, accessibility
- **Think Long-term**: Maintenance, scalability

### Exam Tips
- Be ready to analyze a case study systematically
- Identify what made a project successful or unsuccessful
- Connect case studies to theoretical concepts
- Think critically about design decisions and alternatives

---

## Lecture 7: Interactive Surface Systems - Introduction

### Overview
Introduction to interactive surfaces, multi-touch tables, walls, and collaborative environments.

### Key Concepts

#### 1. **What are Interactive Surfaces?**
- **Definition**: Displays that respond to touch and gestures
- **Types**: Tabletops, walls, floors, curved surfaces
- **Scale**: From small tablets to room-sized walls
- **Users**: Single-user to large groups

#### 2. **Evolution of Interactive Surfaces**

##### **Historical Development**
- **Early Touch Screens**: Resistive, single-touch
- **Multi-touch Revolution**: Capacitive sensing
- **Tabletop Displays**: Microsoft Surface, SMART Table
- **Large Walls**: Collaborative visualization
- **Flexible/Curved**: Bent, foldable displays

#### 3. **Touch Technologies**

##### **Resistive Touch**
- **Mechanism**: Pressure-sensitive layers
- **Advantages**: Works with any stylus, cheap
- **Disadvantages**: No multi-touch, less durable
- **Use cases**: Industrial, medical (gloves)

##### **Capacitive Touch**
- **Mechanism**: Electrical charge detection
- **Types**: Surface capacitive, projected capacitive (PCAP)
- **Advantages**: Multi-touch, durable, accurate
- **Disadvantages**: Conductive stylus needed
- **Use cases**: Smartphones, tablets

##### **Optical/Vision-Based**
- **Mechanism**: Cameras detect touch points
- **Types**: DI (Diffused Illumination), FTIR (Frustrated Total Internal Reflection)
- **Advantages**: Large surfaces, scalable
- **Disadvantages**: Complexity, calibration
- **Use cases**: Large interactive walls

##### **Other Technologies**
- **Acoustic**: Surface acoustic waves
- **Infrared**: IR grid detection
- **Force Sensing**: Pressure measurement

#### 4. **Interactive Tabletops**

##### **Characteristics**
- **Horizontal Surface**: Natural for collaboration
- **Face-to-Face**: Users around table
- **Shared Space**: Common work area
- **Physical Objects**: Can integrate tangibles

##### **Interaction Challenges**
- **Orientation**: No single "up" direction
- **Reach**: Limited by arm length
- **Occlusion**: Bodies/arms block view
- **Territoriality**: Personal vs. shared space

##### **Application Domains**
- **Planning**: Urban planning, architecture
- **Education**: Collaborative learning
- **Gaming**: Multi-player games
- **Museums**: Interactive exhibits
- **Business**: Design reviews, brainstorming

#### 5. **Interactive Walls**

##### **Characteristics**
- **Vertical Display**: Large viewing area
- **Public/Semi-public**: Visible to many
- **Scale**: Room-sized possible
- **Distance Interaction**: Near and far

##### **Interaction Techniques**
- **Direct Touch**: Close interaction
- **Gestures at Distance**: Kinect, Leap Motion
- **Handheld Devices**: Smartphone as controller
- **Multi-user**: Simultaneous interaction

##### **Applications**
- **Visualization**: Large datasets, maps
- **Presentations**: Interactive talks
- **Public Information**: Wayfinding, announcements
- **Collaboration**: Team work spaces

#### 6. **Multi-User Interaction**

##### **Collaboration Styles**
- **Tightly Coupled**: Working on same task together
- **Loosely Coupled**: Working on related but separate tasks
- **Turn-taking**: Sequential access
- **Parallel**: Simultaneous independent work

##### **Design Considerations**
- **Awareness**: Who's doing what
- **Coordination**: Preventing conflicts
- **Communication**: Supporting dialogue
- **Equity**: Fair access for all users
- **Transitions**: Between individual and group work

#### 7. **Interaction Paradigms**

##### **Gestures**
- **Single Touch**: Tap, drag, long press
- **Multi-touch**: Pinch, rotate, multi-finger
- **Bi-manual**: Two-handed interaction
- **Collaborative Gestures**: Multi-user actions

##### **Tangible Interaction**
- **Physical Tokens**: Objects on surface
- **Fiducial Markers**: Tracked patterns
- **Hybrid**: Digital and physical combined

##### **Spatial Arrangement**
- **Personal Territory**: User's area
- **Group Territory**: Shared space
- **Storage Territory**: Temporary parking

#### 8. **Design Challenges**

##### **Technical**
- **Resolution**: Pixels per inch
- **Refresh Rate**: Smooth interaction
- **Tracking Accuracy**: Precise touch detection
- **Scalability**: Supporting many users
- **Robustness**: 24/7 operation

##### **Usability**
- **Discoverability**: How to learn system
- **Fatigue**: Gorilla arm effect (walls)
- **Hygiene**: Shared touch surfaces
- **Accessibility**: Height, reach, abilities

##### **Social**
- **Turn-taking**: Managing access
- **Conflict Resolution**: Concurrent actions
- **Social Acceptability**: Public interaction
- **Privacy**: Personal data on shared display

### Important Terms
- **FTIR**: Frustrated Total Internal Reflection
- **Fiducial**: Trackable marker pattern
- **Gorilla Arm**: Fatigue from vertical touch
- **Territoriality**: Spatial zones around users
- **Bi-manual**: Two-handed interaction

### Exam Tips
- Understand different touch technologies and trade-offs
- Know challenges of horizontal vs. vertical surfaces
- Understand multi-user collaboration issues
- Be familiar with application domains

---

## Lecture 8: Interactive Surface Systems - Technology

### Overview
Deep dive into technical aspects of interactive surfaces: sensing, tracking, and implementation.

### Key Concepts

#### 1. **Sensing Technologies (Detailed)**

##### **Optical Tracking Systems**

**Diffused Illumination (DI)**
- **Principle**: IR LEDs illuminate from below, camera captures touches
- **Pros**: Simple, cheap, good for large surfaces
- **Cons**: Ambient light interference, ghost touches
- **Best for**: Large interactive walls

**Frustrated Total Internal Reflection (FTIR)**
- **Principle**: Touch frustrates total internal reflection in acrylic
- **Pros**: High contrast, multi-touch, no ambient light issues
- **Cons**: Requires special surface, edge lighting
- **Best for**: High-quality tabletops

**Diffused Surface Illumination (DSI)**
- **Principle**: Diffuser layer, IR illumination, camera below
- **Pros**: Works through various materials
- **Cons**: Lower contrast than FTIR
- **Best for**: Tables with textured surfaces

**Laser Light Plane (LLP)**
- **Principle**: Laser plane above surface, camera detects shadows
- **Pros**: Works with any surface
- **Cons**: Calibration complex, costly
- **Best for**: Retrofit solutions

##### **Capacitive Systems**

**Self-Capacitance**
- **Mechanism**: Measures capacitance of each electrode
- **Pros**: High sensitivity
- **Cons**: Ghost touches with multiple fingers
- **Use**: Single touch or simple multi-touch

**Mutual Capacitance (PCAP)**
- **Mechanism**: Measures capacitance between row/column electrodes
- **Pros**: True multi-touch, accurate
- **Cons**: More complex, expensive
- **Use**: Smartphones, tablets, professional displays

**Surface Capacitance**
- **Mechanism**: Uniform conductive layer
- **Pros**: Simple, robust
- **Cons**: Single touch only
- **Use**: Industrial kiosks

#### 2. **Computer Vision for Touch Detection**

##### **Image Processing Pipeline**
1. **Capture**: Get frame from camera
2. **Preprocessing**: Noise reduction, normalization
3. **Background Subtraction**: Remove static elements
4. **Thresholding**: Separate touches from background
5. **Blob Detection**: Find touch regions
6. **Tracking**: Associate blobs across frames
7. **Classification**: Identify touch type/user

##### **Blob Detection Algorithms**
- **Connected Components**: Group adjacent pixels
- **Contour Detection**: Find boundaries
- **Circular Hough Transform**: Detect round blobs
- **Template Matching**: Match patterns

##### **Tracking Algorithms**
- **Nearest Neighbor**: Simple distance matching
- **Kalman Filter**: Predict and update positions
- **Hungarian Algorithm**: Optimal assignment
- **Particle Filter**: Handle occlusions

#### 3. **Fiducial Marker Tracking**

##### **Marker Types**
- **ARToolKit**: Square markers with patterns
- **ReacTIVision**: Topological markers (amoeba patterns)
- **ARTag**: Robust to occlusion
- **AprilTag**: Modern, efficient

##### **Marker Information**
- **ID**: Unique identifier
- **Position**: X, Y coordinates
- **Orientation**: Rotation angle
- **State**: Present/absent

##### **Applications**
- **Tangible Interfaces**: Physical-digital mapping
- **Multi-object Tracking**: Many simultaneous objects
- **User Identification**: Personalization
- **Mode Switching**: Change interface function

#### 4. **Multi-Touch Gesture Recognition**

##### **Low-Level Features**
- **Touch Points**: Number, positions
- **Trajectories**: Movement paths
- **Velocity**: Speed and direction
- **Acceleration**: Changes in speed

##### **Gesture Types**
- **Static**: Number/arrangement of touches
- **Dynamic**: Motion patterns
- **Composite**: Combination of both

##### **Recognition Approaches**
- **Rule-Based**: If-then logic
- **Template Matching**: Compare to stored patterns
- **Machine Learning**: Train classifier
- **Probabilistic**: Hidden Markov Models

##### **Common Gestures**
- **Tap**: Quick touch and release
- **Double-tap**: Two quick taps
- **Long press**: Hold for threshold time
- **Drag**: Touch, move, release
- **Flick**: Quick drag and release
- **Pinch**: Two fingers move together/apart
- **Rotate**: Two fingers rotate around center
- **Spread**: Multiple fingers move outward

#### 5. **Display Technologies**

##### **LCD (Liquid Crystal Display)**
- **Types**: TN, IPS, VA panels
- **Pros**: Mature technology, affordable
- **Cons**: Viewing angles (except IPS), backlight bleed
- **Use**: Most common for touch displays

##### **OLED (Organic LED)**
- **Mechanism**: Self-emissive pixels
- **Pros**: Perfect blacks, thin, flexible
- **Cons**: Burn-in, expensive
- **Use**: High-end displays, flexible screens

##### **Projection-Based**
- **Front Projection**: Project from front
- **Rear Projection**: Project from behind
- **Pros**: Large scale, upgradeable
- **Cons**: Shadows, alignment
- **Use**: Large interactive walls

##### **LED Displays**
- **Mechanism**: Direct LED matrix
- **Pros**: Bright, outdoor use
- **Cons**: Large pixel pitch (low resolution at small scale)
- **Use**: Large public displays

#### 6. **Calibration**

##### **Camera Calibration**
- **Purpose**: Correct lens distortion, determine intrinsic parameters
- **Method**: Chessboard pattern, OpenCV calibration
- **Output**: Camera matrix, distortion coefficients

##### **Touch Calibration**
- **Purpose**: Map camera space to display space
- **Method**: Touch known screen points, compute homography
- **Refinement**: Multi-point calibration for accuracy

##### **Color Calibration**
- **Purpose**: Accurate color reproduction
- **Method**: Colorimeter, lookup tables (LUT)
- **Importance**: Design, professional use

#### 7. **Hardware Architecture**

##### **Components**
- **Display**: LCD, LED, projector
- **Touch Sensing**: Capacitive overlay, cameras
- **Computing**: PC, embedded system
- **Connectivity**: USB, HDMI, network

##### **Typical Tabletop Setup**
- **Acrylic Surface**: Touch surface
- **IR Illumination**: LEDs around edges or below
- **IR Camera**: Captures touches
- **Projector/Display**: Shows content
- **Mirror**: Fold optical path (compact design)
- **PC**: Runs application and vision processing

##### **Typical Wall Setup**
- **Large Display**: Tiled or single panel
- **Touch Overlay**: Capacitive or optical
- **Mounting System**: Wall-mount or floor-stand
- **PC/Server**: Backend processing

#### 8. **Software Architecture**

##### **Layers**
1. **Hardware Interface**: Camera/sensor drivers
2. **Touch Detection**: Computer vision, signal processing
3. **Gesture Recognition**: Interpret touch patterns
4. **Application**: User interface and logic
5. **Rendering**: Graphics display

##### **Common Frameworks**
- **TUIO**: Protocol for tangible/multi-touch
- **OpenCV**: Computer vision library
- **ReacTIVision**: Fiducial tracking
- **MT4j, libTISCH**: Multi-touch frameworks

##### **Performance Considerations**
- **Latency**: End-to-end delay < 50ms
- **Frame Rate**: Camera 60+ fps, display 60+ Hz
- **CPU Load**: Optimize vision processing
- **GPU Utilization**: Hardware-accelerated rendering

#### 9. **Advanced Topics**

##### **Depth Sensing**
- **Kinect**: Structured light (v1), Time-of-Flight (v2)
- **RealSense**: Stereo and ToF
- **LiDAR**: Laser scanning
- **Applications**: Gesture at distance, 3D scanning

##### **Force/Pressure Sensing**
- **Strain Gauges**: Measure deformation
- **Force-Sensitive Resistors (FSR)**: Variable resistance
- **Capacitive Pressure**: Capacitance change
- **Applications**: Drawing pressure, 3D Touch

##### **Hover Detection**
- **Capacitive Proximity**: Detect before touch
- **Optical**: Camera sees approaching hand
- **Applications**: Preview, tooltips

##### **Shape/Hand Identification**
- **Contour Analysis**: Hand shape recognition
- **Skeleton Extraction**: Finger positions
- **User ID**: Identify different users
- **Applications**: User-specific interfaces, handedness

##### **Hybrid Surfaces**
- **Combining Technologies**: Optical + capacitive
- **Benefits**: Best of both worlds
- **Challenges**: Integration complexity

### Implementation Tips
- **Choose Right Technology**: Based on requirements (size, users, budget)
- **Optimize Vision Pipeline**: Use GPU, reduce resolution if needed
- **Handle Edge Cases**: Ghost touches, occlusions, ambient light
- **Calibrate Regularly**: Ensure accuracy over time
- **Test with Real Users**: Lab testing ≠ real-world use

