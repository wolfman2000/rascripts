// Ms. Pac-Man
// #ID = 8468

DotsRemaining = word_be(0xd819)
Zoom = bit7(0xd878)
Lives = byte(0xd880)
LostLife = prev(Lives) - Lives == 1
GameOver = prev(Lives) == 1 && Lives == 0
Mode = byte(0xd8b2)
Arcade = Mode == 0
Hard = Mode == 1
Level = byte(0xd8ba)
AteFruit = bit0(0xd8f5) == 1 && prev(bit0(0xd8f5)) == 1 &&
    byte(0xd895) == 0x20 && byte(0xd893) == prev(byte(0xd893))

function PrevScore() {
    return prev(high4(0xd8c4)) * 100000 + 
    prev(low4(0xd8c4)) * 10000 +
    prev(high4(0xd8c3)) * 1000 +
    prev(low4(0xd8c3)) * 100 +
    prev(high4(0xd8c2)) * 10 +
    prev(low4(0xd8c2))
}

function CurrScore() => bcd(tbyte(0xd8c2))

function EatFruitCheevo(title, fruit, points, score) {
    achievement(
        title = title,
        points = points,
        description = format("Eat the {0}.", fruit),
        trigger = Lives != 0 && PrevScore() + score == CurrScore() && AteFruit
    )
}

EatFruit = [
    ["The Classic Fruit", "Cherry", 2, 100],
    ["This Is Berry Delicious", "Strawberry", 2, 200],
    ["Pulp Or No Pulp?", "Orange", 2, 500],
    ["Is Mayonnaise An Instrument?", "Pretzel", 2, 700],
    ["No Doctors Necessary", "Apple", 2, 1000],
    ["Can A Pair Of Pears Be Paired?", "Pear", 2, 2000],
    ["Don't Slip", "Banana", 2, 5000]
]

for i in EatFruit {
    EatFruitCheevo(i[0], i[1], i[2], i[3])
}

achievement(
    title = "Drew Carey Can Only Give So Many Points",
    points = 5,
    description = "Earn an extra life with 10000 points.",
    trigger = Lives != 0 && PrevScore() < 10000 && CurrScore() >= 10000
)

achievement(
    title = "Huh. Still Hungry.",
    points = 5,
    description = "Eat four ghosts and get 1600 points.",
    trigger = Lives != 0 && PrevScore() + 1600 == CurrScore()
)

LevelToMazeLookup = {
    0: "1", // Layout 1
    1: "2",
    2: "3", // They Meet
    3: "3", // Layout 2
    4: "4",
    5: "5",
    6: "6", // The Chase
    7: "6", // Layout 3
    8: "7",
    9: "8",
    10: "9",
    11: "10", // Jr. Arrives
    12: "10", // Layout 4
    13: "11",
    14: "12",
    15: "13",
    16: "14", // Another Chase
    17: "14", // Layout 3
    18: "15",
    19: "16",
    20: "17", // Layout 5
    21: "18", // Another Kid?
    22: "18", // Layout 4
    23: "19",
    24: "20",
    25: "21", // Layout 6
    26: "22", // Another Chase
    27: "22", // Layout 3
    28: "23",
    29: "24",
    30: "25", // Layout 5
    31: "26", // ...we're trying kid number 2 again?
    32: "26", // Layout 1
    33: "27", // Layout 2
    34: "28", // Layout 3
    35: "29", // Layout 4
    36: "30", // Layout 5
    37: "31", // Layout 6
    38: "32", // Another Chase
    39: "32", // Layout 1, secretly warps back to level 26.
}

LevelToLayoutLookup = {
    0: "1",
    1: "1",
    2: "2",
    3: "2",
    4: "2",
    5: "2",
    6: "3",
    7: "3",
    8: "3",
    9: "3",
    10: "3",
    11: "4",
    12: "4",
    13: "4",
    14: "4",
    15: "4",
    16: "3",
    17: "3",
    18: "3",
    19: "3",
    20: "5",
    21: "4",
    22: "4",
    23: "4",
    24: "4",
    25: "6",
    26: "3",
    27: "3",
    28: "3",
    29: "3",
    30: "5",
    31: "1",
    32: "1",
    33: "2",
    34: "3",
    35: "4",
    36: "5",
    37: "6",
}

ModeLookup = {
    0: "Arcade",
    1: "Hard"
}

function CutsceneCheevo(stageInternal, stageUi, mode, title, points) {
    modeUi = ModeLookup[mode]
    achievement(
        title = title,
        points = points,
        description = format(
            "Beat stage {0} on {1} Mode and enjoy the cutscene.",
            stageUi,
            modeUi
        ),
        trigger = never(Lives == 0) && never(Mode != mode) &&
            once(Level == stageInternal && prev(Level) == stageInternal - 1) &&
            repeated(60, Level == stageInternal + 1 && prior(Level) == stageInternal)
    )
}

CutsceneCheevoData = [
    [2, 2, "Love At First Chomp", 5],
    [6, 5, "Who Made Who Mad?", 5],
    [11, 9, "Bowser Was Not Invented Yet", 10],
    [16, 13, "Are We Playing Tag Now?", 10],
    [21, 17, "Second Child Already?", 10],
    [26, 21, "I Don't Understand This Dynamic", 10],
    [31, 25, "Second Kid, Second Attempt?", 25],
    [38, 31, "This Is The Game That Never Ends...", 25]
]

for m in ModeLookup {
    for c in CutsceneCheevoData {
        CutsceneCheevo(c[0], c[1], m, format("{0} ({1})", c[2], ModeLookup[m]), c[3])
    }
}

achievement(
    title = "I Prefer Detailed Sprites",
    description = "Beat Level 2 using the default Zoom View.",
    points = 5,
    trigger = Zoom == 0  && Lives != 0 && prev(Level) == 1 && Level == 2
)

achievement(
    title = "I Prefer Maze Visibility",
    description = "Beat Level 2 using the non-default 1/2 View.",
    points = 5,
    trigger = Zoom == 1 && Lives != 0 && prev(Level) == 1 && Level == 2
)

// leaderboard
leaderboard(
    title = "High Score Arcade",
    description = "Get the highest score you can!",
    start = GameOver && Arcade,
    cancel = always_false(),
    submit = always_true(),
    value = CurrScore(),
    format = "VALUE"
)

leaderboard(
    title = "High Score Hard",
    description = "Get the highest score you can!",
    start = GameOver && Hard,
    cancel = always_false(),
    submit = always_true(),
    value = CurrScore(),
    format = "VALUE"
)


// rich presence

StartLookup = {
    0: "Entering"
}

RpEmojiScore = "💯"
RpEmojiWoman = "🚶‍♀️"
RpLives = rich_presence_macro("Number", Lives)
RpLevel = rich_presence_lookup("Level", Level, LevelToMazeLookup, "Unknown")
RpLayout = rich_presence_lookup("Layout", Level, LevelToLayoutLookup, "1")
RpScore = rich_presence_macro("Number", CurrScore())
RpMode = rich_presence_lookup("Mode", Mode, ModeLookup)
RpStart = rich_presence_lookup("Start", DotsRemaining, StartLookup, "Eating away at")

rich_presence_conditional_display(
    Lives != 0,
    "{0} Level {1} (Layout {2}) on {3} {4}{5} {6}{7}",
    RpStart,
    RpLevel,
    RpLayout,
    RpMode,
    RpEmojiWoman,
    RpLives,
    RpEmojiScore,
    RpScore
)

rich_presence_display(
    "Ready to eat dots on {0}.",
    RpMode
)
