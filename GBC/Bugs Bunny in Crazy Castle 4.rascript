// Bugs Bunny in Crazy Castle 4
// #ID = 6274

// $00AD: Finish the game
// $C067: Input'ed Password [6 bytes]
//        Each byte represents a character, letter, or symbol. There are 35 symbols that can be put in. As this is not ASCII, they will be documented here. Order represents top left to bottom right of password display.
//        0xC1: B
//        0xC2: C
//        0xC3: D
//        0xC5: F
//        0xC6: G
//        0xC7: H
//        0xC9: J
//        0xCA: K
//        0xCB: L
//        0xCC: M
//        0xCD: N
//        0xCF: P
//        0xD0: Q
//        0xD1: R
//        0xD2: S
//        0xD3: T
//        0xD5: V
//        0xD6: W
//        0xD7: X
//        0xD8: Y
//        0xD9: Z
//        0xDB: Circle? Zero? Period?
//        0xDC: ? (Question Mark)
//        0xF1: 1
//        0xF2: 2
//        0xF3: 3
//        0xF4: 4
//        0xF5: 5
//        0xF6: 6
//        0xF7: 7
//        0xF8: 8
//        0xF9: 9
//        0xDA: Dash / Hyphen (default character, not used in passwords)
// $C8A7: Incrementing Frame Counter?
//        The purpose of this counter appears to be unknown.
// $C8AE: In Control?
//        0x00: In Control
//        0x01: Out of Control (Cutscenes, Loading Screens, etc.)
// $C8B0: Buttons Held This Frame
//        bit0: A
//        bit1: B
//        bit2: Select
//        bit3: Start
//        bit4: Right
//        bit5: Left
//        bit6: Up
//        bit7: Down
// $C8B1: Buttons Pressed This Frame
//        bit0: A
//        bit1: B
//        bit2: Select
//        bit3: Start
//        bit4: Right
//        bit5: Left
//        bit6: Up
//        bit7: Down
// $C8C0: Mirror of 0xc8b0
// $C8C1: Mirror of 0xc8b1
// $C8E0: World ID (0-Index)
// $C8E1: Continuous Stage ID (0-Index)
// $C8ED: Stage ID Per World (0-Index)
// $C8EE: Alternate In-Stage State
//        0x06: Main Stage
//        0x07: Treasure Room
// $C900: Bugs Health
//        Unlike other Crazy Castle games, you actually have a life bar. You start with 3 health each life. Hitting 0 means losing a life.
// $C901: Bugs Life Count
//        You get a game over if this hits 0.
// $C902: Bugs Carrot Count
//        Pick up a small carrot for 1, or a big carrot for 3.
//        Upon picking up 10, grant a freebie Super Carrot Shield for the standard length.
// $C903: Gun Trap Count
// $C904: Balloon Trap Count?
// $C905: Current Equipment
//        0x00: Gun
//        0x01: Balloon
//        bit4: Carrot Shield (Invincibility, cannot damage enemies with it.)
//        bit5: Super Carrot Shield (Can defeat enemies with this.)
//        bit6: Pickaxe Found (Climb over rocks)
//        bit7: Hammer Found (Destroy rocks)
// $C906: Number of Keys Collected
//        To finish each stage, find all 8 and bring them to the final door.
// $C907: Carrot Shield Timer
//        Once you have the carrot shield, set to 0xC8. Only count down when in the main stage, not a treasure room. Upon hitting 0, remove the shield.
// $C908: Mercy Invulnerability Frame Counter
//        Upon getting hit, immediately set to 0x28 and count down. When this hits 0x00, you can be damaged again.
// $C90A: Incrementing Counter (Unknown)
//        This one only cycles between 0x00-0x3F.
// $C90D: Decrementing Timer [16-bit]
//        On the Title Screen, this counts down to zero before activating the demo.
// $C912: Final Door Reminder
//        On picking up the final key of the level, set to 0xc8 and display an indicator above Bugs' head to get to the final door. This counts down to 0x00, when the indicator stops appearing.
// $C92C: Loaded Title Screen Once? 
//        This flag can be used to reset cheevos without turning off the game. Watch when 0x00 becomes 0x03. 
// $C92D: Continuous Stage ID (0-Index) (Duplicate of 0xc8e1)
// $C92E: Password Cursor Position
// $C92F: Password Column Number Entry
//        This goes from 0-6.
// $C930: Password Row Number Entry
//        This goes from 0-5.
// $C933: Incrementing Timer (Unknown Purpose)
// $C934: Intro - Graphics to Display
//        This increments at a similar pace to 0xc935. When the intro is done, this turns to 0xFF.
// $C935: Intro - Text To Display
//        It's not clear if the text is loaded into RAM or not.
// $C936: Start or Password Option
//        0x00: Start Game
//        0x01: Password
// $C93E: Mirror of 0xc8b0
// $C940: Camera X Position [16-bit]
//        This can be moved while pausing.
// $C942: Camera Y Position [16-bit]
//        This can be moved while pausing.
// $C962: Bugs Interior X Position on Screen
//        This mainly comes into play when you enter a room with a treasure chest.
// $C963: Stage State (Limited)
//        0x00: In a Treasure Room
//        0x01: On Main Stage. Sometimes flickers to 0x00.
//        0xFF: Transitioning from Treasure Room to Main Stage
// $C981: Game State
//        0x40: Game is Active
//        0x00: Game is Paused
//        If you try to open the final door of a level without enough keys, this value cycles for some reason.
// $CA00: Some Special Data? [256 bytes]
//        This block may need further investigating.
// $D001: Bugs Animations/Facing?
//        bit7: 1 if facing right, 0 if facing left.
//        This surprisingly doesn't update while in a treasure room.
// $D006: Additional Bugs Animations/Facing?
//        bit0: If standing still, 1 means facing right. If on a ladder, 1 means not moving on the ladder.
//        bit1: 1 if standing still. 0 if moving or on a ladder.
//        bit2: 1 if trying to open/go through a door.
//        bit3: 1 if you fail to open the door. Mainly if you are short on keys on opening the final door.
//        bits 3 and 4: Transporting in a pipe.
//        bits 4 and 5: 1 if on a ladder.
//        bit 5: facing "away" from the screen. Mainly for ladders and opening doors. Also used if on an interior/treasure screen.
// $D00A: Bugs State?
//        0x4d: Walking
//        0x4e: Standing Still
//        0x4f: Transporting Between Floors via Door OR Ladder
//        0x50: Transporting Via Pipes
//        0x5b: Idle Animation
//        0x71: On the Overworld
// $D00D: Alternate Door Tunnel Flag?
//        0x51: Bugs is walking.
//        0x52: Bugs is traveling between floors.
// $D010: Bugs X Position on Screen [16-bit]
//        Attempts to change this value will result in Bugs immediately falling to the ground if not already on the ground.
//        This value affects both the overworld and the levels.
// $D012: Mirror of 0xd010 (do not change manually!) [16-bit]
// $D014: Bugs Y Position on Screen [16-bit]
//        Attempts to change this value will result in Bugs immediately falling to the ground if not already on the ground.
//        This value affects both the overworld and the levels.
// $D016: Mirror of 0xd016 (do not change manually!) [16-bit]
// $D01A: Not In Control Timer
//        When you touch an enemy, set to 0x0f. Until this counts down to 0x00, you cannot move, but you fortunately do not take additional damage.
//        When entering a treasure door, set to 0x0b. Upon hitting 0x00, transition to the treasure room.
//        When leaving a treasure room, set to 0x05 and count down to 0x00. Upon hitting 0x00, you regain control.
//        Upon entering the last door of a level, set to 0x3b. Count down to 0x00, then set to 0x09 for overworld state transitions before immediately setting to 0x00 after a small bit.
// $D048: Decrementing Frame Counter (Unknown Purpose)
// $D088: Decrementing Frame Counter (Unknown Purpose)

// Variables Below

PressedB = bit1(0xC8B0) == 1

// The current world. Mainly for showing where Bugs is on the overworld.
WorldId = low4(0xC8E0)

// The current stage. Fortunately, this game is continuous with its IDs for the most part.
StageId = byte(0xC8E1)

// Are we in a treasure room?
InTreasureRoom = byte(0xC8EE) == 0x07

// How much health does Bugs have? 3 is max health, 0 is dead.
BugsHealth = low4(0xC900)

TookDamage = prev(BugsHealth) > BugsHealth

// How many lives does Bugs have? This hasn't been tested for values above 9.
BugsLifeCount = byte(0xC901)

// How many carrots does Bugs have? Collecting 10 cashes them in for invulnerability.
BugsCarrotCount = low4(0xC902)

// How many gun traps does Bugs have?
GunTrapCount = low4(0xC903)

// How many balloon traps does Bugs have?
BalloonTrapCount = low4(0xC904)

// Address of the currently equipped trap.
CurrentEquippedTrapAddress = 0xc905
// Which trap is currently equipped? This can be used for pointers.
CurrentEquippedTrap = bit0(CurrentEquippedTrapAddress)

// How many keys are collected?
KeysCollected = low4(0xC906)

// Has the player found the pickaxe to climb up certain types of rocks?
PickaxeBit = bit6(0xC905)
HasPickaxe = PickaxeBit == 1

// Has the player found the hammer to destroy certain types of rocks?
HammerBit = bit7(0xC905)
HasHammer = HammerBit == 1

// Has the Title Screen Loaded?
// Use this to clear failed cheevo pauses.
LoadedTitleScreenOnReset = prev(word(0xC90D)) == 0x0 && word(0xC90D) == 0x141e

// What are some of Bugs' animation states?
BugsStateA = byte(0xD00A)
InOverworld = BugsStateA == 0x71
StartedLevel = once(prev(BugsStateA) == 0x71 && BugsStateA == 0) &&
    (BugsStateA == 0x4e || BugsStateA == 0x4d)
IsBugsDead = BugsStateA == 0x50

NoControlTimer = byte(0xd01a)

HasEnteredExitDoor = prev(NoControlTimer) == 0x00 && NoControlTimer == 0x3b

// Dependent Functions Below

// Has the player beaten the level?
function HasBeatenLevel(stageId) {
    return once(StageId == stageId && HasEnteredExitDoor)
}

// Has the player fired a trap?
function HasFiredTrap() {
    currentAmmo = low4(GunTrapCount + CurrentEquippedTrapAddress)
    return once(PressedB && prev(currentAmmo) > currentAmmo)
}

// Lookup Helpers for Worlds Below
WorldLengthLookup = {
    0: [0, 5],
    1: [5, 5],
    2: [10, 3],
    3: [13, 5],
    4: [18, 5],
    5: [23, 3],
    6: [27, 6],
    7: [33, 6],
    8: [39, 6],
    9: [45, 8],
    10: [53, 8],
    11: [61, 9]
}

World1Name = "Forest"
World2Name = "Caverns"
World3Name = "Tree"
World4Name = "Cliffs"
World5Name = "Rapids"
World6Name = "Countryside"
World7Name = "Castle Lobby"
World8Name = "Gardens"
World9Name = "Ice Caverns"
World10Name = "Laboratory"
World11Name = "Tower"
World12Name = "Museum"

WorldNameLookup = {
    0: World1Name,
    1: World2Name,
    2: World3Name,
    3: World4Name,
    4: World5Name,
    5: World6Name,
    6: World7Name,
    7: World8Name,
    8: World9Name,
    9: World10Name,
    10: World11Name,
    11: World12Name
}

WorldPointsLookup = {
    0: 5,
    1: 5,
    2: 5,
    3: 10,
    4: 10,
    5: 5,
    6: 10,
    7: 10,
    8: 10,
    9: 10,
    10: 10,
    11: 25
}

WorldClassicPointsLookup = {
    0: 5,
    1: 5,
    2: 5,
    3: 10,
    4: 10,
    5: 10,
    6: 25,
    7: 25,
    8: 25,
    9: 25,
    10: 25,
    11: 50
}

WorldPasswordLookup = {
    0: "?4Y044",
    1: "R4P04?",
    2: "?XYS4V",
    3: "R4PS37",
    4: "WHY032",
    5: "MXP03Y",
    6: "MXYS3T",
    7: "R0Y023",
    8: "RSP02Y",
    9: "R0PS17",
    10: "M0P01?",
    11: "M0PS07"
}

// Cheevos Below

function CreateBeatWorldCheevo(worldId, points) {
    worldNumber = worldId + 1
    worldName = WorldNameLookup[worldId]
    worldData = WorldLengthLookup[worldId]
    firstStage = worldData[0]
    worldLength = worldData[1]
    lastStage = firstStage + worldLength - 1
    worldGood = WorldId == worldId
    worldBad = WorldId != worldId
    description = "In one session, complete all levels of World " + worldNumber + "."
    if (worldId == 11) {
        description = description + " This includes the final level in World 13."
        worldGood = WorldId >= worldId
        worldBad = WorldId < worldId
    }
    achievement(
        title = "Navigated the " + worldName,
        points = points,
        description = description,
        trigger = never(worldBad) &&
            measured(repeated(worldLength, HasEnteredExitDoor), worldGood)
    )
}

for worldId in WorldPointsLookup {
    CreateBeatWorldCheevo(worldId, WorldPointsLookup[worldId])
}

function CreateClassicBeatWorldCheevo(worldId, points) {
    worldNumber = worldId + 1
    worldName = WorldNameLookup[worldId]
    worldData = WorldLengthLookup[worldId]
    firstStage = worldData[0]
    worldLength = worldData[1]
    lastStage = firstStage + worldLength - 1
    worldGood = WorldId == worldId
    worldBad = WorldId != worldId
    description = "In one session, complete all levels of World " + worldNumber +
        " WITHOUT taking damage."
    if (worldId == 11) {
        description = description + " This includes the final level in World 13."
        worldGood = WorldId >= worldId
        worldBad = WorldId < worldId
    }
    if (worldId > 0) {
        description = description + " Password: " + WorldPasswordLookup[worldId]
    }
    achievement(
        title = "Clasically Navigated the " + worldName,
        points = points,
        description = description,
        trigger = never(worldBad) &&
            measured(repeated(worldLength, HasEnteredExitDoor), worldGood) &&
            disable_when(once(worldGood && TookDamage), until=LoadedTitleScreenOnReset)
    )
}

for worldId in WorldPointsLookup {
    CreateClassicBeatWorldCheevo(worldId, WorldClassicPointsLookup[worldId])
}

function CreateItemLessWorldCheevo(worldId, points) {
    worldNumber = worldId + 1
    worldName = WorldNameLookup[worldId]
    worldData = WorldLengthLookup[worldId]
    firstStage = worldData[0]
    worldLength = worldData[1]
    lastStage = firstStage + worldLength - 1
    worldGood = WorldId == worldId
    worldBad = WorldId != worldId
    description = "In one session, complete all levels of World " + worldNumber +
        " WITHOUT using collected traps."
    if (worldId == 11) {
        description = description + " This includes the final level in World 13."
        worldGood = WorldId >= worldId
        worldBad = WorldId < worldId
    }
    if (worldId > 0) {
        description = description + " Password: " + WorldPasswordLookup[worldId]
    }
    achievement(
        title = "Outwitted the Enemies of the " + worldName,
        points = points,
        description = description,
        trigger = never(worldBad) &&
            measured(repeated(worldLength, HasEnteredExitDoor), worldGood) &&
            disable_when(worldGood && HasFiredTrap(), until=LoadedTitleScreenOnReset)
    )
}

for worldId in WorldPointsLookup {
    CreateItemLessWorldCheevo(worldId, WorldClassicPointsLookup[worldId])
}

// Leaderboards Below

StageIdToLevelLookup = {
    0: "1-1",
    1: "1-2",
    2: "1-3",
    3: "1-4",
    4: "1-5",
    5: "2-1",
    6: "2-2",
    7: "2-3",
    8: "2-4",
    9: "2-5",
    10: "3-1",
    11: "3-2",
    12: "3-3",
    13: "4-1",
    14: "4-2",
    15: "4-3",
    16: "4-4",
    17: "4-5",
    18: "5-1",
    19: "5-2",
    20: "5-3",
    21: "5-4",
    22: "5-5",
    23: "6-1",
    24: "6-2",
    25: "6-3",
    27: "7-1",
    28: "7-2",
    29: "7-3",
    30: "7-4",
    31: "7-5",
    32: "7-6",
    33: "8-1",
    34: "8-2",
    35: "8-3",
    36: "8-4",
    37: "8-5",
    38: "8-6",
    39: "9-1",
    40: "9-2",
    41: "9-3",
    42: "9-4",
    43: "9-5",
    44: "9-6",
    45: "10-1",
    46: "10-2",
    47: "10-3",
    48: "10-4",
    49: "10-5",
    50: "10-6",
    51: "10-7",
    52: "10-8",
    53: "11-1",
    54: "11-2",
    55: "11-3",
    56: "11-4",
    57: "11-5",
    58: "11-6",
    59: "11-7",
    60: "11-8",
    61: "12-1",
    62: "12-2",
    63: "12-3",
    64: "12-4",
    65: "12-5",
    66: "12-6",
    67: "12-7",
    68: "12-8",
    69: "13-1",
}

function CreateWorldIlLeaderboard(worldId) {
    password = WorldPasswordLookup[worldId]
    worldNumber = worldId + 1
    worldData = WorldLengthLookup[worldId]
    firstStage = worldData[0]
    worldLength = worldData[1]
    lastStage = firstStage + worldLength - 1
    worldDeny = WorldId != worldId
    description = "se the password " + password + ". Beat world "
        + worldNumber + " without getting a game over."
    if (worldId == 11) {
        description = description + " This includes the final level in World 13."
        worldDeny = worldDeny && WorldId != worldId + 1
    }
    if (worldId == 0) {
        description = "Start a new game or u" + description
    }
    else {
        description = "U" + description
    }
    
    leaderboard(
        title = "World " + worldNumber + " Time Attack",
        description = description,
        start = StageId == firstStage && BugsLifeCount == 3 && BugsCarrotCount == 0 &&
            StartedLevel && never(WorldId != worldId),
        cancel = BugsLifeCount == 0 || worldDeny,
        submit = repeated(worldLength, HasEnteredExitDoor),
        value = measured(always_true()),
        lower_is_better = true,
        format = "FRAMES"
    )
}

for index in range(0, 11, 1) {
    CreateWorldIlLeaderboard(index)
}

// Let folks have passwords.

StageIdToOneLifePasswordLookup = {
    0: "?6Y046",
    1: "R6Y045",
    2: "?ZY044",
    3: "RZY043",
    4: "?6P042",
    5: "R6P041",
    6: "?ZP040",
    7: "RZP04?",
    8: "?6YS4Z",
    9: "R6YS4Y",
    10: "?ZYS4X",
    11: "RZYS4W",
    12: "?6PS4V",
    13: "R6PS4T",
    14: "?ZPS4S",
    15: "RZPS37",
    16: "W6Y036",
    17: "M6Y036",
    18: "WZY034",
    19: "MZY033",
    20: "W6P032",
    21: "M6P031",
    22: "WZP030",
    23: "MZP03?",
    24: "W6YS3Z",
    25: "M6YS3Y",
    27: "MZYS3W",
    28: "W6PS3V",
    29: "M6PS3T",
    30: "WZPS3S",
    31: "MZPS27",
    32: "?2Y026",
    33: "R2Y025",
    34: "?VY024",
    35: "RVY023",
    36: "?2P022",
    37: "R2P021",
    38: "?VP020",
    39: "RVP02?",
    40: "?2YS2Z",
    41: "R2YS2Y",
    42: "?VYS2X",
    43: "RVYS2W",
    44: "?2PSTV",
    45: "R2PS2T",
    46: "?VPS2S",
    47: "RVPS17",
    48: "W2Y016",
    49: "M2Y015",
    50: "WVY014",
    51: "MVY013",
    52: "W2P012",
    53: "M2P011",
    54: "WVP010",
    55: "MVP01?",
    56: "W2YS1Z",
    57: "M2YS1Y",
    58: "WVYS1X",
    59: "MVYS1W",
    60: "W2PS1V",
    61: "M2PS1T",
    62: "WVPS1S",
    63: "MVPS07",
    64: "?6T006",
    65: "R5T005",
    66: "?ZT004",
    67: "RZT003",
    68: "?6K002",
    69: "R6K001",
}

function CreateSingleIlLeaderboard(stageId) {
    stageNumber = StageIdToLevelLookup[stageId]
    password = StageIdToOneLifePasswordLookup[stageId]
    leaderboard(
        title = "Stage " + stageNumber + " IL",
        description = "Use the password " + password + ". Beat " + stageNumber + " as fast as you can.",
        start = BugsLifeCount == 1 && BugsCarrotCount == 0 &&
            StartedLevel && never(StageId != stageId),
        cancel = BugsHealth == 0 || StageId != stageId,
        submit = StageId == stageId && HasEnteredExitDoor,
        value = measured(always_true()),
        lower_is_better = true,
        format = "FRAMES"
    )
}

for index in range(0, 69, 1) {
    if (index != 26) {
        CreateSingleIlLeaderboard(index)
    }
}

// Rich Presence Below

StageIdToWorldLookup = {
    0: World1Name,
    1: World1Name,
    2: World1Name,
    3: World1Name,
    4: World1Name,
    5: World2Name,
    6: World2Name,
    7: World2Name,
    8: World2Name,
    9: World2Name,
    10: World3Name,
    11: World3Name,
    12: World3Name,
    13: World4Name,
    14: World4Name,
    15: World4Name,
    16: World4Name,
    17: World4Name,
    18: World5Name,
    19: World5Name,
    20: World5Name,
    21: World5Name,
    22: World5Name,
    23: World6Name,
    24: World6Name,
    25: World6Name,
    27: World7Name,
    28: World7Name,
    29: World7Name,
    30: World7Name,
    31: World7Name,
    32: World7Name,
    33: World8Name,
    34: World8Name,
    35: World8Name,
    36: World8Name,
    37: World8Name,
    38: World8Name,
    39: World9Name,
    40: World9Name,
    41: World9Name,
    42: World9Name,
    43: World9Name,
    44: World9Name,
    45: World10Name,
    46: World10Name,
    47: World10Name,
    48: World10Name,
    49: World10Name,
    50: World10Name,
    51: World10Name,
    52: World10Name,
    53: World11Name,
    54: World11Name,
    55: World11Name,
    56: World11Name,
    57: World11Name,
    58: World11Name,
    59: World11Name,
    60: World11Name,
    61: World12Name,
    62: World12Name,
    63: World12Name,
    64: World12Name,
    65: World12Name,
    66: World12Name,
    67: World12Name,
    68: World12Name,
    69: "Final Showdown",
}

HammerLookup = {
    0: "",
    1: "🔨"
}

PickaxeLookup = {
    0: "",
    1: "⛏️"
}

rich_presence_conditional_display(byte(0xed) > 0, "Bugs Cleared the Crazy Castle")

RpKeys = rich_presence_macro("Number", KeysCollected)
RpLives = rich_presence_macro("Number", BugsLifeCount)
RpCarrots = rich_presence_macro("Number", BugsCarrotCount)
RpHealth = rich_presence_macro("Number", BugsHealth)
RpGun = rich_presence_macro("Number", GunTrapCount)
RpBalloon = rich_presence_macro("Number", BalloonTrapCount)
RpWorld = rich_presence_lookup("World", StageId, StageIdToWorldLookup)
RpUiStage = rich_presence_lookup("Stage", StageId, StageIdToLevelLookup)
RpHammer = rich_presence_lookup("Hammer", HammerBit, HammerLookup)
RpPickaxe = rich_presence_lookup("Pickaxe", PickaxeBit, PickaxeLookup)

rich_presence_conditional_display(
    InOverworld,
    "Bugs entering the {0} Stage {1} - 🐇 {2} 🥕 {3}",
    RpWorld,
    RpUiStage,
    RpLives,
    RpCarrots
)

rich_presence_display(
    "Bugs in the {0} Stage {1} - 🐇 {2} 🥕 {3} ❤️ {4} 🔑 {5} 🔫 {6} 🎈 {7} {8}{9}",
    RpWorld,
    RpUiStage,
    RpLives,
    RpCarrots,
    RpHealth,
    RpKeys,
    RpGun,
    RpBalloon,
    RpHammer,
    RpPickaxe
)
