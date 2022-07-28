// Sonic Jam
// #ID = 14548
// By Searo, WanderingHeiho, & Wolfman2000

// Variables

JamTimeAttackActive = byte(0x1030e9)
JamTimeAttackAct = byte(0x1030fa)
JamTimeAttackZone = byte(0x1030FB)

JamClassicMode = byte(0x1030f8)
JamTimeAttack = JamClassicMode == 1
JamSpecialStage = JamClassicMode == 2

JamClassicDiff = byte(0x1030ff)
JamClassicNormal = JamClassicDiff == 0
JamClassicEasy = JamClassicDiff == 1
JamClassicOriginal = JamClassicDiff == 2
JamClassicNotOriginal = JamClassicDiff < 2

JamClassicElapsedTime = word(0x10370e)
JamSpinDash = byte(0x1370da)
S1SpinDashOn = JamSpinDash == 1
JamClassicGame = byte(0x137136)

JamGameState = dword(0x14f3b0)
JamWorld = JamGameState == 0xffffffff
Sonic1 = JamGameState == 0x7302038C && JamClassicGame == 0
Sonic2 = dword(0x102FF8) == 0x83AC0603 && dword(0x102FFC) == 0x1FE00600
Knuckles2 = dword(0x102FF8) == 0x83940603 && dword(0x102FFC) == 0x1FE00600
S2AK = (dword(0x102FF8) == 0x83940603 || dword(0x102FF8) == 0x83AC0603) && dword(0x102FFC) == 0x1FE00600

DifficultyLookup = {
    0: "Normal",
    1: "Easy",
    2: "Original",
}

ModeLookup = {
    1: "| Extra - Time Attack ",
    2: "| Extra - Special Stage",
}

S3CharLookup = {
    0x00: "Sonic & Tails",
    0x01: "Sonic",
    0x02: "Tails",
    0x03: "Knuckles",
}

BSColorLookup = {
    0x00: "Green",
    0x01: "Red",
    0x02: "Pink",
    0x03: "Blue",
    0x04: "Gray",
    0x05: "Red",
    0x06: "Cyan",
    0x07: "Yellow",
}

S1ZoneLookup = {
    0x00: "Green Hill",
    0x01: "Labyrinth",
    0x02: "Marble",
    0x03: "Star Light",
    0x04: "Spring Yard",
    0x05: "Scrap Brain",
    0x06: "Ending",
}

S2ZoneLookup = {
    0x00: "Emerald Hill",
    0x04: "Metropolis",
    0x05: "Metropolis",
    0x06: "Wing Fortress",
    0x07: "Hill Top",
    0x0a: "Oil Ocean",
    0x0b: "Mystic Cave",
    0x0c: "Casino Night",
    0x0d: "Chemical Plant",
    0x0e: "Death Egg",
    0x0f: "Aquatic Ruin",
    0x10: "Sky Chase",
}

S3ZoneLookup = {
    0x00: "Angel Island",
    0x01: "Hydrocity",
    0x02: "Marble Garden",
    0x03: "Carnival Night",
    0x04: "Flying Battery",
    0x05: "Icecap",
    0x06: "Launch Base",
    0x07: "Mushroom Hill",
    0x08: "Sandopolis",
    0x09: "Lava Reef",
    0x0a: "Sky Sanctuary",
    0x0b: "Death Egg",
    0x0c: "Doomsday",
    0x0d: "Game Clear",
    0x0e: "Azure Lake (competition)",
    0x0f: "Ballon Park (competition)",
    0x10: "Desert Palace (competition)",
    0x11: "Chrome Gadget (competition)",
    0x12: "Endless Mine (competition)",
    0x13: "Gumball Machine (Bonus Stage)",
    0x14: "Vertical Orb Climb (Bonus Stage)",
    0x15: "Slot Machine (Bonus Stage)",
    0x16: "Lava Reef",
    0x17: "Death Egg",
}

MissionObjectiveLookup = {
    0: true,
    1: true,
    2: true,
    3: true,
    4: true,
    5: true,
    6: true,
    7: true
}

MissionNameLookup = {
    0: "20 Rings",
    1: "3 Red Points",
    2: "50 Rings",
    3: "Touch Miles",
    4: "5 Blue Points",
    5: "7 Secret Cards",
    6: "3 Balloons",
    7: "100 Rings"
}

MissionQualifyingNameLookup = {
    0: "A Fifth of All Rings",
    1: "Collect the Three Red Points",
    2: "Half of All Rings",
    3: "Reminds Me of a Certain Owl...",
    4: "Collect the Five Blue Points",
    5: "Not Such a Secret Anymore",
    6: "Collect the Three Balloons",
    7: "Ring Collector"
}

MissionQualifyingPointsLookup = {
    0: 3,
    1: 3,
    2: 3,
    3: 5,
    4: 5,
    5: 5,
    6: 5,
    7: 10
}

MissionQualifyingTimeLookup = {
    0: 6000,
    1: 6000,
    2: 6000,
    3: 9000,
    4: 9000,
    5: 12000,
    6: 12000,
    7: 15000
}

MissionSpeedTimeLookup = {
    0: 2000,
    1: 3000,
    2: 3500,
    3: 1000,
    4: 4500,
    5: 5500,
    6: 5000,
    7: 8500
}

MissionSpeedWordLookup = {
    0: "20",
    1: "30",
    2: "35",
    3: "10",
    4: "45",
    5: "55",
    6: "50",
    7: "1 minute and 25"
}

WorldMissionBase = 0x1ffef0
WorldSecondsOffset = 3
WorldDecimalOffset = 2

function WorldTimer(offset) {
    return bcd(byte(offset)) * 6000 + bcd(byte(offset + WorldSecondsOffset)) * 100 + bcd(byte(offset + WorldDecimalOffset))
}

WorldTimerMinutes = byte(0x1ffeec)
WorldTimerSeconds = byte(0x1ffeef)
WorldTimerDecimal = byte(0x1ffeee)
WorldTimerCurrent = bcd(WorldTimerMinutes) * 6000 +
    bcd(WorldTimerSeconds) * 100 + bcd(WorldTimerDecimal)

WorldMissionsUnlocked = bitcount(0x1ffc30)
WorldRedPoints = byte(0x1ffc28)
WorldTouchedMiles = byte(0x1ffc2a)
WorldSecretCards = byte(0x1ffc2c)
WorldBluePoints = byte(0x1ffc2d)
WorldBalloons = byte(0x1ffc2f)

WorldRingHundred = byte(0x1fff18)
WorldRingTen = byte(0x1fff1b)
WorldRingOne = byte(0x1fff1a)

MissionConditionLookup = {
    0: (WorldRingTen >= 2),
    1: (WorldRedPoints == 3),
    2: (WorldRingTen >= 5),
    3: (WorldTouchedMiles == 1),
    4: (WorldBluePoints == 5),
    5: (WorldSecretCards == 7),
    6: (WorldBalloons == 3),
    7: (WorldRingHundred == 1)
}

MissionSpeedPointsLookup = {
    0: 5,
    1: 5,
    2: 5,
    3: 5,
    4: 5,
    5: 5,
    6: 5,
    7: 10
}

// Sonic Jam Achievements

function QualifyingMissionCheevo(missionId) {
    missionName = MissionNameLookup[missionId]
    missionTimeOffset = WorldMissionBase + (missionId * 4)
    timeTicks = byte(missionTimeOffset) != prev(byte(missionTimeOffset)) ||
        byte(missionTimeOffset + WorldSecondsOffset) != prev(byte(missionTimeOffset + WorldSecondsOffset)) ||
        byte(missionTimeOffset + WorldDecimalOffset) != prev(byte(missionTimeOffset + WorldDecimalOffset))
    achievement(
        title = MissionQualifyingNameLookup[missionId],
        description = format("Finished the '{0}' mission with a qualifying time.", missionName),
        points = MissionQualifyingPointsLookup[missionId],
        id = 121378 + missionId,
        trigger = JamWorld && WorldMissionsUnlocked >= missionId && WorldTimer(missionTimeOffset) != 0 &&
            WorldTimerCurrent < MissionQualifyingTimeLookup[missionId] && MissionConditionLookup[missionId] && timeTicks
    )
}

for i in MissionConditionLookup {
    QualifyingMissionCheevo(i)
}

function SpeedMissionCheevo(missionId) {
    missionName = MissionNameLookup[missionId]
    missionTimeOffset = WorldMissionBase + (missionId * 4)
    timeTicks = byte(missionTimeOffset) != prev(byte(missionTimeOffset)) ||
        byte(missionTimeOffset + WorldSecondsOffset) != prev(byte(missionTimeOffset + WorldSecondsOffset)) ||
        byte(missionTimeOffset + WorldDecimalOffset) != prev(byte(missionTimeOffset + WorldDecimalOffset))
    achievement(
        title = format("{0} - Time Attack", missionName),
        description = format("Finish the '{0}' mission in under {1} seconds.", missionName, MissionSpeedWordLookup[missionId]),
        points = MissionQualifyingPointsLookup[missionId],
        id = 121386 + missionId,
        trigger = JamWorld && WorldMissionsUnlocked >= missionId && WorldTimer(missionTimeOffset) != 0 &&
            WorldTimerCurrent < MissionSpeedTimeLookup[missionId] && MissionConditionLookup[missionId] && timeTicks
    )
}

for i in MissionConditionLookup {
    SpeedMissionCheevo(i)
}

achievement(
    title = "Collector of Everything", description = "Collected 100 rings, 3 red points, 5 blue points, 7 secret cards, and 3 balloons all at once.", points = 10,
    id = 121394, badge = "132602", published = "8/10/2020 8:43:00 PM", modified = "7/25/2022 10:10:18 PM",
    trigger = JamWorld && WorldRingHundred == 0x01 && WorldRingTen == 0x00 && WorldRingOne ==
               0x00 && WorldRedPoints == 0x03 && WorldBluePoints == 0x05 && WorldBalloons == 0x03 && WorldSecretCards ==
               0x07
)

// Sonic 1 Cheevos

S1SonicXPosition = word(0x1fd008)
S1SonicYPosition = word(0x1FD00C)
S1AnimId = byte(0x1fd01c)

S1SonicState = 0x1fd023
S1UnderWater = bit6(S1SonicState)

S1SpinDash = prev(byte(0x1FD038)) > byte(0x1FD038)

// This one is available for all Genesis games.
S1ScreenMode = byte(0x1FF601)
S1EndingTransition = prior(S1ScreenMode) == 0x0c && S1ScreenMode == 0x18

S1CameraXPosition = word(0x1FF700)
S1CameraYPosition = word(0x1FF704)

S1LeftBound = word(0x1FF728)
S1RightBound = word(0x1FF72A)

S1BossFlag = byte(0x1FF7A6)

S1StarLightBoss = byte(0x1fd881) == 0x7a
S1StarLightBossHP = byte(0x1fd8a0)

DemoByte = byte(0x1ffff0)
// This batch is also for Sonic 2.
S1AnyDemo = DemoByte == 1
S1NoDemo = DemoByte == 0
S1EndDemo = DemoByte == 0xff

// This batch is for all classic games.
S1ActId = byte(0x1ffe10)
S1Act1 = S1ActId == 0
S1Act2 = S1ActId == 1
S1Act3 = S1ActId == 2
S1Act4 = S1ActId == 3
S1ZoneId = byte(0x1ffe11)
S1LifeCount = byte(0x1ffe13)
S1LifeLost = prev(S1LifeCount) > S1LifeCount
S1LifeGain = prev(S1LifeCount) < S1LifeCount

// Remember that internal IDs may not match the UI.
S1GreenHill = S1ZoneId == 0
S1Marble = S1ZoneId == 2
S1SpringYard = S1ZoneId == 4
S1Labyrinth = S1ZoneId == 1
S1StarLight = S1ZoneId == 3
S1ScrapBrain = S1ZoneId == 5
S1Final = S1ScrapBrain && S1ActId == 2

// All Genesis games use these three bytes.
S1Rings = word(0x1ffe20)
S1TimeMinutes = byte(0x1ffe22)
S1TimeSeconds = byte(0x1ffe25)
S1TimeDecimal = byte(0x1ffe24)
S1TimeElapsed = S1TimeMinutes * 3600 + S1TimeSeconds * 60 + S1TimeDecimal
// Remember that the UI score multiplies this by 10.
S1Score = dword(0x1ffe28)
S1Invincible = byte(0x1ffe2c)
S1Shield = byte(0x1ffe2d) == 1
S1SpeedShoes = byte(0x1ffe2f) == 1

S1EmeraldCount = low4(0x1ffe56)

// This is also for S3&K. Sonic 2 is different.
S1LevelSelect = byte(0x1fffe1) == 1

Sonic1LevelLookup = {
    0: "Green Hill Zone Act 1",
    1: "Green Hill Zone Act 2",
    2: "Green Hill Zone Act 3",
    10: "Labyrinth Zone Act 1",
    11: "Labyrinth Zone Act 2",
    12: "Labyrinth Zone Act 3",
    13: "Scrap Brain Zone Act 3",
    20: "Marble Zone Act 1",
    21: "Marble Zone Act 2",
    22: "Marble Zone Act 3",
    30: "Star Light Zone Act 1",
    31: "Star Light Zone Act 2",
    32: "Star Light Zone Act 3",
    40: "Spring Yard Zone Act 1",
    41: "Spring Yard Zone Act 2",
    42: "Spring Yard Zone Act 3",
    50: "Scrap Brain Zone Act 1",
    51: "Scrap Brain Zone Act 2",
    52: "Final Zone"
}

Sonic1BeatenLevelLookup = {
    0: (S1SonicXPosition >= 0x2560),
    1: (S1SonicXPosition >= 0x1f60),
    2: (S1BossFlag == 2),
    10: (S1SonicXPosition >= 0x1a50),
    11: (S1SonicXPosition >= 0x1160),
    12: (S1BossFlag == 2),
    13: (S1SonicYPosition <= 0x13 && S1SonicXPosition >= 0x0e0a && S1SonicXPosition <= 0x0ef5),
    20: (S1SonicXPosition >= 0x1860),
    21: (S1SonicXPosition >= 0x1860),
    22: (S1BossFlag == 2),
    30: (S1SonicXPosition >= 0x2060 && S1SonicYPosition <= 0x0300),
    31: (S1SonicXPosition >= 0x2060),
    32: (S1BossFlag == 2),
    40: (S1SonicXPosition >= 0x2360),
    41: (S1SonicXPosition >= 0x2960),
    42: (S1BossFlag == 2),
    50: (S1SonicXPosition >= 0x2260),
    51: (S1SonicXPosition >= 0x1ee0),
    52: (S1EndingTransition)
}

Sonic1LevelOrderLookup = [
    0, 1, 2, 20, 21, 22, 40, 41, 42, 10, 11, 12, 30, 31, 32, 50, 51, 13, 52
]

achievement(
    title = "It's A Time Paradox!", description = "[Sonic 1] Use the Spin Dash. Yes, it exists now.", points = 0,
    id = 225225, badge = "250513", published = "6/9/2022 2:05:59 AM", modified = "7/25/2022 10:11:21 PM",
    trigger = Sonic1 && S1NoDemo && S1SpinDash && S1SpinDashOn && JamClassicNotOriginal
)

achievement(
    title = "Star Studded Intro", description = "[Sonic 1, Easy] In Green Hill Zone, become invincible within the first 5 seconds. Then finish the act staying invincible.", points = 5,
    id = 225226, badge = "250514", published = "6/9/2022 2:06:00 AM", modified = "7/26/2022 4:35:20 PM",
    trigger = Sonic1 && JamClassicEasy && S1NoDemo && S1GreenHill && once(S1Invincible == 0x01 && S1TimeSeconds < 0x05) && 
              never(S1LifeLost) && never(S1Invincible < prev(S1Invincible)) && 
              S1SonicXPosition >= 0x2560
)

achievement(
    title = "Weren't There Less Of These Before?", description = "[Sonic 1, Easy] In Marble Zone, beat the stage with all 135 rings in your possession.", points = 5,
    id = 225227, badge = "250515", published = "6/9/2022 2:06:00 AM", modified = "7/26/2022 4:35:20 PM",
    trigger = Sonic1 && JamClassicEasy && S1NoDemo && S1Marble && S1SonicXPosition >= 0x1860 && S1Rings == 0x87
)

achievement(
    title = "Geronimo!!!", description = "[Sonic 1, Easy] In Spring Yard Zone, fall from the floating box all the way to the ground.", points = 5,
    id = 225228, badge = "250516", published = "6/9/2022 2:06:00 AM", modified = "7/26/2022 4:35:20 PM",
    trigger = Sonic1 && JamClassicEasy && S1NoDemo && S1SpringYard && S1Act2 && !S1LevelSelect && S1CameraXPosition <
               0xB32 && S1CameraXPosition > 0xA50 && once(prev(S1CameraYPosition) <= 0x90 && S1CameraYPosition > 0x90) && 
              never(S1AnimId == 0x10) && never(S1LifeLost) && S1CameraYPosition == 0x520
)

achievement(
    title = "Stubborn About Life", description = "[Sonic 1, Easy] In Labyrinth Zone, get the 1-up box on the bottom route and break the surface without air breaks in between.", points = 10,
    id = 225229, badge = "250517", published = "6/9/2022 2:06:01 AM", modified = "7/26/2022 4:35:21 PM",
    trigger = Sonic1 && JamClassicEasy && S1NoDemo && S1Labyrinth && S1Act3 && !S1LevelSelect && 
              never(S1LifeLost) && never(S1UnderWater > prev(S1UnderWater)) && 
              never(S1AnimId == 0x15) && once(S1SonicXPosition > 0x160A && S1SonicXPosition < 0x1730 && S1SonicYPosition
               > 0x600 && S1SonicYPosition < 0x78C && S1LifeGain && S1UnderWater == 0x01) && 
              trigger_when(S1UnderWater == 0x00)
)

achievement(
    title = "The Incredible Shrinking Stairs Act", description = "[Sonic 1, Easy] In Star Light Zone, view the rotating stairs. Weep at how they shrunk, then spring on out of there.", points = 10,
    id = 225230, badge = "250518", published = "6/9/2022 2:06:01 AM", modified = "7/26/2022 4:35:21 PM",
    trigger = Sonic1 && JamClassicEasy && S1NoDemo && S1StarLight && S1Act2 && !S1LevelSelect && S1AnimId ==
               0x10 && S1SonicXPosition <= 0x19F5 && S1SonicXPosition > 0x19D5 && S1SonicYPosition >= 0x5CB
)

achievement(
    title = "The Gears Work Every Other Day", description = "[Sonic 1, Easy] In Scrap Brain Zone, find the zig zag corridor that is missing its crushing machinery.", points = 10,
    id = 225231, badge = "250519", published = "6/9/2022 2:06:01 AM", modified = "7/26/2022 4:35:21 PM",
    trigger = Sonic1 && JamClassicEasy && S1NoDemo && S1ScrapBrain && !S1LevelSelect && S1SonicXPosition <= 0x17DF && S1SonicXPosition >=
               0x17AA && S1SonicYPosition <= 0x491 && S1SonicYPosition >= 0x470
)

achievement(
    title = "Was Robotnik Always This Easy?", description = "[Sonic 1, Easy] Defeat the Final Zone Boss & start chasing Robotnik within 35 seconds.", points = 10,
    id = 225232, badge = "250520", published = "6/9/2022 2:06:02 AM", modified = "7/26/2022 4:35:22 PM",
    trigger = Sonic1 && JamClassicEasy && S1NoDemo && S1Final && !S1LevelSelect && once(S1LeftBound
               >= 0x2450 && prev(S1LeftBound) < 0x2450 && S1RightBound == 0x2460) && never(S1LifeLost) && S1RightBound > 0x2460 && S1TimeSeconds < 0x23
)

achievement(
    title = "Thank You For Playing Spot The Difference", description = "[Sonic 1, Easy] Beat the entire game in one go. No emeralds required.", points = 10,
    id = 225233, badge = "250521", published = "6/9/2022 2:06:02 AM", modified = "7/26/2022 4:35:22 PM",
    trigger = Sonic1 && JamClassicEasy && !S1LevelSelect && once(S1GreenHill && S1NoDemo) && never(S1ScreenMode == 0x04) && 
              S1ScreenMode == 0x18
)

S1ZoneOrderLookup = {
    0: 0,
    1: 2,
    2: 4,
    3: 1,
    4: 3,
    5: 5
}

S1ZoneTitleLookup = {
    0: "Green Day",
    2: "Stained Glass and Marble",
    4: "Can't Stop The Spring",
    1: "Into The Labyrinth",
    3: "Lucky Star",
    5: "Brain Power (NOMA or Freezepop?)"
}

function S1ZoneBeatenCheevo(index) {
    zoneId = S1ZoneOrderLookup[index]
    zoneName = S1ZoneLookup[zoneId]
    title = S1ZoneTitleLookup[zoneId]
    desc = "H"
    endCondition = prev(S1BossFlag) <= 1 && S1BossFlag == 2
    if (zoneId != 1) {
        desc = "Defeat the boss and h"
        endCondition = prev(S1BossFlag) == 1 && S1BossFlag == 2
    }
    if (zoneId == 5) {
        desc = "Escape from the water trap in"
        endCondition = S1SonicYPosition <= 0x13 && S1SonicXPosition >= 0xE0A && S1SonicXPosition <= 0xEF5
    }
    else {
        desc = format("{0}it the capsule at the end of", desc)
    }
    achievement(
        id = 225234 + index,
        title = title,
        points = 10,
        description = format("[Sonic 1, Normal] {0} {1} Zone.", desc, zoneName),
        trigger = Sonic1 && JamClassicNormal && S1NoDemo && !S1LevelSelect &&
            S1ZoneId == zoneId && S1Act3 && endCondition
    )
}

for i in S1ZoneOrderLookup {
    S1ZoneBeatenCheevo(i)
}

achievement(
    title = "The Final Countdown", description = "[Sonic 1, Normal] Defeat Dr. Robotnik in the Final Zone.", points = 10,
    id = 225240, badge = "250528", published = "6/9/2022 2:06:04 AM", modified = "7/26/2022 4:35:24 PM",
    trigger = Sonic1 && JamClassicNormal && S1NoDemo && !S1LevelSelect && S1ScreenMode == 0x18
)

achievement(
    title = "The First Of...How Many Again?", description = "[Sonic 1, Normal] Collect your first chaos emerald.", points = 5,
    id = 225241, badge = "250529", published = "6/9/2022 2:06:05 AM", modified = "7/26/2022 4:35:25 PM",
    trigger = Sonic1 && JamClassicNormal && S1NoDemo && !S1LevelSelect && S1ScreenMode == 0x10 && S1EmeraldCount > prev(S1EmeraldCount) && 
              S1EmeraldCount == 0x01
)

achievement(
    title = "Feels Like We're Missing One...", description = "[Sonic 1, Normal] Collect all of the chaos emeralds.", points = 25,
    id = 225242, badge = "250530", published = "6/9/2022 2:06:05 AM", modified = "7/26/2022 4:35:25 PM",
    trigger = Sonic1 && JamClassicNormal && S1NoDemo && !S1LevelSelect && S1ScreenMode == 0x10 && S1EmeraldCount > prev(S1EmeraldCount) && 
              S1EmeraldCount == 0x06
)

achievement(
    title = "Morning Glory", description = "[Sonic 1, Normal] Beat the game with all six chaos emeralds.", points = 25,
    id = 225243, badge = "250531", published = "6/9/2022 2:06:05 AM", modified = "7/26/2022 4:35:25 PM",
    trigger = Sonic1 && JamClassicNormal && S1NoDemo && !S1LevelSelect && S1ScreenMode == 0x18 && S1EmeraldCount == 0x06
)

achievement(
    title = "Not Quite Super But Close Enough", description = "[Sonic 1, Normal] Have a shield, super speed, and invincibility at the same time.", points = 10,
    id = 225244, badge = "250532", published = "6/9/2022 2:06:06 AM", modified = "7/26/2022 4:35:26 PM",
    trigger = Sonic1 && JamClassicNormal && S1NoDemo && !S1LevelSelect && S1Invincible == 0x01 && S1Shield && S1SpeedShoes
)

achievement(
    title = "And Here's Your Host: Phil Moore!", description = "[Sonic 1, Normal] In one life, collect 35 rings in Green Hill Zone Act 1 in 30 seconds.", points = 5,
    id = 225245, badge = "250533", published = "6/9/2022 2:06:06 AM", modified = "7/26/2022 4:35:26 PM",
    trigger = Sonic1 && JamClassicNormal && S1NoDemo && !S1LevelSelect && S1GreenHill && S1Act1 &&                
              once(prev(S1ScreenMode) == 0x8c && S1ScreenMode == 0x0c) &&
              trigger_when(prev(S1Rings) < 0x23) && trigger_when(S1Rings >= 0x23) && 
              unless(once(S1LifeLost)) && unless(once(S1TimeSeconds >= 0x1E)) &&
              // Intentional always false for alt group reset.
              (always_false() || (never(S1ScreenMode != 0x0c)))
)

achievement(
    title = "Green Hill Perfection", description = "[Sonic 1, Normal] Defeat the Green Hill Zone boss without getting hit.", points = 10,
    id = 225246, badge = "250534", published = "6/9/2022 2:06:06 AM", modified = "7/26/2022 4:35:26 PM",
    trigger = Sonic1 && JamClassicNormal && S1NoDemo && !S1LevelSelect && S1GreenHill && S1Act3 && once(S1LeftBound
               == 0x2960 && prev(S1LeftBound) < 0x2960 && S1RightBound == 0x2960) && trigger_when(S1BossFlag ==
               0x02) && never(S1LifeLost) && never(S1AnimId == 0x1A) && 
              never(S1AnimId == 0x18) && never(S1Invincible < prev(S1Invincible)) && never(S1Rings <
               prev(S1Rings))
)

achievement(
    title = "Breakout Minus Paddle = ???", description = "[Sonic 1, Normal] In Marble Zone Act 2, break all 17 blocks consecutively without stopping.", points = 5,
    id = 225247, badge = "250535", published = "6/9/2022 2:06:07 AM", modified = "7/26/2022 4:35:27 PM",
    trigger = Sonic1 && JamClassicNormal && S1NoDemo && !S1LevelSelect && S1Marble && S1Act2 && S1SonicXPosition >
               0x1100 && S1SonicYPosition > 0x280 && once((S1Score - prev(S1Score)) == 0x0A) && 
              once((S1Score - prev(S1Score)) == 0x14) && once((S1Score - prev(S1Score))
               == 0x32) && repeated(12, (S1Score - prev(S1Score)) == 0x64) && repeated(2,
               (S1Score - prev(S1Score)) == 0x3E8)
)

achievement(
    title = "Marble Perfection", description = "[Sonic 1, Normal] Defeat the Marble Zone boss without getting hit.", points = 10,
    id = 225248, badge = "250536", published = "6/9/2022 2:06:07 AM", modified = "7/26/2022 4:35:27 PM",
    trigger = Sonic1 && JamClassicNormal && S1NoDemo && !S1LevelSelect && S1Marble && S1Act3 && once(S1LeftBound
               == 0x1800 && prev(S1LeftBound) < 0x1800 && S1RightBound == 0x1800) && trigger_when(S1BossFlag ==
               0x02) && never(S1LifeLost) && never(S1AnimId == 0x1A) && 
              never(S1AnimId == 0x18) && never(S1Invincible < prev(S1Invincible)) && never(S1Rings <
               prev(S1Rings))
)

achievement(
    title = "Spring To The Top. Not Literally.", description = "[Sonic 1, Normal] In Spring Yard Zone Act 2, take the upper exit.", points = 5,
    id = 225249, badge = "250537", published = "6/9/2022 2:06:07 AM", modified = "7/26/2022 4:35:27 PM",
    trigger = Sonic1 && JamClassicNormal && S1NoDemo && !S1LevelSelect && S1SpringYard && S1Act2 && S1SonicYPosition <
               0x500 && S1SonicXPosition >= 0x2960
)

achievement(
    title = "Spring Yard Perfection", description = "[Sonic 1, Normal] Defeat the Spring Yard Zone boss without getting hit.", points = 10,
    id = 225250, badge = "250538", published = "6/9/2022 2:06:08 AM", modified = "7/26/2022 4:35:28 PM",
    trigger = Sonic1 && JamClassicNormal && S1NoDemo && !S1LevelSelect && S1SpringYard && S1Act3 && once(S1LeftBound
               == 0x2C00 && prev(S1LeftBound) < 0x2C00 && S1RightBound == 0x2C00) && trigger_when(S1BossFlag ==
               0x02) && never(S1LifeLost) && never(S1AnimId == 0x1A) && 
              never(S1AnimId == 0x18) && never(S1Invincible < prev(S1Invincible)) && never(S1Rings <
               prev(S1Rings))
)

achievement(
    title = "The Hidden Labyrinth Path", description = "[Sonic 1, Normal] In Labyrinth Zone Act 1, bring 50 rings to the goal using the upper path.", points = 10,
    id = 225251, badge = "250539", published = "6/9/2022 2:06:08 AM", modified = "7/26/2022 4:35:28 PM",
    trigger = Sonic1 && JamClassicNormal && S1NoDemo && !S1LevelSelect && once(S1SonicXPosition
               > 0xE00 && S1SonicYPosition < 0x100) && once(S1Labyrinth && S1Act1 &&
               S1TimeSeconds < 0x05 && S1Rings == 0x00) && S1SonicXPosition >= 0x1A50 && S1Rings >= 0x32 && 
              never(!S1Act1) && never(!S1Labyrinth) && 
              never(S1LifeLost)
)

achievement(
    title = "Labyrinth Perfection", description = "[Sonic 1, Normal] Survive the Labyrinth Zone boss without getting hit or wet.", points = 10,
    id = 225252, badge = "250540", published = "6/9/2022 2:06:08 AM", modified = "7/26/2022 4:35:28 PM",
    trigger = Sonic1 && JamClassicNormal && S1NoDemo && !S1LevelSelect && S1Labyrinth && S1Act3 && once(S1SonicXPosition
               >= 0x1D00 && prev(S1SonicXPosition) < 0x1D00) && trigger_when(S1BossFlag == 0x02) && 
              never(S1LifeLost) && never(S1AnimId == 0x1A) && never(S1AnimId ==
               0x18) && never(S1Invincible < prev(S1Invincible)) && never(S1Rings < prev(S1Rings)) && 
              never(S1UnderWater == 0x01)
)

achievement(
    title = "Lower Night", description = "[Sonic 1, Normal] Clear Star Light Zone Act 1 using the lower goal post.", points = 10,
    id = 225253, badge = "250541", published = "6/9/2022 2:06:09 AM", modified = "7/26/2022 4:35:29 PM",
    trigger = Sonic1 && JamClassicNormal && S1NoDemo && !S1LevelSelect && S1StarLight && S1Act1 && S1SonicYPosition >=
               0x28E && S1SonicYPosition <= 0x2DC && S1SonicXPosition >= 0x2060
)

achievement(
    title = "Star Light Perfection", description = "[Sonic 1, Normal] Defeat the Star Light Zone boss using ONLY the seesaws without getting hit.", points = 25,
    id = 225254, badge = "250542", published = "6/9/2022 2:06:09 AM", modified = "7/26/2022 4:35:29 PM",
    trigger = Sonic1 && JamClassicNormal && S1NoDemo && !S1LevelSelect && S1StarLight && S1Act3 && once(S1LeftBound
               == 0x2000 && prev(S1LeftBound) < 0x2000 && S1RightBound == 0x2000) && trigger_when(S1BossFlag ==
               0x02) && never(S1LifeLost) && never(S1AnimId == 0x1A) && 
              never(S1AnimId == 0x18) && never(S1Invincible < prev(S1Invincible)) && never(S1Rings <
               prev(S1Rings)) && never((S1SonicYPosition < 0x250 && S1StarLightBoss && prev(S1StarLightBossHP)
               > S1StarLightBossHP))
)

achievement(
    title = "So That's How You Teleport Here", description = "[Sonic 1, Normal] In Scrap Brain Zone Act 2, take the secret teleporter path. 50 rings should get you in.", points = 10,
    id = 225255, badge = "250543", published = "6/9/2022 2:06:09 AM", modified = "7/26/2022 4:35:29 PM",
    trigger = Sonic1 && JamClassicNormal && S1NoDemo && !S1LevelSelect && S1ScrapBrain && S1Act2 && S1Rings >=
               0x32 && S1SonicXPosition == 0x894 && S1SonicYPosition == 0x8C
)

achievement(
    title = "Why Is This Here?", description = "[Sonic 1, Normal] In Scrap Brain Zone Act 3, break open the sunken 1-up monitor.", points = 10,
    id = 225256, badge = "250544", published = "6/9/2022 2:06:10 AM", modified = "7/26/2022 4:35:30 PM",
    trigger = Sonic1 && JamClassicNormal && S1NoDemo && !S1LevelSelect && S1Labyrinth && S1Act4 && S1SonicXPosition <=
               0xC1 && S1LifeCount - prev(S1LifeCount) == 1
)

achievement(
    title = "Final Perfection", description = "[Sonic 1, Normal] Defeat the Final Zone boss without getting hit. Yes, rings were added. Doesn't matter.", points = 10,
    id = 225257, badge = "250545", published = "6/9/2022 2:06:10 AM", modified = "7/26/2022 4:35:30 PM",
    trigger = Sonic1 && JamClassicNormal && S1NoDemo && !S1LevelSelect && S1ScrapBrain && S1Act3 && once(S1LeftBound
               >= 0x2450 && prev(S1LeftBound) < 0x2450 && S1RightBound == 0x2460) && trigger_when(S1RightBound >
               0x2460) && never(S1LifeLost) && never(S1AnimId == 0x1A) && 
              never(S1AnimId == 0x18) && never(S1Invincible < prev(S1Invincible)) && never(S1Rings <
               prev(S1Rings))
)

achievement(
    title = "Why The Hurry? No Transformation!", description = "[Sonic 1, Extra] Get all 6 chaos emeralds back to back via the Special Stage extra game.", points = 25,
    id = 225258, badge = "250546", published = "6/9/2022 2:06:10 AM", modified = "7/25/2022 10:11:32 PM",
    trigger = Sonic1 && !S1LevelSelect && JamSpecialStage && S1EmeraldCount == 0x06 && prev(S1EmeraldCount) == 0x05
)

Sonic1LevelLookup = {
    0: "Green Hill Zone Act 1",
    1: "Green Hill Zone Act 2",
    2: "Green Hill Zone Act 3",
    10: "Labyrinth Zone Act 1",
    11: "Labyrinth Zone Act 2",
    12: "Labyrinth Zone Act 3",
    13: "Scrap Brain Zone Act 3",
    20: "Marble Zone Act 1",
    21: "Marble Zone Act 2",
    22: "Marble Zone Act 3",
    30: "Star Light Zone Act 1",
    31: "Star Light Zone Act 2",
    32: "Star Light Zone Act 3",
    40: "Spring Yard Zone Act 1",
    41: "Spring Yard Zone Act 2",
    42: "Spring Yard Zone Act 3",
    50: "Scrap Brain Zone Act 1",
    51: "Scrap Brain Zone Act 2",
    52: "Final Zone"
}

S1TimeAttackLookup = {
    0: 3600,
    1: 3600,
    2: 7200,
    10: 14400,
    11: 10800,
    12: 18000,
    13: 3600,
    20: 7200,
    21: 10800,
    22: 18000,
    30: 7200,
    31: 3600,
    32: 9000,
    40: 12600,
    41: 7200,
    42: 14400,
    50: 9000,
    51: 18000,
    52: 7200
}

// A leaderboard function early? Well, the cheevo needs to share data.
function S1CommonBoardStart(index) {
    ord = Sonic1LevelOrderLookup[index]
    level = Sonic1LevelLookup[ord]
    zoneId = index / 3
    actId = index % 3
    return
        JamTimeAttack &&
        repeated(20, JamTimeAttackActive == 0x02) &&
        S1TimeElapsed > 500 &&
        JamTimeAttackActive == 1 && JamClassicElapsedTime == prev(JamClassicElapsedTime) &&
        JamTimeAttackZone == zoneId && JamTimeAttackAct == actId &&
            S1TimeDecimal != 0xff && S1TimeSeconds != 0xff && S1TimeMinutes != 0xff &&
            Sonic1BeatenLevelLookup[ord] &&
            never(S1LifeLost) && never(!Sonic1)
}


function S1TimeAttackCheevo(index) {
    ord = Sonic1LevelOrderLookup[index]
    level = Sonic1LevelLookup[ord]
    achievement(
        id = 225259 + index,
        title = format("Speeding In {0}", level),
        description = format("[Sonic 1, Extra] Beat the best Time Attack time for {0}.", level),
        points = 10,
        trigger = S1CommonBoardStart(index) && S1TimeElapsed < S1TimeAttackLookup[ord]
    )
}

for i in range(0, 18) {
    S1TimeAttackCheevo(i)
}

// Sonic 2 Achievements

S2NoDeath = bit2(0x1fb025) == 0

S2ClearedLevel = bit0(0x1FFE1F) < prev(bit0(0x1FFE1F))

SonicAndTails = byte(0x1fff72) == 0
SonicAlone = byte(0x1fff72) == 1
TailsAlone = byte(0x1fff72) == 2
SonicPlayable = byte(0x1fff72) < 2

// This one is also for Sonic 3
S2EmeraldCount = byte(0x1fffb0)
S2NoLevelSelect = byte(0x1fffd0) == 0
S2NoDebug = byte(0x1ffffb) == 0

S2ZoneClearOrder = [0, 0xd, 0xf, 0xc, 0x7, 0xb, 0xa, 0x5, 0x6] //, 0xe]
S2ZoneClearOrderTitle = [
    "Green Slope",
    "Chemical Romance",
    "Aqua Man",
    "Gambler's Delight",
    "Hilly Billy",
    "Mystical Caverns",
    "Oily Oceans",
    "Where's Superman",
    "Metal Bird"
]

function S2ClearCheevo(index) {
    zoneId = S2ZoneClearOrder[index]
    act = S1Act2
    if zoneId == 0x5 || zoneId == 0x6 {
        act = S1Act1
    }
    cleared = S1ZoneId == zoneId && S2ClearedLevel
    if zoneId == 0x6 {
        cleared = prev(S1ZoneId) == zoneId && S1ZoneId == 0xe
    }
    achievement(
        title = S2ZoneClearOrderTitle[index],
        description = format("[Sonic 2, Normal] Finish the {0} Zone", S2ZoneLookup[zoneId]),
        points = 5,
        id = 226072 + index,
        trigger = Sonic2 && S2NoDebug && S1NoDemo && S2NoLevelSelect && JamClassicNormal && S2NoDeath && act && cleared
    )
}

for i in range(0, 8){
    S2ClearCheevo(i)
}

achievement(
    title = "Blue Justice", description = "[Sonic 2, Normal] Finish the game as Sonic", points = 10,
    id = 226081, badge = "250658", published = "6/12/2022 11:25:26 PM", modified = "7/26/2022 4:48:52 PM",
    trigger = Sonic2 && S2NoDebug && S1NoDemo && S2NoLevelSelect && JamClassicNormal && S2NoDeath && S1ZoneId
               == 0x0E && S1Act1 && prev(S1ScreenMode) == 0x0C && S1ScreenMode == 0x20 && 
              SonicPlayable
)

achievement(
    title = "Twin Justice", description = "[Sonic 2, Normal] Finish the game as just Tails", points = 10,
    id = 226083, badge = "250660", published = "6/12/2022 11:25:27 PM", modified = "7/26/2022 4:48:52 PM",
    trigger = Sonic2 && S2NoDebug && S1NoDemo && S2NoLevelSelect && JamClassicNormal && S2NoDeath && S1ZoneId
               == 0x0E && S1Act1 && prev(S1ScreenMode) == 0x0C && S1ScreenMode == 0x20 && 
              TailsAlone
)

achievement(
    title = "Chaos Collector", description = "[Sonic 2, Normal] Collect all 7 Emeralds", points = 10,
    id = 226084, badge = "250661", published = "6/12/2022 11:25:27 PM", modified = "7/26/2022 4:48:53 PM",
    trigger = S2NoDebug && S1NoDemo && S2NoLevelSelect && JamClassicNormal && 
              S2NoDeath && prev(S2EmeraldCount) == 0x06 && measured(S2EmeraldCount == 0x07,
               when=Sonic2)
)

achievement(
    title = "Yellow Justice", description = "[Sonic 2, Normal] Finish the game with all 7 emeralds", points = 25,
    id = 226082, badge = "250659", published = "6/12/2022 11:25:27 PM", modified = "7/26/2022 4:48:53 PM",
    trigger = Sonic2 && S2NoDebug && S1NoDemo && S2NoLevelSelect && JamClassicNormal && S2NoDeath && S1ZoneId
               == 0x0E && S1Act1 && prev(S1ScreenMode) == 0x0C && S1ScreenMode == 0x20 && 
              S2EmeraldCount == 0x07
)

S2EmeraldBossHP = byte(0x1fb520)

achievement(
    title = "Boss Hog - Emerald Hill", description = "[Sonic 2 | S2K, Normal] Defeat Robotnik before he reaches the right side of the screen (Level Select allowed)", points = 5,
    id = 232631, badge = "262111", published = "7/9/2022 6:16:24 PM", modified = "7/26/2022 4:48:54 PM",
    trigger = S2AK && 
              S2NoDebug && S1NoDemo && JamClassicNormal && S2NoDeath && 
              never(S1ZoneId != 0x00) && never(S1ActId != 0x01) && once(word(0x1FB008) > 0x2800 &&
               word(0x1FB008) < 0x2900) && S1BossFlag == 0x00 && never(bit0(0x1FB523) < prev(bit0(0x1FB523))) && 
              trigger_when(prev(S2EmeraldBossHP) == 0x01) && trigger_when(S2EmeraldBossHP == 0x00)
)

achievement(
    title = "Boss Hog - Chemical Plant", description = "[Sonic 2 | S2K, Normal] Defeat Robotnik before he reaches the left side of the screen (Level Select allowed)", points = 3,
    id = 232632, badge = "262112", published = "7/9/2022 6:16:25 PM", modified = "7/26/2022 4:48:54 PM",
    trigger = S2AK && 
              S2NoDebug && S1NoDemo && JamClassicNormal && S2NoDeath && 
              never(S1ZoneId != 0x0D) && never(S1ActId != 0x01) && once(word(0x1FB008) > 0x2900 &&
               word(0x1FB008) < 0x29E0) && S1BossFlag == 0x00 && never((word(0x1FB630) > 0x2A50 && word(0x1FB630) <
               0x2A60)) && trigger_when(prev(byte(0x1FB620)) == 0x01) && trigger_when(byte(0x1FB620) == 0x00)
)

achievement(
    title = "Boss Hog - Aquatic", description = "[Sonic 2 | S2K, Normal] Defeat Robotnik without taking damage and without jumping after damaging him (No SS, Level Select allowed)", points = 5,
    id = 232633, badge = "262113", published = "7/9/2022 6:16:25 PM", modified = "7/26/2022 4:48:55 PM",
    trigger = S2AK && 
              S2NoDebug && S1NoDemo && JamClassicNormal && S2NoDeath && 
              never(S1ZoneId != 0x0F) && never(S1ActId != 0x01) && once(word(0x1FB008) > 0x2900 &&
               word(0x1FB008) < 0x2A00) && S1BossFlag == 0x00 && never((byte(0x1FB433) > 0x00 && byte(0x1FB433) <
               0x08 && bit0(0x1FB03D) == 0x01)) && never(byte(0x1FF65E) == 0xFF) && never(byte(0x1FB030) == 0x78) && 
              trigger_when(prev(byte(0x1FB433)) == 0x01) && trigger_when(byte(0x1FB433) == 0x00)
)

achievement(
    title = "Boss Hog - Casino Night", description = "[Sonic 2 | S2K, Normal] Defeat Robotnik without taking damage or pressing left or right after damaging the boss (No SS, Level Select allowed)", points = 5,
    id = 232682, badge = "262114", published = "7/9/2022 7:44:54 PM", modified = "7/26/2022 4:48:55 PM",
    trigger = S2AK && 
              S2NoDebug && S1NoDemo && JamClassicNormal && S2NoDeath && 
              never(S1ZoneId != 0x0C) && never(S1ActId != 0x01) && once(word(0x1FB008) > 0x2800 &&
               word(0x1FB008) < 0x2860) && S1BossFlag == 0x00 && never(byte(0x1FF65E) == 0xFF) && 
              never(byte(0x1FB030) == 0x78) && trigger_when(prev(byte(0x1FB673)) == 0x01) && trigger_when(byte(0x1FB673)
               == 0x00) && never((byte(0x1FB673) < 0x08 && byte(0x1FB673) > 0x00 && bit2(0x1030EB) == 0x00)) && 
              never((byte(0x1FB673) < 0x08 && byte(0x1FB673) > 0x00 && bit3(0x1030EB) == 0x00))
)

achievement(
    title = "Boss Hog - Hill Top", description = "[Sonic 2 | S2K, Normal] Defeat Robotnik without taking damage and without jumping after the boss music starts (No SS, Level Select allowed)", points = 5,
    id = 232634, badge = "262115", published = "7/9/2022 6:16:25 PM", modified = "7/26/2022 4:48:56 PM",
    trigger = S2AK && 
              S2NoDebug && S1NoDemo && JamClassicNormal && S2NoDeath && 
              never(S1ZoneId != 0x07) && never(S1ActId != 0x01) && once(word(0x1FB008) > 0x2EA0 &&
               word(0x1FB008) < 0x2ED0) && S1BossFlag == 0x00 && never((byte(0x11812C) == 0x13 && bit0(0x1FB03D) >
               prev(bit0(0x1FB03D)))) && never(byte(0x1FF65E) == 0xFF) && never(byte(0x1FB030) == 0x78) && 
              trigger_when(prev(byte(0x1FB4F3)) == 0x01) && trigger_when(byte(0x1FB4F3) == 0x00) && never(word(0x1FB534)
               == 0x560)
)

achievement(
    title = "Boss Hog - Mystic Cave", description = "[Sonic 2 | S2K, Normal] Defeat Robotnik without taking damage or jumping and without letting him return to the ceiling (No SS, Level Select allowed)", points = 5,
    id = 232635, badge = "262116", published = "7/9/2022 6:16:25 PM", modified = "7/26/2022 4:48:56 PM",
    trigger = S2AK && 
              S2NoDebug && S1NoDemo && JamClassicNormal && S2NoDeath && 
              never(S1ZoneId != 0x0B) && never(S1ActId != 0x01) && once(word(0x1FB008) > 0x2000 &&
               word(0x1FB008) < 0x2090) && S1BossFlag == 0x00 && never((byte(0x11812C) == 0x13 && bit0(0x1FB03D) >
               prev(bit0(0x1FB03D)))) && never(byte(0x1FF65E) == 0xFF) && never(byte(0x1FB030) == 0x78) && 
              trigger_when(prev(byte(0x1FB533)) == 0x01) && trigger_when(byte(0x1FB533) == 0x00) && 
              never((word(0x1FB534) > 0x560 && word(0x1FB534) == 0x560))
)

achievement(
    title = "Boss Hog - Oil Ocean", description = "[Sonic 2 | S2K, Normal] Defeat Robotnik without letting him escape back under the oil (No SS, Level Select allowed)", points = 10,
    id = 232636, badge = "262117", published = "7/9/2022 6:16:26 PM", modified = "7/26/2022 4:48:57 PM",
    trigger = S2AK && 
              S2NoDebug && S1NoDemo && JamClassicNormal && S2NoDeath && 
              never(S1ZoneId != 0x0A) && never(S1ActId != 0x01) && once(word(0x1FB008) > 0x2770 &&
               word(0x1FB008) < 0x27E0) && S1BossFlag == 0x00 && never((byte(0x11812C) == 0x13 &&
               prev(word(0x1FB518)) == 0x300 && word(0x1FB518) < 0x300)) && never(byte(0x1FF65E) == 0xFF) && 
              trigger_when(prev(byte(0x1FB533)) == 0x01) && trigger_when(byte(0x1FB533) == 0x00)
)

achievement(
    title = "Boss Hog - Metropolis", description = "[Sonic 2 | S2K, Normal] Defeat Robotnik without taking damage (No SS, Level Select allowed)", points = 5,
    id = 232637, badge = "262118", published = "7/9/2022 6:16:26 PM", modified = "7/26/2022 4:48:57 PM",
    trigger = S2AK && 
              S2NoDebug && S1NoDemo && JamClassicNormal && S2NoDeath && 
              never(S1ZoneId != 0x05) && never(S1ActId != 0x00) && once(word(0x1FB008) > 0x29E0 &&
               word(0x1FB008) < 0x2A00) && S1BossFlag == 0x00 && never(byte(0x1FF65E) == 0xFF) && 
              never(byte(0x1FB030) == 0x78) && trigger_when(prev(byte(0x1FB533)) == 0x01) && trigger_when(byte(0x1FB533)
               == 0x00)
)

achievement(
    title = "Boss Hog - Winged Fortress", description = "[Sonic 2 | S2K, Normal] Defeat Robotnik without taking damage or touching the ground after damaging the boss (No SS, Level Select allowed)", points = 10,
    id = 232638, badge = "262119", published = "7/9/2022 6:16:26 PM", modified = "7/26/2022 4:48:58 PM",
    trigger = S2AK && 
              S2NoDebug && S1NoDemo && JamClassicNormal && S2NoDeath && 
              never(S1ZoneId != 0x06) && never(S1ActId != 0x00) && once(word(0x1FB008) > 0x2A80 &&
               word(0x1FB008) < 0x2AD0) && S1BossFlag == 0x00 && never(byte(0x1FF65E) == 0xFF) && 
              never(byte(0x1FB030) == 0x78) && trigger_when(prev(byte(0x1FB460)) == 0x01) && trigger_when(byte(0x1FB460)
               == 0x00) && never((byte(0x1FB460) < 0x08 && byte(0x1FB460) > 0x00 && word(0x1FB00C) == 0x4EC))
)

achievement(
    title = "Boss Hog - Death Egg", description = "[Sonic 2 | S2K, Normal] Finish Death Egg without taking damage (No SS, Level Select allowed)", points = 10,
    id = 232639, badge = "262120", published = "7/9/2022 6:16:27 PM", modified = "7/26/2022 4:37:45 PM",
    trigger = S2AK && 
              S2NoDebug && S1NoDemo && JamClassicNormal && never((prior(word(0x1FB008))
               == 0x00 && word(0x1FB008) == 0x60)) && never(S1ZoneId != 0x0E) && never(S1ActId != 0x00) && 
              once(word(0x1FB008) > 0x200 && word(0x1FB008) < 0x230) && S1BossFlag == 0x00 && never(byte(0x1FF65E)
               == 0xFF) && never(byte(0x1FB030) == 0x78) && trigger_when(repeated(2, prev(byte(0x1FB460)) == 0x01 &&
               byte(0x1FB460) == 0x00))
)

achievement(
    title = "Quick Kill - Emerald Hill", description = "[Sonic 2 | S2K, Easy] Defeat Robotnik before he can turn right (Level Select allowed)", points = 2,
    id = 232630, badge = "262111", published = "7/9/2022 6:16:24 PM", modified = "7/26/2022 4:48:59 PM",
    trigger = S2AK && 
              S2NoDebug && S1NoDemo && JamClassicEasy && S2NoDeath && 
              never(S1ZoneId != 0x00) && never(S1ActId != 0x01) && once(word(0x1FB008) > 0x2800 &&
               word(0x1FB008) < 0x2900) && S1BossFlag == 0x00 && never(bit0(0x1FB523) == 0x01) && 
              trigger_when(prev(byte(0x1FB520)) == 0x01) && trigger_when(byte(0x1FB520) == 0x00)
)

achievement(
    title = "Spot the Difference - Chemical Plant", description = "[Sonic 2 | S2K, Easy]  Find all 4 sets of disabled chemical ball shooters (Level Select allowed)", points = 3,
    id = 232640, badge = "262121", published = "7/9/2022 6:16:27 PM", modified = "7/26/2022 4:48:59 PM",
    trigger = S2NoDebug && S1NoDemo && JamClassicEasy && never(S1ZoneId !=
               0x0D) && measured(tally(4, 
                  once(word(0x1FB008) >= 0xC8D && word(0x1FB008) <= 0xEF3 && word(0x1FB00C) >= 0x540 &&
                   word(0x1FB00C) <= 0x56C), 
                  once(word(0x1FB008) >= 0x1109 && word(0x1FB008) <= 0x1177 && word(0x1FB00C) >= 0x240 &&
                   word(0x1FB00C) <= 0x26C), 
                  once(word(0x1FB008) >= 0x1908 && word(0x1FB008) <= 0x1A75 && word(0x1FB00C) >= 0x600 &&
                   word(0x1FB00C) <= 0x6AC), 
                  once(word(0x1FB008) >= 0x2308 && word(0x1FB008) <= 0x237C && word(0x1FB00C) >= 0x3C0 &&
                   word(0x1FB00C) <= 0x42C)
              ), when=(dword(0x102FF8) == 0x83940603 || dword(0x102FF8) ==
               0x83AC0603) && dword(0x102FFC) == 0x1FE00600)
)

achievement(
    title = "Spot the Difference - Aquatic Ruins", description = "[Sonic 2 | S2K, Easy] Find all 4 new underwater safety springs in Aquatic Ruins (Level Select allowed)", points = 2,
    id = 232641, badge = "262122", published = "7/9/2022 6:16:28 PM", modified = "7/26/2022 4:49:00 PM",
    trigger = S2NoDebug && S1NoDemo && JamClassicEasy && never(S1ZoneId !=
               0x0F) && measured(tally(4, 
                  once(word(0x1FB008) >= 0x1000 && word(0x1FB008) <= 0x1050 && word(0x1FB00C) >= 0x500 &&
                   bit0(0x1FB02D) > prev(bit0(0x1FB02D))), 
                  once(word(0x1FB008) >= 0x1210 && word(0x1FB008) <= 0x1270 && word(0x1FB00C) >= 0x500 &&
                   bit0(0x1FB02D) > prev(bit0(0x1FB02D))), 
                  once(word(0x1FB008) >= 0x1540 && word(0x1FB008) <= 0x1590 && word(0x1FB00C) >= 0x500 &&
                   bit0(0x1FB02D) > prev(bit0(0x1FB02D))), 
                  once(word(0x1FB008) >= 0x1820 && word(0x1FB008) <= 0x1875 && word(0x1FB00C) >= 0x500 &&
                   bit0(0x1FB02D) > prev(bit0(0x1FB02D)))
              ), when=(dword(0x102FF8) == 0x83940603 || dword(0x102FF8) ==
               0x83AC0603) && dword(0x102FFC) == 0x1FE00600)
)

achievement(
    title = "Spot the Difference - Casino Night", description = "[Sonic 2 | S2K, Easy] Find all 4 sets of missing spikes in Casino Night (Level Select allowed)", points = 3,
    id = 232642, badge = "262123", published = "7/9/2022 6:16:28 PM", modified = "7/26/2022 4:49:00 PM",
    trigger = S2NoDebug && S1NoDemo && JamClassicEasy && never(S1ZoneId !=
               0x0C) && measured(tally(4, 
                  once(word(0x1FB008) >= 0x900 && word(0x1FB008) <= 0x980 && word(0x1FB00C) >= 0x700 &&
                   word(0x1FB00C) <= 0x770), 
                  once(word(0x1FB008) >= 0xB70 && word(0x1FB008) <= 0xBC0 && word(0x1FB00C) >= 0x600 &&
                   word(0x1FB00C) <= 0x630), 
                  once(word(0x1FB008) >= 0x1540 && word(0x1FB008) <= 0x1590 && word(0x1FB00C) >= 0x440 &&
                   word(0x1FB00C) <= 0x480), 
                  once(word(0x1FB008) >= 0x1A00 && word(0x1FB008) <= 0x1A50 && word(0x1FB00C) >= 0x2C0 &&
                   word(0x1FB00C) <= 0x2F0)
              ), when=(dword(0x102FF8) == 0x83940603 || dword(0x102FF8) ==
               0x83AC0603) && dword(0x102FFC) == 0x1FE00600)
)

achievement(
    title = "Spot the Difference - Hill Top", description = "[Sonic 2 | S2K, Easy] Find all 4 sets new of safety platforms in Hill Top", points = 3,
    id = 232643, badge = "262124", published = "7/9/2022 6:16:28 PM", modified = "7/26/2022 4:49:01 PM",
    trigger = S2NoDebug && S1NoDemo && JamClassicEasy && never(S1ZoneId !=
               0x07) && measured(tally(4, 
                  once(word(0x1FB008) >= 0x185 && word(0x1FB008) <= 0x375 && word(0x1FB00C) >= 0x530 &&
                   word(0x1FB00C) <= 0x570), 
                  once(word(0x1FB008) >= 0x13BC && word(0x1FB008) <= 0x13F5 && word(0x1FB00C) >= 0x1D0 &&
                   word(0x1FB00C) <= 0x220), 
                  once(word(0x1FB008) >= 0x14A8 && word(0x1FB008) <= 0x14F0 && word(0x1FB00C) >= 0x3E0 &&
                   word(0x1FB00C) <= 0x420), 
                  once(word(0x1FB008) >= 0x12A0 && word(0x1FB008) <= 0x1460 && word(0x1FB00C) >= 0x698 &&
                   word(0x1FB00C) <= 0x700)
              ), when=(dword(0x102FF8) == 0x83940603 || dword(0x102FF8) ==
               0x83AC0603) && dword(0x102FFC) == 0x1FE00600)
)

achievement(
    title = "Spot the Difference - Mystic Cave", description = "[Sonic 2 | S2K, Easy] Find all 7 sets new of safety platforms or missing spikes in Mystic Cave", points = 3,
    id = 232644, badge = "262125", published = "7/9/2022 6:16:28 PM", modified = "7/26/2022 4:49:01 PM",
    trigger = S2NoDebug && S1NoDemo && JamClassicEasy && never(S1ZoneId !=
               0x0B) && measured(tally(7, 
                  once(word(0x1FB008) >= 0x389 && word(0x1FB008) <= 0x473 && word(0x1FB00C) == 0x795), 
                  once(word(0x1FB008) >= 0x650 && word(0x1FB008) <= 0x675 && word(0x1FB00C) == 0x72C), 
                  once(word(0x1FB008) >= 0xC8A && word(0x1FB008) <= 0xD75 && word(0x1FB00C) == 0x76C), 
                  once(word(0x1FB008) >= 0x12CA && word(0x1FB008) <= 0x1310 && word(0x1FB00C) >= 0x690 &&
                   word(0x1FB00C) <= 0x6AC), 
                  once(word(0x1FB008) >= 0x17AA && word(0x1FB008) <= 0x17E0 && word(0x1FB00C) >= 0x650 &&
                   word(0x1FB00C) <= 0x6D0), 
                  once(word(0x1FB008) >= 0x1700 && word(0x1FB008) <= 0x1739 && word(0x1FB00C) >= 0x560 &&
                   word(0x1FB00C) <= 0x570), 
                  once(word(0x1FB008) >= 0x1B50 && word(0x1FB008) <= 0x1B90 && word(0x1FB00C) >= 0x6AC &&
                   word(0x1FB00C) <= 0x6C0)
              ), when=(dword(0x102FF8) == 0x83940603 || dword(0x102FF8) ==
               0x83AC0603) && dword(0x102FFC) == 0x1FE00600)
)

achievement(
    title = "Spot the Difference - Oil Ocean", description = "[Sonic 2 | S2K, Easy] Find 7 sets of changes in Oil Ocean", points = 4,
    id = 232645, badge = "262126", published = "7/9/2022 6:16:29 PM", modified = "7/26/2022 4:49:02 PM",
    trigger = S2NoDebug && S1NoDemo && JamClassicEasy && never(S1ZoneId !=
               0x0A) && measured(tally(7, 
                  once(word(0x1FB008) >= 0x4C0 && word(0x1FB008) <= 0x50A && word(0x1FB00C) >= 0x540 &&
                   word(0x1FB00C) <= 0x570), 
                  once(word(0x1FB008) >= 0xAEA && word(0x1FB008) <= 0xAF5 && word(0x1FB00C) == 0x50C), 
                  once(word(0x1FB008) >= 0x14A8 && word(0x1FB008) <= 0x14F0 && word(0x1FB00C) >= 0x3E0 &&
                   word(0x1FB00C) <= 0x420), 
                  once(word(0x1FB008) >= 0x12A0 && word(0x1FB008) <= 0x1460 && word(0x1FB00C) >= 0x698 &&
                   word(0x1FB00C) <= 0x700), 
                  once(word(0x1FB008) >= 0xFCA && word(0x1FB008) <= 0xFEB && word(0x1FB00C) >= 0x530 &&
                   word(0x1FB00C) <= 0x550 && bit4(0x1FB01C) > prev(bit4(0x1FB01C))), 
                  once(word(0x1FB008) >= 0x110A && word(0x1FB008) <= 0x1175 && word(0x1FB00C) == 0x28C), 
                  once(word(0x1FB008) >= 0x1A0A && word(0x1FB008) <= 0x1A75 && word(0x1FB00C) == 0x40C), 
                  once(word(0x1FB008) >= 0x1B8A && word(0x1FB008) <= 0x1C02 && word(0x1FB00C) == 0x40C), 
                  once(word(0x1FB008) >= 0x200A && word(0x1FB008) <= 0x2075 && word(0x1FB00C) == 0x28C), 
                  once(word(0x1FB008) >= 0x22EA && word(0x1FB008) <= 0x2475 && word(0x1FB00C) >= 0x50C &&
                   word(0x1FB00C) <= 0x68C), 
                  once(word(0x1FB008) >= 0x1E80 && word(0x1FB008) <= 0x1F06 && word(0x1FB00C) >= 0x520 &&
                   word(0x1FB00C) <= 0x5CA)
              ), when=(dword(0x102FF8) == 0x83940603 || dword(0x102FF8) ==
               0x83AC0603) && dword(0x102FFC) == 0x1FE00600)
)

achievement(
    title = "Spot the Difference - Metropolis", description = "[Sonic 2 | S2K, Easy] Find 7 sets of changes in Metropolis", points = 4,
    id = 232646, badge = "262127", published = "7/9/2022 6:16:29 PM", modified = "7/26/2022 4:49:03 PM",
    trigger = S2NoDebug && S1NoDemo && JamClassicEasy && never(S1ZoneId !=
               0x04) && measured(tally(7, 
                  once(word(0x1FB008) >= 0x70A && word(0x1FB008) <= 0x775 && word(0x1FB00C) >= 0xAC &&
                   word(0x1FB00C) <= 0xCC), 
                  once(word(0x1FB008) >= 0xCD0 && word(0x1FB008) <= 0xDF5 && word(0x1FB00C) >= 0xB0 &&
                   word(0x1FB00C) <= 0xF0), 
                  once(word(0x1FB008) >= 0x10FE && word(0x1FB008) <= 0x1175 && word(0x1FB00C) == 0xEC), 
                  once(word(0x1FB008) >= 0x130A && word(0x1FB008) <= 0x1315 && word(0x1FB00C) == 0x16C), 
                  once(word(0x1FB008) >= 0x188A && word(0x1FB008) <= 0x18B0 && word(0x1FB00C) == 0x4EC), 
                  once(word(0x1FB008) >= 0x1900 && word(0x1FB008) <= 0x1980 && word(0x1FB00C) >= 0x4C5 &&
                   word(0x1FB00C) <= 0x4EC), 
                  once(word(0x1FB008) >= 0x16AB && word(0x1FB008) <= 0x17C8 && word(0x1FB00C) >= 0xB0 &&
                   word(0x1FB00C) <= 0xCF), 
                  once(word(0x1FB008) >= 0xE8A && word(0x1FB008) <= 0xEF5 && word(0x1FB00C) >= 0x456 &&
                   word(0x1FB00C) <= 0x46C)
              ), when=(dword(0x102FF8) == 0x83940603 || dword(0x102FF8) ==
               0x83AC0603) && dword(0x102FFC) == 0x1FE00600)
)

achievement(
    title = "Quick Kill - Death Egg", description = "[Sonic 2 | S2K, Easy] Clear Death Egg in under 32 seconds", points = 5,
    id = 232647, badge = "262120", published = "7/9/2022 6:16:30 PM", modified = "7/26/2022 4:49:03 PM",
    trigger = S2AK && 
              S2NoDebug && S1NoDemo && JamClassicEasy && S2NoDeath && 
              S1ZoneId == 0x0E && prev(S1ScreenMode) == 0x0C && trigger_when(S1ScreenMode == 0x20) && 
              (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) <= 0x780
)

achievement(
    title = "Speeding in Emerald Hill 1", description = "[Sonic 2, Extra] Clear Emerald Hill Zone act 1 in Time Attack in 0:25 or less", points = 5,
    id = 230533, badge = "255714", published = "6/29/2022 12:22:04 AM", modified = "7/25/2022 10:11:50 PM",
    trigger = Sonic2 && JamTimeAttackZone == 0x00 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x5DC && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               byte(0x1FFE13) < prior(byte(0x1FFE13)))
)

achievement(
    title = "Speeding in Emerald Hill 2", description = "[Sonic 2, Extra] Clear Emerald Hill Zone act 2 in Time Attack in 1:00 or less", points = 5,
    id = 230534, badge = "255715", published = "6/29/2022 12:22:04 AM", modified = "7/25/2022 10:11:50 PM",
    trigger = Sonic2 && JamTimeAttackZone == 0x00 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0xE10 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               byte(0x1FFE13) < prior(byte(0x1FFE13)))
)

achievement(
    title = "Speeding in Chemical Plant 1", description = "[Sonic 2, Extra] Clear Chemical Plantl Zone act 1 in Time Attack in 0:35 or less", points = 5,
    id = 230535, badge = "255716", published = "6/29/2022 12:22:05 AM", modified = "7/25/2022 10:11:50 PM",
    trigger = Sonic2 && JamTimeAttackZone == 0x01 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0xA8C && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               byte(0x1FFE13) < prior(byte(0x1FFE13)))
)

achievement(
    title = "Speeding in Chemical Plant 2", description = "[Sonic 2, Extra] Clear Chemical Plant Zone act 2 in Time Attack in 1:00 or less", points = 5,
    id = 230536, badge = "255717", published = "6/29/2022 12:22:05 AM", modified = "7/25/2022 10:11:51 PM",
    trigger = Sonic2 && JamTimeAttackZone == 0x01 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0xE10 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               byte(0x1FFE13) < prior(byte(0x1FFE13)))
)

achievement(
    title = "Speeding in Aquatic Ruin 1", description = "[Sonic 2, Extra] Clear Aquatic Ruin Zone act 1 in Time Attack in 0:35 or less", points = 5,
    id = 230537, badge = "255718", published = "6/29/2022 12:22:05 AM", modified = "7/25/2022 10:11:51 PM",
    trigger = Sonic2 && JamTimeAttackZone == 0x02 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x834 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               byte(0x1FFE13) < prior(byte(0x1FFE13)))
)

achievement(
    title = "Speeding in Aquatic Ruin 2", description = "[Sonic 2, Extra] Clear Aquatic Ruin Zone act 2 in Time Attack in 1:15 or less", points = 5,
    id = 230538, badge = "255719", published = "6/29/2022 12:22:06 AM", modified = "7/25/2022 10:11:52 PM",
    trigger = Sonic2 && JamTimeAttackZone == 0x02 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x1194 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               byte(0x1FFE13) < prior(byte(0x1FFE13)))
)

achievement(
    title = "Speeding in Casino Night 1", description = "[Sonic 2, Extra] Clear Casino Night Zone act 1 in Time Attack in 0:55 or less", points = 5,
    id = 230539, badge = "255720", published = "6/29/2022 12:22:06 AM", modified = "7/25/2022 10:11:52 PM",
    trigger = Sonic2 && JamTimeAttackZone == 0x03 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0xCE4 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               byte(0x1FFE13) < prior(byte(0x1FFE13)))
)

achievement(
    title = "Speeding in Casino Night 2", description = "[Sonic 2, Extra] Clear Casino Night Zone act 2 in Time Attack in 2:00 or less", points = 5,
    id = 230540, badge = "255721", published = "6/29/2022 12:22:06 AM", modified = "7/25/2022 10:11:52 PM",
    trigger = Sonic2 && JamTimeAttackZone == 0x03 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x1C20 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               byte(0x1FFE13) < prior(byte(0x1FFE13)))
)

achievement(
    title = "Speeding in Hill Top 1", description = "[Sonic 2, Extra] Clear Hill Topl Zone act 1 in Time Attack in 1:30 or less", points = 5,
    id = 230541, badge = "255722", published = "6/29/2022 12:22:07 AM", modified = "7/25/2022 10:11:53 PM",
    trigger = Sonic2 && JamTimeAttackZone == 0x04 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x1518 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               byte(0x1FFE13) < prior(byte(0x1FFE13)))
)

achievement(
    title = "Speeding in Hill Top 2", description = "[Sonic 2, Extra] Clear Hill Top Zone act 2 in Time Attack in 1:30 or less", points = 5,
    id = 230542, badge = "255723", published = "6/29/2022 12:22:07 AM", modified = "7/25/2022 10:11:53 PM",
    trigger = Sonic2 && JamTimeAttackZone == 0x04 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x1518 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               byte(0x1FFE13) < prior(byte(0x1FFE13)))
)

achievement(
    title = "Speeding in Mystic Cave 2", description = "[Sonic 2, Extra] Clear Mystic Cave Zone act 2 in Time Attack in 1:10 or less", points = 5,
    id = 230543, badge = "255723", published = "6/29/2022 12:22:07 AM", modified = "7/25/2022 10:11:53 PM",
    trigger = Sonic2 && JamTimeAttackZone == 0x05 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x1068 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               byte(0x1FFE13) < prior(byte(0x1FFE13)))
)

achievement(
    title = "Speeding in Mystic Cave 1", description = "[Sonic 2, Extra] Clear Mystic Cave Zone act 1 in Time Attack in 1:10 or less", points = 5,
    id = 230544, badge = "255724", published = "6/29/2022 12:22:08 AM", modified = "7/25/2022 10:11:54 PM",
    trigger = Sonic2 && JamTimeAttackZone == 0x05 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x1068 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               byte(0x1FFE13) < prior(byte(0x1FFE13)))
)

achievement(
    title = "Speeding in Oil Ocean 1", description = "[Sonic 2, Extra] Clear Oil Ocean Zone act 1 in Time Attack in 1:05 or less", points = 5,
    id = 230545, badge = "255725", published = "6/29/2022 12:22:08 AM", modified = "7/25/2022 10:11:54 PM",
    trigger = Sonic2 && JamTimeAttackZone == 0x06 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0xF3C && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               byte(0x1FFE13) < prior(byte(0x1FFE13)))
)

achievement(
    title = "Speeding in Oil Ocean 2", description = "[Sonic 2, Extra] Clear Oil Ocean Zone act 2 in Time Attack in 1:20 or less", points = 5,
    id = 230546, badge = "255726", published = "6/29/2022 12:22:08 AM", modified = "7/25/2022 10:11:54 PM",
    trigger = Sonic2 && JamTimeAttackZone == 0x06 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x12C0 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               byte(0x1FFE13) < prior(byte(0x1FFE13)))
)

achievement(
    title = "Speeding in Metropolis 1", description = "[Sonic 2, Extra] Clear Metropolis Zone act 1 in Time Attack in 1:45 or less", points = 5,
    id = 230547, badge = "255727", published = "6/29/2022 12:22:09 AM", modified = "7/25/2022 10:11:55 PM",
    trigger = Sonic2 && JamTimeAttackZone == 0x07 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x189C && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               byte(0x1FFE13) < prior(byte(0x1FFE13)))
)

achievement(
    title = "Speeding in Metropolis 2", description = "[Sonic 2, Extra] Clear Metropolis Zone act 2 in Time Attack in 2:00 or less", points = 5,
    id = 230548, badge = "255728", published = "6/29/2022 12:22:09 AM", modified = "7/25/2022 10:11:55 PM",
    trigger = Sonic2 && JamTimeAttackZone == 0x07 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x1C20 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               byte(0x1FFE13) < prior(byte(0x1FFE13)))
)

achievement(
    title = "Speeding in Metropolis 3", description = "[Sonic 2, Extra] Clear Metropolis Zone act 3 in Time Attack in 2:35 or less", points = 5,
    id = 230549, badge = "255729", published = "6/29/2022 12:22:09 AM", modified = "7/25/2022 10:11:55 PM",
    trigger = Sonic2 && JamTimeAttackZone == 0x07 && byte(0x1030FA) == 0x02 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x2454 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               byte(0x1FFE13) < prior(byte(0x1FFE13)))
)

achievement(
    title = "Speeding in Wing Fortress", description = "[Sonic 2, Extra] Clear Wing Fortress in Time Attack in 1:45 or less", points = 10,
    id = 230550, badge = "255730", published = "6/29/2022 12:22:10 AM", modified = "7/25/2022 10:11:56 PM",
    trigger = Sonic2 && JamTimeAttackZone == 0x09 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x189C && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               byte(0x1FFE13) < prior(byte(0x1FFE13)))
)

achievement(
    title = "Speeding in Death Egg", description = "[Sonic 2, Extra] Clear Death Egg in Time Attack in 1:00 or less", points = 10,
    id = 230551, badge = "255731", published = "6/29/2022 12:22:10 AM", modified = "7/25/2022 10:11:56 PM",
    trigger = Sonic2 && JamTimeAttackZone == 0x0A && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0xE10 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               byte(0x1FFE13) < prior(byte(0x1FFE13)))
)

achievement(
    title = "Green Slope & Knuckles", description = "[Knuckles in Sonic 2, Normal] Finish the Emerald Hill Zone", points = 5,
    id = 229004, badge = "253978", published = "6/24/2022 3:55:57 AM", modified = "7/26/2022 4:49:04 PM",
    trigger = Knuckles2 && S2NoDebug && S1NoDemo && S2NoLevelSelect && JamClassicNormal && S2NoDeath && S1ZoneId
               == 0x00 && S1Act2 && S2ClearedLevel
)

achievement(
    title = "Chemical Romance & Knuckles", description = "[Knuckles in Sonic 2, Normal] Finish the Chemical Plant Zone", points = 5,
    id = 229005, badge = "253979", published = "6/24/2022 3:55:57 AM", modified = "7/26/2022 4:49:04 PM",
    trigger = Knuckles2 && S2NoDebug && S1NoDemo && S2NoLevelSelect && JamClassicNormal && S2NoDeath && S1ZoneId
               == 0x0D && S1Act2 && S2ClearedLevel
)

achievement(
    title = "Aqua Man & Knuckles", description = "[Knuckles in Sonic 2, Normal] Finish the Aquatic Ruin Zone", points = 5,
    id = 229006, badge = "253980", published = "6/24/2022 3:55:57 AM", modified = "7/26/2022 4:49:05 PM",
    trigger = Knuckles2 && S2NoDebug && S1NoDemo && S2NoLevelSelect && JamClassicNormal && S2NoDeath && S1ZoneId
               == 0x0F && S1Act2 && S2ClearedLevel
)

achievement(
    title = "Gambler's Delight & Knuckles", description = "[Knuckles in Sonic 2, Normal] Finish the Casino Night Zone", points = 5,
    id = 229007, badge = "253981", published = "6/24/2022 3:55:58 AM", modified = "7/26/2022 4:49:05 PM",
    trigger = Knuckles2 && S2NoDebug && S1NoDemo && S2NoLevelSelect && JamClassicNormal && S2NoDeath && S1ZoneId
               == 0x0C && S1Act2 && S2ClearedLevel
)

achievement(
    title = "Hillly Billy & Knuckles", description = "[Knuckles in Sonic 2, Normal] Finish the Hill Top Zone", points = 5,
    id = 229008, badge = "253982", published = "6/24/2022 3:55:58 AM", modified = "7/26/2022 4:49:06 PM",
    trigger = Knuckles2 && S2NoDebug && S1NoDemo && S2NoLevelSelect && JamClassicNormal && S2NoDeath && S1ZoneId
               == 0x07 && S1Act2 && S2ClearedLevel
)

achievement(
    title = "Mystical Caverns & Knuckles", description = "[Knuckles in Sonic 2, Normal] Finish the Mystic Cave Zone", points = 5,
    id = 229009, badge = "253983", published = "6/24/2022 3:55:58 AM", modified = "7/26/2022 4:49:06 PM",
    trigger = Knuckles2 && S2NoDebug && S1NoDemo && S2NoLevelSelect && JamClassicNormal && S2NoDeath && S1ZoneId
               == 0x0B && S1Act2 && S2ClearedLevel
)

achievement(
    title = "Oily Oceans & Knuckles", description = "[Knuckles in Sonic 2, Normal] Finish the Oil Ocean Zone", points = 5,
    id = 229010, badge = "253984", published = "6/24/2022 3:55:59 AM", modified = "7/26/2022 4:49:07 PM",
    trigger = Knuckles2 && S2NoDebug && S1NoDemo && S2NoLevelSelect && JamClassicNormal && S2NoDeath && S1ZoneId
               == 0x0A && S1Act2 && S2ClearedLevel
)

achievement(
    title = "Where's Superman & Knuckles", description = "[Knuckles in Sonic 2, Normal] Finish the Metropolis Zone", points = 5,
    id = 229011, badge = "253985", published = "6/24/2022 3:55:59 AM", modified = "7/26/2022 4:49:07 PM",
    trigger = Knuckles2 && S2NoDebug && S1NoDemo && S2NoLevelSelect && JamClassicNormal && S2NoDeath && S1ZoneId
               == 0x05 && S1Act1 && S2ClearedLevel
)

achievement(
    title = "Metal Bird & Knuckles", description = "[Knuckles in Sonic 2, Normal] Finish the Winged Fortress Zone", points = 5,
    id = 229012, badge = "253986", published = "6/24/2022 3:55:59 AM", modified = "7/26/2022 4:49:08 PM",
    trigger = Knuckles2 && S2NoDebug && S1NoDemo && S2NoLevelSelect && JamClassicNormal && S2NoDeath && S1ActId
               == 0x00 && prev(S1ZoneId) == 0x06 && S1ZoneId == 0x0E
)

achievement(
    title = "Red Justice", description = "[Knuckles in Sonic 2, Normal] Finish the game as Knuckles", points = 10,
    id = 229013, badge = "253987", published = "6/24/2022 3:56:00 AM", modified = "7/26/2022 4:49:08 PM",
    trigger = Knuckles2 && S2NoDebug && S1NoDemo && S2NoLevelSelect && JamClassicNormal && S2NoDeath && S1ZoneId
               == 0x0E && S1Act1 && prev(S1ScreenMode) == 0x0C && S1ScreenMode == 0x20 && 
              byte(0x1FFF72) < 0x02
)

achievement(
    title = "Chaos Collector & Knuckles", description = "[Knuckles in Sonic 2, Normal] Collect all 7 Emeralds", points = 10,
    id = 229015, badge = "253989", published = "6/24/2022 3:56:00 AM", modified = "7/26/2022 4:49:09 PM",
    trigger = S2NoDebug && S1NoDemo && S2NoLevelSelect && JamClassicNormal && 
              S2NoDeath && prev(S2EmeraldCount) == 0x06 && measured(S2EmeraldCount == 0x07,
               when=Knuckles2)
)

achievement(
    title = "Sparkly Red Justice", description = "[Knuckles in Sonic 2, Normal] Finish the game with all 7 emeralds", points = 25,
    id = 229014, badge = "253988", published = "6/24/2022 3:56:00 AM", modified = "7/26/2022 4:49:09 PM",
    trigger = Knuckles2 && S2NoDebug && S1NoDemo && S2NoLevelSelect && JamClassicNormal && S2NoDeath && S1ZoneId
               == 0x0E && S1Act1 && prev(S1ScreenMode) == 0x0C && S1ScreenMode == 0x20 && 
              S2EmeraldCount == 0x07
)

achievement(
    title = "Knuckles Speeding in Emerald Hill 1", description = "[S2K, Extra] Clear Emerald Hill Zone act 1 in Time Attack in under 0:45", points = 10,
    id = 229572, badge = "254650", published = "6/25/2022 11:07:41 PM", modified = "7/25/2022 10:12:00 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x02 && JamTimeAttackZone == 0x00 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, dword(0x1FFE22) == 0x00 && byte(0x1030E9) == 0x02) && 
              trigger_when((byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes *
               0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) <= 0xA8C && never((byte(0x1030F5) == 0x02 &&
               bit7(0x1030EB) < prev(bit7(0x1030EB))) || S1LifeLost)
)

achievement(
    title = "Knuckles Speeding in Emerald Hill 2", description = "[S2K, Extra] Clear Emerald Hill Zone act 2 in Time Attack in under 1:00", points = 10,
    id = 229573, badge = "254651", published = "6/25/2022 11:07:41 PM", modified = "7/25/2022 10:12:01 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x02 && JamTimeAttackZone == 0x00 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, dword(0x1FFE22) == 0x00 && byte(0x1030E9) == 0x02) && 
              trigger_when((byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes *
               0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) <= 0xE10 && never((byte(0x1030F5) == 0x02 &&
               bit7(0x1030EB) < prev(bit7(0x1030EB))) || S1LifeLost)
)

achievement(
    title = "Knuckles Speeding in Chemical Plant 1", description = "[S2K, Extra] Clear Chemical Plant Zone act 1 in Time Attack in under 0:40", points = 25,
    id = 229574, badge = "254652", published = "6/25/2022 11:07:41 PM", modified = "7/25/2022 10:12:01 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x02 && JamTimeAttackZone == 0x01 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, dword(0x1FFE22) == 0x00 && byte(0x1030E9) == 0x02) && 
              trigger_when((byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes *
               0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) <= 0x960 && never((byte(0x1030F5) == 0x02 &&
               bit7(0x1030EB) < prev(bit7(0x1030EB))) || S1LifeLost)
)

achievement(
    title = "Knuckles Speeding in Chemical Plant 2", description = "[S2K, Extra] Clear Chemical Plant Zone act 2 in Time Attack in under 0:45", points = 25,
    id = 229575, badge = "254653", published = "6/25/2022 11:07:42 PM", modified = "7/25/2022 10:12:01 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x02 && JamTimeAttackZone == 0x01 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, dword(0x1FFE22) == 0x00 && byte(0x1030E9) == 0x02) && 
              trigger_when((byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes *
               0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) <= 0xA8C && never((byte(0x1030F5) == 0x02 &&
               bit7(0x1030EB) < prev(bit7(0x1030EB))) || S1LifeLost)
)

achievement(
    title = "Knuckles Speeding in Aquatic Ruin 1", description = "[S2K, Extra] Clear Aquatic Ruin Zone act 1 in Time Attack in under 0:30", points = 25,
    id = 229576, badge = "254654", published = "6/25/2022 11:07:42 PM", modified = "7/25/2022 10:12:02 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x02 && JamTimeAttackZone == 0x02 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, dword(0x1FFE22) == 0x00 && byte(0x1030E9) == 0x02) && 
              trigger_when((byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes *
               0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) <= 0x708 && never((byte(0x1030F5) == 0x02 &&
               bit7(0x1030EB) < prev(bit7(0x1030EB))) || S1LifeLost)
)

achievement(
    title = "Knuckles Speeding in Aquatic Ruin 2", description = "[S2K, Extra] Clear Aquatic Ruin Zone act 2 in Time Attack in under 1:00", points = 25,
    id = 229577, badge = "254655", published = "6/25/2022 11:07:42 PM", modified = "7/25/2022 10:12:02 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x02 && JamTimeAttackZone == 0x02 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, dword(0x1FFE22) == 0x00 && byte(0x1030E9) == 0x02) && 
              trigger_when((byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes *
               0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) <= 0xE10 && never((byte(0x1030F5) == 0x02 &&
               bit7(0x1030EB) < prev(bit7(0x1030EB))) || S1LifeLost)
)

achievement(
    title = "Knuckles Speeding in Casino Night 1", description = "[S2K, Extra] Clear Casino Night Zone act 1 in Time Attack in under 0:50", points = 10,
    id = 229578, badge = "254656", published = "6/25/2022 11:07:43 PM", modified = "7/25/2022 10:12:02 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x02 && JamTimeAttackZone == 0x03 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, dword(0x1FFE22) == 0x00 && byte(0x1030E9) == 0x02) && 
              trigger_when((byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes *
               0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) <= 0xBB8 && never((byte(0x1030F5) == 0x02 &&
               bit7(0x1030EB) < prev(bit7(0x1030EB))) || S1LifeLost)
)

achievement(
    title = "Knuckles Speeding in Casino Night 2", description = "[S2K, Extra] Clear Casino Night Zone act 2 in Time Attack in under 2:00", points = 10,
    id = 229579, badge = "254657", published = "6/25/2022 11:07:43 PM", modified = "7/25/2022 10:12:03 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x02 && JamTimeAttackZone == 0x03 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, dword(0x1FFE22) == 0x00 && byte(0x1030E9) == 0x02) && 
              trigger_when((byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes *
               0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) <= 0x1C20 && never((byte(0x1030F5) == 0x02 &&
               bit7(0x1030EB) < prev(bit7(0x1030EB))) || S1LifeLost)
)

achievement(
    title = "Knuckles Speeding in Hill Top 1", description = "[S2K, Extra] Clear Hill Top Zone act 1 in Time Attack in under 1:15", points = 10,
    id = 229580, badge = "254658", published = "6/25/2022 11:07:43 PM", modified = "7/25/2022 10:12:03 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x02 && JamTimeAttackZone == 0x04 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, dword(0x1FFE22) == 0x00 && byte(0x1030E9) == 0x02) && 
              trigger_when((byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes *
               0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) <= 0x1194 && never((byte(0x1030F5) == 0x02 &&
               bit7(0x1030EB) < prev(bit7(0x1030EB))) || S1LifeLost)
)

achievement(
    title = "Knuckles Speeding in Hill Top 2", description = "[S2K, Extra] Clear Hill Top Zone act 2 in Time Attack in under 1:30", points = 10,
    id = 229581, badge = "254659", published = "6/25/2022 11:07:44 PM", modified = "7/25/2022 10:12:04 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x02 && JamTimeAttackZone == 0x04 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, dword(0x1FFE22) == 0x00 && byte(0x1030E9) == 0x02) && 
              trigger_when((byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes *
               0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) <= 0x1518 && never((byte(0x1030F5) == 0x02 &&
               bit7(0x1030EB) < prev(bit7(0x1030EB))) || S1LifeLost)
)

achievement(
    title = "Knuckles Speeding in Mystic Cave 1", description = "[S2K, Extra] Clear Mystic Cave Zone act 1 in Time Attack in under 1:15", points = 10,
    id = 229582, badge = "254660", published = "6/25/2022 11:07:44 PM", modified = "7/25/2022 10:12:04 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x02 && JamTimeAttackZone == 0x05 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, dword(0x1FFE22) == 0x00 && byte(0x1030E9) == 0x02) && 
              trigger_when((byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes *
               0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) <= 0x1194 && never((byte(0x1030F5) == 0x02 &&
               bit7(0x1030EB) < prev(bit7(0x1030EB))) || S1LifeLost)
)

achievement(
    title = "Knuckles Speeding in Mystic Cave 2", description = "[S2K, Extra] Clear Mystic Cave Zone act 2 in Time Attack in under 1:10", points = 25,
    id = 229583, badge = "254661", published = "6/25/2022 11:07:44 PM", modified = "7/25/2022 10:12:04 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x02 && JamTimeAttackZone == 0x05 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, dword(0x1FFE22) == 0x00 && byte(0x1030E9) == 0x02) && 
              trigger_when((byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes *
               0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) <= 0x1068 && never((byte(0x1030F5) == 0x02 &&
               bit7(0x1030EB) < prev(bit7(0x1030EB))) || S1LifeLost)
)

achievement(
    title = "Knuckles Speeding in Oil Ocean 1", description = "[S2K, Extra] Clear Oil Ocean Zone act 1 in Time Attack in under 1:45", points = 25,
    id = 229584, badge = "254662", published = "6/25/2022 11:07:45 PM", modified = "7/25/2022 10:12:05 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x02 && JamTimeAttackZone == 0x06 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, dword(0x1FFE22) == 0x00 && byte(0x1030E9) == 0x02) && 
              trigger_when((byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes *
               0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) <= 0x189C && never((byte(0x1030F5) == 0x02 &&
               bit7(0x1030EB) < prev(bit7(0x1030EB))) || S1LifeLost)
)

achievement(
    title = "Knuckles Speeding in Oil Ocean 2", description = "[S2K, Extra] Clear Oil Ocean Zone act 2 in Time Attack in under 1:30", points = 10,
    id = 229585, badge = "254663", published = "6/25/2022 11:07:45 PM", modified = "7/25/2022 10:12:05 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x02 && JamTimeAttackZone == 0x06 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, dword(0x1FFE22) == 0x00 && byte(0x1030E9) == 0x02) && 
              trigger_when((byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes *
               0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) <= 0x1518 && never((byte(0x1030F5) == 0x02 &&
               bit7(0x1030EB) < prev(bit7(0x1030EB))) || S1LifeLost)
)

achievement(
    title = "Knuckles Speeding in Metropolis 1", description = "[S2K, Extra] Clear Metropolis Zone act 1 in Time Attack in under 1:45", points = 10,
    id = 229586, badge = "254664", published = "6/25/2022 11:07:45 PM", modified = "7/25/2022 10:12:05 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x02 && JamTimeAttackZone == 0x07 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, dword(0x1FFE22) == 0x00 && byte(0x1030E9) == 0x02) && 
              trigger_when((byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes *
               0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) <= 0x189C && never((byte(0x1030F5) == 0x02 &&
               bit7(0x1030EB) < prev(bit7(0x1030EB))) || S1LifeLost)
)

achievement(
    title = "Knuckles Speeding in Metropolis 2", description = "[S2K, Extra] Clear Metropolis Zone act 2 in Time Attack in under 2:10", points = 10,
    id = 229587, badge = "254665", published = "6/25/2022 11:07:46 PM", modified = "7/25/2022 10:12:06 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x02 && JamTimeAttackZone == 0x07 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, dword(0x1FFE22) == 0x00 && byte(0x1030E9) == 0x02) && 
              trigger_when((byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes *
               0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) <= 0x1E78 && never((byte(0x1030F5) == 0x02 &&
               bit7(0x1030EB) < prev(bit7(0x1030EB))) || S1LifeLost)
)

achievement(
    title = "Knuckles Speeding in Metropolis 3", description = "[S2K, Extra] Clear Metropolis Zone act 3 in Time Attack in under 3:10", points = 10,
    id = 229588, badge = "254666", published = "6/25/2022 11:07:46 PM", modified = "7/25/2022 10:12:06 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x02 && JamTimeAttackZone == 0x07 && byte(0x1030FA) == 0x02 && 
              JamTimeAttack && repeated(20, dword(0x1FFE22) == 0x00 && byte(0x1030E9) == 0x02) && 
              trigger_when((byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes *
               0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) <= 0x2C88 && never((byte(0x1030F5) == 0x02 &&
               bit7(0x1030EB) < prev(bit7(0x1030EB))) || S1LifeLost)
)

achievement(
    title = "Knuckles Speeding in Wing Fortress", description = "[S2K, Extra] Clear Wing Fortress Zone in Time Attack in under 2:30", points = 10,
    id = 229589, badge = "254667", published = "6/25/2022 11:07:46 PM", modified = "7/25/2022 10:12:06 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x02 && JamTimeAttackZone == 0x09 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, dword(0x1FFE22) == 0x00 && byte(0x1030E9) == 0x02) && 
              trigger_when((byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes *
               0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) <= 0x2328 && never((byte(0x1030F5) == 0x02 &&
               bit7(0x1030EB) < prev(bit7(0x1030EB))) || S1LifeLost)
)

achievement(
    title = "Knuckles Speeding in Death Egg", description = "[S2K, Extra] Clear Death Egg Zone in Time Attack in under 1:00", points = 10,
    id = 229590, badge = "254668", published = "6/25/2022 11:07:47 PM", modified = "7/25/2022 10:12:07 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x02 && JamTimeAttackZone == 0x0A && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, dword(0x1FFE22) == 0x00 && byte(0x1030E9) == 0x02) && 
              trigger_when((byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes *
               0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) <= 0xE10 && never((byte(0x1030F5) == 0x02 &&
               bit7(0x1030EB) < prev(bit7(0x1030EB))) || S1LifeLost)
)

achievement(
    title = "Is-land, and Everything's on Fire", description = "[Sonic 3, Normal] Complete Angel Island Zone as Sonic (with or without Tails)", points = 4,
    id = 225526, badge = "249646", published = "6/10/2022 7:36:50 PM", modified = "7/26/2022 4:22:25 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0x4021C600 ||
               dword(0x137136) != 0x02 || dword(0x13713A) != 0x00 || dword(0x1FFFD0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x00 && S1Act2 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && word(0x1D4010) > 0x4800 && (prev(byte(0x1FFF08)) == 0x00 || prev(byte(0x1FFF08))
               == 0x01)
)

achievement(
    title = "Angel Island Act 1 Perfection", description = "[Sonic 3, Normal] Beat the boss of Angel Island Zone act 1 damageless, no shield or Super Sonic (Level Select allowed)", points = 5,
    id = 225567, badge = "249687", published = "6/10/2022 7:37:54 PM", modified = "7/26/2022 4:22:26 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0x4021C600 || dword(0x137136) != 0x02 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFFB) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x00 && S1Act2 && trigger_when(byte(0x1FFAA9) == 0xFF) && word(0x1D4010)
               > 0x10E0 && word(0x1D4010) < 0x1209 && never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) ==
               0xA701)) &&
              (always_false() || (unless((word(0x1D4010) < 0x10E0 || prev(byte(0x11812C)) != 0x2E)) && unless(once(bit0(0x1D402A) == 0x01
                 || byte(0x1FFE18) != 0x00 || word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "Angel Island Act 2 Perfection", description = "[Sonic 3, Normal] Beat the boss of Angel Island Zone act 2 in under 8.7 seconds, no Super Sonic (Level Select allowed)", points = 10,
    id = 225568, badge = "249688", published = "6/10/2022 7:37:54 PM", modified = "7/26/2022 4:22:26 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0x4021C600 || dword(0x137136) != 0x02 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFFB) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x00 && S1Act2 && trigger_when(byte(0x1FFAA9) == 0xFF) && word(0x1D4010)
               > 0x488C && never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) == 0xA701)) &&
              (always_false() || (unless((prev(byte(0x11812C)) != 0x19 || prev(byte(0x1FF63A)) == 0x01)) && unless(once(repeated(522,
                 byte(0x11812C) == 0x19) || byte(0x1FFE18) != 0x00))))
)

achievement(
    title = "Someone Un-spiked my Drink!", description = "[Sonic 3, Easy] There's a missing set of submerged spikes somewhere in Angel Island Zone act 1. Walk where they should be", points = 3,
    id = 225546, badge = "249666", published = "6/10/2022 7:37:15 PM", modified = "7/26/2022 4:22:27 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0x4021C600 ||
               dword(0x137136) != 0x02 || dword(0x13713A) != 0x00 || dword(0x1FFFD0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x01) && word(0x1D4014) >= 0x570 && word(0x1D4010) >= 0x66D && word(0x1D4010) <=
               0x68F && S1ZoneId == 0x00 && S1Act2
)

achievement(
    title = "Drowning in the Music", description = "[Sonic 3, Normal] Complete Hydrocity Zone as Sonic (with or without Tails)", points = 4,
    id = 225527, badge = "249647", published = "6/10/2022 7:36:50 PM", modified = "7/26/2022 4:22:27 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0x4021C600 ||
               dword(0x137136) != 0x02 || dword(0x13713A) != 0x00 || dword(0x1FFFD0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x01 && S1Act2 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && (prev(byte(0x1FFF08)) == 0x00 || prev(byte(0x1FFF08)) == 0x01) && word(0x1D4010)
               > 0x1600
)

achievement(
    title = "Hydrocity Act 1 Perfection", description = "[Sonic 3, Normal] Beat the boss of Hydrocity Zone act 1 without getting hit, no shields or Super Sonic (Level Select allowed)", points = 5,
    id = 225569, badge = "249689", published = "6/10/2022 7:37:55 PM", modified = "7/26/2022 4:22:28 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0x4021C600 || dword(0x137136) != 0x02 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFFB) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x01 && S1Act1 && trigger_when(byte(0x1FFAA9) == 0xFF) && word(0x1D4010)
               > 0x36A4 && never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) == 0xA701)) &&
              (always_false() || (unless((byte(0x11812C) != 0x18 && prev(byte(0x11812C)) != 0x19)) && unless(once(byte(0x1FFE18) != 0x00
                 || word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "Hydrocity Act 2 Perfection", description = "[Sonic 3, Normal] Beat the boss of Hydrocity Zone act 2 in under 18 seconds, no Super Sonic", points = 10,
    id = 225570, badge = "249690", published = "6/10/2022 7:37:55 PM", modified = "7/26/2022 4:22:28 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0x4021C600 || dword(0x137136) != 0x02 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFFB) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x01 && S1Act2 && trigger_when(byte(0x1FFAA9) == 0xFF) && 
              once(word(0x1D4010) >= 0x40A0) && never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) ==
               0xA701)) &&
              (always_false() || (unless((prev(byte(0x11812C)) != 0x31 && prev(byte(0x11812C)) != 0x18 && prev(byte(0x11812C)) != 0x19) ||
                 byte(0x1FF63A) == 0x01) && unless(once((once(word(0x1D4010) >= 0x40A0) && repeated(1080,
                 always_true())) || byte(0x1FFE18) != 0x00))))
)

achievement(
    title = "Spinning? I Prefer Springing to Action", description = "[Sonic 3, Easy] Find the red spring that replaced an underwater spinning pillar in Hydrocity Zone act 2", points = 10,
    id = 225547, badge = "249667", published = "6/10/2022 7:37:16 PM", modified = "7/26/2022 4:22:29 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0x4021C600 ||
               dword(0x137136) != 0x02 || dword(0x13713A) != 0x00 || dword(0x1FFFD0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x01) && word(0x1D4014) >= 0x861 && word(0x1D4014) <= 0x870 && word(0x1D4010) >=
               0x3776 && word(0x1D4010) <= 0x37A2 && S1ZoneId == 0x01 && S1Act2
)

achievement(
    title = "Keeping Your Guard-en Up", description = "[Sonic 3, Normal] Complete Marble Garden Zone as Sonic (with or without Tails)", points = 5,
    id = 225528, badge = "249648", published = "6/10/2022 7:36:50 PM", modified = "7/26/2022 4:22:29 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0x4021C600 ||
               dword(0x137136) != 0x02 || dword(0x13713A) != 0x00 || dword(0x1FFFD0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x02 && S1Act2 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && (prev(byte(0x1FFF08)) == 0x00 || prev(byte(0x1FFF08)) == 0x01) && word(0x1D4010)
               > 0x200
)

achievement(
    title = "Marble Garden Act 1 Perfection", description = "[Sonic 3, Normal] Beat the boss of Marble Garden Zone act 1 without getting hit, no shields or Super Sonic (Level Select allowed)", points = 10,
    id = 225571, badge = "249691", published = "6/10/2022 7:37:55 PM", modified = "7/26/2022 4:22:29 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0x4021C600 || dword(0x137136) != 0x02 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFFB) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x02 && S1Act1 && trigger_when(byte(0x1FFAA9) == 0xFF) && word(0x1D4010)
               > 0x2E0A && never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) == 0xA701)) &&
              (always_false() || (unless(prev(byte(0x11812C)) != 0x2E) && unless(once(bit0(0x1D402A) == 0x01 || byte(0x1FFE18) != 0x00 ||
                 word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "Marble Garden Act 2 Perfection", description = "[Sonic 3, Normal] Beat the boss of Marble Garden act 2 without getting hit, no Super Sonic (Level Select allowed)", points = 5,
    id = 225572, badge = "249692", published = "6/10/2022 7:37:56 PM", modified = "7/26/2022 4:22:30 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0x4021C600 || dword(0x137136) != 0x02 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFFB) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x02 && S1Act2 && trigger_when(byte(0x1FFAA9) == 0xFF) && 
              never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) == 0xA701)) &&
              (always_false() || (unless((word(0x1D4010) < 0x3C8A || prev(byte(0x11812C)) != 0x19)) && unless(once(byte(0x1FFE18) != 0x00
                 || word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "It Was Spinning Like a (Spiked) Wrecking Ball", description = "[Sonic 3, Easy] Locate where this spiked ball is supposed to be in Marble Garden Zone act 2 and touch where the post should be", points = 5,
    id = 225548, badge = "249668", published = "6/10/2022 7:37:16 PM", modified = "7/26/2022 4:22:30 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0x4021C600 ||
               dword(0x137136) != 0x02 || dword(0x13713A) != 0x00 || dword(0x1FFFD0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x01) && word(0x1D4014) >= 0x6BF && word(0x1D4014) <= 0x6CE && word(0x1D4010) >=
               0x204A && word(0x1D4010) <= 0x205D && S1ZoneId == 0x02 && S1Act2
)

achievement(
    title = "Jam Through the Carnival", description = "[Sonic 3, Normal] Complete Carnival Night Zone as Sonic (with or without Tails)", points = 5,
    id = 225529, badge = "249649", published = "6/10/2022 7:36:51 PM", modified = "7/26/2022 4:22:30 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0x4021C600 ||
               dword(0x137136) != 0x02 || dword(0x13713A) != 0x00 || dword(0x1FFFD0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x03 && S1Act2 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && (prev(byte(0x1FFF08)) == 0x00 || prev(byte(0x1FFF08)) == 0x01) && word(0x1D4010)
               > 0x1000
)

achievement(
    title = "Carnival Night Act 1 Perfection", description = "[Sonic 3, Normal] Beat the boss of Carnival Night Zone act 1 without getting hit, no Super Sonic (Level Select allowed)", points = 5,
    id = 225573, badge = "249693", published = "6/10/2022 7:37:56 PM", modified = "7/26/2022 4:22:31 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0x4021C600 || dword(0x137136) != 0x02 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFFB) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x03 && S1Act1 && trigger_when(byte(0x1FFAA9) == 0xFF) && word(0x1D4010)
               > 0x3200 && never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) == 0xA701)) &&
              (always_false() || (unless(prev(byte(0x11812C)) != 0x2E) && unless(once(byte(0x1FFE18) != 0x00 || word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "Carnival Night Act 2 Perfection", description = "[Sonic 3, Normal] Beat the boss of Carnival Night act 2 without getting hit, no Super Sonic (Level Select allowed)", points = 5,
    id = 225574, badge = "249694", published = "6/10/2022 7:37:56 PM", modified = "7/26/2022 4:22:31 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0x4021C600 || dword(0x137136) != 0x02 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFFB) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x03 && S1Act2 && trigger_when(byte(0x1FFAA9) == 0xFF) && word(0x1D4010)
               > 0x4790 && word(0x1D4014) <= 0x2FA && never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) ==
               0xA701)) &&
              (always_false() || (unless(prev(byte(0x11812C)) != 0x19) && unless(once(byte(0x1FFE18) != 0x00 || word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "You Cannot Escape the Barrels", description = "[Sonic 3, Normal or Easy] While you no longer need to get past the barrel of doom, an extra life might be hiding as a reward for dealing with one", points = 5,
    id = 225549, badge = "249669", published = "6/10/2022 7:37:16 PM", modified = "7/26/2022 4:22:31 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0x4021C600 ||
               dword(0x137136) != 0x02 || dword(0x13713A) != 0x00 || dword(0x1FFFD0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) == 0x02) && word(0x1D4014) >= 0x967 && word(0x1D4014) <= 0xA40 && word(0x1D4010) >=
               0x1ACE && word(0x1D4010) <= 0x1C7A && S1ZoneId == 0x03 && S1Act2 && byte(0x1FFE13)
               > prev(byte(0x1FFE13)) && byte(0x1FFECC) > prev(byte(0x1FFECC))
)

achievement(
    title = "Hard Times Gone By", description = "[Sonic 3, Normal] Complete Icecap Zone as Sonic (with or without Tails)", points = 5,
    id = 225530, badge = "249650", published = "6/10/2022 7:36:51 PM", modified = "7/26/2022 4:22:32 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0x4021C600 ||
               dword(0x137136) != 0x02 || dword(0x13713A) != 0x00 || dword(0x1FFFD0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x05 && S1Act2 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && (prev(byte(0x1FFF08)) == 0x00 || prev(byte(0x1FFF08)) == 0x01) && word(0x1D4010)
               > 0x1000
)

achievement(
    title = "Icecap Act 1 Perfection", description = "[Sonic 3, Normal] Beat the boss of Icecap Zone act 1 without getting hit, no Super Sonic (Level Select allowed)", points = 5,
    id = 225575, badge = "249695", published = "6/10/2022 7:37:57 PM", modified = "7/26/2022 4:22:32 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0x4021C600 || dword(0x137136) != 0x02 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFFB) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x05 && S1Act2 && trigger_when(byte(0x1FFAA9) == 0xFF) && word(0x1D4010)
               > 0x6E0 && never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) == 0xA701)) &&
              (always_false() || (unless(prev(byte(0x11812C)) != 0x2E) && unless(once(byte(0x1FFE18) != 0x00 || word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "Icecap Act 2 Perfection", description = "[Sonic 3, Normal] Beat the boss of Icecap act 2 without getting hit, no Super Sonic (Level Select allowed)", points = 5,
    id = 225576, badge = "249696", published = "6/10/2022 7:37:57 PM", modified = "7/26/2022 4:22:32 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0x4021C600 || dword(0x137136) != 0x02 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFFB) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x05 && S1Act2 && trigger_when(byte(0x1FFAA9) == 0xFF) && word(0x1D4010)
               > 0x4390 && never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) == 0xA701)) &&
              (always_false() || (unless(prev(byte(0x11812C)) != 0x19) && unless(once(byte(0x1FFE18) != 0x00 || word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "A Jarring Safety Addition", description = "[Sonic 3, Normal or Easy] ] In Icecap Zone act 2, a pit has been removed, but its replacement seems somewhat out of place", points = 3,
    id = 225550, badge = "249670", published = "6/10/2022 7:37:17 PM", modified = "7/26/2022 4:22:33 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0x4021C600 ||
               dword(0x137136) != 0x02 || dword(0x13713A) != 0x00 || dword(0x1FFFD0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) == 0x02) && word(0x1D4014) >= 0xBB0 && word(0x1D4014) <= 0xBDD && word(0x1D4010) >=
               0x2C7A && word(0x1D4010) <= 0x30E0 && S1ZoneId == 0x05 && S1Act2
)

achievement(
    title = "Not Even a Big Arm-y Would Stop Me", description = "[Sonic 3, Normal] Beat the game as Sonic (with or without Tails)", points = 10,
    id = 225531, badge = "249651", published = "6/10/2022 7:36:51 PM", modified = "7/26/2022 4:22:33 PM",
    trigger = unless((prev(S1ScreenMode) != 0x0C && prev(S1ScreenMode) != 0x8C) || dword(0x14F3B0) != 0x4021C600 ||
               dword(0x137136) != 0x02 || dword(0x13713A) != 0x00 || dword(0x1FFFD0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && prev(S1ZoneId) == 0x06 && prev(S1ActId) == 0x01 && 
              (prev(byte(0x1FFF08)) == 0x00 || prev(byte(0x1FFF08)) == 0x01) && S1ScreenMode == 0x20
)

achievement(
    title = "But the Adventure is Only Half Done...", description = "[Sonic 3, Normal] Beat the game as Sonic (with or without Tails) with all chaos emeralds", points = 10,
    id = 225635, badge = "249770", published = "6/10/2022 8:47:12 PM", modified = "7/26/2022 4:22:33 PM",
    trigger = unless((prev(S1ScreenMode) != 0x0C && prev(S1ScreenMode) != 0x8C) || dword(0x14F3B0) != 0x4021C600 ||
               dword(0x137136) != 0x02 || dword(0x13713A) != 0x00 || dword(0x1FFFD0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && prev(S1ZoneId) == 0x06 && prev(S1ActId) == 0x01 && 
              (prev(byte(0x1FFF08)) == 0x00 || prev(byte(0x1FFF08)) == 0x01) && S1ScreenMode == 0x20 && S2EmeraldCount
               == 0x07
)

achievement(
    title = "Launch Base Act 1 Perfection", description = "[Sonic 3, Normal] Beat the boss of Launch Base Zone act 1 without getting hit, no Super Sonic (Level Select allowed)", points = 5,
    id = 225577, badge = "249697", published = "6/10/2022 7:37:57 PM", modified = "7/26/2022 4:22:34 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0x4021C600 || dword(0x137136) != 0x02 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFFB) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x06 && S1Act1 && trigger_when(byte(0x1FFAA9) == 0xFF) && word(0x1D4010)
               > 0x3DA0 && never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) == 0xA701)) &&
              (always_false() || (unless(prev(byte(0x11812C)) != 0x2E) && unless(once(byte(0x1FFE18) != 0x00 || word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "Launch Base Act 2 Perfection", description = "[Sonic 3, Normal] Beat the first two bosses of Launch Base act 2 without getting hit, no Super Sonic (Level Select allowed)", points = 10,
    id = 225578, badge = "249698", published = "6/10/2022 7:37:58 PM", modified = "7/26/2022 4:22:34 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0x4021C600 || dword(0x137136) != 0x02 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFFB) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x06 && S1Act2 && trigger_when((prev(byte(0x11812C)) == 0x19 &&
               byte(0x11812C) == 0x30)) && never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) == 0xA701)) &&
              (always_false() || (unless(word(0x1D4010) < 0x3A28) && unless(once(byte(0x1FFE18) != 0x00 || word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "Big Arm Perfection", description = "[Sonic 3, Normal] Beat the final boss of Launch Base act 2 without getting hit, no Super Sonic (Level Select allowed)", points = 10,
    id = 225579, badge = "249699", published = "6/10/2022 7:37:58 PM", modified = "7/26/2022 4:22:35 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0x4021C600 || dword(0x137136) != 0x02 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFFB) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x06 && S1Act2 && word(0x1D4010) > 0x3A28 && trigger_when(word(0x1D4022)
               == 0xB202) && never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) == 0xA701)) &&
              (always_false() || (unless((byte(0x11812C) != 0x32 && byte(0x11812C) != 0x30)) && unless(once(byte(0x1FFE18) != 0x00 ||
                 word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "Stop Stealing the Wildlife Big!", description = "[Sonic 3, Easy] A Ribot and some spikes are missing somewhere in Launch Base Zone act 2 and has been replaced with a boost pad. Use the boost pad to trigger", points = 5,
    id = 225551, badge = "249671", published = "6/10/2022 7:37:17 PM", modified = "7/26/2022 4:22:35 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0x4021C600 ||
               dword(0x137136) != 0x02 || dword(0x13713A) != 0x00 || dword(0x1FFFD0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x01) && word(0x1D4014) >= 0x6F0 && word(0x1D4014) <= 0x6F8 && word(0x1D4010) >=
               0x1AB3 && word(0x1D4010) <= 0x1ACF && S1ZoneId == 0x06 && S1Act2
)

achievement(
    title = "A Special Player I", description = "[Sonic 3/S3&K, Normal] Earn a Perfect in special stage 1", points = 5,
    id = 225538, badge = "249658", published = "6/10/2022 7:37:13 PM", modified = "7/26/2022 4:22:35 PM",
    trigger = unless((S1ScreenMode != 0x48 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && word(0x1FE438) ==
               0x00 && word(0x1FE442) == 0x00 && byte(0x1FFFB3) > prev(byte(0x1FFFB3)) && prev(byte(0x1FFFB3)) == 0x00 &&
              ((dword(0x14F3B0) == 0x4021C600 && dword(0x137136) == 0x02 && dword(0x13713A) == 0x00 && dword(0x1FFFD0)
                 == 0x00) ||
               (dword(0x14F3B0) == 0xE1008111 && byte(0x137136) == 0x03 && byte(0x13713A) == 0x03 && word(0x1FFFE0) ==
                 0x00))
)

achievement(
    title = "A Special Player II", description = "[Sonic 3/S3&K, Normal] Earn a Perfect in special stage 2", points = 5,
    id = 225539, badge = "249659", published = "6/10/2022 7:37:13 PM", modified = "7/26/2022 4:22:36 PM",
    trigger = unless((S1ScreenMode != 0x48 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && word(0x1FE438) ==
               0x00 && word(0x1FE442) == 0x00 && byte(0x1FFFB2) > prev(byte(0x1FFFB2)) && prev(byte(0x1FFFB2)) == 0x00 &&
              ((dword(0x14F3B0) == 0x4021C600 && dword(0x137136) == 0x02 && dword(0x13713A) == 0x00 && dword(0x1FFFD0)
                 == 0x00) ||
               (dword(0x14F3B0) == 0xE1008111 && byte(0x137136) == 0x03 && byte(0x13713A) == 0x03 && word(0x1FFFE0) ==
                 0x00))
)

achievement(
    title = "A Special Player III", description = "[Sonic 3/S3&K, Normal] Earn a Perfect in special stage 3", points = 5,
    id = 225540, badge = "249660", published = "6/10/2022 7:37:13 PM", modified = "7/26/2022 4:22:36 PM",
    trigger = unless((S1ScreenMode != 0x48 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && word(0x1FE438) ==
               0x00 && word(0x1FE442) == 0x00 && byte(0x1FFFB5) > prev(byte(0x1FFFB5)) && prev(byte(0x1FFFB5)) == 0x00 &&
              ((dword(0x14F3B0) == 0x4021C600 && dword(0x137136) == 0x02 && dword(0x13713A) == 0x00 && dword(0x1FFFD0)
                 == 0x00) ||
               (dword(0x14F3B0) == 0xE1008111 && byte(0x137136) == 0x03 && byte(0x13713A) == 0x03 && word(0x1FFFE0) ==
                 0x00))
)

achievement(
    title = "A Special Player IV", description = "[Sonic 3/S3&K, Normal] Earn a Perfect in special stage 4", points = 5,
    id = 225541, badge = "249661", published = "6/10/2022 7:37:14 PM", modified = "7/26/2022 4:22:36 PM",
    trigger = unless((S1ScreenMode != 0x48 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && word(0x1FE438) ==
               0x00 && word(0x1FE442) == 0x00 && byte(0x1FFFB4) > prev(byte(0x1FFFB4)) && prev(byte(0x1FFFB4)) == 0x00 &&
              ((dword(0x14F3B0) == 0x4021C600 && dword(0x137136) == 0x02 && dword(0x13713A) == 0x00 && dword(0x1FFFD0)
                 == 0x00) ||
               (dword(0x14F3B0) == 0xE1008111 && byte(0x137136) == 0x03 && byte(0x13713A) == 0x03 && word(0x1FFFE0) ==
                 0x00))
)

achievement(
    title = "A Special Player V", description = "[Sonic 3/S3&K, Normal] Earn a Perfect in special stage 5", points = 5,
    id = 225542, badge = "249662", published = "6/10/2022 7:37:14 PM", modified = "7/26/2022 4:22:37 PM",
    trigger = unless((S1ScreenMode != 0x48 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && word(0x1FE438) ==
               0x00 && word(0x1FE442) == 0x00 && byte(0x1FFFB7) > prev(byte(0x1FFFB7)) && prev(byte(0x1FFFB7)) == 0x00 &&
              ((dword(0x14F3B0) == 0x4021C600 && dword(0x137136) == 0x02 && dword(0x13713A) == 0x00 && dword(0x1FFFD0)
                 == 0x00) ||
               (dword(0x14F3B0) == 0xE1008111 && byte(0x137136) == 0x03 && byte(0x13713A) == 0x03 && word(0x1FFFE0) ==
                 0x00))
)

achievement(
    title = "A Special Player VI", description = "[Sonic 3/S3&K, Normal] Earn a Perfect in special stage 6", points = 10,
    id = 225543, badge = "249663", published = "6/10/2022 7:37:14 PM", modified = "7/26/2022 4:22:37 PM",
    trigger = unless((S1ScreenMode != 0x48 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && word(0x1FE438) ==
               0x00 && word(0x1FE442) == 0x00 && byte(0x1FFFB6) > prev(byte(0x1FFFB6)) && prev(byte(0x1FFFB6)) == 0x00 &&
              ((dword(0x14F3B0) == 0x4021C600 && dword(0x137136) == 0x02 && dword(0x13713A) == 0x00 && dword(0x1FFFD0)
                 == 0x00) ||
               (dword(0x14F3B0) == 0xE1008111 && byte(0x137136) == 0x03 && byte(0x13713A) == 0x03 && word(0x1FFFE0) ==
                 0x00))
)

achievement(
    title = "A Special Player VII", description = "[Sonic 3/S3&K, Normal] Earn a Perfect in special stage 7", points = 10,
    id = 225544, badge = "249664", published = "6/10/2022 7:37:15 PM", modified = "7/26/2022 4:22:37 PM",
    trigger = unless((S1ScreenMode != 0x48 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && word(0x1FE438) ==
               0x00 && word(0x1FE442) == 0x00 && byte(0x1FFFB9) > prev(byte(0x1FFFB9)) && prev(byte(0x1FFFB9)) == 0x00 &&
              ((dword(0x14F3B0) == 0x4021C600 && dword(0x137136) == 0x02 && dword(0x13713A) == 0x00 && dword(0x1FFFD0)
                 == 0x00) ||
               (dword(0x14F3B0) == 0xE1008111 && byte(0x137136) == 0x03 && byte(0x13713A) == 0x03 && word(0x1FFFE0) ==
                 0x00))
)

achievement(
    title = "Chaotic Sugar Rush", description = "[Sonic 3, Normal] Obtain all seven chaos emeralds", points = 10,
    id = 225545, badge = "249665", published = "6/10/2022 7:37:15 PM", modified = "7/26/2022 4:22:38 PM",
    trigger = unless((S1ScreenMode != 0x48 || dword(0x14F3B0) != 0x4021C600 || dword(0x137136) != 0x02 ||
               dword(0x13713A) != 0x00 || dword(0x1FFFD0) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              prev(S2EmeraldCount) == 0x06 && S2EmeraldCount == 0x07
)

achievement(
    title = "This is Making My Head Spin", description = "[Sonic 3, Normal] Complete the secret eighth special stage from the level select menu", points = 5,
    id = 225552, badge = "249672", published = "6/10/2022 7:37:17 PM", modified = "7/26/2022 4:22:38 PM",
    trigger = unless((S1ScreenMode != 0x48 || dword(0x14F3B0) != 0x4021C600 || dword(0x137136) != 0x02 ||
               dword(0x13713A) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && word(0x1FE438) == 0x00 && 
              byte(0x1FFFB8) > prev(byte(0x1FFFB8))
)

achievement(
    title = "Blue Spheres are My Specialty", description = "[Sonic 3, Extra] Clear the Special Stage gauntlet", points = 10,
    id = 225566, badge = "249771", published = "6/10/2022 7:37:42 PM", modified = "7/25/2022 10:12:19 PM",
    trigger = unless((S1ScreenMode != 0x48 && S1ScreenMode != 0x34) || dword(0x14F3B0) != 0x4021C600 ||
               dword(0x137136) != 0x02 || dword(0x13713A) != 0x00 || byte(0x1030F8) != 0x02) && word(0x1FE438) == 0x00 && 
              word(0x1FFFB0) == 0x07
)

achievement(
    title = "A Truely Special Player", description = "[Sonic 3, Extra] Earn a Perfect in all special stages in the Special Stage gauntlet", points = 25,
    id = 225565, badge = "249772", published = "6/10/2022 7:37:42 PM", modified = "7/25/2022 10:12:19 PM",
    trigger = unless((S1ScreenMode != 0x34 || dword(0x14F3B0) != 0x4021C600 || dword(0x137136) != 0x02 ||
               dword(0x13713A) != 0x00 || byte(0x1030F8) != 0x02)) && word(0x1FE438) == 0x00 && repeated(7,
               word(0x1FE442) == 0x00 && word(0x1FE442) < prev(word(0x1FE442))) &&
              (always_false() || (never(word(0x1FFFB0) < prev(word(0x1FFFB0)))))
)

achievement(
    title = "Speeding in Angel Island 1", description = "[Sonic 3, Extra] Clear Angel Island Zone act 1 in Time Attack in under 1:10", points = 10,
    id = 225553, badge = "249673", published = "6/10/2022 7:37:38 PM", modified = "7/25/2022 10:12:20 PM",
    trigger = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x00 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x1068 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "Speeding in Angel Island 2", description = "[Sonic 3, Extra] Clear Angel Island Zone act 2 in Time Attack in under 2:40", points = 10,
    id = 225554, badge = "249674", published = "6/10/2022 7:37:38 PM", modified = "7/25/2022 10:12:20 PM",
    trigger = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x00 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x2328 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "Speeding in Hydrocity 1", description = "[Sonic 3, Extra] Clear Hydrocity Zone act 1 in Time Attack in under 2:40", points = 10,
    id = 225555, badge = "249675", published = "6/10/2022 7:37:38 PM", modified = "7/25/2022 10:12:20 PM",
    trigger = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x01 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x2580 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "Speeding in Hydrocity 2", description = "[Sonic 3, Extra] Clear Hydrocity Zone act 2 in Time Attack in under 3:30", points = 10,
    id = 225556, badge = "249676", published = "6/10/2022 7:37:39 PM", modified = "7/25/2022 10:12:21 PM",
    trigger = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x01 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x3138 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "Speeding in Marble Garden 1", description = "[Sonic 3, Extra] Clear Marble Garden Zone act 1 in Time Attack in under 3:40", points = 10,
    id = 225557, badge = "249677", published = "6/10/2022 7:37:39 PM", modified = "7/25/2022 10:12:21 PM",
    trigger = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x02 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x3390 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "Speeding in Marble Garden 2", description = "[Sonic 3, Extra] Clear Marble Garden Zone act 2 in Time Attack in under 5:00", points = 10,
    id = 225558, badge = "249678", published = "6/10/2022 7:37:39 PM", modified = "7/25/2022 10:12:21 PM",
    trigger = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x02 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x4D58 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "Speeding in Carnival Night 1", description = "[Sonic 3, Extra] Clear Carnival Night Zone act 1 in Time Attack in under 2:30", points = 10,
    id = 225559, badge = "249679", published = "6/10/2022 7:37:40 PM", modified = "7/25/2022 10:12:22 PM",
    trigger = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x03 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x2328 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "Speeding in Carnival Night 2", description = "[Sonic 3, Extra] Clear Carnival Night Zone act 2 in Time Attack in under 4:00", points = 10,
    id = 225560, badge = "249680", published = "6/10/2022 7:37:40 PM", modified = "7/25/2022 10:12:22 PM",
    trigger = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x03 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x3840 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "Speeding in Icecap 1", description = "[Sonic 3, Extra] Clear Icecap Zone act 1 in Time Attack in under 3:30", points = 10,
    id = 225561, badge = "249681", published = "6/10/2022 7:37:40 PM", modified = "7/25/2022 10:12:23 PM",
    trigger = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x04 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x3138 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "Speeding in Icecap 2", description = "[Sonic 3, Extra] Clear Icecap Zone act 2 in Time Attack in under 2:00", points = 10,
    id = 225562, badge = "249682", published = "6/10/2022 7:37:41 PM", modified = "7/25/2022 10:12:23 PM",
    trigger = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x04 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x1C20 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "Speeding in Launch Base 1", description = "[Sonic 3, Extra] Clear Launch Base Zone act 1 in Time Attack in under 4:00", points = 10,
    id = 225563, badge = "249683", published = "6/10/2022 7:37:41 PM", modified = "7/25/2022 10:12:23 PM",
    trigger = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x05 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x3840 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "Speeding in Launch Base 2", description = "[Sonic 3, Extra] Clear Launch Base Zone act 2 in Time Attack in under 5:00", points = 10,
    id = 225564, badge = "249684", published = "6/10/2022 7:37:41 PM", modified = "7/25/2022 10:12:24 PM",
    trigger = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x05 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x4650 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "The Adventure Continues", description = "[S&K, Normal] Beat Mushroom Hill Zone as Sonic", points = 4,
    id = 227518, badge = "252472", published = "6/18/2022 12:16:33 AM", modified = "7/26/2022 4:19:38 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x00 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x07 && S1Act2 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && word(0x1D4010) > 0x1000 && (prev(byte(0x1FFF08)) == 0x00 || prev(byte(0x1FFF08))
               == 0x01)
)

achievement(
    title = "Mushroom Hill Act 1 Perfection", description = "[S&K, Normal] As Sonic, beat the boss of Mushroom Hill Zone act 1 damageless, no shield or Super Sonic (Level Select allowed)", points = 5,
    id = 227519, badge = "252473", published = "6/18/2022 12:16:33 AM", modified = "7/26/2022 4:19:38 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x07 && S1Act1 && trigger_when(byte(0x1FFAA9) == 0xFF) && word(0x1D4010)
               > 0x42A6 && word(0x1D4010) < 0x4500 && never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) ==
               0xA701)) && (prev(byte(0x1FFF08)) == 0x00 || prev(byte(0x1FFF08)) == 0x01) &&
              (always_false() || (unless((word(0x1D4010) <= 0x42A6 || prev(byte(0x11812C)) != 0x2E)) && unless(once(bit0(0x1D402A) == 0x01
                 || byte(0x1FFE18) != 0x00 || word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "Mushroom Hill Act 2 Perfection", description = "[S&K, Normal] As Sonic, beat the boss of Mushroom Hill Zone act 2 damageless without a fire shield or Super Sonic (Level Select allowed)", points = 5,
    id = 227520, badge = "252474", published = "6/18/2022 12:16:33 AM", modified = "7/26/2022 4:19:39 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x07 && S1Act2 && trigger_when(byte(0x1FFAA9) == 0xFF) && word(0x1D4010)
               > 0x10E0 && never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) == 0xA701)) && 
              (prev(byte(0x1FFF08)) == 0x00 || prev(byte(0x1FFF08)) == 0x01) &&
              (always_false() || (unless((word(0x1D4010) < 0x3C90 || prev(byte(0x11812C)) != 0x19)) && unless(once(bit4(0x1D402A) == 0x01
                 || byte(0x1FFE18) != 0x00 || word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "There's Nothing Holding Me Down Now", description = "[S&K, Easy] It's no fun having your speed stopped by something grabbing you. Launch yourself from a spring to where you would normally be caught by one of these in Mushroom Hill Zone act 1 (Level Select allowed)", points = 4,
    id = 227521, badge = "252475", published = "6/18/2022 12:16:34 AM", modified = "7/26/2022 4:19:39 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x00 || dword(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x01) && word(0x1D4014) >= 0x570 && word(0x1D4010) >= 0x3330 && word(0x1D4010) <=
               0x3361 && S1ZoneId == 0x07 && S1Act1 && prev(word(0x1D4014)) >= 0x5E0 && 
              word(0x1D4014) < 0x5E0
)

achievement(
    title = "Is It Duracell or Enegizer?", description = "[S&K, Normal] Beat Flying Battery Zone as Sonic", points = 5,
    id = 227522, badge = "252476", published = "6/18/2022 12:16:34 AM", modified = "7/26/2022 4:19:39 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x00 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x04 && S1Act2 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && word(0x1D4010) > 0x2000 && (prev(byte(0x1FFF08)) == 0x00 || prev(byte(0x1FFF08))
               == 0x01)
)

achievement(
    title = "Flying Battery Act 1 Perfection", description = "[S&K, Normal] As Sonic, beat the boss of Flying Battery Zone act 1 without getting hit, pressing left or right, or using Super Sonic (Level Select allowed)", points = 10,
    id = 227523, badge = "252477", published = "6/18/2022 12:16:34 AM", modified = "7/26/2022 4:19:40 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x04 && S1Act1 && trigger_when(byte(0x1FFAA9) == 0xFF) && word(0x1D4010)
               > 0x2E20 && word(0x1D4010) < 0x3000 && never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) ==
               0xA701)) && (prev(byte(0x1FFF08)) == 0x00 || prev(byte(0x1FFF08)) == 0x01) &&
              (always_false() || (unless((byte(0x1FF63A) == 0x01 || word(0x1D4010) < 0x2E20 || prev(byte(0x11812C)) != 0x2E)) && 
                unless(once(repeated(25, bit2(0x1030EB) == 0x00 || bit3(0x1030EB) == 0x00) || byte(0x1FFE18) != 0x00 ||
                 word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "Flying Battery Act 2 Perfection", description = "[S&K, Normal] As Sonic, beat the boss of Flying Battery act 2 without getting hit, no Super Sonic (Level Select allowed)", points = 5,
    id = 227524, badge = "252478", published = "6/18/2022 12:16:35 AM", modified = "7/26/2022 4:19:40 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x04 && S1Act2 && trigger_when(byte(0x1FFAA9) == 0xFF) && word(0x1D4010)
               > 0x2A80 && never((word(0x1FFE10) != prev(word(0x1FFE10)) || S1ZoneId != 0x13) && S1ZoneId !=
               0x14 && S1ZoneId != 0x15 && word(0x1D4022) == 0xA701) && (prev(byte(0x1FFF08)) == 0x00 ||
               prev(byte(0x1FFF08)) == 0x01) &&
              (always_false() || (unless((word(0x1D4010) < 0x2A80 || prev(byte(0x11812C)) != 0x2E) && prev(byte(0x11812C)) != 0x0A &&
                 prev(byte(0x11812C)) != 0x19) && unless(once(byte(0x1FFE18) != 0x00 || word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "A Bare-bones Spinning Pillar", description = "[S&K, Easy] Remember all those spinning pillars in Flying Battery act 2? Find the one that no longer has any platforms to crush you (Level Select allowed)", points = 5,
    id = 227525, badge = "252479", published = "6/18/2022 12:16:35 AM", modified = "7/26/2022 4:19:40 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x00 || dword(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x01) && word(0x1D4010) >= 0xD9A && word(0x1D4010) <= 0xDE3 && S1ZoneId ==
               0x04 && S1Act2 && word(0x1D4014) >= 0x7BC && word(0x1D4014) <= 0x800F
)

achievement(
    title = "Empty Your Shoes Before You Leave", description = "[S&K, Normal] Beat Sandopolis Zone as Sonic", points = 5,
    id = 227526, badge = "252480", published = "6/18/2022 12:16:35 AM", modified = "7/26/2022 4:19:41 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x00 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x08 && S1Act2 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && word(0x1D4010) > 0x2000 && (prev(byte(0x1FFF08)) == 0x00 || prev(byte(0x1FFF08))
               == 0x01)
)

achievement(
    title = "Sandopolis Act 1 Perfection", description = "[S&K, Normal] As Sonic, beat the boss of Sandopolis Zone act 1 without getting hit or pressing a jump button more than one time (Level Select allowed)", points = 5,
    id = 227527, badge = "252481", published = "6/18/2022 12:16:36 AM", modified = "7/26/2022 4:19:41 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x08 && S1Act1 && trigger_when(byte(0x1FFAA9) == 0xFF) && word(0x1D4010)
               > 0x4180 && word(0x1D4010) < 0x4460 && never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) ==
               0xA701)) && (prev(byte(0x1FFF08)) == 0x00 || prev(byte(0x1FFF08)) == 0x01) &&
              (always_false() || (unless((byte(0x1FF63A) == 0x01 || word(0x1D4010) < 0x4180 || prev(byte(0x11812C)) != 0x2E)) && 
                unless(once((repeated(2, bit4(0x1030EB) < prev(bit4(0x1030EB)) && bit5(0x1030EB) < prev(bit5(0x1030EB))
                 && bit6(0x1030EB) < prev(bit6(0x1030EB)))) || word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "Sandopolis Act 2 Perfection", description = "[S&K, Normal] As Sonic, beat the boss of Sandopolis act 2 without getting hit, no Super Sonic (Level Select allowed)", points = 5,
    id = 227528, badge = "252482", published = "6/18/2022 12:16:36 AM", modified = "7/26/2022 4:19:41 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x08 && S1Act2 && trigger_when(byte(0x1FFAA9) == 0xFF) && word(0x1D4010)
               > 0x4E70 && word(0x1D4014) >= 0x60F && word(0x1D4014) <= 0x740 && never((word(0x1FFE10) !=
               prev(word(0x1FFE10)) || word(0x1D4022) == 0xA701)) && (prev(byte(0x1FFF08)) == 0x00 ||
               prev(byte(0x1FFF08)) == 0x01) &&
              (always_false() || (unless((word(0x1D4010) < 0x4E70 || prev(byte(0x11812C)) != 0x12) && byte(0x11812C) != 0x29 &&
                 prev(byte(0x11812C)) != 0x19) && unless(once(byte(0x1FFE18) != 0x00 || word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "Where's the Ring and Speed Shoes?", description = "[S&K, Easy] Two monitors were removed? Why not just make them easier to get? Go where the monitors used to be (Level Select allowed)", points = 5,
    id = 227529, badge = "252483", published = "6/18/2022 12:16:36 AM", modified = "7/26/2022 4:19:42 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x00 || dword(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x01) && word(0x1D4014) >= 0x450 && word(0x1D4014) <= 0x4C0 && word(0x1D4010) >=
               0x2426 && word(0x1D4010) <= 0x2480 && S1ZoneId == 0x08 && S1Act2
)

achievement(
    title = "Hope the Island Doesn't Erupt", description = "[S&K, Normal] Beat Lava Reef Zone as Sonic", points = 10,
    id = 227530, badge = "252484", published = "6/18/2022 12:16:37 AM", modified = "7/26/2022 4:19:42 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x00 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x16 && S1Act1 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && word(0x1D4010) > 0x900 && (prev(byte(0x1FFF08)) == 0x00 || prev(byte(0x1FFF08))
               == 0x01)
)

achievement(
    title = "Lava Reef Act 1 Perfection", description = "[S&K, Normal] As Sonic, beat the boss of Lava Reef Zone act 1 without getting hit, no Super Sonic (Level Select allowed)", points = 5,
    id = 227531, badge = "252485", published = "6/18/2022 12:16:37 AM", modified = "7/26/2022 4:19:42 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x09 && S1Act1 && trigger_when(byte(0x1FFAA9) == 0xFF) && word(0x1D4010)
               > 0x2C00 && word(0x1D4010) < 0x2E00 && never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) ==
               0xA701)) && (prev(byte(0x1FFF08)) == 0x00 || prev(byte(0x1FFF08)) == 0x01) &&
              (always_false() || (unless((word(0x1D4010) < 0x2C00 || prev(byte(0x11812C)) != 0x2E)) && unless(once(byte(0x1FFE18) != 0x00
                 || word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "Lava Reef Act 2 Perfection", description = "[S&K, Normal] As Sonic, beat the boss of Lava Reef act 2 without getting hit, no Super Sonic (Level Select allowed)", points = 5,
    id = 227532, badge = "252486", published = "6/18/2022 12:16:37 AM", modified = "7/26/2022 4:19:43 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x16 && S1Act1 && trigger_when(byte(0x1FFAA9) == 0xFF) && 
              never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) == 0xA701)) && (prev(byte(0x1FFF08)) ==
               0x00 || prev(byte(0x1FFF08)) == 0x01) &&
              (always_false() || (unless(prev(byte(0x11812C)) != 0x19) && unless(once(byte(0x1FFE18) != 0x00 || word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "A Hedgehog With a Particular Set of Skills", description = "[S&K, Easy] A set of fifteen rings and a 1-up has somehow become harder to reach, so put your spindash jump and electric shield skills to the test (Level Select allowed)", points = 10,
    id = 227533, badge = "252487", published = "6/18/2022 12:16:38 AM", modified = "7/26/2022 4:19:43 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x00 || dword(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x01) && word(0x1D4014) >= 0x240 && word(0x1D4014) <= 0x2C0 && word(0x1D4010) >=
               0x1D36 && word(0x1D4010) <= 0x1E56 && S1ZoneId == 0x09 && S1Act1
)

achievement(
    title = "The Dissolution of a Doctor Echidna Partnership", description = "[S&K, Normal] Beat Hidden Palace Zone as Sonic", points = 5,
    id = 227534, badge = "252488", published = "6/18/2022 12:16:38 AM", modified = "7/26/2022 4:19:43 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x00 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && prev(S1ZoneId) == 0x16 && prev(S1ActId) == 0x01 && 
              S1ZoneId == 0x0A && S1Act1 && (prev(byte(0x1FFF08)) == 0x00 || prev(byte(0x1FFF08))
               == 0x01)
)

achievement(
    title = "Hidden Palace Perfection", description = "[S&K, Normal] As Sonic, beat the boss of Hidden Palace Zone without getting hit, no Super Sonic (Level Select allowed)", points = 5,
    id = 227535, badge = "252489", published = "6/18/2022 12:16:38 AM", modified = "7/26/2022 4:19:44 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x16 && S1Act2 && trigger_when(word(0x1FEE7C) != 0x380) && 
              word(0x1D4010) > 0x1000 && word(0x1D4010) < 0x1220 && never((word(0x1FFE10) != prev(word(0x1FFE10)) ||
               word(0x1D4022) == 0xA701)) && (prev(byte(0x1FFF08)) == 0x00 || prev(byte(0x1FFF08)) == 0x01) &&
              (always_false() || (unless((word(0x1D4010) < 0x1000 || prev(byte(0x11812C)) != 0x14) && prev(byte(0x11812C)) != 0x1F) && 
                unless(once(bit0(0x1D402A) == 0x01 || byte(0x1FFE18) != 0x00 || word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "The Unstable Floating Ruins", description = "[S&K, Normal] Beat Sky Sanctuary Zone as Sonic", points = 10,
    id = 227536, badge = "252490", published = "6/18/2022 12:16:39 AM", modified = "7/26/2022 4:19:44 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x00 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x0A && S1Act1 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && word(0x1D4010) > 0x1000 && (prev(byte(0x1FFF08)) == 0x00 || prev(byte(0x1FFF08))
               == 0x01)
)

achievement(
    title = "Sky Sanctuary Perfection 1", description = "[S&K, Normal] As Sonic, beat the first boss of Sky Sanctuary Zone without getting hit, no Super Sonic (Level Select allowed)", points = 5,
    id = 227537, badge = "252491", published = "6/18/2022 12:16:39 AM", modified = "7/26/2022 4:19:45 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x0A && S1Act1 && trigger_when(word(0x1FFE28) != prev(word(0x1FFE28))) && 
              never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) == 0xA701)) && (prev(byte(0x1FFF08)) ==
               0x00 || prev(byte(0x1FFF08)) == 0x01) &&
              (always_false() || (unless((word(0x1D4010) < 0x160 || word(0x1D4010) > 0x290 || prev(byte(0x11812C)) != 0x19)) && 
                unless(once(byte(0x1FFE18) != 0x00 || word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "Sky Sanctuary Perfection 2", description = "[S&K, Normal] As Sonic, beat the second boss of Sky Sanctuary Zone without getting hit, no Super Sonic (Level Select allowed)", points = 5,
    id = 227538, badge = "252492", published = "6/18/2022 12:16:39 AM", modified = "7/26/2022 4:19:45 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x0A && S1Act1 && trigger_when(word(0x1FFE28) != prev(word(0x1FFE28))) && 
              never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) == 0xA701)) && (prev(byte(0x1FFF08)) ==
               0x00 || prev(byte(0x1FFF08)) == 0x01) &&
              (always_false() || (unless((word(0x1D4010) < 0x1660 || word(0x1D4010) > 0x1798 || prev(byte(0x11812C)) != 0x19)) && 
                unless(once(byte(0x1FFE18) != 0x00 || word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "Sky Sanctuary Perfection 3", description = "[S&K, Normal] As Sonic, beat the third boss of Sky Sanctuary Zone without getting hit, no Super Sonic (Level Select allowed)", points = 5,
    id = 227539, badge = "252493", published = "6/18/2022 12:16:40 AM", modified = "7/26/2022 4:19:45 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x0A && S1Act1 && trigger_when(word(0x1FFE28) != prev(word(0x1FFE28))) && 
              never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) == 0xA701)) && (prev(byte(0x1FFF08)) ==
               0x00 || prev(byte(0x1FFF08)) == 0x01) &&
              (always_false() || (unless((word(0x1D4010) < 0x19A0 || word(0x1D4010) > 0x1AD0 || prev(byte(0x11812C)) != 0x19)) && 
                unless(once(byte(0x1FFE18) != 0x00 || word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "No Flight Needed for This Skip", description = "[S&K, Easy] Not only has a crumbling platform section been changed, some clouds were added as well! Use them to skip where the first boss is (Level Select allowed)", points = 4,
    id = 227540, badge = "252494", published = "6/18/2022 12:16:40 AM", modified = "7/26/2022 4:19:46 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x00 || dword(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00
               || word(0x1D4014) > 0x9F0 || byte(0x1030FF) != 0x01) && trigger_when(word(0x1D4014) <= 0x800) && 
              once(word(0x1D4014) >= 0x8F0 && word(0x1D4010) >= 0x650 && never(word(0x1D4010) <= 0x2A0)) && 
              word(0x1D4010) <= 0x7B4 && S1ZoneId == 0x0A && S1Act1
)

achievement(
    title = "Sonic Spacewalker", description = "[S&K, Normal] Beat Death Egg Zone Zone as Sonic", points = 10,
    id = 227541, badge = "252495", published = "6/18/2022 12:16:40 AM", modified = "7/26/2022 4:19:46 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x00 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && prev(S1ZoneId) == 0x17 && prev(S1ActId) == 0x00 && 
              (word(0x1FFE10) == 0xC00 || word(0x1FFE10) == 0xD01) && (prev(byte(0x1FFF08)) == 0x00 ||
               prev(byte(0x1FFF08)) == 0x01)
)

achievement(
    title = "Death Egg Act 1 Perfection", description = "[S&K, Normal] As Sonic, beat the boss of Death Egg Zone act 1 without getting hit, no Super Sonic (Level Select allowed)", points = 10,
    id = 227542, badge = "252496", published = "6/18/2022 12:16:41 AM", modified = "7/26/2022 4:19:46 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x0B && S1Act1 && trigger_when(byte(0x1FFAA9) == 0xFF) && 
              never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) == 0xA701)) && (prev(byte(0x1FFF08)) ==
               0x00 || prev(byte(0x1FFF08)) == 0x01) &&
              (always_false() || (unless((word(0x1D4010) < 0x10E0 || prev(byte(0x11812C)) != 0x2E)) && unless(once(byte(0x1FFE18) != 0x00
                 || word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "Death Egg Act 2 Perfection 1", description = "[S&K, Normal] As Sonic, beat the first boss of Death Egg act 2 without getting hit, no Super Sonic (Level Select allowed)", points = 5,
    id = 227543, badge = "252497", published = "6/18/2022 12:16:41 AM", modified = "7/26/2022 4:19:47 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x0B && S1Act2 && trigger_when(word(0x1FFE28) != prev(word(0x1FFE28))) && 
              never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) == 0xA701)) && (prev(byte(0x1FFF08)) ==
               0x00 || prev(byte(0x1FFF08)) == 0x01) &&
              (always_false() || (unless((word(0x1D4010) < 0x10E0 || prev(byte(0x11812C)) != 0x19)) && unless(once(byte(0x1FFE18) != 0x00
                 || word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "Death Egg Act 2 Perfection 2", description = "[S&K, Normal] As Sonic, beat the second boss of Death Egg act 2 without getting hit, no Super Sonic (Level Select allowed)", points = 10,
    id = 227544, badge = "252498", published = "6/18/2022 12:16:41 AM", modified = "7/26/2022 4:19:47 PM",
    trigger = unless((S1ScreenMode != 0x0C || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               dword(0x13713A) != 0x00 || byte(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              S1ZoneId == 0x17 && S1Act1 && trigger_when(word(0x1FFE28) != prev(word(0x1FFE28))) && 
              never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) == 0xA701)) && (byte(0x1FFF08) == 0x00 ||
               byte(0x1FFF08) == 0x01) &&
              (always_false() || (unless(prev(byte(0x11812C)) != 0x30) && unless(once(byte(0x1FFE18) != 0x00 || word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "The Balconies Above Death", description = "[S&K, Easy] Who needs those long platforms that angle based on your position? Let's have rising stairs instead! Land on one of the sets of platforms with a spring (Level Select allowed)", points = 5,
    id = 227545, badge = "252499", published = "6/18/2022 12:16:42 AM", modified = "7/26/2022 4:19:47 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x00 || dword(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x01) && S1ZoneId == 0x0B && S1Act2 &&
              ((word(0x1D4014) >= 0xA60 && word(0x1D4010) >= 0x2243 && word(0x1D4010) <= 0x22C0) ||
               (word(0x1D4014) >= 0xAF0 && word(0x1D4010) >= 0x2000 && word(0x1D4010) <= 0x2147))
)

achievement(
    title = "How Do Emeralds Let You Breath in Space?", description = "[S&K, Normal] Beat the game as Sonic with all 7 chaos emeralds", points = 25,
    id = 227546, badge = "252500", published = "6/18/2022 12:16:42 AM", modified = "7/26/2022 4:19:48 PM",
    trigger = unless((prev(S1ScreenMode) != 0x0C && prev(S1ScreenMode) != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x00 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && prev(S1ZoneId) == 0x0C && prev(S1ActId) == 0x00 && 
              S1Act2 && S1ZoneId == 0x0D && (prev(byte(0x1FFF08)) == 0x00 || prev(byte(0x1FFF08))
               == 0x01)
)

achievement(
    title = "Another Special Player I", description = "[S&K/S3&K, Normal] Earn a Perfect in special stage 1 (Super Emerald 4 in S3&K)", points = 5,
    id = 227547, badge = "252501", published = "6/18/2022 12:16:42 AM", modified = "7/26/2022 4:19:48 PM",
    trigger = unless((S1ScreenMode != 0x48 || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && word(0x1FE438) == 0x00 && word(0x1FE442) == 0x00 && 
              byte(0x1FFFB3) > prev(byte(0x1FFFB3)) && word(0x1FFFE0) == 0x00 &&
              ((dword(0x13713A) == 0x00 && prev(byte(0x1FFFB3)) == 0x00) ||
               (byte(0x13713A) == 0x03 && prev(byte(0x1FFFB3)) == 0x02))
)

achievement(
    title = "Another Special Player II", description = "[S&K/S3&K, Normal] Earn a Perfect in special stage 2 (Super Emerald 3 in S3&K)", points = 10,
    id = 227548, badge = "252502", published = "6/18/2022 12:16:43 AM", modified = "7/26/2022 4:19:48 PM",
    trigger = unless((S1ScreenMode != 0x48 || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && word(0x1FE438) == 0x00 && word(0x1FE442) == 0x00 && 
              byte(0x1FFFB2) > prev(byte(0x1FFFB2)) && word(0x1FFFE0) == 0x00 &&
              ((dword(0x13713A) == 0x00 && prev(byte(0x1FFFB2)) == 0x00) ||
               (dword(0x13713A) == 0x03 && prev(byte(0x1FFFB2)) == 0x02))
)

achievement(
    title = "Another Special Player III", description = "[S&K/S3&K, Normal] Earn a Perfect in special stage 3 (Super Emerald 5 in S3&K)", points = 5,
    id = 227549, badge = "252503", published = "6/18/2022 12:16:43 AM", modified = "7/26/2022 4:19:49 PM",
    trigger = unless((S1ScreenMode != 0x48 || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && word(0x1FE438) == 0x00 && word(0x1FE442) == 0x00 && 
              byte(0x1FFFB5) > prev(byte(0x1FFFB5)) && word(0x1FFFE0) == 0x00 &&
              ((dword(0x13713A) == 0x00 && prev(byte(0x1FFFB5)) == 0x00) ||
               (dword(0x13713A) == 0x03 && prev(byte(0x1FFFB5)) == 0x02))
)

achievement(
    title = "Another Special Player IV", description = "[S&K/S3&K, Normal] Earn a Perfect in special stage 4 (Super Emerald 2 in S3&K)", points = 10,
    id = 227550, badge = "252504", published = "6/18/2022 12:16:43 AM", modified = "7/26/2022 4:19:49 PM",
    trigger = unless((S1ScreenMode != 0x48 || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && word(0x1FE438) == 0x00 && word(0x1FE442) == 0x00 && 
              byte(0x1FFFB4) > prev(byte(0x1FFFB4)) && word(0x1FFFE0) == 0x00 &&
              ((dword(0x13713A) == 0x00 && prev(byte(0x1FFFB4)) == 0x00) ||
               (dword(0x13713A) == 0x03 && prev(byte(0x1FFFB4)) == 0x02))
)

achievement(
    title = "Another Special Player V", description = "[S&K/S3&K, Normal] Earn a Perfect in special stage 5 (Super Emerald 6 in S3&K)", points = 5,
    id = 227551, badge = "252505", published = "6/18/2022 12:16:44 AM", modified = "7/26/2022 4:19:49 PM",
    trigger = unless((S1ScreenMode != 0x48 || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && word(0x1FE438) == 0x00 && word(0x1FE442) == 0x00 && 
              byte(0x1FFFB7) > prev(byte(0x1FFFB7)) && word(0x1FFFE0) == 0x00 &&
              ((dword(0x13713A) == 0x00 && prev(byte(0x1FFFB7)) == 0x00) ||
               (dword(0x13713A) == 0x03 && prev(byte(0x1FFFB7)) == 0x02))
)

achievement(
    title = "Another Special Player VI", description = "[S&K/S3&K, Normal] Earn a Perfect in special stage 6 (Super Emerald 1 in S3&K)", points = 5,
    id = 227552, badge = "252506", published = "6/18/2022 12:16:44 AM", modified = "7/26/2022 4:19:50 PM",
    trigger = unless((S1ScreenMode != 0x48 || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && word(0x1FE438) == 0x00 && word(0x1FE442) == 0x00 && 
              byte(0x1FFFB6) > prev(byte(0x1FFFB6)) && word(0x1FFFE0) == 0x00 &&
              ((dword(0x13713A) == 0x00 && prev(byte(0x1FFFB6)) == 0x00) ||
               (dword(0x13713A) == 0x03 && prev(byte(0x1FFFB6)) == 0x02))
)

achievement(
    title = "Another Special Player VII", description = "[S&K/S3&K, Normal] Earn a Perfect in special stage 7 (Super Emerald 7 in S3&K)", points = 10,
    id = 227553, badge = "252507", published = "6/18/2022 12:16:44 AM", modified = "7/26/2022 4:19:50 PM",
    trigger = unless((S1ScreenMode != 0x48 || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && word(0x1FE438) == 0x00 && word(0x1FE442) == 0x00 && 
              byte(0x1FFFB9) > prev(byte(0x1FFFB9)) && word(0x1FFFE0) == 0x00 &&
              ((dword(0x13713A) == 0x00 && prev(byte(0x1FFFB9)) == 0x00) ||
               (dword(0x13713A) == 0x03 && prev(byte(0x1FFFB9)) == 0x02))
)

achievement(
    title = "The Hype Seems to be Missing...", description = "[S&K, Normal] Obtain all seven chaos emeralds", points = 10,
    id = 227554, badge = "252508", published = "6/18/2022 12:16:45 AM", modified = "7/26/2022 4:19:50 PM",
    trigger = unless((S1ScreenMode != 0x48 || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               dword(0x13713A) != 0x00 || dword(0x1FFFD0) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              prev(byte(0x1FFFB1)) == 0x06 && byte(0x1FFFB1) == 0x07
)

achievement(
    title = "Checkerboards are my Favorite Design", description = "[S&K, Extra] Clear the Special Stage gauntlet", points = 10,
    id = 227516, badge = "252522", published = "6/18/2022 12:16:27 AM", modified = "7/25/2022 10:12:36 PM",
    trigger = unless((S1ScreenMode != 0x48 && S1ScreenMode != 0x34) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x00 || byte(0x1030F8) != 0x02) && word(0x1FE438) == 0x00 && 
              word(0x1FFFB0) == 0x07
)

achievement(
    title = "Another Truely Special Player Showcase", description = "[S&K, Extra] Earn a Perfect in all special stages in the Special Stage gauntlet", points = 25,
    id = 227517, badge = "252523", published = "6/18/2022 12:16:28 AM", modified = "7/25/2022 10:12:37 PM",
    trigger = unless((S1ScreenMode != 0x34 || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               dword(0x13713A) != 0x00 || byte(0x1030F8) != 0x02)) && word(0x1FE438) == 0x00 && repeated(7,
               word(0x1FE442) == 0x00 && word(0x1FE442) < prev(word(0x1FE442))) &&
              (always_false() || (never(word(0x1FFFB0) < prev(word(0x1FFFB0)))))
)

achievement(
    title = "Speeding in Mushroom Hill 1", description = "[S&K, Extra] Clear Mushroom Hill Zone act 1 in Time Attack in under 2:00", points = 10,
    id = 227555, badge = "252509", published = "6/18/2022 12:16:45 AM", modified = "7/25/2022 10:12:37 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x00 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x1C20 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "Speeding in Mushroom Hill 2", description = "[S&K, Extra] Clear Mushroom Hill Zone act 2 in Time Attack in under 2:20", points = 10,
    id = 227556, badge = "252510", published = "6/18/2022 12:16:45 AM", modified = "7/25/2022 10:12:37 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x00 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x20D0 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "Speeding in Flying Battery 1", description = "[S&K, Extra] Clear Flying Battery Zone act 1 in Time Attack in under 3:30", points = 10,
    id = 227557, badge = "252511", published = "6/18/2022 12:16:46 AM", modified = "7/25/2022 10:12:38 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x01 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x3138 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "Speeding in Flying Battery 2", description = "[S&K, Extra] Clear Flying Battery Zone act 2 in Time Attack in under 4:40", points = 10,
    id = 227558, badge = "252512", published = "6/18/2022 12:16:46 AM", modified = "7/25/2022 10:12:38 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x01 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x41A0 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "Speeding in Sandopolis 1", description = "[S&K, Extra] Clear Sandopolis Zone act 1 in Time Attack in under 3:50", points = 10,
    id = 227559, badge = "252513", published = "6/18/2022 12:16:46 AM", modified = "7/25/2022 10:12:38 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x02 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x35E8 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "Speeding in Sandopolis 2", description = "[S&K, Extra] Clear Sandopolis Zone act 2 in Time Attack in under 5:30", points = 10,
    id = 227560, badge = "252514", published = "6/18/2022 12:16:47 AM", modified = "7/25/2022 10:12:39 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x02 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x4D58 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "Speeding in Lava Reef 1", description = "[S&K, Extra] Clear Lava Reef Zone act 1 in Time Attack in under 4:30", points = 10,
    id = 227561, badge = "252515", published = "6/18/2022 12:16:47 AM", modified = "7/25/2022 10:12:39 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x03 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x3F48 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "Speeding in Lava Reef 2", description = "[S&K, Extra] Clear Lava Reef Zone act 2 in Time Attack in under 4:00", points = 10,
    id = 227562, badge = "252516", published = "6/18/2022 12:16:47 AM", modified = "7/25/2022 10:12:39 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x03 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x3840 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "Speeding in Hidden Palace", description = "[S&K, Extra] Clear Hidden Palace Zone in Time Attack in under 1:00", points = 10,
    id = 227563, badge = "252517", published = "6/18/2022 12:16:48 AM", modified = "7/25/2022 10:12:40 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x04 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0xE10 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "Speeding in Sky Sanctuary", description = "[S&K, Extra] Clear Sky Sanctuary Zone in Time Attack in under 4:00", points = 10,
    id = 227564, badge = "252518", published = "6/18/2022 12:16:48 AM", modified = "7/25/2022 10:12:40 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x05 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x3840 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "Speeding in Death Egg 1", description = "[S&K, Extra] Clear Death Egg Zone act 1 in Time Attack in under 4:30", points = 10,
    id = 227565, badge = "252519", published = "6/18/2022 12:16:48 AM", modified = "7/25/2022 10:12:40 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x06 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x3F48 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "Speeding in Death Egg 2", description = "[S&K, Extra] Clear Death Egg Zone act 2 in Time Attack in under 5:00", points = 10,
    id = 227566, badge = "252520", published = "6/18/2022 12:16:49 AM", modified = "7/25/2022 10:12:41 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x06 && byte(0x1030FA) == 0x01 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x4650 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "Speeding in Doomsday", description = "[S&K, Extra] Clear Doomsday Zone in Time Attack in under 2:20", points = 10,
    id = 227567, badge = "252521", published = "6/18/2022 12:16:49 AM", modified = "7/25/2022 10:12:41 PM",
    trigger = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x07 && byte(0x1030FA) == 0x00 && 
              JamTimeAttack && repeated(20, byte(0x1030E9) == 0x02) && trigger_when((byte(0x1030E9) == 0x01 &&
               word(0x10370E) == prev(word(0x10370E)))) && (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C +
               byte(0x1FFE24)) <= 0x20D0 && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) ||
               S1LifeLost)
)

achievement(
    title = "Flying Through the Fire and the Flames", description = "[S3&K, Normal] Complete Angel Island Zone as Tails", points = 4,
    id = 227042, badge = "251934", published = "6/15/2022 4:55:48 AM", modified = "7/26/2022 4:11:52 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x00 && S1Act2 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && word(0x1D4010) > 0x4800 && byte(0x1FFF08) == 0x02
)

achievement(
    title = "Wish I Brought the Sea Fox", description = "[S3&K, Normal] Complete Hydrocity Zone as Tails", points = 4,
    id = 227043, badge = "251935", published = "6/15/2022 4:55:49 AM", modified = "7/26/2022 4:11:52 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x01 && S1Act2 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && word(0x1D4010) > 0x1600 && byte(0x1FFF08) == 0x02
)

achievement(
    title = "Relaxation in the Rock Garden", description = "[S3&K, Normal] Complete Marble Garden Zone as Tails", points = 5,
    id = 227044, badge = "251936", published = "6/15/2022 4:55:49 AM", modified = "7/26/2022 4:11:53 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x02 && S1Act2 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && word(0x1D4010) > 0x200 && byte(0x1FFF08) == 0x02
)

achievement(
    title = "Hope He's Not Afraid of Clowns", description = "[S3&K. Normal] Complete Carnival Night Zone as Tails", points = 5,
    id = 227045, badge = "251937", published = "6/15/2022 4:55:49 AM", modified = "7/26/2022 4:11:53 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x03 && S1Act2 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && word(0x1D4010) > 0x1000 && byte(0x1FFF08) == 0x02
)

achievement(
    title = "Wear a Scarf Out There", description = "[S3&K, Normal] Complete Icecap Zone as Tails", points = 5,
    id = 227046, badge = "251938", published = "6/15/2022 4:55:50 AM", modified = "7/26/2022 4:11:54 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x05 && S1Act2 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && word(0x1D4010) > 0x1000 && byte(0x1FFF08) == 0x02
)

achievement(
    title = "Go Go Go Through the Base", description = "[S3&K, Normal] Complete Launch Base Zone as Tails", points = 5,
    id = 227053, badge = "251945", published = "6/15/2022 4:55:52 AM", modified = "7/26/2022 4:11:54 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x06 && S1Act2 && byte(0x11812C) == 0x29 && 
              word(0x1D4010) > 0x1000 && byte(0x1FFF08) == 0x02
)

achievement(
    title = "Better Not Lick Them, Just to be Safe", description = "[S3&K, Normal] Complete Mushroom Hill Zone as Tails", points = 5,
    id = 227055, badge = "251947", published = "6/15/2022 4:55:53 AM", modified = "7/26/2022 4:11:55 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x07 && S1Act2 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && word(0x1D4010) > 0x1000 && byte(0x1FFF08) == 0x02
)

achievement(
    title = "Watt Are You Waiting for Fox Boy?", description = "[S3&K, Normal] Complete Flying Battery Zone as Tails", points = 5,
    id = 227057, badge = "251949", published = "6/15/2022 4:55:53 AM", modified = "7/26/2022 4:11:55 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x04 && S1Act2 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && word(0x1D4010) > 0x1000 && byte(0x1FFF08) == 0x02
)

achievement(
    title = "When There's Something Strange in the Pyramid", description = "[S3&K, Normal] Complete Sandopolis Zone as Tails", points = 10,
    id = 227059, badge = "251951", published = "6/15/2022 4:55:54 AM", modified = "7/26/2022 4:11:55 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x08 && S1Act2 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && word(0x1D4010) > 0x1000 && byte(0x1FFF08) == 0x02
)

achievement(
    title = "Shed Your Heat of the Moment Insecurities", description = "[S3&K, Normal] Complete Lava Reef Zone as Tails", points = 10,
    id = 227061, badge = "251953", published = "6/15/2022 4:55:55 AM", modified = "7/26/2022 4:11:56 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x16 && S1Act1 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && word(0x1D4010) > 0x900 && byte(0x1FFF08) == 0x02
)

achievement(
    title = "How the Tables Turn on Your Turntable", description = "[S3&K, Normal] Complete Hidden Palace Zone as Tails", points = 5,
    id = 227063, badge = "251955", published = "6/15/2022 4:55:55 AM", modified = "7/26/2022 4:11:56 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && prev(S1ZoneId) == 0x16 && prev(S1ActId) == 0x01 && 
              byte(0x1FFF08) == 0x02 && S1ZoneId == 0x0A && S1Act1
)

achievement(
    title = "I Wanna Fly High, of My Own Accord", description = "[S3&K, Normal] Complete Sky Sanctuary Zone as Tails", points = 10,
    id = 227065, badge = "251957", published = "6/15/2022 4:55:56 AM", modified = "7/26/2022 4:11:57 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x0A && S1Act1 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && word(0x1D4010) > 0x1000 && byte(0x1FFF08) == 0x02
)

achievement(
    title = "I'm Not Pointing Fingers, He Is", description = "[S3&K, Normal] Have Knuckles perform a different animation near the start of Sky Sanctuary Zone", points = 5,
    id = 227078, badge = "251970", published = "6/15/2022 4:56:00 AM", modified = "7/26/2022 4:11:57 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x0A && S1Act1 && word(0x1D4010) >= 0x3D0 && 
              word(0x1D4010) <= 0x3EF && byte(0x1D4836) == 0xEE
)

achievement(
    title = "A Tale of the Two-Tailed", description = "[S3&K, Normal] Beat the game as Tails", points = 10,
    id = 227041, badge = "251933", published = "6/15/2022 4:55:48 AM", modified = "7/26/2022 4:11:57 PM",
    trigger = unless((prev(S1ScreenMode) != 0x0C && prev(S1ScreenMode) != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && prev(S1ZoneId) == 0x17 && prev(S1ActId) == 0x00 && 
              prev(byte(0x1FFF08)) == 0x02 && S1Act2 && S1ZoneId == 0x0D
)

achievement(
    title = "Deja Vu, This Attack's Happened Before", description = "[S3&K, Normal] Complete Angel Island Zone as Knuckles", points = 4,
    id = 227047, badge = "251939", published = "6/15/2022 4:55:50 AM", modified = "7/26/2022 4:11:58 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x00 && S1Act2 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && word(0x1D4010) > 0x3600 && byte(0x1FFF08) == 0x03
)

achievement(
    title = "Don't Ask Me About Pronounciation", description = "[S3&K, Normal] Complete Hydrocity Zone as Knuckles", points = 4,
    id = 227048, badge = "251940", published = "6/15/2022 4:55:50 AM", modified = "7/26/2022 4:11:58 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x01 && S1Act2 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && word(0x1D4010) > 0x1600 && byte(0x1FFF08) == 0x03
)

achievement(
    title = "Chiseled Marble and Chiseled Fists", description = "[S3&K, Normal] Complete Marble Garden Zone as Knuckles", points = 5,
    id = 227049, badge = "251941", published = "6/15/2022 4:55:51 AM", modified = "7/26/2022 4:11:59 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x02 && S1Act2 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && word(0x1D4010) > 0x400 && byte(0x1FFF08) == 0x03
)

achievement(
    title = "The Carnival's Backstage Route", description = "[S3&K, Normal] Complete Carnival Night Zone as Knuckles", points = 5,
    id = 227050, badge = "251942", published = "6/15/2022 4:55:51 AM", modified = "7/26/2022 4:11:59 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x03 && S1Act2 && byte(0x11812C) == 0x29 && 
              word(0x1D4010) > 0x1000 && byte(0x1FFF08) == 0x03 && word(0x1D4014) > 0x320
)

achievement(
    title = "Hail to the Lone Echidna", description = "[S3&K, Normal] Complete Icecap Zone as Knuckles", points = 5,
    id = 227051, badge = "251943", published = "6/15/2022 4:55:51 AM", modified = "7/26/2022 4:12:00 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x05 && S1Act2 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && word(0x1D4010) > 0x1000 && byte(0x1FFF08) == 0x03
)

achievement(
    title = "Why Does This Place Still Exist?", description = "[S3&K, Normal] Complete Launch Base Zone as Knuckles", points = 5,
    id = 227054, badge = "251946", published = "6/15/2022 4:55:52 AM", modified = "7/26/2022 4:12:00 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x06 && S1Act2 && byte(0x11812C) == 0x29 && 
              word(0x1D4010) > 0x1000 && byte(0x1FFF08) == 0x03
)

achievement(
    title = "A Fungi to be With", description = "[S3&K, Normal] Complete Mushroom Hill Zone as Knuckles", points = 5,
    id = 227056, badge = "251948", published = "6/15/2022 4:55:53 AM", modified = "7/26/2022 4:12:00 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x07 && S1Act2 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && word(0x1D4010) > 0x1000 && byte(0x1FFF08) == 0x03
)

achievement(
    title = "Short Circuit the Ship", description = "[S3&K, Normal] Complete Flying Battery Zone as Knuckles", points = 5,
    id = 227058, badge = "251950", published = "6/15/2022 4:55:54 AM", modified = "7/26/2022 4:12:01 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x04 && S1Act2 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && word(0x1D4010) > 0x1000 && byte(0x1FFF08) == 0x03
)

achievement(
    title = "Rough, Coarse, and it Gets Everywhere", description = "[S3&K, Normal] Complete Sandopolis Zone as Knuckles", points = 10,
    id = 227060, badge = "251952", published = "6/15/2022 4:55:54 AM", modified = "7/26/2022 4:12:02 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x08 && S1Act2 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && word(0x1D4010) > 0x1000 && byte(0x1FFF08) == 0x03
)

achievement(
    title = "Their Goal, is it a Coral-ation?", description = "[S3&K, Normal] Complete Lava Reef Zone as Knuckles", points = 10,
    id = 227062, badge = "251954", published = "6/15/2022 4:55:55 AM", modified = "7/26/2022 4:12:02 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x09 && S1Act2 && prev(word(0x1D4010)) <
               0x3FD0 && word(0x1D4010) >= 0x3FD0 && byte(0x1FFF08) == 0x03 && word(0x1D4014) <= 0x10C && word(0x1D4014)
               > 0x5E
)

achievement(
    title = "Time for the Finale Up Above", description = "[S3&K, Normal] Complete Hidden Palace Zone as Knuckles", points = 5,
    id = 227064, badge = "251956", published = "6/15/2022 4:55:56 AM", modified = "7/26/2022 4:12:02 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x16 && S1Act2 && word(0x1D4010) >= 0xB26 && 
              byte(0x1FFF08) == 0x03 && word(0x1D4010) <= 0xB55 && word(0x1D4014) <= 0x29F && prev(word(0x1D4014)) >=
               0x2A0
)

achievement(
    title = "Tougher Than the Rest of Them", description = "[S3&K, Normal] Beat the game as Knuckles", points = 10,
    id = 227066, badge = "251958", published = "6/15/2022 4:55:56 AM", modified = "7/26/2022 4:12:03 PM",
    trigger = unless((prev(S1ScreenMode) != 0x0C && prev(S1ScreenMode) != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x0A && S1Act2 && byte(0x1FFF08) == 0x03 && 
              byte(0x11812C) == 0x15 && word(0x1D4010) > 0x1A0
)

achievement(
    title = "Hype for the Hyper, Surpass the Super!", description = "[S3&K, Normal] Obtain all chaos and super emeralds", points = 25,
    id = 227067, badge = "251959", published = "6/15/2022 4:55:57 AM", modified = "7/26/2022 4:12:03 PM",
    trigger = unless((S1ScreenMode != 0x48 || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && 
              prev(S2EmeraldCount) == 0x06 && S2EmeraldCount == 0x07 && byte(0x1FFFB1) == 0x07
)

achievement(
    title = "You Up for a Challenge or Two?", description = "[S3&K] All challenges allow the use of level select, but not debug mode. Have fun!", points = 0,
    id = 227081, badge = "251973", published = "6/15/2022 4:56:01 AM", modified = "7/26/2022 4:12:03 PM",
    trigger = unless((S1ScreenMode != 0x04 || dword(0x14F3B0) != 0xE1008111 || dword(0x137136) != 0x03 ||
               dword(0x13713A) != 0x03 || byte(0x1030F8) != 0x00 || byte(0x1030FF) != 0x00)) && byte(0x11812C) == 0x25
)

achievement(
    title = "Fighting A Forest Fire With Fire", description = "[S3&K, Normal] As Sonic (without Tails), obtain a Fire Shield in act 1 of Angel Island Zone and clear act 2 without losing it (no special/bonus stages)", points = 10,
    id = 227069, badge = "251961", published = "6/15/2022 4:55:57 AM", modified = "7/26/2022 4:12:04 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x00 && byte(0x1FFF08) == 0x01 && 
              trigger_when((S1Act2 && byte(0x1FFAA9) == 0xFF && word(0x1D4010) > 0x3600 &&
               byte(0x11812C) == 0x29)) && once(word(0x1FFE10) == 0x01 && word(0x1D4010) > 0xF79 && word(0x1D4010) <
               0x1220 && bit4(0x1D402A) == 0x01 && dword(0x1FFE22) == 0x00) && never((prev(S1ScreenMode) != 0x0C &&
               prev(S1ScreenMode) != 0x8C) || byte(0x1D402A) != prev(byte(0x1D402A)))
)

achievement(
    title = "Just Because I can Swim Doesn't Mean I Want to", description = "[S3&K, Normal] Reach the boss of Hydrocity Zone act 1 without going in the water as Knuckles without dying, using super/hyper, or going into special/bonus stages", points = 5,
    id = 227070, badge = "251962", published = "6/15/2022 4:55:58 AM", modified = "7/26/2022 4:12:04 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x01 && S1Act1 && byte(0x1FFF08) == 0x03 && 
              trigger_when((word(0x1D4014) >= 0x46B && word(0x1D4010) < 0x37B5 && word(0x1D4010) > 0x3680)) && 
              once(word(0x1FFE10) == 0x100 && dword(0x1FFE22) == 0x00) && never((S1ScreenMode != 0x0C &&
               S1ScreenMode != 0x8C) || word(0x1FFE13) < prev(word(0x1FFE13)) || byte(0x1FF65E) != 0x00 ||
               byte(0x1FF64C) != prev(byte(0x1FF64C)))
)

achievement(
    title = "Looting in the Garden", description = "[S3&K, Normal] Break 20 monitors in Marble Garden Zone as Tails, no special/bonus stages", points = 10,
    id = 227071, badge = "251963", published = "6/15/2022 4:55:58 AM", modified = "7/26/2022 4:12:04 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x02 && S1Act1 && byte(0x1FFF08) == 0x02 && 
              never((S1ZoneId != prev(S1ZoneId) || word(0x1FFE13) != prev(word(0x1FFE13)) || S1ActId
               != prev(S1ActId))) && measured(repeated(20, byte(0x1FFECC) > prev(byte(0x1FFECC))))
)

achievement(
    title = "Retracing the Hedgehog's Path", description = "[S3&K, Normal] Find and beat the boss of Carnival Night Zone act 2 as Knuckles", points = 10,
    id = 227052, badge = "251944", published = "6/15/2022 4:55:52 AM", modified = "7/26/2022 4:12:05 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE0) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x03 && S1Act2 && byte(0x1FFAA9) == 0xFF && 
              byte(0x11812C) == 0x29 && word(0x1D4010) > 0x1000 && byte(0x1FFF08) == 0x03 && word(0x1D4014) < 0x320
)

achievement(
    title = "Make Sure to Freeze Your Assets", description = "[S3&K, Normal] After obtaining all 7 chaos emeralds, complete Icecap Zone act 1 as Tails with 219 or more rings without entering a bonus stage", points = 25,
    id = 227072, badge = "251964", published = "6/15/2022 4:55:58 AM", modified = "7/26/2022 4:12:05 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && trigger_when((word(0x1FFE10) == 0x501 && word(0x1D4010) < 0x1000 &&
               byte(0x11812C) == 0x29 && S1Rings >= 0xDB)) && once(word(0x1FFE10) == 0x500 && byte(0x1FFFB1) ==
               0x07 && byte(0x1FFF08) == 0x02 && word(0x1FFE04) == 0x00) && never((word(0x1FFE10) != 0x500 &&
               S1ZoneId != prev(S1ZoneId)))
)

achievement(
    title = "Launch Base Act 2 Perfection REDUX", description = "[S3&K, Normal] Beat the boss of Launch Base Zone act 2 as Knuckles without getting hit, no Super/Hyper", points = 25,
    id = 227073, badge = "251965", published = "6/15/2022 4:55:59 AM", modified = "7/26/2022 4:12:06 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x06 && S1Act2 && 
              trigger_when(byte(0x1FFAA9) == 0xFF) && never((word(0x1FFE10) != prev(word(0x1FFE10)) || word(0x1D4022) ==
               0xA701)) && byte(0x1FFF08) == 0x03 &&
              (always_false() || (unless((word(0x1D4014) > 0x3EC && word(0x1D4010) < 0x4300 && prev(byte(0x11812C)) != 0x19)) && 
                unless(once(byte(0x1FF65E) != 0x00 || word(0x1D4022) == 0x8D01))))
)

achievement(
    title = "A Secret Stash in the Sky", description = "[S3&K, Normal] In act 2 of Mushroom Hill Zone, find the hidden set of seven rings and two shield monitors", points = 10,
    id = 227068, badge = "251960", published = "6/15/2022 4:55:57 AM", modified = "7/26/2022 4:12:06 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x07 && S1Act2 && word(0x1D4010) > 0x373F && 
              word(0x1D4010) < 0x377F && word(0x1D4014) <= 0x2D9
)

achievement(
    title = "Tails, Where Are You Going!?", description = "[S3&K, Normal] As Tails, successfully fly from the first outside platforming section to the start of the next outside section by going under the level in act 1 of Flying Battery Zone", points = 10,
    id = 227074, badge = "251966", published = "6/15/2022 4:55:59 AM", modified = "7/26/2022 4:12:06 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x04 && S1Act1 && once(byte(0x1FFF08) ==
               0x02 && word(0x1D4014) >= 0xAD0 && word(0x1D4010) > 0x874 && word(0x1D4010) < 0xD02 &&
               never(word(0x1D4014) < 0xA60)) && trigger_when((word(0x1D4010) >= 0x140A && word(0x1D4010) <= 0x1608 &&
               word(0x1D4014) == 0xAF0))
)

achievement(
    title = "Saving on the Electrical/Oil Bill", description = "[S3&K, Normal] In Sandopolis Zone act 2, reach the boss without turning on the lights", points = 25,
    id = 227075, badge = "251967", published = "6/15/2022 4:55:59 AM", modified = "7/26/2022 4:12:07 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x08 && S1Act2 && 
              trigger_when((word(0x1D4010) >= 0x5000 && word(0x1D4010) <= 0x5080 && word(0x1D4014) <= 0x4C2 &&
               word(0x1D4014) >= 0x440)) && byte(0x1FFF08) == 0x03 && disable_when(byte(0x1FF65E) != 0x00 ||
               byte(0x1FF7C2) < prev(byte(0x1FF7C2)), until=word(0x1FFE10) != prev(word(0x1FFE10)))
)

achievement(
    title = "Like Running Around in Norfair", description = "[S3&K, Normal] Clear both acts of Lava Reef Zone as Tails without dying, using Fire Shields, using super, or going into special/bonus stages", points = 25,
    id = 227076, badge = "251968", published = "6/15/2022 4:56:00 AM", modified = "7/26/2022 4:12:07 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && trigger_when((prev(word(0x1FFE10)) == 0x1600 && byte(0x1FFAA9) == 0xFF &&
               byte(0x11812C) == 0x29)) && once(word(0x1FFE10) == 0x900 && word(0x1FFE04) == 0x00) && 
              never((((S1ZoneId != 0x09 && S1ZoneId != 0x16 && S1ZoneId != prev(S1ZoneId)) ||
               prev(S1ScreenMode) != 0x0C) && prev(S1ScreenMode) != 0x8C) || byte(0x1FF65E) != 0x00 ||
               bit4(0x1D402A) == 0x01 || word(0x1FFE13) < prev(word(0x1FFE13)))
)

achievement(
    title = "Okay, But Why Have Them in This Stage?", description = "[S3&K, Normal] Destroy all 10 monitors in Hidden Palace Zone as Tails", points = 5,
    id = 227077, badge = "251969", published = "6/15/2022 4:56:00 AM", modified = "7/26/2022 4:12:07 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x16 && S1Act2 && byte(0x1FFF08) == 0x02 && 
              never((S1ZoneId != prev(S1ZoneId) || S1ActId != prev(S1ActId))) && 
              measured(repeated(10, byte(0x1FFECC) > prev(byte(0x1FFECC))))
)

achievement(
    title = "I Don't Want a Nostalgia Trip", description = "[S3&K, Normal] As Tails, clear Sky Sancutary Zone while only fighting Mecha Sonic once without dying or bonus stages", points = 10,
    id = 227079, badge = "251971", published = "6/15/2022 4:56:01 AM", modified = "7/26/2022 4:12:08 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && S1ZoneId == 0x0A && S1Act1 && 
              trigger_when((byte(0x1FFAA9) == 0xFF && word(0x1D4010) > 0x1000 && byte(0x11812C) == 0x29)) && 
              byte(0x1FFF08) == 0x02 && once(word(0x1D4010) < 0x150 && word(0x1D4014) >= 0xB70 && word(0x1FFE04) ==
               0x00) && never((prev(S1ScreenMode) != 0x0C && prev(S1ScreenMode) != 0x8C) || word(0x1FFE13) <
               prev(word(0x1FFE13)) || word(0x1FFE10) != prev(word(0x1FFE10))) && never(repeated(2, byte(0x11812C) !=
               prev(byte(0x11812C)) && byte(0x11812C) == 0x19))
)

achievement(
    title = "Fragile Items in the Electronics Department", description = "[S3&K, Normal] Clear both acts of Death Egg Zone without dying, breaking any monitors, using super/hyper, or going into bonus stages", points = 25,
    id = 227080, badge = "251972", published = "6/15/2022 4:56:01 AM", modified = "7/26/2022 4:12:08 PM",
    trigger = unless((S1ScreenMode != 0x0C && S1ScreenMode != 0x8C) || dword(0x14F3B0) != 0xE1008111 ||
               dword(0x137136) != 0x03 || dword(0x13713A) != 0x03 || dword(0x1FFFE2) != 0x00 || byte(0x1030F8) != 0x00
               || byte(0x1030FF) != 0x00) && trigger_when((prev(word(0x1FFE10)) == 0x1700 && word(0x1FFE10) == 0xD01)) && 
              once(word(0x1FFE10) == 0xB00 && word(0x1D4010) < 0xA0 && word(0x1D4014) >= 0x990 && word(0x1FFE04) ==
               0x00) && never((prev(S1ScreenMode) != 0x0C && prev(S1ScreenMode) != 0x8C) || byte(0x1FF65E) != 0x00
               || word(0x1FFE13) < prev(word(0x1FFE13))) && never((S1ZoneId == 0x0B && byte(0x1FFECC) >
               prev(byte(0x1FFECC))))
)

achievement(
    title = "And A Ring To Keep On Playing", description = "[Blue Spheres] Clear a blue sphere stage with difficulty 1.", points = 5,
    id = 226152, badge = "250878", published = "6/13/2022 8:10:41 PM", modified = "7/25/2022 10:12:55 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x00
)

achievement(
    title = "2 Player Modes", description = "[Blue Spheres] Clear a blue sphere stage with difficulty 2.", points = 5,
    id = 226153, badge = "250879", published = "6/13/2022 8:10:41 PM", modified = "7/25/2022 10:12:56 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x01
)

achievement(
    title = "3 Unsung Heroes", description = "[Blue Spheres] Clear a blue sphere stage with difficulty 3.", points = 5,
    id = 226154, badge = "250880", published = "6/13/2022 8:10:41 PM", modified = "7/25/2022 10:12:56 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x02
)

achievement(
    title = "4 Casinos", description = "[Blue Spheres] Clear a blue sphere stage with difficulty 4.", points = 5,
    id = 226155, badge = "250881", published = "6/13/2022 8:10:42 PM", modified = "7/25/2022 10:12:56 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x03
)

achievement(
    title = "FIVE FLICKIES FREEEEEEEEEED!", description = "[Blue Spheres] Clear a blue sphere stage with difficulty 5.", points = 5,
    id = 226156, badge = "250882", published = "6/13/2022 8:10:42 PM", modified = "7/25/2022 10:12:57 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x04
)

achievement(
    title = "6 Scrapped Brains", description = "[Blue Spheres] Clear a blue sphere stage with difficulty 6.", points = 5,
    id = 226157, badge = "250883", published = "6/13/2022 8:10:42 PM", modified = "7/25/2022 10:12:57 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x05
)

achievement(
    title = "7 Chaos Emeralds", description = "[Blue Spheres] Clear a blue sphere stage with difficulty 7.", points = 5,
    id = 226158, badge = "250884", published = "6/13/2022 8:10:43 PM", modified = "7/25/2022 10:12:57 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x06
)

achievement(
    title = "8 Hits To Freedom", description = "[Blue Spheres] Clear a blue sphere stage with difficulty 8.", points = 5,
    id = 226159, badge = "250885", published = "6/13/2022 8:10:43 PM", modified = "7/25/2022 10:12:58 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x07
)

achievement(
    title = "9 Skies Chasing", description = "[Blue Spheres] Clear a blue sphere stage with difficulty 9.", points = 5,
    id = 226160, badge = "250886", published = "6/13/2022 8:10:43 PM", modified = "7/25/2022 10:12:58 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x08
)

achievement(
    title = "10 Rings in TVs", description = "[Blue Spheres] Clear a blue sphere stage with difficulty 10.", points = 10,
    id = 226161, badge = "250887", published = "6/13/2022 8:10:44 PM", modified = "7/25/2022 10:12:58 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x09
)

achievement(
    title = "11 Bumpers Bumping", description = "[Blue Spheres] Clear a blue sphere stage with difficulty 11.", points = 10,
    id = 226162, badge = "250888", published = "6/13/2022 8:10:44 PM", modified = "7/25/2022 10:12:59 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x0A
)

achievement(
    title = "12 Flipping See-Saws", description = "[Blue Spheres] Clear a blue sphere stage with difficulty 12.", points = 10,
    id = 226163, badge = "250889", published = "6/13/2022 8:10:44 PM", modified = "7/25/2022 10:12:59 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x0B
)

achievement(
    title = "13 MAX Levels", description = "[Blue Spheres] Clear a blue sphere stage with difficulty MAX.", points = 10,
    id = 226164, badge = "250890", published = "6/13/2022 8:10:45 PM", modified = "7/25/2022 10:12:59 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x0C
)

achievement(
    title = "Perfect 1", description = "[Blue Spheres] Get a perfect on a blue sphere stage  with difficulty 1.", points = 10,
    id = 226165, badge = "250891", published = "6/13/2022 8:10:45 PM", modified = "7/25/2022 10:13:00 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x00 && word(0x1FE442) == 0x00
)

achievement(
    title = "Perfect 2", description = "[Blue Spheres] Get a perfect on a blue sphere stage with difficulty 2.", points = 10,
    id = 226166, badge = "250892", published = "6/13/2022 8:10:45 PM", modified = "7/25/2022 10:13:00 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x01 && word(0x1FE442) == 0x00
)

achievement(
    title = "Perfect 3", description = "[Blue Spheres] Get a perfect on a blue sphere stage with difficulty 3.", points = 10,
    id = 226167, badge = "250893", published = "6/13/2022 8:10:46 PM", modified = "7/25/2022 10:13:00 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x02 && word(0x1FE442) == 0x00
)

achievement(
    title = "Perfect 4", description = "[Blue Spheres] Get a perfect on a blue sphere stage with difficulty 4.", points = 10,
    id = 226168, badge = "250894", published = "6/13/2022 8:10:46 PM", modified = "7/25/2022 10:13:01 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x03 && word(0x1FE442) == 0x00
)

achievement(
    title = "Perfect 5", description = "[Blue Spheres] Get a perfect on a blue sphere stage with difficulty 5.", points = 10,
    id = 226169, badge = "250895", published = "6/13/2022 8:10:46 PM", modified = "7/25/2022 10:13:01 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x04 && word(0x1FE442) == 0x00
)

achievement(
    title = "Perfect 6", description = "[Blue Spheres] Get a perfect on a blue sphere stage with difficulty 6.", points = 10,
    id = 226170, badge = "250896", published = "6/13/2022 8:10:47 PM", modified = "7/25/2022 10:13:01 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x05 && word(0x1FE442) == 0x00
)

achievement(
    title = "Perfect 7", description = "[Blue Spheres] Get a perfect on a blue sphere stage with difficulty 7.", points = 10,
    id = 226171, badge = "250897", published = "6/13/2022 8:10:47 PM", modified = "7/25/2022 10:13:02 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x06 && word(0x1FE442) == 0x00
)

achievement(
    title = "Perfect 8", description = "[Blue Spheres] Get a perfect on a blue sphere stage with difficulty 8.", points = 10,
    id = 226172, badge = "250898", published = "6/13/2022 8:10:47 PM", modified = "7/25/2022 10:13:02 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x07 && word(0x1FE442) == 0x00
)

achievement(
    title = "Perfect 9", description = "[Blue Spheres] Get a perfect on a blue sphere stage with difficulty 9.", points = 10,
    id = 226173, badge = "250899", published = "6/13/2022 8:10:48 PM", modified = "7/25/2022 10:13:02 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x08 && word(0x1FE442) == 0x00
)

achievement(
    title = "Perfect 10", description = "[Blue Spheres] Get a perfect on a blue sphere stage with difficulty 10.", points = 25,
    id = 226174, badge = "250900", published = "6/13/2022 8:10:48 PM", modified = "7/25/2022 10:13:03 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x09 && word(0x1FE442) == 0x00
)

achievement(
    title = "Perfect 11", description = "[Blue Spheres] Get a perfect on a blue sphere stage with difficulty 11.", points = 25,
    id = 226175, badge = "250901", published = "6/13/2022 8:10:48 PM", modified = "7/25/2022 10:13:03 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x0A && word(0x1FE442) == 0x00
)

achievement(
    title = "Perfect 12", description = "[Blue Spheres] Get a perfect on a blue sphere stage with difficulty 12.", points = 25,
    id = 226176, badge = "250902", published = "6/13/2022 8:10:49 PM", modified = "7/25/2022 10:13:03 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x0B && word(0x1FE442) == 0x00
)

achievement(
    title = "Perfect MAX", description = "[Blue Spheres] Get a perfect on a blue sphere stage with difficulty MAX.", points = 25,
    id = 226177, badge = "250903", published = "6/13/2022 8:10:49 PM", modified = "7/25/2022 10:13:04 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && byte(0x1FFFAC) == 0x0C && word(0x1FE442) == 0x00
)

achievement(
    title = "Shopping For Limes", description = "[Blue Spheres] Clear a blue sphere stage and collect a green chaos emerald.", points = 5,
    id = 226178, badge = "250904", published = "6/13/2022 8:10:49 PM", modified = "7/25/2022 10:13:04 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && (bit2(0x1FFFA7) * 0x04 + bit1(0x1FFFA7) * 0x02 + bit0(0x1FFFA7)) ==
               0x00
)

achievement(
    title = "Shopping For Apples", description = "[Blue Spheres] Clear a blue sphere stage and collect a red chaos emerald.", points = 5,
    id = 226179, badge = "250905", published = "6/13/2022 8:10:50 PM", modified = "7/25/2022 10:13:04 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && ((bit2(0x1FFFA7) * 0x04 + bit1(0x1FFFA7) * 0x02 + bit0(0x1FFFA7)) ==
               0x01) || (bit2(0x1FFFA7) * 0x04 + bit1(0x1FFFA7) * 0x02 + bit0(0x1FFFA7)) == 0x05
)

achievement(
    title = "Shopping For Pomegranate", description = "[Blue Spheres] Clear a blue sphere stage and collect a pink chaos emerald.", points = 5,
    id = 226180, badge = "250906", published = "6/13/2022 8:10:50 PM", modified = "7/25/2022 10:13:05 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && (bit2(0x1FFFA7) * 0x04 + bit1(0x1FFFA7) * 0x02 + bit0(0x1FFFA7)) ==
               0x02
)

achievement(
    title = "Shopping For Blueberries", description = "[Blue Spheres] Clear a blue sphere stage and collect a blue chaos emerald.", points = 5,
    id = 226181, badge = "250907", published = "6/13/2022 8:10:50 PM", modified = "7/25/2022 10:13:05 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && (bit2(0x1FFFA7) * 0x04 + bit1(0x1FFFA7) * 0x02 + bit0(0x1FFFA7)) ==
               0x03
)

achievement(
    title = "Shopping For Melons", description = "[Blue Spheres] Clear a blue sphere stage and collect a gray chaos emerald.", points = 5,
    id = 226182, badge = "250908", published = "6/13/2022 8:10:51 PM", modified = "7/25/2022 10:13:05 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && (bit2(0x1FFFA7) * 0x04 + bit1(0x1FFFA7) * 0x02 + bit0(0x1FFFA7)) ==
               0x04
)

achievement(
    title = "Shopping For Plums", description = "[Blue Spheres] Clear a blue sphere stage and collect a cyan chaos emerald.", points = 5,
    id = 226183, badge = "250909", published = "6/13/2022 8:10:51 PM", modified = "7/25/2022 10:13:06 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && (bit2(0x1FFFA7) * 0x04 + bit1(0x1FFFA7) * 0x02 + bit0(0x1FFFA7)) ==
               0x06
)

achievement(
    title = "Shopping For Bananas", description = "[Blue Spheres] Clear a blue sphere stage and collect a yellow chaos emerald.", points = 5,
    id = 226184, badge = "250910", published = "6/13/2022 8:10:51 PM", modified = "7/25/2022 10:13:06 PM",
    trigger = dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01 && prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D)
               == 0x04 && word(0x1FE438) == 0x00 && (bit2(0x1FFFA7) * 0x04 + bit1(0x1FFFA7) * 0x02 + bit0(0x1FFFA7)) ==
               0x07
)

achievement(
    title = "Triple Threat", description = "[Blue Spheres] Win three special stages in a row (no changing the code in the middle).", points = 5,
    id = 226185, badge = "250911", published = "6/13/2022 8:10:52 PM", modified = "7/25/2022 10:13:06 PM",
    trigger = word(0x1FE438) == 0x00 && measured(repeated(3, prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D) == 0x04),
               when=(dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01)) && never((dword(0x14F3B0) != 0xE1008111
               && byte(0x13713A) != 0x01)) && never((byte(0x1FE44D) == 0x00 && byte(0x1FE432) >= 0x01 && byte(0x1FE432)
               <= 0x3D)) && never((byte(0x1FF8BC) == 0x74 && byte(0x1FF8C4) == 0x60 && byte(0x1FF8CC) == 0x60 &&
               byte(0x1FF8D4) == 0x60 && byte(0x1FF8DC) == 0x60 && byte(0x1FF8E4) == 0x60 && byte(0x1FF8EC) == 0x60 &&
               byte(0x1FF8F4) == 0x60 && byte(0x1FF8FC) == 0x60 && byte(0x1FF904) == 0x60 && byte(0x1FF90C) == 0x60 &&
               byte(0x1FF914) == 0x60))
)

achievement(
    title = "Quintuple Threat", description = "[Blue Spheres] Win five special stages in a row (no changing the code in the middle).", points = 10,
    id = 226186, badge = "250912", published = "6/13/2022 8:10:52 PM", modified = "7/25/2022 10:13:07 PM",
    trigger = word(0x1FE438) == 0x00 && measured(repeated(5, prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D) == 0x04),
               when=(dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01)) && never((dword(0x14F3B0) != 0xE1008111
               && byte(0x13713A) != 0x01)) && never((byte(0x1FE44D) == 0x00 && byte(0x1FE432) >= 0x01 && byte(0x1FE432)
               <= 0x3D)) && never((byte(0x1FF8BC) == 0x74 && byte(0x1FF8C4) == 0x60 && byte(0x1FF8CC) == 0x60 &&
               byte(0x1FF8D4) == 0x60 && byte(0x1FF8DC) == 0x60 && byte(0x1FF8E4) == 0x60 && byte(0x1FF8EC) == 0x60 &&
               byte(0x1FF8F4) == 0x60 && byte(0x1FF8FC) == 0x60 && byte(0x1FF904) == 0x60 && byte(0x1FF90C) == 0x60 &&
               byte(0x1FF914) == 0x60))
)

achievement(
    title = "Perfect Triple Threat", description = "[Blue Spheres] Win three special stages in a row with perfects (no changing the code in the middle).", points = 10,
    id = 226187, badge = "250913", published = "6/13/2022 8:10:52 PM", modified = "7/25/2022 10:13:07 PM",
    trigger = word(0x1FE438) == 0x00 && measured(repeated(3, prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D) == 0x04),
               when=(dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01)) && never((dword(0x14F3B0) != 0xE1008111
               && byte(0x13713A) != 0x01)) && never((byte(0x1FE44D) == 0x00 && byte(0x1FE432) >= 0x01 && byte(0x1FE432)
               <= 0x3D)) && never((byte(0x1FF8BC) == 0x74 && byte(0x1FF8C4) == 0x60 && byte(0x1FF8CC) == 0x60 &&
               byte(0x1FF8D4) == 0x60 && byte(0x1FF8DC) == 0x60 && byte(0x1FF8E4) == 0x60 && byte(0x1FF8EC) == 0x60 &&
               byte(0x1FF8F4) == 0x60 && byte(0x1FF8FC) == 0x60 && byte(0x1FF904) == 0x60 && byte(0x1FF90C) == 0x60 &&
               byte(0x1FF914) == 0x60)) && never((word(0x1FE442) != 0x00 && prev(byte(0x1FE44D)) == 0x03 &&
               byte(0x1FE44D) == 0x04))
)

achievement(
    title = "Perfect Quintuple Threat", description = "[Blue Spheres] Win five special stages in a row with perfects (no changing the code in the middle).", points = 25,
    id = 226188, badge = "260156", published = "6/13/2022 8:10:53 PM", modified = "7/25/2022 10:13:07 PM",
    trigger = word(0x1FE438) == 0x00 && measured(repeated(5, prev(byte(0x1FE44D)) == 0x03 && byte(0x1FE44D) == 0x04),
               when=(dword(0x14F3B0) == 0xE1008111 && byte(0x13713A) == 0x01)) && never((dword(0x14F3B0) != 0xE1008111
               && byte(0x13713A) != 0x01)) && never((byte(0x1FE44D) == 0x00 && byte(0x1FE432) >= 0x01 && byte(0x1FE432)
               <= 0x3D)) && never((byte(0x1FF8BC) == 0x74 && byte(0x1FF8C4) == 0x60 && byte(0x1FF8CC) == 0x60 &&
               byte(0x1FF8D4) == 0x60 && byte(0x1FF8DC) == 0x60 && byte(0x1FF8E4) == 0x60 && byte(0x1FF8EC) == 0x60 &&
               byte(0x1FF8F4) == 0x60 && byte(0x1FF8FC) == 0x60 && byte(0x1FF904) == 0x60 && byte(0x1FF90C) == 0x60 &&
               byte(0x1FF914) == 0x60)) && never((word(0x1FE442) != 0x00 && prev(byte(0x1FE44D)) == 0x03 &&
               byte(0x1FE44D) == 0x04))
)

leaderboard(
    id = 36461, title = "Sonic 1 Normal Any% Classic",
    description = "[Sonic 1, Normal] Beat the game as fast as possible w/o game overs. Spindash is not allowed.",
    start  = Sonic1 && byte(0x1370D2) == 0x00 && !S1SpinDashOn && 
             !S1LevelSelect && S1NoDemo && prev(S1ScreenMode) == 0x8C && S1ScreenMode == 0x0C && 
             S1ZoneId == 0x00 && S1Act1,
    cancel = always_true() &&
             ((byte(0x1FFE13) == 0x00) ||
              (dword(0x14F3B0) != 0x7302038C) ||
              (byte(0x137136) != 0x00) ||
              (S1ScreenMode == 0x04)),
    submit = S1ScreenMode == 0x18,
    value = measured(tally(0, (word(0x1FF63A) == 0x00 && (prev(byte(0x1FFE24)) + byte(0x1FFE24)) == 0x3A),
              (word(0x1FF63A) == 0x00 && (byte(0x1FFE24) - prev(byte(0x1FFE24))) == 0x02), byte(0x1FFE24) !=
              prev(byte(0x1FFE24)))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 36462, title = "Sonic 1 Normal Any% Anniversary",
    description = "[Sonic 1, Normal] Beat the game as fast as possible w/o game overs. Spindash is allowed.",
    start  = Sonic1 && byte(0x1370D2) == 0x00 && S1SpinDashOn && 
             !S1LevelSelect && S1NoDemo && prev(S1ScreenMode) == 0x8C && S1ScreenMode == 0x0C && 
             S1ZoneId == 0x00 && S1Act1,
    cancel = always_true() &&
             ((byte(0x1FFE13) == 0x00) ||
              (dword(0x14F3B0) != 0x7302038C) ||
              (byte(0x137136) != 0x00) ||
              (S1ScreenMode == 0x04)),
    submit = S1ScreenMode == 0x18,
    value = measured(tally(0, (word(0x1FF63A) == 0x00 && (prev(byte(0x1FFE24)) + byte(0x1FFE24)) == 0x3A),
              (word(0x1FF63A) == 0x00 && (byte(0x1FFE24) - prev(byte(0x1FFE24))) == 0x02), byte(0x1FFE24) !=
              prev(byte(0x1FFE24)))),
    format = "FRAMES", lower_is_better = true
)

function S1TimeAttackBoard(index) {
    ord = Sonic1LevelOrderLookup[index]
    level = Sonic1LevelLookup[ord]
    
    leaderboard(
        id = 36463 + (index * 2),
        title = level + " - Time Attack",
        description = "[Sonic 1, Extra] Get the best time you can in Time Attack mode for " + level + ".",
        start = S1CommonBoardStart(index),
        cancel = always_false(),
        submit = always_true(),
        value = S1TimeElapsed,
        lower_is_better = true,
        format = "FRAMES"
    )
}

function S1ScoreAttackBoard(index) {
    ord = Sonic1LevelOrderLookup[index]
    level = Sonic1LevelLookup[ord]
    
    leaderboard(
        id = 36464 + (index * 2),
        title = level + " - Score Attack",
        description = "[Sonic 1, Extra] Get the best score you can in Time Attack mode for " + level + ".",
        start = S1CommonBoardStart(index),
        cancel = always_false(),
        submit = always_true(),
        value = S1Score * 10,
    format = "VALUE"
    )
}

for i in range(0, 18, 1) {
    S1TimeAttackBoard(i)
    if i < 18 {
        S1ScoreAttackBoard(i)
    }
}

leaderboard(
    id = 36576, title = "Sonic 2 Normal Any%",
    description = "[Sonic 2, Normal] Beat the game as fast as possible w/o game overs",
    start  = dword(0x14F3B0) == 0x4F262A10 && byte(0x137136) == 0x01 && byte(0x1030F8) == 0x00 && byte(0x13713A) == 0x00 && 
             byte(0x1370D2) == 0x00 && S2NoDebug && S1NoDemo && prev(S1ScreenMode) == 0x8C && 
             S1ScreenMode == 0x0C && S1ZoneId == 0x00 && S1Act1,
    cancel = always_true() &&
             ((byte(0x1FFE13) == 0x00) ||
              (dword(0x14F3B0) != 0x4F262A10) ||
              (byte(0x137136) != 0x01) ||
              (S1ScreenMode == 0x04)),
    submit = S1ScreenMode == 0x20,
    value = measured(tally(0, (word(0x1FF63A) == 0x00 && (prev(byte(0x1FFE24)) + byte(0x1FFE24)) == 0x3A),
              (word(0x1FF63A) == 0x00 && (byte(0x1FFE24) - prev(byte(0x1FFE24))) == 0x02), (byte(0x1FF63A) == 0x00 &&
              S1ScreenMode == 0x10), byte(0x1FFE24) != prev(byte(0x1FFE24)))),
    format = "FRAMES", lower_is_better = true
)

S2ActOrderLookup = [
    [0, 0],
    [0, 1],
    [1, 0],
    [1, 1],
    [2, 0],
    [2, 1],
    [3, 0],
    [3, 1],
    [4, 0],
    [4, 1],
    [5, 0],
    [5, 1],
    [6, 0],
    [6, 1],
    [7, 0],
    [7, 1],
    [7, 2],
    [8, 0],
    [9, 0],
    [10, 0]
]

S2ActOrderNameLookup = [
    "Emerald Hill 1",
    "Emerald Hill 2",
    "Chemical Plant 1",
    "Chemical Plant 2",
    "Aquatic Ruin 1",
    "Aquatic Ruin 2",
    "Casino Night 1",
    "Casino Night 2",
    "Hill Top 1",
    "Hill Top 2",
    "Mystic Cave 1",
    "Mystic Cave 2",
    "Oil Ocean 1",
    "Oil Ocean 2",
    "Metropolis 1",
    "Metropolis 2",
    "Metropolis 3",
    "Sky Chase",
    "Wing Fortress",
    "Death Egg"
]

S2ActOrderNameAltLookup = [
    "Emerald Hill act 1",
    "Emerald Hill act 2",
    "Chemical Plant act 1",
    "Chemical Plant act 2",
    "Aquatic Ruin act 1",
    "Aquatic Ruin act 2",
    "Casino Night act 1",
    "Casino Night act 2",
    "Hill Top act 1",
    "Hill Top act 2",
    "Mystic Cave act 1",
    "Mystic Cave act 2",
    "Oil Ocean act 1",
    "Oil Ocean act 2",
    "Metropolis act 1",
    "Metropolis act 2",
    "Metropolis act 3",
    "Sky Chase",
    "Wing Fortress",
    "Death Egg"
]

function S2TimeAttackBoard(index) {
    id = 36500 + index
    if (index > 17) {
        id = id - 1
    }
    loc = S2ActOrderLookup[index]
    zone = loc[0]
    act = loc[1]
    name = S2ActOrderNameLookup[index]
    leaderboard(
        id = id,
        title = format("{0} - Time Attack", name),
        description = format("Beat {0} in the fastest time", S2ActOrderNameAltLookup[index]),
        start = JamTimeAttackZone == zone && JamTimeAttackAct == act && JamTimeAttack &&
            repeated(20, JamTimeAttackActive == 0x02) && JamTimeAttackActive == 0x01 &&
            JamClassicElapsedTime == prev(JamClassicElapsedTime) && never(!Sonic2) &&
            never(S1LifeLost) && S1TimeMinutes != 0xff && S1TimeSeconds != 0xff && S1TimeDecimal != 0xff,
        cancel = always_false(),
        submit = always_true(),
        value = S1TimeElapsed,
        format = "FRAMES",
        lower_is_better = true
    )
}

for i in range(0, 19) {
    if (i != 17) {
        S2TimeAttackBoard(i)
    }
}

function S2ScoreAttackBoard(index) {
    id = 36519 + index
    if (index == 18) {
        id = id - 1
    }
    else if (index == 17) {
        id = id + 1
    }
    loc = S2ActOrderLookup[index]
    zone = loc[0]
    act = loc[1]
    name = S2ActOrderNameLookup[index]
    leaderboard(
        id = id,
        title = format("{0} - Score Attack", name),
        description = format("Beat {0} with the highest score", S2ActOrderNameAltLookup[index]),
        start = JamTimeAttackZone == zone && JamTimeAttackAct == act && JamTimeAttack &&
            repeated(20, JamTimeAttackActive == 0x02) && JamTimeAttackActive == 0x01 &&
            JamClassicElapsedTime == prev(JamClassicElapsedTime) && never(!Sonic2) &&
            never(S1LifeLost) && S1TimeMinutes != 0xff && S1TimeSeconds != 0xff && S1TimeDecimal != 0xff,
        cancel = always_false(),
        submit = always_true(),
        value = S1Score * 10,
        format = "VALUE"
    )
}

for i in range(0, 18) {
    S2ScoreAttackBoard(i)
}


leaderboard(
    id = 36577, title = "Sonic 2 & Knuckles Normal Any%",
    description = "[Sonic 2 & Knuckles, Normal] Beat the game as fast as possible w/o game overs",
    start  = dword(0x14F3B0) == 0x7E04D104 && byte(0x137136) == 0x03 && byte(0x1030F8) == 0x00 && byte(0x13713A) == 0x02 && 
             byte(0x1370D2) == 0x00 && S2NoDebug && S1NoDemo && prev(S1ScreenMode) == 0x8C && 
             S1ScreenMode == 0x0C && S1ZoneId == 0x00 && S1Act1,
    cancel = always_true() &&
             ((byte(0x1FFE13) == 0x00) ||
              (dword(0x14F3B0) != 0x7E04D104) ||
              (byte(0x137136) != 0x03) ||
              (S1ScreenMode == 0x04)),
    submit = S1ScreenMode == 0x20,
    value = measured(tally(0, (word(0x1FF63A) == 0x00 && (prev(byte(0x1FFE24)) + byte(0x1FFE24)) == 0x3A),
              (word(0x1FF63A) == 0x00 && (byte(0x1FFE24) - prev(byte(0x1FFE24))) == 0x02), (byte(0x1FF63A) == 0x00 &&
              S1ScreenMode == 0x10), byte(0x1FFE24) != prev(byte(0x1FFE24)))),
    format = "FRAMES", lower_is_better = true
)

function S2KnuxTimeAttackBoard(index) {
    id = 36538 + index
    if (index > 17) {
        id = id - 1
    }
    loc = S2ActOrderLookup[index]
    zone = loc[0]
    act = loc[1]
    name = S2ActOrderNameLookup[index]
    leaderboard(
        id = id,
        title = format("{0} & Knuckles - Time Attack", name),
        description = format("Beat {0} in the fastest time as Knuckles", S2ActOrderNameAltLookup[index]),
        start = JamTimeAttackZone == zone && JamTimeAttackAct == act && JamTimeAttack &&
            repeated(20, JamTimeAttackActive == 0x02) && JamTimeAttackActive == 0x01 &&
            JamClassicElapsedTime == prev(JamClassicElapsedTime) && never(!Knuckles2) &&
            never(S1LifeLost) && S1TimeMinutes != 0xff && S1TimeSeconds != 0xff && S1TimeDecimal != 0xff,
        cancel = always_false(),
        submit = always_true(),
        value = S1TimeElapsed,
        format = "FRAMES",
        lower_is_better = true
    )
}

for i in range(0, 19) {
    if (i != 17) {
        S2KnuxTimeAttackBoard(i)
    }
}

function S2KnuxScoreAttackBoard(index) {
    id = 36557 + index
    if (index == 18) {
        id = id - 1
    }
    else if (index == 17) {
        id = id + 1
    }
    loc = S2ActOrderLookup[index]
    zone = loc[0]
    act = loc[1]
    name = S2ActOrderNameLookup[index]
    leaderboard(
        id = id,
        title = format("{0} & Knuckles - Score Attack", name),
        description = format("Beat {0} with the highest score", S2ActOrderNameAltLookup[index]),
        start = JamTimeAttackZone == zone && JamTimeAttackAct == act && JamTimeAttack &&
            repeated(20, JamTimeAttackActive == 0x02) && JamTimeAttackActive == 0x01 &&
            JamClassicElapsedTime == prev(JamClassicElapsedTime) && never(!Knuckles2) &&
            never(S1LifeLost) && S1TimeMinutes != 0xff && S1TimeSeconds != 0xff && S1TimeDecimal != 0xff,
        cancel = always_false(),
        submit = always_true(),
        value = S1Score * 10,
        format = "VALUE"
    )
}

for i in range(0, 18) {
    S2KnuxScoreAttackBoard(i)
}

leaderboard(
    id = 36651, title = "Angel Island Zone Act 1 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x00 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 36652, title = "Angel Island Zone Act 1 - Score Attack",
    description = "Clear the stage with the highest score in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x00 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((word(0x1FFE28) * 0x0A + byte(0x1FFE26) * 0xA0000 + 0x00)),
    format = "SCORE"
)

leaderboard(
    id = 36653, title = "Angel Island Zone Act 2 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x00 && byte(0x1030FA) == 0x01 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 36654, title = "Angel Island Zone Act 2 - Score Attack",
    description = "Clear the stage with the highest score in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x00 && byte(0x1030FA) == 0x01 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((word(0x1FFE28) * 0x0A + byte(0x1FFE26) * 0xA0000 + 0x00)),
    format = "SCORE"
)

leaderboard(
    id = 36655, title = "Hydrocity Zone Act 1 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x01 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 36656, title = "Hydrocity Zone Act 1 - Score Attack",
    description = "Clear the stage with the highest score in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x01 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((word(0x1FFE28) * 0x0A + byte(0x1FFE26) * 0xA0000 + 0x00)),
    format = "SCORE"
)

leaderboard(
    id = 36657, title = "Hydrocity Zone Act 2 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x01 && byte(0x1030FA) == 0x01 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 36658, title = "Hydrocity Zone Act 2 - Score Attack",
    description = "Clear the stage with the highest score in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x01 && byte(0x1030FA) == 0x01 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((word(0x1FFE28) * 0x0A + byte(0x1FFE26) * 0xA0000 + 0x00)),
    format = "SCORE"
)

leaderboard(
    id = 36659, title = "Marble Garden Zone Act 1 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x02 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 36660, title = "Marble Garden Zone Act 1 - Score Attack",
    description = "Clear the stage with the highest score in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x02 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((word(0x1FFE28) * 0x0A + byte(0x1FFE26) * 0xA0000 + 0x00)),
    format = "SCORE"
)

leaderboard(
    id = 36661, title = "Marble Garden Zone Act 2 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x02 && byte(0x1030FA) == 0x01 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 36662, title = "Marble Garden Zone Act 2 - Score Attack",
    description = "Clear the stage with the highest score in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x02 && byte(0x1030FA) == 0x01 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((word(0x1FFE28) * 0x0A + byte(0x1FFE26) * 0xA0000 + 0x00)),
    format = "SCORE"
)

leaderboard(
    id = 36663, title = "Carnival Night Zone Act 1 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x03 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 36664, title = "Carnival Night Zone Act 1 - Score Attack",
    description = "Clear the stage with the highest score in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x03 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((word(0x1FFE28) * 0x0A + byte(0x1FFE26) * 0xA0000 + 0x00)),
    format = "SCORE"
)

leaderboard(
    id = 36665, title = "Carnival Night Zone Act 2 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x03 && byte(0x1030FA) == 0x01 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 36666, title = "Carnival Night Zone Act 2 - Score Attack",
    description = "Clear the stage with the highest score in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x03 && byte(0x1030FA) == 0x01 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((word(0x1FFE28) * 0x0A + byte(0x1FFE26) * 0xA0000 + 0x00)),
    format = "SCORE"
)

leaderboard(
    id = 36667, title = "Icecap Zone Act 1 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x04 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 36668, title = "Icecap Zone Act 1 - Score Attack",
    description = "Clear the stage with the highest score in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x04 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((word(0x1FFE28) * 0x0A + byte(0x1FFE26) * 0xA0000 + 0x00)),
    format = "SCORE"
)

leaderboard(
    id = 36669, title = "Icecap Zone Act 2 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x04 && byte(0x1030FA) == 0x01 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 36670, title = "Icecap Zone Act 2 - Score Attack",
    description = "Clear the stage with the highest score in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x04 && byte(0x1030FA) == 0x01 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((word(0x1FFE28) * 0x0A + byte(0x1FFE26) * 0xA0000 + 0x00)),
    format = "SCORE"
)

leaderboard(
    id = 36671, title = "Launch Base Zone Act 1 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x05 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 36672, title = "Launch Base Zone Act 1 - Score Attack",
    description = "Clear the stage with the highest score in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x05 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((word(0x1FFE28) * 0x0A + byte(0x1FFE26) * 0xA0000 + 0x00)),
    format = "SCORE"
)

leaderboard(
    id = 36673, title = "Launch Base Zone Act 2 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x05 && byte(0x1030FA) == 0x01 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 36674, title = "Launch Base Zone Act 2 - Score Attack",
    description = "Clear the stage with the highest score in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x02 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x05 && byte(0x1030FA) == 0x01 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((word(0x1FFE28) * 0x0A + byte(0x1FFE26) * 0xA0000 + 0x00)),
    format = "SCORE"
)

leaderboard(
    id = 37010, title = "Mushroom Hill Zone Act 1 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x00 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 37011, title = "Mushroom Hill Zone Act 1 - Score Attack",
    description = "Clear the stage with the highest score in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x00 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((word(0x1FFE28) * 0x0A + byte(0x1FFE26) * 0xA0000 + 0x00)),
    format = "SCORE"
)

leaderboard(
    id = 37012, title = "Mushroom Hill Zone Act 2 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x00 && byte(0x1030FA) == 0x01 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 37013, title = "Mushroom Hill Zone Act 2 - Score Attack",
    description = "Clear the stage with the highest score in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x00 && byte(0x1030FA) == 0x01 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((word(0x1FFE28) * 0x0A + byte(0x1FFE26) * 0xA0000 + 0x00)),
    format = "SCORE"
)

leaderboard(
    id = 37014, title = "Flying Battery Zone Act 1 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x01 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 37015, title = "Flying Battery Zone Act 1 - Score Attack",
    description = "Clear the stage with the highest score in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x01 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((word(0x1FFE28) * 0x0A + byte(0x1FFE26) * 0xA0000 + 0x00)),
    format = "SCORE"
)

leaderboard(
    id = 37016, title = "Flying Battery Zone Act 2 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x01 && byte(0x1030FA) == 0x01 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 37017, title = "Flying Battery Zone Act 2 - Score Attack",
    description = "Clear the stage with the highest score in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x01 && byte(0x1030FA) == 0x01 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((word(0x1FFE28) * 0x0A + byte(0x1FFE26) * 0xA0000 + 0x00)),
    format = "SCORE"
)

leaderboard(
    id = 37018, title = "Sandopolis Zone Act 1 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x02 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 37019, title = "Sandopolis Zone Act 1 - Score Attack",
    description = "Clear the stage with the highest score in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x02 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((word(0x1FFE28) * 0x0A + byte(0x1FFE26) * 0xA0000 + 0x00)),
    format = "SCORE"
)

leaderboard(
    id = 37020, title = "Sandopolis Zone Act 2 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x02 && byte(0x1030FA) == 0x01 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 37021, title = "Sandopolis Zone Act 2 - Score Attack",
    description = "Clear the stage with the highest score in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x02 && byte(0x1030FA) == 0x01 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((word(0x1FFE28) * 0x0A + byte(0x1FFE26) * 0xA0000 + 0x00)),
    format = "SCORE"
)

leaderboard(
    id = 37022, title = "Lava Reef Zone Act 1 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x03 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 37023, title = "Lava Reef Zone Act 1 - Score Attack",
    description = "Clear the stage with the highest score in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x03 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((word(0x1FFE28) * 0x0A + byte(0x1FFE26) * 0xA0000 + 0x00)),
    format = "SCORE"
)

leaderboard(
    id = 37024, title = "Lava Reef Zone Act 2 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x03 && byte(0x1030FA) == 0x01 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 37025, title = "Lava Reef Zone Act 2 - Score Attack",
    description = "Clear the stage with the highest score in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x03 && byte(0x1030FA) == 0x01 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((word(0x1FFE28) * 0x0A + byte(0x1FFE26) * 0xA0000 + 0x00)),
    format = "SCORE"
)

leaderboard(
    id = 37026, title = "Hidden Palace Zone Act 1 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x04 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 37027, title = "Sky Sanctuary Zone Act 1 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x05 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 37028, title = "Sky Sanctuary Zone Act 1 - Score Attack",
    description = "Clear the stage with the highest score in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x05 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((word(0x1FFE28) * 0x0A + byte(0x1FFE26) * 0xA0000 + 0x00)),
    format = "SCORE"
)

leaderboard(
    id = 37029, title = "Death Egg Zone Act 1 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x06 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 37030, title = "Death Egg Zone Act 1 - Score Attack",
    description = "Clear the stage with the highest score in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x06 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((word(0x1FFE28) * 0x0A + byte(0x1FFE26) * 0xA0000 + 0x00)),
    format = "SCORE"
)

leaderboard(
    id = 37031, title = "Death Egg Zone Act 2 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x06 && byte(0x1030FA) == 0x01 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 37032, title = "Death Egg Zone Act 2 - Score Attack",
    description = "Clear the stage with the highest score in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x06 && byte(0x1030FA) == 0x01 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((word(0x1FFE28) * 0x0A + byte(0x1FFE26) * 0xA0000 + 0x00)),
    format = "SCORE"
)

leaderboard(
    id = 37033, title = "Doomsday Zone Act 1 - Time Attack",
    description = "Clear the stage with the fastest time in Time Attack mode (no zips allowed)",
    start  = byte(0x137136) == 0x03 && byte(0x13713A) == 0x00 && JamTimeAttackZone == 0x07 && byte(0x1030FA) == 0x00 && 
             JamTimeAttack && repeated(10, byte(0x1030E9) == 0x02) && once((S1TimeMinutes * 0xE10 +
              S1TimeSeconds * 0x3C + byte(0x1FFE24)) == 0x00) && never((byte(0x1030F5) == 0x02 && bit7(0x1030EB) <
              prev(bit7(0x1030EB))) || S1LifeLost),
    cancel = (S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24)) != 0x00 &&
             (((word(0x1D4010) - prev(word(0x1D4010))) > 0x100 && (word(0x1D4010) - prev(word(0x1D4010))) < 0x3000) ||
              ((byte(0x1030F5) == 0x02 && bit7(0x1030EB) < prev(bit7(0x1030EB))) || byte(0x1FFE13) <
                prev(byte(0x1FFE13)))),
    submit = byte(0x1030E9) == 0x01 && word(0x10370E) == prev(word(0x10370E)),
    value = measured((S1TimeMinutes * 0xE10 + S1TimeSeconds * 0x3C + byte(0x1FFE24))),
    format = "FRAMES", lower_is_better = true
)

rich_presence_conditional_display(dword(0x14F3B0) == 0x00, "  ")

rich_presence_conditional_display(dword(0x14F3B0) == 0xFFDE51C8, "Preparing to Jam ")

rich_presence_conditional_display(dword(0x14F3B0) == 0x1D8E1D8C, "Selecting a Classic Game to play")

rich_presence_conditional_display(dword(0x14F3B0) == 0x1F1F1F1F, "Emeralds From Special Stage Attack")

rich_presence_conditional_display(Sonic1 && S1ScreenMode == 0x08, "Watching Sonic 1 Demo")

rich_presence_conditional_display(Sonic1 && byte(0x1030F8) != 0x00, "Playing Sonic 1 {0}",
    rich_presence_lookup("Mode", byte(0x1030F8), ModeLookup)
)

rich_presence_conditional_display(Sonic1, "Playing Sonic 1 on {0} - {1}",
    rich_presence_lookup("Difficulty", byte(0x1030FF), DifficultyLookup),
    rich_presence_lookup("S1Zone", S1ZoneId, S1ZoneLookup)
)

rich_presence_conditional_display(dword(0x14F3B0) == 0x4F262A10 && S1AnyDemo, "Watching Sonic 2 Demo")

rich_presence_conditional_display(dword(0x14F3B0) == 0x4F262A10 && JamSpecialStage, "Playing Sonic 2 {0}",
    rich_presence_lookup("Mode", byte(0x1030F8), ModeLookup)
)

rich_presence_conditional_display(dword(0x14F3B0) == 0x4F262A10, "Playing Sonic 2 on {0} - {1}",
    rich_presence_lookup("Difficulty", byte(0x1030FF), DifficultyLookup),
    rich_presence_lookup("S2Zone", S1ZoneId, S2ZoneLookup)
)

rich_presence_conditional_display(dword(0x14F3B0) == 0x7E04D104, "Playing Knuckles in Sonic 2 on {0} - {1}",
    rich_presence_lookup("Difficulty", byte(0x1030FF), DifficultyLookup),
    rich_presence_lookup("S2Zone", S1ZoneId, S2ZoneLookup)
)

rich_presence_conditional_display(dword(0x14F3B0) == 0xE1008111 && byte(0x1030FD) == 0x01, "Playing Blue Spheres: {0} wants the {1} 💎 in Level {2} - {3} 🔵 & {4} Rings Remain",
    rich_presence_lookup("S3Char", byte(0x1FFF08), S3CharLookup),
    rich_presence_lookup("BSColor", bit2(0x1FFFA7) * 4 + bit1(0x1FFFA7) * 2 + bit0(0x1FFFA7), BSColorLookup),
    rich_presence_value("Number", dword(0x1FE402) + 1),
    rich_presence_value("Number", word(0x1FE438)),
    rich_presence_value("Number", word(0x1FE442))
)

rich_presence_conditional_display(dword(0x14F3B0) == 0xE1008111 && S1ScreenMode == 0x08 && byte(0x1030FD) == 0x00, "Watching Sonic & Knuckles Demo")

rich_presence_conditional_display(dword(0x14F3B0) == 0xE1008111 && byte(0x1030F8) != 0x00 && byte(0x1030FD) == 0x00, "Playing Sonic & Knuckles {0}",
    rich_presence_lookup("Mode", byte(0x1030F8), ModeLookup)
)

rich_presence_conditional_display(dword(0x14F3B0) == 0xE1008111 && byte(0x1030FD) == 0x00, "Playing Sonic & Knuckles on {0} - {1}",
    rich_presence_lookup("Difficulty", byte(0x1030FF), DifficultyLookup),
    rich_presence_lookup("S3Zone", S1ZoneId, S3ZoneLookup)
)

rich_presence_conditional_display(dword(0x14F3B0) == 0xE1008111 && S1ScreenMode == 0x08, "Watching Sonic 3 & Knuckles Demo")

rich_presence_conditional_display(dword(0x14F3B0) == 0xE1008111, "Playing Sonic 3 & Knuckles on {0} - {1}",
    rich_presence_lookup("Difficulty", byte(0x1030FF), DifficultyLookup),
    rich_presence_lookup("S3Zone", S1ZoneId, S3ZoneLookup)
)

rich_presence_conditional_display(dword(0x14F3B0) == 0x4021C600 && S1AnyDemo, "Watching Sonic 3 Demo")

rich_presence_conditional_display(dword(0x14F3B0) == 0x4021C600 && byte(0x1030F8) != 0x00, "Playing Sonic 3 {0}",
    rich_presence_lookup("Mode", byte(0x1030F8), ModeLookup)
)

rich_presence_conditional_display(dword(0x14F3B0) == 0x4021C600, "Playing Sonic 3 on {0} - {1}",
    rich_presence_lookup("Difficulty", byte(0x1030FF), DifficultyLookup),
    rich_presence_lookup("S3Zone", S1ZoneId, S3ZoneLookup)
)

rich_presence_conditional_display(JamWorld, "Playing Sonic World with {0}{1}{2} rings, {3} red points, {4} blue points, {5} secret cards, and {6} balloons. Timer is currently at {7}'{8}\"{9}.",
    rich_presence_value("Digit", bcd(byte(0x1FFF18))),
    rich_presence_value("Digit", bcd(byte(0x1FFF1B))),
    rich_presence_value("Digit", bcd(byte(0x1FFF1A))),
    rich_presence_value("Digit", bcd(byte(0x1FFC28))),
    rich_presence_value("Digit", bcd(byte(0x1FFC2D))),
    rich_presence_value("Digit", bcd(byte(0x1FFC2C))),
    rich_presence_value("Digit", bcd(byte(0x1FFC2F))),
    rich_presence_value("Digit", bcd(byte(0x1FFEEC))),
    rich_presence_value("Digit", bcd(byte(0x1FFEEF))),
    rich_presence_value("Digit", bcd(byte(0x1FFEEE)))
)

rich_presence_display("Preparing to Jam")
