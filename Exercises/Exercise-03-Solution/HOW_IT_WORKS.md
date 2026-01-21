# How the Throw Height Meter Works

## What Does This App Do?

This app measures how high you throw your phone in the air. When you toss your phone straight up and catch it, the app calculates the maximum height it reached!

## The Physics Behind It

When you throw something upward, it goes through these stages:
1. **Going up** - slowing down due to gravity
2. **At the peak** - momentarily stops
3. **Coming down** - speeding up due to gravity

Here's the clever part: While the phone is in the air (both going up AND coming down), it's essentially in **free fall**. This means the accelerometer inside reads almost zero acceleration, even though gravity is pulling it down!

Think of it like being in an elevator with a broken cable - you'd feel weightless because you and the elevator are falling together. Same thing happens to your phone when it's thrown!

## How the Code Works

### 1. Listening to the Accelerometer

The phone's accelerometer constantly measures forces acting on it:
- When sitting still: it measures ~9.81 m/s² (Earth's gravity)
- When in free fall: it measures almost 0 m/s² (phone is falling with gravity)

The app listens to these measurements and calculates the total acceleration magnitude:
```
magnitude = √(x² + y² + z²)
```

### 2. Detecting Free Fall

The app watches for when the magnitude drops below **0.5 m/s²**. This threshold accounts for:
- Sensor noise (real sensors aren't perfectly accurate)
- Small movements or rotations during the throw

When free fall is detected, the app marks the start time.

### 3. Detecting the Catch

When the magnitude goes back above 0.5 m/s², the phone has been caught (or hit something). The app marks the end time.

### 4. Calculating the Height

Now comes the math! When you throw something straight up:
- **T** = total time in the air (measured by the app)
- **t** = time to reach maximum height = T/2
- **h** = maximum height

Using physics equations for free fall:
```
h = ½ × g × t²
```

But since t = T/2:
```
h = ½ × g × (T/2)²
h = ½ × g × T²/4
h = g × T² / 8
```

Where **g** = 9.81 m/s² (Earth's gravity)

### 5. Displaying the Result

The app shows the calculated height in meters with two decimal places (e.g., "1.23 meters").

## Key Variables in the Code

- **g**: Gravity constant (9.81 m/s²)
- **inFreeFall**: Boolean flag - are we currently in free fall?
- **freeFallStart**: When did free fall begin?
- **freeFallEnd**: When did free fall end?
- **height**: The calculated maximum height
- **status**: Current message shown to the user

## Why the 0.5 m/s² Threshold?

In a perfect world, free fall would measure exactly 0 m/s². But in reality:
- Sensors have measurement noise
- The phone might rotate slightly
- Your hand movements aren't perfectly smooth

Using 0.5 m/s² gives us a good balance - sensitive enough to detect throws but not so sensitive that it triggers from normal handling.

## The Reset Button

After measuring a throw, you can press "Reset" to:
- Clear the previous height measurement
- Get ready for another throw
- Reset the status message

## Safety Note

This is why the exercise has that warning! The phone needs to be in actual free fall, which means throwing it in the air. Always test over soft surfaces like beds or sofas, and consider wrapping your phone in bubble wrap!

# Anti-Cheating Logic

## The Problem
How do you tell the difference between:
- **Legitimate throw**: Tossing phone upward and catching it
- **Cheating**: Dropping phone from a building or height

## Detection Methods

### 1. Time Limit Check
**Logic**: Legitimate throws have short free fall times (< 2 seconds)
- If free fall time > 2 seconds → Reject (probably dropped from building)

### 2. Throw Force Detection
**Logic**: Real throws start with strong upward acceleration
- Before free fall: Check for acceleration spike (> 12 m/s²)
- If no spike detected → Reject (phone was just released, not thrown)

### 3. Catch Impact Check
**Logic**: Catching creates strong deceleration
- At end of free fall: Measure deceleration magnitude
- If deceleration < 8 m/s² → Reject (landed on soft surface, not caught)

### 4. Rotation Verification
**Logic**: Natural throws involve rotation
- Monitor gyroscope during free fall
- If total rotation is too low → Reject (too controlled to be natural)

### 5. Altitude Consistency
**Logic**: Start and end should be at same height
- Measure altitude before throw and after catch
- If altitude difference > 2 meters → Reject (changed floors/location)

## Implementation Flow

```
1. BEFORE FREE FALL:
   - Monitor for strong acceleration spike (throw force)
   - Record starting altitude
   - Track gyroscope readings

2. DURING FREE FALL:
   - Measure duration
   - Continue tracking rotation

3. AFTER FREE FALL:
   - Measure catch deceleration
   - Check ending altitude
   - Validate all criteria

4. DECISION:
   - All checks pass? → Calculate and show height
   - Any check fails? → Reject as invalid/cheating
```

## Combined Validation

Best approach: Use multiple checks together

```
Valid Throw = 
  ✓ Time < 2 seconds
  AND ✓ Initial acceleration > 12 m/s²
  AND ✓ Catch deceleration > 8 m/s²
  AND ✓ Some rotation detected
  AND ✓ Altitude difference < 2 meters
```

## Why This Works

- **Can't drop from building**: Time limit catches this
- **Can't just release**: Needs throw force
- **Can't land softly**: Needs catch impact
- **Can't be too controlled**: Needs natural rotation
- **Can't change location**: Altitude must match

Each check alone can be bypassed, but together they form a strong defense.

