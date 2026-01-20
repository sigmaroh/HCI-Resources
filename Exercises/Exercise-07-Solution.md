# Exercise 07: Interactive Surfaces and Spaces


## Task

Consider the following usage scenarios and determine which interface type would be most appropriate:

**Interface Options:**
- Regular laptop or desktop computer
- Mobile phone or tablet device
- Large interactive surface
- Mixed-reality space

**Scenarios:**
1. Ship navigation on the bridge of a large container vessel
2. Emergency response and coordination after a large-scale disaster
3. A casual but fast-paced game for four players, such as air hockey
4. Collaborative text writing for a research paper
5. Air traffic control in an international airport

---

## Solutions

### 1. Ship Navigation on a Large Container Vessel

**Most appropriate: Large Interactive Surface**

A large interactive surface (horizontal or vertical) is ideal for ship navigation because maritime operations require simultaneous visualization of multiple data layers including nautical charts, radar overlays, AIS (Automatic Identification System) data, weather information, and route planning. The ship's bridge typically has multiple officers (captain, navigator) who need shared situational awareness and must collaborate on critical decisions. A large surface allows all crew members to view the same information simultaneously and interact with different elements without obstructing each other's view. The physical size accommodates the complexity of maritime navigation data while supporting the territoriality principles discussed in the lecture—officers can have personal zones for their specific tasks while maintaining group awareness through the shared central display. Additionally, the rugged nature of maritime environments favors fixed, large displays over fragile mobile devices.

---

### 2. Emergency Response and Coordination After Large-Scale Disaster

**Most appropriate: Mixed Reality Space (with mobile device support)**

A mixed reality space is most suitable for disaster response coordination because it provides the spatial awareness and collaborative features essential for managing complex, distributed emergency operations. As shown in the Virtual Valcamonica example from the lecture, MR spaces enable multiple responders to simultaneously view and interact with 3D visualizations of the disaster area, resource distributions, and response strategies. The shared spatial environment allows commanders to point to specific locations, overlay real-time data from field teams (transmitted via their mobile devices), and collaboratively plan response tactics with proper depth perception. While field personnel would use mobile tablets for on-site data collection and navigation, the command center benefits from an immersive MR space where multiple coordinators can track the full-body poses and gestures of team members to naturally communicate strategies—addressing the collaboration and "walk-up-and-use" considerations mentioned in the lecture's discussion of big issues in ISS.

---

### 3. Casual Fast-Paced Game for Four Players (Air Hockey)

**Most appropriate: Large Interactive Surface (Horizontal Tabletop)**

A large horizontal interactive surface is the clear choice for a four-player air hockey game because it directly translates the physical affordances of traditional air hockey into a digital experience. As demonstrated by the Reactable example in the lecture, horizontal surfaces naturally support face-to-face collaboration and simultaneous multi-touch interaction from multiple users positioned around the perimeter. The casual, fast-paced nature of air hockey requires low-latency touch response (addressing the "fatigue and reachability" issues differently than vertical displays—horizontal surfaces don't cause "gorilla arm" fatigue). The shared physical space creates the social engagement essential to casual gaming, allowing players to read each other's body language and maintain eye contact. The 2D position tracking with multi-touch capabilities (as defined in the lecture's TUIO 2.0 input types) provides the precision needed for game physics while accommodating four players' simultaneous inputs without interference, exemplifying the territoriality concept where each player has their "personal territory" at their table edge.

---

### 4. Collaborative Text Writing for a Research Paper

**Most appropriate: Regular Laptop or Desktop Computer**

Regular desktop or laptop computers remain the most appropriate choice for collaborative academic writing despite the availability of more advanced interfaces. Research paper writing is a cognitively intensive, text-heavy task requiring extended periods of focused individual work with keyboard-based input for efficient text entry—something that large interactive surfaces and other alternatives cannot match in productivity. While the collaboration aspect might suggest a shared surface, academic writing typically involves asynchronous contribution where co-authors work on different sections independently before integrating their work through established software tools (Google Docs, Overleaf, Word with Track Changes). The infrastructure requirements and setup complexity of ISS systems (as noted in the lecture's "Big Issues" section) are unjustified for this task. Individual screens provide the privacy needed for draft writing, detailed editing, and managing references without the "shared and public use" complications. Mobile devices have inadequate screen real estate for viewing lengthy documents, and MR/large surfaces would introduce fatigue without providing meaningful benefits for predominantly keyboard-based work.

---

### 5. Air Traffic Control at International Airport

**Most appropriate: Large Interactive Surface (combined with individual workstations)**

A large interactive surface serves as the optimal primary interface for air traffic control, functioning as a shared situational awareness display complemented by individual controller workstations. The SPLOM Wall example from the lecture (4.1m x 2.3m display) directly parallels ATC needs—both require visualization of massive datasets (aircraft positions, flight paths, weather, restricted zones) across an expansive information space where multiple operators must maintain comprehensive oversight. The large surface addresses the "reachability" challenge through hybrid interaction: controllers use individual stations for sector-specific commands while the central surface provides the collaborative overview necessary for handoffs between sectors and coordination during emergencies. The high information density of international airport operations—tracking potentially hundreds of aircraft across multiple sectors—demands the pixel real estate that only large displays can provide. As discussed in the lecture's definition of interactive surfaces, the multi-touch with 2D position tracking allows supervisors to point out specific aircraft or areas during training and coordination, while the shared visibility prevents the "privacy and social context" issues since ATC inherently requires transparency for safety-critical operations.

---

### Interface Type Selection Factors:

**Large Interactive Surfaces excel when:**
- Spatial organization is critical
- Multiple simultaneous users need shared awareness
- High information density requires extensive display area
- Face-to-face collaboration is important
- Territoriality and personal zones are needed

**Mobile Devices work best for:**
- Distributed, on-the-go scenarios
- Portability is essential
- Field data collection
- Individual, location-independent tasks

**Traditional Computers remain superior for:**
- Keyboard-intensive work
- Individual-focused tasks
- Extended text editing and document creation
- Asynchronous collaboration

**MR Spaces provide unique value when:**
- 3D spatial understanding is essential
- Immersive collaboration is needed
- Depth perception adds critical information
- Full-body interaction enhances communication

---

## Big Issues in ISS

1. **Infrastructure Requirements:** Complex, expensive setups limiting widespread adoption
2. **Fatigue and Reachability:** "Gorilla arm" effect on vertical surfaces, reach limitations on large displays
3. **Interaction Design:** Challenges in shared/public use, walk-up-and-use interfaces
4. **Tangibility:** Combining physical and digital interaction coherently
5. **Touch-Related Issues:** Similar to mobile devices but at larger scale
6. **Gestures and Discoverability:** Learning curve for non-standard interactions

---

