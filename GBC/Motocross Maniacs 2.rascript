// Motocross Maniacs 2
// #ID = 6136

Name1 = tbyte_be(0x98c6)
Pts1 = word_be(0x98cb)

Difficulty = byte(0xc008)
GameStateFull = word_be(0xc030)
GameStateMain = byte(0xc030)
Class = byte(0xc03d)
Course = byte(0xc060)

Nitros = byte(0xca12)
FuelLeftSeconds = byte(0xca4f)

GameCen = bcd(byte(0xca02))
GameSec = bcd(byte(0xca03))
GameMin = bcd(byte(0xca04))

Followers = byte(0xca2a)

RunningGameCen = bcd(byte(0xec31))
RunningGameSec = bcd(byte(0xec32))
RunningGameMin = bcd(byte(0xec33))

DiffLookup = {
    0: "Easy",
    1: "Medium",
    2: "Hard",
}

CourseLookup = {
    1: "01",
    2: "02",
    3: "03",
    4: "04",
    5: "05",
    6: "06",
    7: "07",
    8: "08",
    9: "09",
    10: "10",
    11: "11",
    12: "12",
    13: "13",
    14: "14",
    15: "15",
    16: "16",
    0x11: "Edit 1",
    0x12: "Edit 2",
    0x13: "Edit 3"
}

ClassLookup = {
    0: "Rookie",
    1: "National",
    2: "World",
    3: "Super World"
}

ClassLastStage = {
    0: 5,
    1: 10,
    2: 15,
    3: 16
}

// Cheevos

FinishedRace = prev(GameStateMain) == 0x10 && GameStateMain == 0x12

function CourseClearCheevo(i) {
    points = 10
    diffCheck = Difficulty != 0
    diffMsg = "medium or higher"
    if (i <= 5) {
        points = 3
    }
    else if (i <= 10) {
        points = 4
    }
    else if (i <= 15) {
        points = 5
    }
    else if (i == 16) {
        diffCheck = Difficulty == 2
        diffMsg = "hard"
    }
    achievement(
        title = format("Course {0} Clear", i),
        points = points,
        description = format(
            "Clear course {0} in Championship Mode on {1}.",
            i,
            diffMsg
        ),
        trigger = FinishedRace &&
            Course == i && diffCheck
    )
}

function CourseCrashlessCheevo(i) {
    points = 25
    diffCheck = Difficulty != 0
    diffMsg = "medium or higher"
    if (i <= 5) {
        points = 4
    }
    else if (i <= 10) {
        points = 5
    }
    else if (i <= 15) {
        points = 10
    }
    else if (i == 16) {
        diffCheck = Difficulty == 2
        diffMsg = "hard"
    }
    achievement(
        title = format("Course {0} Crash-less", i),
        points = points,
        description = format(
            "Clear course {0} in Championship Mode on {1} without crashing.",
            i,
            diffMsg
        ),
        trigger = 
            once(prev(GameStateMain) == 0x0f && GameStateMain == 0x10) &&
            never(!diffCheck) &&
            never(Course != i) &&
            never(GameStateMain == 0x11) &&
            never(byte(0xca32) == 1) &&
            trigger_when(FinishedRace)
    )
}

for i in range(1, 16) {
    CourseClearCheevo(i)
}

for i in range(1, 16) {
    CourseCrashlessCheevo(i)
}

function PerfectChampCheevo(d, c) {
    points = 10
    target = 0x3f3a
    if (c == 3) {
        points = 50
        target = 0x403a
    }
    else if (d == 2) {
        points = 25
    }
    if (c != 3 || d == 2) {
        achievement(
            title = format("{0} Class {1} Mastered", ClassLookup[c], DiffLookup[d]),
            points = points,
            description = format(
                "Get max points on the {0} Class on {1} difficulty.", ClassLookup[c], DiffLookup[d]
            ),
            trigger = 
                prev(GameStateFull) == 0x1207 && GameStateFull == 0x1208 &&
                    Class == c &&
                    Course == ClassLastStage[c] && Difficulty >= d &&
                    Name1 == 0x5d5359 && Pts1 == target
        )
    }
}

for d in range(1, 2) {
    for c in ClassLookup {
        PerfectChampCheevo(d, c)
    }
}

function ParadeCheevo(i) {
    points = 10
    if (i != 3) {
        points = 5
    }
    term = "bikers"
    if (i == 1) {
        term = "biker"
    }
    achievement(
        title = format("What Is {0} More?", i),
        points = points,
        description = format(
            "Clear any Championship Race with {0} {1} following you.",
            i,
            term
        ),
        trigger = FinishedRace && Followers >= i
    )
}

for i in range(1, 3) {
    ParadeCheevo(i)
}

achievement(
    title = "Slow And Steady...?",
    points = 10,
    description = "Clear any course in Championship Mode without crashing or using nitro.",
    trigger = 
        once(prev(GameStateMain) == 0x0f && GameStateMain == 0x10) &&
        never(GameStateMain == 0x11) &&
        never(byte(0xca32) == 1) &&
        never(bit5(0xc028) > prev(bit5(0xc028))) &&
        trigger_when(FinishedRace)
)

// Leaderboards

function CourseLeaderboard(d, i) {
    leaderboard(
        title = format("Course {0} {1} (Championship)", i, DiffLookup[d]),
        description = "Get the fastest time!",
        start = FinishedRace && Course == i && Difficulty == d,
        cancel = always_false(),
        submit = always_true(),
        value = GameMin * 6000 + GameSec * 100 + GameCen,
        lower_is_better = true,
        format = "MILLISECS"
    )
}

for d in range(0, 2) {
    for i in range(1, 16) {
        CourseLeaderboard(d, i)
    }
}

// RP

SimpleGsLookup = {
    0: "Ready for Motocross Maniacs",
    1: "Nintendo has to be here somewhere...",
    2: "Konami sure loves their logos...",
    3: "Welcome to Motocross Maniacs 2",
    5: "Setting Up the Options",
    7: "Deciding how to motocross today",
    0x0e: "Deciding which championship class to go for"
}

EmojiGas = "⛽"
EmojiNitro = "🚀"
EmojiTimer = "⏲️"

RpRunningTime = rich_presence_value(
    "Time",
    RunningGameCen + (RunningGameSec * 100) + (RunningGameMin * 6000),
    "MILLISECS"
)
RpEndTime = rich_presence_value(
    "Time",
    GameCen + (GameSec * 100) + (GameMin * 6000),
    "MILLISECS"
)

RpFuelLeftSeconds = rich_presence_macro("Number", FuelLeftSeconds)
RpDiff = rich_presence_lookup("Diff", Difficulty, DiffLookup, "Medium")
RpClass = rich_presence_lookup("Class", Class, ClassLookup)
RpCourse = rich_presence_lookup("Course", Course, CourseLookup, "??")
RpFallback = rich_presence_lookup(
    "Fallback", GameStateMain, SimpleGsLookup, "Messing with the course editor"
)
RpNitros = rich_presence_macro("Number", bcd(Nitros))

rich_presence_conditional_display(
    GameStateMain >= 0x1d,
    "Racing against another human"
)

rich_presence_conditional_display(
    GameStateMain == 4,
    "Watching the Demo of Course {0}",
    RpCourse
)

rich_presence_conditional_display(
    GameStateMain == 8,
    "Thinking of practicing Course {0} on {1}",
    RpCourse,
    RpDiff
)

rich_presence_conditional_display(
    GameStateMain == 9,
    "Loading the time trial for Course {0} on {1}",
    RpCourse,
    RpDiff
)

rich_presence_conditional_display(
    GameStateMain == 0x0a,
    "On the time trial for Course {0} on {1} {2}{3} {4}{5} {6}{7}",
    RpCourse,
    RpDiff,
    EmojiGas,
    RpFuelLeftSeconds,
    EmojiNitro,
    RpNitros,
    EmojiTimer,
    RpRunningTime
)

rich_presence_conditional_display(
    GameStateMain == 0x0b,
    "Failed the time trial for Course {0} on {1}",
    RpCourse,
    RpDiff
)

rich_presence_conditional_display(
    GameStateMain == 0x0c,
    "Done with the time trial for Course {0} on {1}",
    RpCourse,
    RpDiff,
    EmojiTimer,
    RpEndTime
)

rich_presence_conditional_display(
    GameStateMain == 0x0d,
    "Wish to tackle the time trial for Course {0} on {1} again?",
    RpCourse,
    RpDiff
)

rich_presence_conditional_display(
    GameStateMain == 0x0f,
    "Loading {0} Class Course {1} on {2}",
    RpClass,
    RpCourse,
    RpDiff
)

rich_presence_conditional_display(
    GameStateMain == 0x10,
    "Racing in {0} Class Course {1} on {2} {3}{4} {5}{6} {7}{8}",
    RpClass,
    RpCourse,
    RpDiff,
    EmojiGas,
    RpFuelLeftSeconds,
    EmojiNitro,
    RpNitros,
    EmojiTimer,
    RpRunningTime
)

rich_presence_conditional_display(
    GameStateMain == 0x11,
    "No more fuel for {0} Class Course {1} on {2}",
    RpClass,
    RpCourse,
    RpDiff
)

rich_presence_conditional_display(
    GameStateMain == 0x12,
    "Completed {0} Class Course {1} on {2} {3}{4}",
    RpClass,
    RpCourse,
    RpDiff,
    EmojiTimer,
    RpEndTime
)

rich_presence_conditional_display(
    GameStateMain == 0x13,
    "Ready for the next challenge on the {0} Class?",
    RpClass
)

rich_presence_conditional_display(
    GameStateMain == 0x14,
    "Done with the {0} Class",
    RpClass
)

rich_presence_conditional_display(
    GameStateMain == 0x15,
    "Looking up their records on Course {0}",
    RpCourse
)

rich_presence_display(
    "{0}",
    RpFallback
)
