# Exercise 06: Case Studies - COVID-19 Contact Tracing Analysis

**Course:** Smart Human-Computer Interaction (SHCI)  
**Semester:** 2025  
**Based on:** Lecture 06 - Case Studies (COVID-19 Contact Tracing Protocol)

---

In the lecture, we have looked at the COVID-19 contact tracing protocol based on Bluetooth Low Energy.
For this exercise, consider why this system did not end up being widely used, even though it was ultimately
deployed on millions of smartphones. Write up two scenarios in which the app could give a false positive
(warning about a potential infection, even though you were never exposed) and two scenarios for false
negatives (not warning you despite potential exposure).
Based on what you learned previously about wireless communication and alternative input/output channels,
speculate about potential ways to mitigate these false positives and negatives.

---

## Part 1: Why the System Failed to Achieve Wide Adoption

Despite the technically elegant privacy-preserving design described in Lecture 06, the COVID-19 contact tracing system faced several critical adoption barriers:

### Technical Limitations:

**1. Bluetooth Imprecision:**
- BLE signals aren't accurate for measuring distance, so real exposure risk is hard to tell.

**2. Battery Drain:**
- Using BLE all the time still used up battery, so people would turn it off.

### Social and Behavioral Factors:

**3. Trust Issues:**
- Many people didn't trust the app or understand how it kept their data private, so they didn't use it.

**4. Not Enough Users:**
- The system only works if a lot of people use it. Too few users made it ineffective.

**5. Too Many Warnings:**
- Lots of false alarms made people ignore or delete the app.

**6. Other Priorities:**
- People had to worry about battery, privacy, and hassle, so they often disabled the app.

---

## Part 2: False Positive Scenarios

### False Positive #1: The Apartment Wall Problem

**Scenario:**
You live in an apartment building with thin walls. Your neighbor in the adjacent unit tests positive for COVID-19 and their phone broadcasts infected identifiers. Your phone, sitting on your nightstand just 2 meters away on the other side of the wall, detects these BLE signals for 8+ hours overnight (well above the typical 15-minute threshold). You receive an exposure notification despite never sharing the same airspace or having any infection risk.

**Why This Happens:**
As discussed in Lecture 02, BLE signals operate in the 2.4 GHz ISM band with typical range of 10-100 meters. Standard building materials (drywall, wood) provide minimal RF attenuation at this frequency. The COVID protocol uses RSSI (signal strength) as a proxy for physical distance, but:
- BLE signals easily penetrate walls
- The system has no way to detect physical barriers
- Signal strength through a wall might be similar to signal strength across open air at the same distance
- Duration-based thresholds compound the problem (the longer you're "near" someone through a wall, the higher the false positive risk)

**Impact:**
This is particularly problematic in high-density urban housing where people may be flagged for exposure dozens of times from neighbors, coworkers in adjacent offices, or people in nearby cars at traffic lights.

---

### False Positive #2: The Outdoor Distance Miscalculation

**Scenario:**
You're waiting for a bus, standing 8 meters away from another person at the opposite end of the bus shelter (well beyond the 2-meter social distancing recommendation). The other person is outdoors, wearing a mask, and you're both in open air with good ventilation. However, BLE signal propagation in open outdoor spaces with minimal obstacles can be quite strong. Your phones maintain BLE contact for 20 minutes while waiting for the bus. Three days later, that person tests positive, and you receive an exposure warning.

**Why This Happens:**
The BLE-based system has three fundamental flaws for risk assessment:

1. **Distance Imprecision:** As covered in Lecture 02's discussion of positioning technologies, BLE proximity detection has 1-5 meter accuracy at best. Signal strength varies with:
   - Device antenna design (iPhone vs. Android variations)
   - Phone orientation in pocket/hand
   - Body absorption (the human body is mostly water, which absorbs RF)
   - Multipath effects in outdoor environments

2. **No Context Awareness:** The system cannot distinguish between:
   - Indoor (enclosed, poor ventilation) vs. outdoor (open air, dispersed aerosols)
   - Face-to-face interaction vs. back-to-back at a distance
   - Masked vs. unmasked individuals
   - Active conversation (higher viral load expelled) vs. silent proximity

3. **Binary Threshold Problem:** Most implementations used simple rules like "within X meters for Y minutes = exposure." This doesn't account for the exponential drop-off in actual transmission risk with distance, especially outdoors.

**Impact:**
Outdoor false positives undermine the system's credibility. Users who receive warnings after low-risk outdoor encounters while masked become skeptical of all future warnings.

---

## Part 3: False Negative Scenarios

### False Negative #1: The Phone-Left-at-Home Problem

**Scenario:**
You go to a crowded indoor concert without your phone (perhaps to avoid distractions, prevent theft, or because the venue prohibits phone use). You spend 3 hours in close proximity to hundreds of people, many of whom are unmasked and singing/shouting (high aerosol generation). Multiple attendees later test positive for COVID-19. However, because your phone wasn't with you, you never receive any exposure notifications and remain unaware of your high-risk exposure.

**Why This Happens:**
The Bluetooth-based protocol has a critical dependency: **the phone must be present, powered on, with Bluetooth enabled, and actively running the contact tracing service.** This fails in numerous real-world scenarios:

1. **Device Separation:** People don't always carry their phones:
   - Left in car, office, or locker
   - Intentionally left home during certain activities (exercise, social events, protests)
   - Lost or stolen devices
   - Children/elderly without smartphones

2. **Battery Death:** As emphasized in Lecture 01, mobile battery life is the ultimate limiting factor:
   - Phone dies during the day
   - User disables Bluetooth to conserve power
   - Low-power mode may throttle background BLE scanning

3. **Technical Failures:**
   - App crashes or is force-stopped by OS
   - Bluetooth stack bugs
   - OS updates that break compatibility
   - User accidentally disables necessary permissions

**Impact:**
This is a systematic undercount of actual exposures. The system only captures phone-to-phone proximity, not person-to-person proximity. This false sense of security is particularly dangerous because users believe they're protected when they're not.

---

### False Negative #2: The Brief High-Risk Encounter

**Scenario:**
You're in a small elevator with a COVID-positive individual. The elevator ride lasts exactly 45 seconds. During this time, you're both unmasked in a confined space (2m × 2m), breathing recirculated air with zero ventilation. The positive individual coughs twice directly in your direction at close range (<1 meter). However, because the encounter duration was below the typical 15-minute threshold used by most contact tracing implementations, your phone never generates an exposure notification.

**Why This Happens:**
The protocol's duration thresholds create a dangerous blind spot:

1. **Arbitrary Time Windows:** Most implementations used 15-minute continuous exposure thresholds based on early epidemiological guidance. This was meant to reduce false positives but creates false negatives for:
   - Brief but high-intensity exposures (elevators, bathroom encounters, quick face-to-face conversations)
   - Cumulative exposures (multiple brief encounters with the same person)
   - "Superspreader" events where viral load is exceptionally high

2. **BLE Connection Instability:** As discussed in Lecture 02 regarding wireless communication challenges:
   - Phones must maintain BLE connection long enough to exchange identifiers
   - Signal interruption (person walking away, turning corner, phone pocketed) can reset the timer
   - Multiple brief detections might not aggregate to trigger threshold
   - The "hidden node problem" from Lecture 02 applies: two phones might not "see" each other due to body blocking or orientation

3. **Quantization Error:** Time is bucketed into discrete windows. An encounter spanning two 7-minute windows (14 minutes total of exposure) might not trigger a 15-minute threshold if the system doesn't aggregate across windows.

**Impact:**
This false negative is particularly insidious because it occurs in precisely the high-risk scenarios where notification would be most valuable: confined spaces, close proximity, poor ventilation.

---

## Part 4: Proposed Mitigation Strategies

Based on concepts from Lectures 02 (Networks & Location), 03/04 (Mobile I/O), and 06 (Case Studies), here are potential improvements to reduce false positives and negatives:

---

### Strategy 1: Multi-Modal Sensor Fusion for Better Distance Estimation

**Approach:** Combine multiple wireless technologies and sensors to improve distance accuracy and context awareness.

**Technologies to Combine:**

1. **Ultra-Wideband (UWB):** For accurate distance; more precise than BLE, but not on all phones.
2. **WiFi RTT:** Uses WiFi signals for better indoor location and to tell if people are in the same or different rooms.
3. **GPS:** Shows if people are outdoors or indoors; adjust warnings based on this.
4. **Barometer:** Detects if people are on different floors to avoid false alerts through walls/floors.

**Implementation:**
```
Risk Score = f(BLE_RSSI, UWB_Distance, WiFi_Correlation, GPS_Context, 
               Barometric_Floor, Duration, Movement_Pattern)
```

**Benefits:**
- Reduces apartment wall false positives by detecting physical separation
- Reduces outdoor false positives by applying context-appropriate thresholds
- More accurate distance estimation reduces both false positive and false negative rates

---

### Strategy 2: Environmental and Behavioral Context Recognition

**Approach:** Use additional device sensors to infer environmental context and adjust risk calculations accordingly.

**Sensor Integration from Lecture 03/04 (Mobile I/O):**

1. **Microphone for Ventilation Detection:**
   - Indoor spaces have characteristic ambient noise (HVAC sounds, echo patterns)
   - Outdoor spaces have different acoustic signatures (traffic, birds, wind)
   - Can detect if user is in "quiet enclosed space" (high risk) vs. "outdoor with traffic noise" (lower risk)
   - **Privacy-Preserving:** Use Fast Fourier Transform (FFT) audio fingerprints (mentioned in Lecture 03/04) without recording actual audio
   - Only process ambient frequency patterns, not speech

2. **Accelerometer/Gyroscope for Activity Context:**
   - Detect if user is stationary (sitting in meeting/restaurant) vs. walking past someone
   - Distinguish "face-to-face" orientation (phones both upright, relatively stationary) from "walking past" (both phones moving, different orientations)
   - Brief encounters while both users are in motion (walking) could receive lower risk weighting than stationary face-to-face encounters

3. **Light Sensor for Indoor/Outdoor Classification:**
   - Ambient light levels can help distinguish indoor (typically 300-500 lux) from outdoor (5,000-100,000 lux)
   - Combines with GPS: if light is low but GPS shows "outdoors," likely in parking structure or urban canyon (moderate risk)

4. **Magnetometer for Orientation:**
   - Detect if phones are facing same direction (people facing same way in theater, bus) vs. facing each other (conversation, confrontation)
   - Face-to-face orientation suggests higher-risk direct breathing zone

**Contextual Risk Adjustment:**

| Context | Distance Threshold | Duration Threshold | Rationale |
|---------|-------------------|-------------------|-----------|
| Indoor + Stationary | 2 meters | 10 minutes | Enclosed space, likely poor ventilation |
| Indoor + Moving | 1.5 meters | 15 minutes | Moving through space (hallway, store) |
| Outdoor + Stationary | 1.5 meters | 20 minutes | Good ventilation, longer safe duration |
| Outdoor + Moving | 1 meter | Not triggered | Passing encounters, very low risk |
| Vehicle (detected by motion pattern) | 1 meter | 15 minutes | Shared enclosed space |

**Benefits:**
- Dramatically reduces false positives from outdoor encounters
- Adjusts thresholds based on actual transmission risk factors
- Addresses the "elevator problem" false negative by detecting confined space context

---

### Strategy 3: Network Infrastructure Collaboration

**Approach:** Leverage WiFi and cellular network infrastructure for corroborating proximity detection.

**From Lecture 02 (Cell-Based Positioning):**

1. **WiFi BSSID Correlation:**
   - If two phones report connecting to the same WiFi Access Point (BSSID), they're likely in the same building/space
   - Timing analysis: if connections overlap, users are simultaneously present
   - Can differentiate "same coffee shop" from "adjacent apartments" (different SSIDs)
   - **Privacy Note:** Only share hashed BSSID + timestamp, not actual SSID names

2. **Cell Tower Triangulation:**
   - Cell ID + timing advance information can provide rough location (100m-1km)
   - If two users are connected to completely different cell towers, BLE detection might be a false positive (through wall or at edge of BLE range)
   - Acts as a "sanity check" on BLE proximity claims

3. **WiFi Fingerprinting:**
   - Instead of connecting to WiFi, phones can scan visible WiFi networks (SSIDs + signal strengths)
   - Create a "fingerprint" of location from the pattern of visible networks
   - If two phones have similar WiFi fingerprints, they're likely in the same physical location
   - Helps distinguish "same floor" from "different floor" in buildings

**Implementation Example:**
```
If (BLE_Proximity AND Same_WiFi_BSSID) → High confidence, same space
If (BLE_Proximity AND Different_Cell_Towers) → Possible false positive, through wall
If (BLE_Proximity AND Similar_WiFi_Fingerprint) → Corroborated, likely accurate
```

**Benefits:**
- Reduces false positives from through-wall detections (different WiFi networks visible)
- Increases confidence in true positives (multiple independent signals agree)
- Provides redundancy if BLE fails (WiFi-based proximity as backup)

---

### Strategy 4: Machine Learning Risk Models

**Approach:** Use on-device machine learning to build sophisticated risk models that learn from epidemiological data.

**Training Data Sources:**
- Known transmission events (contact tracing interview data)
- Environmental factors (indoor/outdoor, ventilation, masking)
- Duration and distance combinations that led to actual infections
- False positive reports from users

**Model Features (from all previous sensors):**
- BLE RSSI readings over time (not just average)
- UWB distance measurements
- GPS context (indoor/outdoor)
- Accelerometer patterns (stationary/mobile)
- Barometric floor level
- Time of day, day of week
- Local transmission rates
- User-reported context (optional: "I'm at gym/restaurant/work")

**On-Device Processing:**
- Use phone's Neural Engine/NPU for real-time inference
- Model outputs probability of transmission rather than binary yes/no
- Allows for nuanced warnings: "Low risk exposure" vs. "High risk exposure"

**Continuous Learning:**
- Federated learning approach (similar to privacy-preserving protocol): update models without sharing individual data
- Incorporate new epidemiological research findings
- Adapt to new variants with different transmission characteristics

**Benefits:**
- Adapts to evolving understanding of disease transmission
- Can learn to distinguish high-risk from low-risk scenarios
- Reduces both false positives and false negatives through better risk assessment

---

### Strategy 5: Explicit Barrier Detection

**Approach:** Actively detect physical barriers between users to prevent through-wall false positives.

**Techniques:**

1. **UWB Material Penetration Analysis:**
   - Different materials absorb UWB signals differently
   - By analyzing UWB signal characteristics (not just strength), can infer if signal passed through barriers
   - Concrete walls cause significant UWB attenuation; drywall causes less
   - If UWB signal shows heavy attenuation but BLE is strong, suggests barrier present

2. **Movement Correlation:**
   - If both phones move in similar patterns (walking together, turning corners simultaneously), likely in same space
   - If movement patterns are uncorrelated (one phone stationary, other moving), might suggest different spaces
   - Uses accelerometer + gyroscope data from Lecture 03/04

3. **Echo/Acoustic Analysis:**
   - Use microphone to detect ambient sound patterns
   - Rooms on opposite sides of walls have different acoustic signatures
   - Can detect if ambient sounds are correlated (same space) or uncorrelated (different spaces)
   - Privacy-preserving: only analyze ambient frequencies, not content

4. **WiFi Signal Pattern Matching:**
   - Phones in the same room see similar WiFi signal strengths from multiple APs
   - Phones in different rooms separated by walls see different relative signal strengths
   - Create a "spatial signature" from multi-AP RSSI readings

**Decision Logic:**
```
If (Strong_BLE_Signal AND Different_Movement_Patterns AND 
    Different_Acoustic_Signatures AND Dissimilar_WiFi_Patterns):
    Likely_Separated_By_Barrier = True
    Reduce_Risk_Score()
```

**Benefits:**
- Directly addresses the apartment wall false positive problem
- Also helps with office partition scenarios
- Combines multiple independent signals for high confidence

---

### Strategy 6: Social Graph and Behavioral Patterns

**Approach:** Use phone usage patterns to infer social context (with privacy preservation).

**Behavioral Signals:**

1. **Call/Message Patterns (Anonymized):**
   - If two phones frequently call/message each other, they likely know each other
   - Close contacts with known social connections are higher priority for notification than random strangers
   - Only use hashed phone numbers, never actual contact data

2. **Calendar Integration (Optional, Opt-In):**
   - If calendar shows "meeting in Conference Room A," system knows you're in a shared indoor space
   - Can adjust sensitivity based on calendar context
   - Completely optional and user-controlled

3. **Routine Detection:**
   - Learn user's daily patterns (home, work, gym) from location history
   - Exposures at "home" location are higher concern (household member) than brief exposure at grocery store
   - Can prioritize notifications: household exposures > workplace > transit > random

**Privacy Considerations:**
- All behavioral analysis happens on-device only
- Only broadcast: "I'm in high-risk context" vs. "low-risk context" (binary flag)
- Never share actual social graph or calendar data

**Benefits:**
- Helps users prioritize which exposures are most concerning
- Reduces alarm fatigue from low-priority exposures
- Better reflects real transmission patterns (household spread is major vector)

---

