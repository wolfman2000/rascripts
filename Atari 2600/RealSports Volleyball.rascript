// RealSports Volleyball
// #ID = 16350

// Variables

DayCycle = byte(0x01)
InGame = byte(0x12) == 0
InDemo = !InGame && prev(byte(0x12)) != 0
StartedGame = InGame && prev(byte(0x12)) != 0
FinishedGame = prev(byte(0x12)) == 0 && !InGame
LeftSideSpeed = bit0(0x16)
RightSideSpeed = bit0(0x17)

LeftSideFast = bit0(0x16) == 0
RightSideFast = bit0(0x17) == 0

LeftInControl = bit0(0x2d) == 0

GameMode = byte(0x3a)
TraditionalGame = GameMode <= 2
QuickGame = GameMode > 2
ActivePlayers = byte(0x3b)

LeftScore = bcd(byte(0x3c))
LeftPrevScore = prev(high4(0x3c)) * 10 + prev(low4(0x3c))
RightScore = bcd(byte(0x3d))
RightPrevScore = prev(high4(0x3d)) * 10 + prev(low4(0x3d))

TwoPointVictory = LeftScore - RightScore >= 2

WonGame = FinishedGame && LeftScore >= 15 && TwoPointVictory
LostGame = FinishedGame && RightScore >= 15 && RightScore - LeftScore >= 2
UnfinishedGameNormal = FinishedGame && LeftScore < 15 && RightScore < 15
UnfinishedGameLeftFatigued = FinishedGame && LeftScore >= 15 && !TwoPointVictory
UnfinishedGameRightFatigued = FinishedGame && RightScore >= 15 && RightScore - LeftScore < 2

UnfinishedGame = UnfinishedGameNormal || UnfinishedGameLeftFatigued || UnfinishedGameRightFatigued

ChangedSpeed = LeftSideSpeed != prev(LeftSideSpeed) ||
   RightSideSpeed > prev(RightSideSpeed)

InvalidGame = LostGame || UnfinishedGame || ChangedSpeed

StartedTraditionalFastFastGame = LeftScore == 0 && RightScore == 0 && StartedGame &&
        GameMode == 1 && LeftSideFast && RightSideFast
StartedFastReturnFastFastGame = LeftScore == 0 && RightScore == 0 && StartedGame &&
        GameMode == 3 && LeftSideFast && RightSideFast
StartedTraditionalSlowSlowGame = LeftScore == 0 && RightScore == 0 && StartedGame &&
        GameMode == 1 && !LeftSideFast && !RightSideFast
StartedFastReturnSlowSlowGame = LeftScore == 0 && RightScore == 0 && StartedGame &&
        GameMode == 3 && !LeftSideFast && !RightSideFast
StartedTraditionalSlowFastGame = LeftScore == 0 && RightScore == 0 && StartedGame &&
        GameMode == 1 && !LeftSideFast && RightSideFast
StartedFastReturnSlowFastGame = LeftScore == 0 && RightScore == 0 && StartedGame &&
        GameMode == 3 && !LeftSideFast && RightSideFast

// Achievements

achievement(
    title = "A Nice Cold One",
    description = "Watch the sun instead of playing volleyball for a day (can swap game modes to go faster).",
    points = 2,
    trigger = repeated(256, byte(0x01) != prev(byte(0x01))) && never(InGame)
)

function VolleyballCheevo(title, desc, points, start) {
    achievement(
        title = title,
        description = desc,
        points = points,
        trigger = once(start) && never(InvalidGame) && trigger_when(WonGame)
    )
}

VolleyballCheevo(
    "Hummus",
    "Win a game of Traditional Volleyball with both teams moving fast.",
    5,
    StartedTraditionalFastFastGame
)

VolleyballCheevo(
    "Peanut Butter & Banana",
    "Win a game of Fast Return Volleyball with both teams moving fast.",
    5,
    StartedFastReturnFastFastGame
)

VolleyballCheevo(
    "Turkey Wraps with Honey Mustard Dip",
    "Win a game of Traditional Volleyball with both teams moving slow.",
    5,
    StartedTraditionalSlowSlowGame
)

VolleyballCheevo(
    "Pesto Pasta Salad",
    "Win a game of Fast Return Volleyball with both teams moving slow.",
    5,
    StartedFastReturnSlowSlowGame
)

VolleyballCheevo(
    "Sesame Noodles",
    "Win a game of Traditional Volleyall with only your side moving slow.",
    10,
    StartedTraditionalSlowFastGame
)

VolleyballCheevo(
    "Kale & Quinoa Salad",
    "Win a game of Fast Return Volleyball with only your side moving slow.",
    10,
    StartedFastReturnSlowFastGame
)

achievement(
    title = "No-Bake Cookies",
    description = "Win any game of Volleyball 15-0 as long as the opponent's team moves fast.",
    points = 10,
    trigger = once(
        LeftScore == 0 && RightScore == 0 && StartedGame && RightSideFast && bit0(0x3a) == 1
        ) &&
        never(UnfinishedGame) &&
        never(ChangedSpeed) &&
        never(RightScore > 0) &&
        trigger_when(WonGame)
)

// Leaderboards

function VolleyballLeaderboard(title, description, start) {
    leaderboard(
        title = title,
        description = description,
        start = start,
        cancel = InvalidGame,
        submit = WonGame,
        value = always_true(),
        lower_is_better = true,
        format = "FRAMES"
    )
}

VolleyballLeaderboard(
    "Traditional Fast vs Fast Victory RTA",
    "Win in Game Mode 1 (Traditional Volleyball) with both teams moving fast.",
    StartedTraditionalFastFastGame
)

VolleyballLeaderboard(
    "Fast Return Fast vs Fast Victory RTA",
    "Win in Game Mode 3 (Fast Return Volleyball) with both teams moving fast.",
    StartedFastReturnFastFastGame
)

VolleyballLeaderboard(
    "Traditional Slow vs Slow Victory RTA",
    "Win in Game Mode 1 (Traditional Volleyball) with both teams moving slow.",
    StartedTraditionalSlowSlowGame
)

VolleyballLeaderboard(
    "Fast Return Slow vs Slow Victory RTA",
    "Win in Game Mode 3 (Fast Return Volleyball) with both teams moving slow.",
    StartedFastReturnSlowSlowGame
)

VolleyballLeaderboard(
    "Traditional Slow vs Fast Victory RTA",
    "Win in Game Mode 1 (Traditional Volleyball) with just the left team moving slow.",
    StartedTraditionalSlowFastGame
)

VolleyballLeaderboard(
    "Fast Return Slow vs Fast Victory RTA",
    "Win in Game Mode 3 (Fast Return Volleyball) with just the left team moving slow.",
    StartedFastReturnSlowFastGame
)

// Rich Presence

RpGameMode = rich_presence_lookup("GameMode", GameMode, {
    1: "1 Player Traditional",
    2: "2 Player Traditional",
    3: "1 Player Fast Return",
    4: "2 Player Fast Return"
})

SpeedLookup = {
    0: "Fast",
    1: "Slow"
}

RpLeftSpeed = rich_presence_lookup("Speed", bit0(0x16), SpeedLookup)
RpRightSpeed = rich_presence_lookup("Speed", bit0(0x17), SpeedLookup)

RpLeftScore = rich_presence_macro("Number", LeftScore)
RpRightScore = rich_presence_macro("Number", RightScore)

rich_presence_conditional_display(
    InGame,
    "{0} Game in Progress at the Beach Volleyball Court: {1} vs {2}: Score {3} to {4}",
    RpGameMode,
    RpLeftSpeed,
    RpRightSpeed,
    RpLeftScore,
    RpRightScore
)

rich_presence_display(
    "Watching the Sun Set at the Beach Volleyball Court: Last Game's Score {0} to {1}",
    RpLeftScore,
    RpRightScore
)
