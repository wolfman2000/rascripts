// Wedding Peach
// #ID = 3965

GameState = byte(0x23)

P1Char = byte(0x20a)
P2Char = byte(0x20c)
P3Char = byte(0x20e)

P1Henshin = byte(0x210)
P2Henshin = byte(0x212)
P3Henshin = byte(0x214)

P1GameScore = bcd(word(0x246))
P1PrevGameScore = prev(low4(0x247)) * 100 + prev(high4(0x246)) * 10 + prev(low4(0x246))
P2GameScore = bcd(word(0x248))
P2PrevGameScore = prev(low4(0x249)) * 100 + prev(high4(0x248)) * 10 + prev(low4(0x248))
P3GameScore = bcd(word(0x24a))
P3PrevGameScore = prev(low4(0x24b)) * 100 + prev(high4(0x24a)) * 10 + prev(low4(0x24a))

P1TotalScore = bcd(word(0x23a))
P2TotalScore = bcd(word(0x23c))
P3TotalScore = bcd(word(0x23e))

PlayingMiniGame = GameState >= 3 && GameState <= 10

PlayerLookup = {
    0: "Peach",
    1: "Lilly",
    2: "Daisy"
}

MiniGameTitle = {
    5: "Head Smashing",
    10: "Slot Machine",
    3: "Card Match",
    4: "Flower Search",
    9: "Shooting Gallery",
    6: "Go Fish",
    8: "Crane Game",
    7: "Window Shell Game",
    11: "Track And Burn"
}

WinGameTitle = {
    3: "The Truth About Card Matching",
    4: "Putting Your Items In Flower Bushes",
    5: "The Targeted Dumpling",
    6: "Seaside Fishing",
    7: "Exciting Shell Game?",
    8: "Crane Games Are Painful",
    9: "The Dumplings Are The Devil",
    10: "Take Care Against RNG",
}

// Achievements

function WinMinigameCheevo(id) {
    achievement(
        title = WinGameTitle[id],
        points = 5,
        description = format(
            "Get 1st place in {0}. No being transformed unless all of you are.",
            MiniGameTitle[id]
        ),
        trigger = prev(GameState) == id && GameState == 0x0c &&
            (P1Henshin == 0 || (P2Henshin == 1 && P3Henshin == 1)) &&
            P1PrevGameScore >= P2PrevGameScore &&
            P1PrevGameScore >= P3PrevGameScore
    )
}

for i in MiniGameTitle {
    if (i != 11) {
        WinMinigameCheevo(i)
    }
}

achievement(
    title = "Love Angels, We'll Fight",
    points = 5,
    description = "Transform using the power of four full hearts before the final minigame.",
    trigger = P1Henshin == 1 && byte(0x222) == 0 && prev(byte(0x222)) == 4 &&
        GameState != 11
)

achievement(
    title = "A Devil's Kiss Isn't Sweet",
    points = 10,
    description = "Survive the final minigame without tripping or losing points.",
    trigger = once(GameState == 11 && prev(GameState) == 12) &&
        once(P1GameScore == 100 && P2GameScore == 100 && P3GameScore == 100) &&
        never(P1GameScore == 0) &&
        never(word(0x76) != 0 && P1GameScore < P1PrevGameScore) &&
        trigger_when(prev(byte(0x38)) == 0xff) &&
        trigger_when(byte(0x38) == 0x00 || (byte(0x422) == 0 && prev(byte(0x422)) == 1))
)

RoundLookup = {
    0: 4,
    1: 6,
    2: 8
}

StoryWinTitle = {
    0: "Birth Of The Story Mode Cheevo",
    1: "Second Story Mode Cheevo Is Born",
    2: "The Third Story Mode Cheevo"
}

function StoryModeVictory(id) {
    points = 10
    if (id == 2) {
        points = 25
    }
    achievement(
        title = StoryWinTitle[id],
        points = points,
        description = "Win the competition with " + RoundLookup[id] + " games a day.",
        trigger = 
            never(byte(0x458) != 7) && never(byte(0xf50) != 7) &&
            never(GameState != 0x0b) && never(byte(0x22c) != id) &&
               (prev(byte(0x1807)) == 0 && byte(0x1807) == 1) &&
            P1TotalScore > P2TotalScore &&
            P1TotalScore > P3TotalScore
    )
}

for i in RoundLookup {
    StoryModeVictory(i)
}

// Leaderboard

HenshinLookup = {
    0: "Civilian",
    1: "Transformed"
}

function BestScoreBoard(id, state) {
    leaderboard(
        title = format("{0} High Score ({1})", MiniGameTitle[id], HenshinLookup[state]),
        description = "Get the high score!",
        start = P1Henshin == state && prev(GameState) == id && GameState == 0x0c,
        cancel = always_false(),
        submit = always_true(),
        value = P1PrevGameScore
    )
}

function StoryModeLeaderboard(id) {
    leaderboard(
        title = format("Story Mode Highest Score {0} Games A Day", RoundLookup[id]),
        description = "Get the highest score you can!",
        start =
            byte(0x458) == 7 &&
            byte(0xf50) == 7 &&
            GameState == 0x0b &&
            byte(0x22c) == id &&
            prev(byte(0x1807)) == 0 &&
            byte(0x1807) == 1,
        cancel = always_false(),
        submit = always_true(),
        value = P1TotalScore
    )
}

for i in MiniGameTitle {
    if (i != 11) {
        BestScoreBoard(i, 0)
        BestScoreBoard(i, 1)
    }
}

for i in range(0, 2) {
    StoryModeLeaderboard(i)
}

// RP

RpGirl1 = rich_presence_lookup("Name", P1Char, PlayerLookup)
RpGirl2 = rich_presence_lookup("Name", P2Char, PlayerLookup)
RpGirl3 = rich_presence_lookup("Name", P3Char, PlayerLookup)

RpGame1 = rich_presence_macro("Number", P1GameScore)
RpGame2 = rich_presence_macro("Number", P2GameScore)
RpGame3 = rich_presence_macro("Number", P3GameScore)

rich_presence_conditional_display(
    PlayingMiniGame,
    "Playing {0}: {1} {2} {3} {4} {5} {6}",
    rich_presence_lookup("MiniGame", GameState, MiniGameTitle),
    RpGirl1,
    RpGame1,
    RpGirl2,
    RpGame2,
    RpGirl3,
    RpGame3
)

rich_presence_conditional_display(
    GameState == 0x0b,
    "The Final Event Vs. Jama-P!"
)

rich_presence_conditional_display(
    GameState == 0x0c,
    "Totaling the Results after playing {0}",
    rich_presence_lookup("MiniGame", prior(GameState), MiniGameTitle)
)

rich_presence_display("Time to compete for the affection of Tim.")
