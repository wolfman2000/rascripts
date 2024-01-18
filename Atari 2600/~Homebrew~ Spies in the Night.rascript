// ~Homebrew~ Spies in the Night
// #ID = 22548

function TimeRemaining() {
    return low4(0x15) * 10 +
    low4(0x14) * 100 +
    high4(0x14) * 1000 +
    high4(0x13) * 6000
}

function PriorTimeRemaining() {
    return prior(low4(0x15)) * 10 +
    prior(low4(0x14)) * 100 +
    prior(high4(0x14)) * 1000 +
    prior(high4(0x13)) * 6000
}

Status = byte(0x0a)
InGame = bit3(0x0f)
Level = byte(0x59)
Screen = byte(0x5d)

LastGameScore = bcd(tbyte_be(0x13))

StartGame = InGame > prev(InGame) && TimeRemaining() == 6000
BeatLevel = byte(0x7) == 2 && prev(byte(0x7)) == 4

// Cheevos

function BeatLevel(lvl, title, points) {
    achievement(
        title = title,
        description = format(
            "Complete Level {0}.",
            lvl
        ),
        points = points,
        trigger = InGame == 1 && Level == lvl && BeatLevel
    )
}

BeatLevel(1, "The Manchurian Candidate", 1)
BeatLevel(3, "The Hunt For Red October", 2)
BeatLevel(5, "Tinker Tailor Soldier Spy", 4)
BeatLevel(7, "Burn After Reading", 5)
BeatLevel(10, "On Her Majesty's Secret Service", 10)

function StealthLevel(times, title, points) {
    died = Status == 0x0e || Status == 0x1c || Status == 0x2a || Status == 0x38
    NextLevelRetry = Level > prev(Level)
    achievement(
        title = title,
        description = format(
            "Clear {0} levels in one session without dying. The count resets on time over.",
            times
        ),
        points = points,
        trigger = never(InGame == 0) &&
            disable_when(died, until=InGame == 0 || NextLevelRetry) &&
            measured(repeated(times, BeatLevel))
    )
}

StealthLevel(2, "Bridge Of Spies", 5)
StealthLevel(4, "Three Days Of The Condor", 10)
StealthLevel(6, "North By Northwest", 25)

function NoLeftLevel(times, title, points) {
    left = prev(byte(0x63)) >= 0x14 && prev(byte(0x63)) <= 0x1e &&
        byte(0x63) >= 0x0a && byte(0x63) < 0x14
    achievement(
        title = title,
        points = points,
        description = format(
            "Clear {0} levels in one session without pressing left. The count resets on time over.",
            times
        ),
        trigger = never(InGame == 0) &&
            disable_when(left, until=InGame == 0 || Level > prev(Level)) &&
            measured(repeated(times, BeatLevel))
    )
}

NoLeftLevel(2, "The Imitation Game", 5)
NoLeftLevel(4, "The Spy Who Came In From The Cold", 10)
NoLeftLevel(6, "No Way Out", 25)

achievement(
    title = "Enemy Of The State",
    description = "Complete Level 1 without ducking.",
    points = 5,
    trigger = once(StartGame) &&
        never(InGame == 0) && never(Status == 0x76) &&
        trigger_when(Level == 2 && prev(Level) == 1)
)

// Leaderboards

leaderboard(
    title = "High Score",
    description = "Get the highest score you can.",
    start = InGame < prev(InGame) && LastGameScore > 0,
    cancel = always_false(),
    submit = always_true(),
    value = LastGameScore,
    format = "VALUE"
)

leaderboard(
    title = "High Score Eventually",
    description = "Get the highest score you can.",
    start = StartGame,
    cancel = InGame == 0 && LastGameScore == 0,
    submit = InGame == 1 && TimeRemaining() == 0,
    value = tally(
        0,
        Screen > prev(Screen) * 100,
        Level > prev(Level) * 10100
    ),
    format = "VALUE"
)

// Rich Presence

Dead = "Dying (Wait a minute!)"
Walk = "Walking"

StatusLookup = {
    0x00: Dead,
    0x0e: Dead,
    0x1c: Dead,
    0x2a: Dead,
    0x38: Dead,
    0x3e: Walk,
    0x4c: Walk,
    0x5a: Walk, 
    0x68: Walk,
    0x76: "Ducking",
    0xcc: Dead,
    0xda: Dead,
    0xe8: Dead,
}

EmojiClock = "⌚"

RpLevel = rich_presence_macro("Number", Level)
RpScreen = rich_presence_macro("Number", Screen)
RpTime = rich_presence_value("Time", TimeRemaining(), "MILLISECS")
RpStatus = rich_presence_lookup("Status", Status, StatusLookup, "Standing")

rich_presence_conditional_display(
    InGame == 0,
    "Preparing to Spy in the Night. Last Attempt: {0}",
    rich_presence_macro("Number", LastGameScore)
)

rich_presence_conditional_display(
    Status == 0xee,
    "Loading Level {0}, Screen {1}: {2}{3}",
    RpLevel,
    RpScreen,
    EmojiClock,
    RpTime
)

rich_presence_conditional_display(
    TimeRemaining() == 0,
    "The Spy Games are over. Farthest position: Level {0}, Screen {1}",
    RpLevel,
    RpScreen
)

rich_presence_display(
    "Spying via {4} in Level {0}, Screen {1}: {2}{3}",
    RpLevel,
    RpScreen,
    EmojiClock,
    RpTime,
    RpStatus
)
