// ~Hack~ Donkey Kong On The Run
// #ID = 25326

GameState = byte(0x05)
ActivePlayers = byte(0x0f)

StartingLifeCount = byte(0x20)
ExtraLifeAward = byte(0x21)

Player1Lives = byte(0x40)
Player2Lives = byte(0x48)

Player1Score = bcd(tbyte(0xb2))
Player1PrevScore = prev(high4(0xb4)) * 100000 + prev(low4(0xb4)) * 10000 +
    prev(high4(0xb3)) * 1000 + prev(low4(0xb3)) * 100 +
    prev(high4(0xb2)) * 10 + prev(low4(0xb2))
Player2Score = bcd(tbyte(0xb5))

HasHammer = byte(0x217) == 1
StageType = byte(0x227)
InternalLives = byte(0x228)
CurrentStageZero = byte(0x22a) - 0x65
PrevStageZero = prev(byte(0x22a)) - 0x65

LastAction = byte(0x343)
StageFinished = byte(0x388)

World = byte(0x1ba3)

MainGame = GameState == 3
TwoPlayers = ActivePlayers == 1
InitialThreeLives = StartingLifeCount == 3
StillWithInitialLives = Player1Lives > (StartingLifeCount - 3)

StageTitleLookup = {
    0: "Girder",
    1: "Factory",
    2: "Elevator",
    3: "Rivet"
}

StageTypeLookup = {
    0: "Girders",
    1: "Girders",
    2: "Factory",
    3: "Elevators",
    4: "Rivets"
}

StageNameLookup = {
    // W1
    0: "Girders",
    1: "Rivets",
    // W2
    2: "Girders",
    3: "Elevators",
    4: "Rivets",
    // W3
    5: "Girders",
    6: "Factory",
    7: "Elevators",
    8: "Rivets",
    // W4
    9: "Girders",
    10: "Factory",
    11: "Girders",
    12: "Elevators",
    13: "Rivets",
    // W5
    14: "Girders",
    15: "Factory",
    16: "Girders",
    17: "Elevators",
    18: "Girders",
    19: "Rivets",
    // W6
    20: "Girders",
    21: "Factory",
    22: "Girders",
    23: "Elevators",
    24: "Girders",
    25: "Rivets",
    // W7
    26: "Girders",
    27: "Factory",
    28: "Girders",
    29: "Elevators",
    30: "Girders",
    31: "Rivets",
    // W8
    32: "Girders",
    33: "Factory",
    34: "Girders",
    35: "Elevators",
    36: "Girders",
    37: "Rivets",
    // W9
    38: "Girders",
    39: "Factory",
    40: "Girders",
    41: "Elevators",
    42: "Girders",
    43: "Rivets",
    // W10
    44: "Girders",
    45: "Factory",
    46: "Girders",
    47: "Elevators",
    48: "Girders",
    49: "Rivets",
    // W11
    50: "Girders",
    51: "Factory",
    52: "Girders",
    53: "Elevators",
    54: "Girders",
    55: "Rivets",
    // W12
    56: "Girders",
    57: "Factory",
    58: "Girders",
    59: "Elevators",
    60: "Girders",
    61: "Rivets",
    // W13
    62: "Girders",
    63: "Factory",
    64: "Girders",
    65: "Elevators",
    66: "Girders",
    67: "Rivets",
    // W14
    68: "Girders",
    69: "Factory",
    70: "Girders",
    71: "Elevators",
    72: "Girders",
    73: "Rivets",
    // W15
    74: "Girders",
    75: "Factory",
    76: "Girders",
    77: "Elevators",
    78: "Girders",
    79: "Rivets",
    // W16
    80: "Girders",
    81: "Factory",
    82: "Girders",
    83: "Elevators",
    84: "Girders",
    85: "Rivets",
    // W17
    86: "Girders",
    87: "Factory",
    88: "Girders",
    89: "Elevators",
    90: "Girders",
    91: "Rivets",
    // W18
    92: "Girders",
    93: "Factory",
    94: "Girders",
    95: "Elevators",
    96: "Girders",
    97: "Rivets",
    // W19
    98: "Girders",
    99: "Factory",
    100: "Girders",
    101: "Elevators",
    102: "Girders",
    103: "Rivets",
    // W20
    104: "Girders",
    105: "Factory",
    106: "Girders",
    107: "Elevators",
    108: "Girders",
    109: "Rivets",
    // W21
    110: "Girders",
    111: "Factory",
    112: "Girders",
    113: "Elevators",
    114: "Girders",
    115: "Rivets",
    // W22 (last one assuming DK Arcade Rules)
    116: "Girders",
    117: "Factory",
    118: "Girders",
    119: "Elevators",
    120: "Girders",
    121: "Rivets",
}
StageLevelLookup = {
    0: "1-1",
    1: "1-2",
    2: "2-1",
    3: "2-2",
    4: "2-3",
    5: "3-1",
    6: "3-2",
    7: "3-3",
    8: "3-4",
    9: "4-1",
    10: "4-2",
    11: "4-3",
    12: "4-4",
    13: "4-5",
    14: "5-1",
    15: "5-2",
    16: "5-3",
    17: "5-4",
    18: "5-5",
    19: "5-6",
    20: "6-1",
    21: "6-2",
    22: "6-3",
    23: "6-4",
    24: "6-5",
    25: "6-6",
    26: "7-1",
    27: "7-2",
    28: "7-3",
    29: "7-4",
    30: "7-5",
    31: "7-6",
    32: "8-1",
    33: "8-2",
    34: "8-3",
    35: "8-4",
    36: "8-5",
    37: "8-6",
    38: "9-1",
    39: "9-2",
    40: "9-3",
    41: "9-4",
    42: "9-5",
    43: "9-6",
    44: "10-1",
    45: "10-2",
    46: "10-3",
    47: "10-4",
    48: "10-5",
    49: "10-6",
    50: "11-1",
    51: "11-2",
    52: "11-3",
    53: "11-4",
    54: "11-5",
    55: "11-6",
    56: "12-1",
    57: "12-2",
    58: "12-3",
    59: "12-4",
    60: "12-5",
    61: "12-6",
    62: "13-1",
    63: "13-2",
    64: "13-3",
    65: "13-4",
    66: "13-5",
    67: "13-6",
    68: "14-1",
    69: "14-2",
    70: "14-3",
    71: "14-4",
    72: "14-5",
    73: "14-6",
    74: "15-1",
    75: "15-2",
    76: "15-3",
    77: "15-4",
    78: "15-5",
    79: "15-6",
    80: "16-1",
    81: "16-2",
    82: "16-3",
    83: "16-4",
    84: "16-5",
    85: "16-6",
    86: "17-1",
    87: "17-2",
    88: "17-3",
    89: "17-4",
    90: "17-5",
    91: "17-6",
    92: "18-1",
    93: "18-2",
    94: "18-3",
    95: "18-4",
    96: "18-5",
    97: "18-6",
    98: "19-1",
    99: "19-2",
    100: "19-3",
    101: "19-4",
    102: "19-5",
    103: "19-6",
    104: "20-1",
    105: "20-2",
    106: "20-3",
    107: "20-4",
    108: "20-5",
    109: "20-6",
    110: "21-1",
    111: "21-2",
    112: "21-3",
    113: "21-4",
    114: "21-5",
    115: "21-6",
    116: "22-1",
    117: "22-2",
    118: "22-3",
    119: "22-4",
    120: "22-5",
    121: "22-6",
}

StageGirder = [0, 2, 5, 9, 11]
for i in range(14, 121, 2) {
    array_push(StageGirder, i)
}

StageFactory = [6, 10]
for i in range(15, 121, 6) {
    array_push(StageFactory, i)
}

StageElevator = [3, 7, 12]
for i in range(17, 121, 6) {
    array_push(StageElevator, i)
}

StageRivet = [1, 4, 8, 13]
for i in range(19, 121, 6) {
    array_push(StageRivet, i)
}

// achievements

function NextStage(val) => CurrentStageZero == val && prev(CurrentStageZero) == val - 1

BeatStage = StageFinished == 1 && prev(StageFinished) == 0

achievement(
    title = "Now With Randomly Missing Ladders",
    description = "Clear the Girders for the first time.",
    points = 2,
    trigger = MainGame && unless(TwoPlayers) &&
        StageType == 1 && BeatStage
)

achievement(
    title = "Fix-It Felix Would Like A Word With You",
    description = "Clear the Rivets for the first time.",
    points = 3,
    trigger = MainGame && unless(TwoPlayers) &&
        StageType == 4 && BeatStage
)

achievement(
    title = "At Least The Elevators Work, Right?",
    description = "Clear the Elevators for the first time.",
    points = 5,
    trigger = MainGame && unless(TwoPlayers) &&
        StageType == 3 && BeatStage
)

achievement(
    title = "What Is Being Made Here Anyway?",
    description = "Clear the Factory for the first time.",
    points = 10,
    trigger = MainGame && unless(TwoPlayers) &&
        StageType == 2 && BeatStage
)

achievement(
    title = "Chasing For 50m",
    description = "Clear the second Rivet stage.",
    points = 5,
    trigger = MainGame && unless(TwoPlayers) &&
        World == 2 && StageType == 4 && BeatStage
)

achievement(
    title = "The Japanese Tour",
    description = "Clear the third Rivet stage.",
    points = 10,
    trigger = MainGame && unless(TwoPlayers) &&
       World == 3 && StageType == 4 && BeatStage
)

achievement(
    title = "Deja Vu?",
    description = "Clear the fourth Rivet stage.",
    points = 10,
    trigger = MainGame && unless(TwoPlayers) &&
        World == 4 && StageType == 4 && BeatStage
)

achievement(
    title = "Gurdurr Swarm",
    description = "Clear the fifth Rivet stage.",
    points = 25,
    trigger = MainGame && unless(TwoPlayers) &&
        World == 5 && StageType == 4 && BeatStage
)

achievement(
    title = "Continuing The Chase Until The Kill Screen",
    description = "Clear the sixth Rivet stage.",
    points = 25,
    trigger = MainGame && unless(TwoPlayers) &&
        World == 6 && StageType == 4 && BeatStage
)

achievement(
    title = "Come Back Here You Big Monkey",
    description = "Get an extra life with your three starting lives. Min 10000 required.",
    points = 5,
    trigger = MainGame && unless(TwoPlayers) &&
        StillWithInitialLives &&
        bcd(ExtraLifeAward) * 1000 <= Player1Score &&
        bcd(ExtraLifeAward) * 1000 >= Player1PrevScore &&
        InternalLives == prev(InternalLives) + 1 &&
        ExtraLifeAward >= 0x10
)

achievement(
    title = "Needs More Red Zone",
    description = "Defeat three enemies with one hammer on the Girders.",
    points = 5,
    trigger = MainGame && unless(TwoPlayers) &&
        never(!HasHammer) &&
        trigger_when(repeated(3, Player1Score > Player1PrevScore)) &&
        StageType == 1
)

function PickedUpItem(val) => prev(LastAction) != val && LastAction == val

achievement(
    title = "Factory Cleanup",
    description = "Beat any factory stage after collecting all items.",
    points = 10,
    trigger = MainGame && unless(TwoPlayers) &&
        never(Player1Lives < prev(Player1Lives)) &&
        never(StageType != 2) &&
        once(PickedUpItem(0x10)) &&
        once(PickedUpItem(0x0c)) &&
        once(PickedUpItem(0x14)) &&
        trigger_when(BeatStage)
)

achievement(
    title = "Elevator Cleanup",
    description = "Beat any elevator stage after collecting all items.",
    points = 10,
    trigger = MainGame && unless(TwoPlayers) &&
        never(Player1Lives < prev(Player1Lives)) &&
        never(StageType != 3) &&
        once(PickedUpItem(0x10)) &&
        once(PickedUpItem(0x0c)) &&
        once(PickedUpItem(0x14)) &&
        trigger_when(BeatStage)
)

achievement(
    title = "Rivet Cleanup",
    description = "Beat any rivet stage after collecting all items.",
    points = 10,
    trigger = MainGame && unless(TwoPlayers) &&
        never(Player1Lives < prev(Player1Lives)) &&
        never(StageType != 4) &&
        once(PickedUpItem(0x10)) &&
        once(PickedUpItem(0x0c)) &&
        once(PickedUpItem(0x14)) &&
        trigger_when(BeatStage)
)

achievement(
    title = "Wes Copeland's Training",
    description = "Get 100000 points with your three starting lives.",
    points = 25,
    trigger = MainGame && unless(TwoPlayers) &&
        StillWithInitialLives &&
        Player1PrevScore < 100000 &&
        trigger_when(Player1Score >= 100000)
)

achievement(
    title = "Wes Copeland's Challenge",
    description = "Get 200000 points with your three starting lives.",
    points = 50,
    trigger = MainGame && unless(TwoPlayers) &&
        StillWithInitialLives &&
        Player1PrevScore < 200000 &&
        trigger_when(Player1Score >= 200000)
)

// leaderboards

leaderboard(
    title = "High Score Run",
    description = "Get the highest score you can with your three starting lives.",
    start = MainGame && !TwoPlayers &&
        prev(Player1Lives) == StartingLifeCount - 2 &&
        Player1Lives == StartingLifeCount - 3,
    cancel = always_false(),
    submit = always_true(),
    value = Player1Score
)

// rich presence

RpStageType = rich_presence_lookup(
    "StageType", StageType, StageTypeLookup, "Unknown"
)
RpStageNum = rich_presence_lookup(
    "StageNum", CurrentStageZero, StageLevelLookup, ""
)

EmojiLives = "🚶"
EmojiScore = "💯"

rich_presence_conditional_display(
    MainGame && !TwoPlayers,
    "Chasing DK in L-{0} the {1} {2} {3} {4} {5}",
    // (original L) RpStageNum,
    rich_presence_macro("Number", World),
    RpStageType,
    EmojiLives,
    rich_presence_macro("Number", Player1Lives),
    EmojiScore,
    rich_presence_macro("Number", Player1Score)
)

rich_presence_conditional_display(
    !MainGame,
    "Making plans to catch that danged ape."
)

rich_presence_conditional_display(
    TwoPlayers,
    "Getting help to catch Donkey Kong. Hopefully."
)

rich_presence_display(
    "Hoping Donkey Kong doesn't go On The Run. Again."
)
