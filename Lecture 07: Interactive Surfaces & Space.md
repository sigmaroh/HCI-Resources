# Lecture 07: Interactive Surfaces & Spaces (ISS)

## Part 1: Definition & Core Concepts

Interactive Surfaces & Spaces (ISS) is a research field at the intersection of HCI, graphics, and sensing, focused on creating and studying computer interfaces that extend beyond the personal screen into the physical environment.

### A. Interactive Surfaces

**Definition:** Typically 2D planar surfaces capable of sensing input and displaying output. They can range from tabletops to walls.

**Input Types & Degrees of Freedom (DOF):**

- **Multi-Touch:** 2D position (+ optional rotation & hover). The standard for modern smartphones/tablets.
- **Pen/Stylus:** 2D position + rich attributes like pressure, tilt angle, rotation, and a unique ID. Enables precision and expressive input.
- **Tokens/Tangibles:** Physical objects placed on the surface. They provide 2D position + rotation + a unique ID. The system recognizes the object and its orientation.
- **Blobs:** Unidentified touch regions, providing basic 2D position, rotation, and shape outline.
- **"Fishtank" 3D:** An extension where the surface acts as a window into a 3D scene, offering a limited sense of depth (hence "0.5" extra dimension).

### B. Interactive Spaces

**Definition:** Volumetric, 3D environments where interaction is not confined to a plane. The user's body and objects are tracked in six degrees of freedom (6DOF) within a room-scale volume.

**Input Types:**

- **Tracked Objects/Controllers:** Provide full 6D Pose (X, Y, Z position + Pitch, Yaw, Roll orientation), often with buttons.
- **Hand Pose:** Advanced tracking of all finger joints (up to 26 DOF per hand), enabling natural gestures.
- **Full Body Pose:** Tracking of the entire skeletal structure for whole-body interaction.

**Philosophical Question:** Is a smartphone an interactive surface? Yes, but it's a personal, mobile surface. ISS typically focuses on larger, shared, or situated surfaces and spaces. Is an MR headset an interactive space? Yes, it creates a personal, portable interactive space around the user.

---

## Part 2: Big Issues in ISS

While sharing challenges with mobile (e.g., gesture discoverability), ISS introduces unique, often larger-scale problems.

### 1. Infrastructure & Scale

**Problem:** Deploying a wall-sized display, a multi-camera tracking system, or a room-scale projection setup is complex, expensive, and immobile. It's not a consumer product; it's a research instrument or specialized installation.

**Implication:** Limits widespread adoption and testing "in the wild." Research is often conducted in lab settings.

### 2. Fatigue & Reachability ("Gorilla Arm")

**The Classic Problem:** Interacting with vertical surfaces (like in Minority Report) for extended periods is physically exhausting. Arms get tired, precision drops.

**Related Issue:** On very large displays (SPLOM Wall), users cannot reach all areas without moving. This requires design strategies for navigation, viewpoint control, and collaborative interaction.

### 3. Interaction Design for Shared & Public Use

**Problem:** How do you design for:

- **Collaboration:** Multiple simultaneous users without interference.
- **Audiences:** "Walk-up-and-use" interfaces for the public that are immediately understandable.
- **Privacy & Social Context:** Interacting in a public space (like the Interactive Ad example) raises questions about social comfort and engagement.

### 4. Combining Physical & Digital ("Tangibility")

**Core ISS Strength/Tension:** A key differentiator from pure screen-based interaction is the use of physical objects (tokens) as part of the interface (e.g., Reactable).

**Challenge:** Designing a coherent system where the physical affordances of objects map intuitively to digital functions, and where the digital system robustly tracks and responds to them.

---

## Part 3: Research Context & Related Fields

ISS sits within a broader ecosystem of HCI research conferences and communities.

**Flagship Venue:** The ACM ISS conference (Interactive Surfaces and Spaces).

**Key Characteristics of ISS Research:**

- **Prototype-Driven:** Often involves building novel hardware or sensing setups.
- **Exploratory:** Focuses on new interaction techniques, often before they are commercially viable.
- **Application-Centric in Niche Domains:** Visualization, design, music, education, public exhibits.

### Closely Related Fields:

**Tangible Interaction (ACM TEI):**

- **Focus:** Deeply on the physicality of interaction. How do we give digital information physical form to manipulate? The Reactable (music) and SandScape (landscape simulation) are quintessential TEI/ISS projects.
- **Overlap:** ISS often provides the surface or space in which tangible interaction occurs.

**Mixed Reality (IEEE VR, ACM VRST):**

- **Focus:** Blending real and virtual worlds. MR HMDs (like HoloLens) create personal interactive spaces.
- **Overlap:** Virtual Valcamonica is an MR project that uses large tracked spaces and displays. ISS provides the environmental tracking and display technologies that enable collaborative MR experiences.

**Human-Computer Interaction (ACM CHI):**

- The overarching field. ISS, TEI, and MR are specialized sub-communities that publish their core work in their own conferences but also contribute to CHI.

---

## Part 4: Example Systems Analysis

### 1. SandScape (MIT Media Lab, 2002)

**What:** A tangible interface for landscape simulation. Users sculpt real sand. A projector colors the sand based on simulated properties (e.g., elevation, water flow), and a camera tracks changes.

**ISS Relevance:** Demonstrates the seamless merging of physical manipulation and dynamic visual feedback on a shared surface. It's a foundational example of how ISS can make complex simulations accessible and intuitive.

### 2. Reactable (2009)

**What:** A musical instrument and collaborative interface. Users place and rotate physical pucks (tokens) on a luminous round table to create and modify sound.

**ISS Relevance:** A masterpiece of tangible interaction on a surface. It uses computer vision to track tokens, mapping their ID, position, and orientation to sound parameters. It highlights collaboration, discoverability through physical affordances, and real-time feedback.

### 3. Interactive Public Ads (2017)

**What:** A public display that uses a depth camera to overlay the silhouettes of passersby on the screen, creating a "mirror" effect to attract attention.

**ISS Relevance:** Addresses the "interaction blindness" problem of public displays. It uses simple, full-body interaction (just moving in space) to create engagement without requiring users to understand a complex UI, tackling social context and walk-up usability.

### 4. Virtual Valcamonica (2018)

**What:** A collaborative Mixed Reality system for visualizing prehistoric rock carvings. Multiple users wear 3D glasses to see 3D models superimposed in a real space.

**ISS Relevance:** Pushes into interactive spaces. It combines large-scale tracking, stereoscopic displays, and collaborative interaction to create a shared archaeological exploration tool, blending ISS with MR.

### 5. SPLOM Wall (2020)

**What:** A massive (4.1m x 2.3m) wall display for visualizing high-dimensional data using a Scatterplot Matrix.

**ISS Relevance:** Epitomizes the scale and reachability challenge. Research questions include: How do users navigate such a large information space? What interaction techniques (laser pointers? touch? gesture?) work best? It's about interaction at scale.

### 6. Anatomy Education in MR (2024)

**What:** A study exploring MR for teaching complex 3D subject matter (embryonic anatomy), comparing individual vs. group learning.

**ISS Relevance:** Connects interactive spaces (the shared MR environment) to a real-world application. It investigates how the social and collaborative aspects of a shared space impact learning outcomes, a core ISS question.

---

## Synthesis & Key Takeaways

**From Surface to Space:** ISS encompasses a spectrum from 2D touch surfaces to immersive 3D rooms. The defining factor is the integration of interaction with the physical environment.

**Challenges of Scale:** The "big issues" shift from battery life and portability (mobile) to fatigue, infrastructure, and designing for shared, large-scale use.

**The Tangible Advantage:** A major theme is giving digital information a physical handle, whether through touch, pens, or manipulable tokens. This can lower the learning barrier and support collaboration.

**Deep Interdisciplinary Roots:** ISS is not just CS. It draws from design, art (interactive installations), engineering (sensing hardware), and domain sciences (like archaeology in Valcamonica).

**The Prototype is the Knowledge:** In ISS, a significant contribution is often the built system itself—the novel combination of hardware, software, and interaction technique that demonstrates a new possibility.

In summary, ISS asks: "How can we break interaction out of the small, personal screen and embed it into our surroundings in a useful, engaging, and human-centric way?" The case studies show the field's journey from novel tabletops to collaborative, spatial experiences.

---