// ~Homebrew~ BirdLife
// #ID = 25661

GameState = byte(0x9f259c)
Height = dword(0x9f262c)
Iframes = dword(0x9f2634)
Lives = dword(0x9f2638)
Score = dword(0x9f263c)

Flying = bit4(0x1fbfe74) + bit5(0x1fbfe75)

GsWait = GameState == 0x0a
GsAlive = GameState == 0x14
GsDead = GameState == 0x1e

function SecondsToFrames(val) => val * 60

function ScoreTarget(target) {
    return measured(
        tally(
            target,
            Score > prev(Score),
            Score > prev(Score) + 1,
            Score > prev(Score) + 2,
            Score > prev(Score) + 3
        )
    )
}

// Cheevos

achievement(
    title = "Bird Up",
    points = 2,
    description = "Dodge 50 birds in one game.",
    trigger = never(GsWait) && never(GsDead) && ScoreTarget(50)
)

achievement(
    title = "Not A Pinioned Pigeon",
    points = 3,
    description = "Dodge 100 birds in one game.",
    trigger = never(GsWait) && never(GsDead) && ScoreTarget(100)
)

achievement(
    title = "Jonathan's Dream Made Reality",
    points = 5,
    description = "Dodge 200 birds in one game.",
    trigger = never(GsWait) && never(GsDead) && ScoreTarget(200)
)

achievement(
    title = "At Least We're Not Against Flying V Formations",
    points = 5,
    description = "Dodge 500 birds in total. Game Overs in between are allowed.",
    trigger = GsAlive && prev(Score) < 500 && Score >= 500
)

achievement(
    title = "One Tenth The Way Towards South Carolina",
    points = 10,
    description = "Dodge 1000 birds in total. Game Overs in between are allowed.",
    trigger = GsAlive && prev(Score) < 1000 && Score >= 1000
)

achievement(
    title = "Flight Of The...Wait. This Isn't A Bumblebee!",
    points = 5,
    description = "Survive 60 seconds without getting hit.",
    trigger = never(GsWait) && never(GsDead) && never(Lives < prev(Lives)) &&
        never(Iframes != 0) &&
        trigger_when(repeated(SecondsToFrames(60), always_true()))
)

achievement(
    title = "Flying Through Boston Is Dangerous",
    points = 5,
    description = "Survive 20 seconds without getting in range of buildings or getting hit.",
    trigger = never(GsWait) && never(GsDead) && never(Height > 0x90) &&
        never(Lives < prev(Lives)) && never(Iframes != 0) &&
        trigger_when(repeated(SecondsToFrames(20), always_true()))
)

achievement(
    title = "This Isn't Flying! This Is Falling With Style!",
    points = 5,
    description = "Survive 20 seconds without flying up or getting hit.",
    trigger = never(GsWait) && never(GsDead) && never(Flying != 0) &&
        never(Lives < prev(Lives)) && never(Iframes != 0) &&
        trigger_when(repeated(SecondsToFrames(20), always_true()))
)

// Leaderboards

leaderboard(
    title = "Best Score Single Flight",
    description = "Dodge the most birds!",
    start = prev(GameState) == 0x0a && GsAlive,
    cancel = GsWait,
    submit = prev(GameState) == 0x14 && GsDead,
    value = ScoreTarget(0)
)

leaderboard(
    title = "Best Score Damageless",
    description = "Dodge the most birds without getting hit!",
    start = prev(GameState) == 0x0a && GsAlive,
    cancel = GsWait,
    submit = Lives < prev(Lives),
    value = ScoreTarget(0)
)

leaderboard(
    title = "Best Time Single Flight",
    description = "Fly as long as you can!",
    start = prev(GameState) == 0x0a && GsAlive,
    cancel = GsWait,
    submit = prev(GameState) == 0x14 && GsDead,
    value = always_true(),
    format = "FRAMES"
)

leaderboard(
    title = "Best Time Damageless",
    description = "Fly as long as you can without getting hit!",
    start = prev(GameState) == 0x0a && GsAlive,
    cancel = GsWait,
    submit = Lives < prev(Lives),
    value = always_true(),
    format = "FRAMES"
)

// RP

EmojiHeart = "❤️"
EmojiOuch = "❌"

FlyingLookup = {
    0: "Gliding",
    1: "Flying",
    2: "Flying"
}

HealthLookup = {
    2: (EmojiHeart + EmojiHeart),
    1: (EmojiHeart + EmojiOuch),
    0: (EmojiOuch + EmojiOuch)
}

RpSessionScore = rich_presence_macro("Number", Score)
RpRunScore = ScoreTarget(0) && never(GameState != 0x14)

rich_presence_conditional_display(
    GameState == 0x0a,
    "Preparing to fly south for the winter. Total dodges: {0}",
    RpSessionScore
)

rich_presence_conditional_display(
    GameState == 0x1e,
    "Not what I meant by south for the winter here... Total dodges: {0}",
    RpSessionScore
)

rich_presence_display(
    "{1} across the city, dodging other birds. Health: {3} Current dodges: {2}  Total dodges: {0}",
    RpSessionScore,
    rich_presence_lookup("Flying", Flying, FlyingLookup),
    rich_presence_macro("Number", RpRunScore),
    rich_presence_lookup("Health", Lives, HealthLookup)
)
