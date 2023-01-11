// ~Homebrew~ Family Picross
// #ID = 14917

GameState = byte(0)
PuzzleId = byte(0x49)

function BeatPuzzle() => prev(GameState) == 4 && GameState == 6

function CurrentScore() =>
    byte(0x607) * 100000 + byte(0x608) * 10000 +
    byte(0x609) * 1000 + byte(0x60a) * 100 +
    byte(0x60b) * 10

function PrevScore() =>
    prev(byte(0x607)) * 100000 + prev(byte(0x608)) * 10000 +
    prev(byte(0x609)) * 1000 + prev(byte(0x60a)) * 100 +
    prev(byte(0x60b)) * 10

NameLookup = {
    0: "0",
    1: "1",
    2: "2",
    3: "3",
    4: "4",
    5: "5",
    6: "6",
    7: "7",
    8: "8",
    9: "9",
    10: "A",
    11: "B",
    12: "C",
    13: "D",
    14: "E",
    15: "F",
    16: "G",
    17: "H",
    18: "I",
    19: "J",
    20: "K",
    21: "L",
    22: "M",
    23: "N",
    24: "O",
    25: "P",
    26: "Q",
    27: "R",
    28: "S",
    29: "T",
    30: "U",
    31: "V",
    32: "W",
    33: "X",
    34: "Y",
    35: "Z",
    36: ".",
    37: ",",
    38: "-"
}

TuneLookup = {
    0: "A",
    1: "B",
    2: "C"
}

// Cheevos

BatchOf5Lookup = {
    1: "Ramping Up",
    6: "Bookends",
    11: "Angry Animals",
    16: "Courage",
    21: "Cool Sights?",
    26: "Modern Classics?",
    31: "Power of Music",
    36: "Some Solutions Are Unamusing",
    41: "Mostly Good Memories",
    46: "Use What You Have",
    51: "You're On Fire",
    56: "Far Out!",
    61: "Alright, Have Some Quickies",
    66: "Don't Rush Food Down",
    71: "Going Big",
    76: "No More Memes? Too Bad--",
    81: "Party Time",
    86: "Sort Of Nature-ish",
    91: "Challenges",
    96: "Welcome To Triple Digits",
    101: "Bring ALL The Memes!",
    106: "The Power of Science?",
    111: "Technology With Nature",
    116: "Rising Sun",
}

function BeatLevels(firstStage, length) {
    comparisons = []
    for i in range(firstStage, firstStage + length) {
        array_push(comparisons, (PuzzleId == i && BeatPuzzle()))
    }
    return comparisons
}

BatchOf4Lookup = {
    1: "Starting Small",
    5: "Bounty Hunting",
    9: "Interesting Creatures",
    13: "Food Chain",
    17: "Courage",
    21: "Meaningful Things?",
    25: "Modern Classics?",
    29: "Definitely Metal",
    33: "The Power of Music",
    37: "Some Solutions Are Unamusing",
    41: "Mostly Good Memories",
    45: "Use What You Have",
    49: "You're On Fire",
    53: "Hot And Cold",
    57: "Far Out!",
    61: "Alright, Have Some Quickies",
    65: "Don't Rush Food Down",
    69: "Classic Games",
    73: "Going Big",
    77: "No More Memes? Too Bad--",
    81: "Party Time",
    85: "Sort Of Nature-Ish",
    89: "Challenges",
    93: "Mostly Traditional Entertainment",
    97: "Welcome To Triple Digits",
    101: "Older Memes?",
    105: "Enjoyment & Frustration All In One",
    109: "Creatures in a Factory",
    113: "Technology With Nature",
    117: "Land of the Rising Sun",
    121: "Are We There Yet?",
    125: "We Are There Now"
}

function BatchOf4Cheevo(firstStage) {
    points = 2
    if firstStage < 64 {
        points = 1
    }
    comparisons = BeatLevels(firstStage, 3)
    achievement(
        title = BatchOf4Lookup[firstStage],
        description = format(
            "Clear levels {0}-{1} in a row.",
            firstStage,
            firstStage + 3
        ),
        points = points,
        trigger = never(GameState <= 1) && measured(tally(4, comparisons))
    )
}

for i in range(1, 128, 4) {
    BatchOf4Cheevo(i)
}

// Leaderboards

function SinglePuzzleRTA(stage) {
    leaderboard(
        title = format("Puzzle {0} RTA", stage),
        description = "Clear as fast as you can!",
        start = GameState == 5 && PuzzleId == stage,
        cancel = GameState < 4 || GameState == 0x0e || PuzzleId != stage,
        submit = prev(GameState) == 4 && GameState == 6,
        value = GameState == 4 || GameState == 7,
        lower_is_better = true,
        format = "FRAMES"
    )
}

function BatchOfFourRTA(stage) {
    lastStage = stage + 3
    leaderboard(
        title = format("Puzzles {0}-{1} RTA", stage, lastStage),
        description = "Clear the four puzzles as fast as you can!",
        start = GameState == 5 && PuzzleId == stage,
        cancel = GameState < 4 || GameState == 0x0e ||
            PuzzleId < stage || PuzzleId > lastStage,
        submit = prev(GameState) == 4 && GameState == 6 && PuzzleId == lastStage,
        value = GameState == 4 || GameState == 7,
        lower_is_better = true,
        format = "FRAMES"
    )
}

for i in range(1, 128, 1) {
    SinglePuzzleRTA(i)
}

for i in range(1, 128, 4) {
    BatchOfFourRTA(i)
}

// Rich Presence

EmojiScore = "💯"
EmojiTimer = "⏰"
RpPuzzleId = rich_presence_macro("Number", PuzzleId)
RpCurrentScore = rich_presence_macro("Number", CurrentScore())
RpName1 = rich_presence_lookup("Letter", byte(0x600), NameLookup, " ")
RpName2 = rich_presence_lookup("Letter", byte(0x601), NameLookup, " ")
RpName3 = rich_presence_lookup("Letter", byte(0x602), NameLookup, " ")
RpName4 = rich_presence_lookup("Letter", byte(0x603), NameLookup, " ")
RpName5 = rich_presence_lookup("Letter", byte(0x604), NameLookup, " ")
RpName6 = rich_presence_lookup("Letter", byte(0x605), NameLookup, " ")
RpName7 = rich_presence_lookup("Letter", byte(0x606), NameLookup, " ")

rich_presence_conditional_display(
    GameState == 4,
    "{0}{1}{2}{3}{4}{5}{6} On Puzzle {7} {10}{11}{12}:{13}{14} {8}{9}",
    RpName1,
    RpName2,
    RpName3,
    RpName4,
    RpName5,
    RpName6,
    RpName7,
    RpPuzzleId,
    EmojiScore,
    RpCurrentScore,
    EmojiTimer,
    "0",
    rich_presence_macro("Number", byte(0x117)),
    rich_presence_macro("Number", byte(0x119)),
    rich_presence_macro("Number", byte(0x11a))
)

rich_presence_conditional_display(
    GameState == 8,
    "{0}{1}{2}{3}{4}{5}{6} is a Picross Master!!",
    RpName1,
    RpName2,
    RpName3,
    RpName4,
    RpName5,
    RpName6,
    RpName7
)

rich_presence_conditional_display(
    GameState == 7,
    "{0}{1}{2}{3}{4}{5}{6} Out of Time on Puzzle {7} {8}{9}",
    RpName1,
    RpName2,
    RpName3,
    RpName4,
    RpName5,
    RpName6,
    RpName7,
    RpPuzzleId,
    EmojiScore,
    RpCurrentScore
)

rich_presence_conditional_display(
    GameState == 6,
    "FAR OUT! {0}{1}{2}{3}{4}{5}{6} Completed Puzzle {7} {8}{9}",
    RpName1,
    RpName2,
    RpName3,
    RpName4,
    RpName5,
    RpName6,
    RpName7,
    RpPuzzleId,
    EmojiScore,
    RpCurrentScore
)

rich_presence_conditional_display(
    GameState == 5,
    "{0}{1}{2}{3}{4}{5}{6} About to start Puzzle {7} {8}{9}",
    RpName1,
    RpName2,
    RpName3,
    RpName4,
    RpName5,
    RpName6,
    RpName7,
    RpPuzzleId,
    EmojiScore,
    RpCurrentScore
)

rich_presence_conditional_display(
    GameState == 3,
    "{0}{1}{2}{3}{4}{5}{6} Confirming Their Name",
    RpName1,
    RpName2,
    RpName3,
    RpName4,
    RpName5,
    RpName6,
    RpName7
)

rich_presence_conditional_display(
    GameState == 0x0d,
    "{0}{1}{2}{3}{4}{5}{6} Deciding on Tune {7} for Picross Fun",
    RpName1,
    RpName2,
    RpName3,
    RpName4,
    RpName5,
    RpName6,
    RpName7,
    rich_presence_lookup("Tune", byte(0x64e), TuneLookup)
)

rich_presence_conditional_display(
    GameState == 0x0e,
    "Game Over: Please try Family Picross again."
)

rich_presence_conditional_display(
    GameState <= 1,
    "Welcome to Family Picross"
)

rich_presence_conditional_display(
    GameState == 2,
    "Viewing High Scores in Family Picross"
)

rich_presence_conditional_display(
    GameState == 9,
    "Adjusting Options for Family Picross"
)

rich_presence_conditional_display(
    GameState == 0x0a,
    "Seeing Who Made Family Picross"
)

rich_presence_display(
    "Aiming for easy points with Family Picross"
)
