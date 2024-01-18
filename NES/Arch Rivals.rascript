// Arch Rivals
// #ID = 1543

OnePlayer = byte(0x2a) == 0
P1Main = byte(0xac)
P1Cpu = byte(0xad)

GameState = byte(0xfc)
InGame = GameState == 0

Quarter = byte(0x5e6)

function CurrScore(hundred) {
    return low4(hundred) * 100 + low4(hundred + 1) * 10 + low4(hundred + 2)
}

function PrevScore(hundred) {
    return prev(low4(hundred)) * 100 + prev(low4(hundred + 1)) * 10 + prev(low4(hundred + 2))
}

// Cheevos

GameDone = OnePlayer && prev(Quarter) >= 3 &&
    prev(GameState) != 0x10 && prev(GameState) != 0x1b &&
    __ornext(GameState == 0x10 || GameState == 0x1b)


// first three pointer
achievement(
    title = "It's A Three Pointer",
    description = "Make a three point shot.",
    points = 3,
    trigger = OnePlayer && InGame && PrevScore(0x598) + 3 == CurrScore(0x598)
)

// break the backboard

achievement(
    title = "No Fouls For This At Least",
    description = "Break the backboard.",
    points = 5,
    trigger = OnePlayer && InGame &&
        (Quarter <= 1 && byte(0x730) > prev(byte(0x730)) ||
        (Quarter >= 2 && byte(0x731) > prev(byte(0x731))))
)

// win the game

achievement(
    title = "Remember Good Sportsmanship At The End",
    points = 5,
    description = "Win the game.",
    trigger = GameDone && CurrScore(0x598) > CurrScore(0x59b)
)

// get 80 points as a team

achievement(
    title = "High Scoring Affair",
    points = 5,
    description = "End the game with 80 points or more on your team.",
    trigger = GameDone && CurrScore(0x598) >= 80
)

// Have 50% accuracy or higher at end of game

achievement(
    title = "Sharp Shooter",
    points = 10,
    description = "Have 50% accuracy or more of your shots by the end of the game.",
    trigger = GameDone && byte(0x724) * 2 >= byte(0x722)
)

// get 15 rebounds

achievement(
    title = "Recovery Artist",
    points = 10,
    description = "Have 15 rebounds or more by the end of the game.",
    trigger = GameDone && byte(0x728) >= 15
)

// get 15 steals

achievement(
    title = "Honor Among Basketball Players?",
    points = 10,
    description = "Have 15 steals or more by the end of the game.",
    trigger = GameDone && byte(0x726) >= 15
)

// get a triple double

achievement(
    title = "The Basketbrawl Triple Double",
    points = 25,
    description = "End the game with shots landed, rebounds, and steals in double digits.",
    trigger = GameDone && byte(0x728) >= 10 && byte(0x726) >= 10 && byte(0x724) >= 10
)


// Leaderboards

leaderboard(
    title = "Points Scored",
    description = "How many points did your team earn in a game?",
    start = GameDone,
    cancel = always_false(),
    submit = always_true(),
    value = CurrScore(0x598)
)

leaderboard(
    title = "Individual Points Scored",
    description = "How many points did your specific player earn in a game?",
    start = GameDone,
    cancel = always_false(),
    submit = always_true(),
    value = byte(0x720)
)

leaderboard(
    title = "Individual Steals Made",
    description = "How many times did your specific player steal the ball?",
    start = GameDone,
    cancel = always_false(),
    submit = always_true(),
    value = byte(0x726)
)

leaderboard(
    title = "Individual Rebounds Made",
    description = "How many times did your specific player rebound after a shot?",
    start = GameDone,
    cancel = always_false(),
    submit = always_true(),
    value = byte(0x728)
)

// RP

EmojiClock = "⏲️"

RpTime = rich_presence_value(
    "Time",
    low4(0x59f) * 60 + low4(0x5a0) * 10 + low4(0x5a1),
    "SECS"
)

HomeLookup = {
    0: "Los Angeles",
    1: "Brawl State",
    2: "Natural High",
    3: "Brawl State",
    4: "Natural High",
    5: "Chicago"
}

AwayLookup = {
    0: "Chicago",
    1: "Natural High",
    2: "Los Angeles",
    3: "Los Angeles",
    4: "Chicago",
    5: "Brawl State"
}

QuarterLookup = {
    0: "the 1st Quarter",
    1: "the 2nd Quarter",
    2: "the 3rd Quarter",
    3: "the 4th Quarter",
    4: "Overtime"
}

rich_presence_conditional_display(
    GameState >= 0x04 && GameState <= 0x06,
    "Select Your Arch Rival"
)

rich_presence_conditional_display(
    GameState == 0x01 || (GameState >= 0x14 && GameState <= 0x19),
    "It's Time for Basketbrawl"
)

rich_presence_conditional_display(
    GameState >= 0x10 && GameState <= 0x12,
    "{0} VS {1} -- {2} to {3} Final Score",
    rich_presence_lookup("Home", byte(0x5ce), HomeLookup),
    rich_presence_lookup("Away", byte(0x5ce), AwayLookup),
    rich_presence_macro("Number", CurrScore(0x598)),
    rich_presence_macro("Number", CurrScore(0x59b))
)

rich_presence_display(
    "{0} VS {1} -- {2} to {3} {4}{5} in {6}",
    rich_presence_lookup("Home", byte(0x5ce), HomeLookup),
    rich_presence_lookup("Away", byte(0x5ce), AwayLookup),
    rich_presence_macro("Number", CurrScore(0x598)),
    rich_presence_macro("Number", CurrScore(0x59b)),
    EmojiClock,
    RpTime,
    rich_presence_lookup("Quarter", Quarter, QuarterLookup)
)
