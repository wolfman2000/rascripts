// Word Searcher (DSi)
// #ID = 22369

DsId = dword(0xffe00c) == 0x4553574b

SelectedProfile = byte(0x1c823c)
OnProfile = SelectedProfile >= 1 && SelectedProfile <= 4
SwappedProfile = SelectedProfile != prev(SelectedProfile)

PuzzleState = byte(0x1c81ec)
PuzzlePage = byte(0x1c81ec)
SelectingPage = PuzzlePage >= 1 && PuzzlePage <= 5

PuzzleIndex = byte(0x1b3b44)

Word01 = byte(0x1c8344)
Word02 = byte(0x1c8348)
Word03 = byte(0x1c834c)
Word04 = byte(0x1c8350)
Word05 = byte(0x1c8354)
Word06 = byte(0x1c8358)
Word07 = byte(0x1c835c)
Word08 = byte(0x1c8360)
Word09 = byte(0x1c8364)
Word10 = byte(0x1c8368)
Word11 = byte(0x1c836c)
Word12 = byte(0x1c8370)
Word13 = byte(0x1c8374)
Word14 = byte(0x1c8378)

PuzzleCompleted = Word01 + Word02 + Word03 + Word04 + Word05 + Word06 + Word07 +
Word08 + Word09 + Word10 + Word11 + Word12 + Word13 + Word14 == 14 &&
prev(Word01) + prev(Word02) + prev(Word03) + prev(Word04) +
prev(Word05) + prev(Word06) + prev(Word07) + prev(Word08) +
prev(Word09) + prev(Word10) + prev(Word11) + prev(Word12) +
prev(Word13) + prev(Word14) == 13


PuzzleMinutes = byte(0x1c827c)
PuzzleSeconds = byte(0x1c81e8)

CategoryLookup = {
    0: "Anatomy",
    1: "Ancient Weapons",
    2: "Animals",
    3: "Animals 2",
    4: "Art",
    5: "Artist",
    6: "Autumn",
    7: "Boats",
    8: "Breakfast",
    9: "Camping",
    10: "Can. Cities",
    11: "Can. Cities 2",
    12: "Car Parts",
    13: "Card Games",
    14: "Carnivore",
    15: "Cats",
    16: "Chemistry",
    17: "Christmas",
    18: "Circus",
    19: "Clothes",
    20: "Colors",
    21: "Computers",
    22: "Constellations",
    23: "Cookies",
    24: "Countries",
    25: "Currency",
    26: "Dogs",
    27: "Emotions",
    28: "Emperors",
    29: "Euro. Cities",
    30: "Euro. Cities 2",
    31: "Europe",
    32: "Europe 2",
    33: "Explorers",
    34: "Fairy Tales",
    35: "Farming",
    36: "Fish",
    37: "Fishing",
    38: "Flowers",
    39: "Fruits",
    40: "Game Genres",
    41: "Geography",
    42: "Greek Gods",
    43: "Herbivores",
    44: "Ice Cream",
    45: "Insects",
    46: "Instruments",
    47: "Jewels",
    48: "Kitchen",
    49: "Landmarks",
    50: "Numbers",
    51: "Mascots",
    52: "Measurements",
    53: "Mythology",
    54: "Nobel Winners",
    55: "Norse Gods",
    56: "Old West",
    57: "Omnivores",
    58: "Onomatopoeia",
    59: "Pets",
    60: "Pizza Toppings",
    61: "Poetry",
    62: "Prime Ministers",
    63: "Professions",
    64: "Q Words",
    65: "Reptiles",
    66: "Rivers",
    67: "Rocks",
    68: "School",
    69: "Scientists",
    70: "Sea Creatures",
    71: "Seas",
    72: "Sharks",
    73: "Sounds",
    74: "Spiders",
    75: "Sports",
    76: "Spring",
    77: "Stars",
    78: "Summer",
    79: "Summer Olympics",
    80: "Sweets",
    81: "Symbols",
    82: "The Beach",
    83: "The Caribbean",
    84: "Theater",
    85: "Toolbox",
    86: "Transportation",
    87: "Trees",
    88: "US Capitals",
    89: "US Capitals 2",
    90: "US Presidents",
    91: "US States",
    92: "Vegetables",
    93: "Volcanoes",
    94: "Weather",
    95: "Whales",
    96: "Winter",
    97: "Winter Olympics",
    98: "X Words",
    99: "Z Words",
}

// achievements

function Batch4Cheevo(index, name) {
    first = index + 1
    last = index + 4
    achievement(
        title = name,
        description = format("Solve Puzzles {0}-{1} in one session.", first, last),
        points = 2,
        trigger = unless(!DsId) && never(SwappedProfile) &&
            once(PuzzleIndex == index && PuzzleCompleted) &&
            once(PuzzleIndex == index + 1 && PuzzleCompleted) &&
            once(PuzzleIndex == index + 2 && PuzzleCompleted) &&
            once(PuzzleIndex == index + 3 && PuzzleCompleted)
    )
}

CategoryCheevo = {
    0: "The Anatomy Of Animals",
    4: "Art In Autumn",
    8: "Camping In Canadian Cities",
    12: "Carnivorous Cats",
    16: "Clothes Through Chemistry",
    20: "Colorful Cookies",
    24: "Dogs In Many Countries",
    28: "Emperors Of Europe",
    32: "Farmers Who Explore",
    36: "Can Fish Eat Fruit?",
    40: "The Greek Gods' Favorite Game Genres",
    44: "Can Insects Play Instruments?",
    48: "Mascots In The Kitchen",
    52: "Norse Gods In Mythology",
    56: "The Pets Of The Old West",
    60: "What Pizza Toppings Do Professionals Like?",
    64: "Reptiles In Rivers",
    68: "Scientists Did Go To School",
    72: "The Sounds Of Sharks",
    76: "The Stars Of The Summer Olympics",
    80: "Sweets For The Beach",
    84: "Transportation To The Theater",
    88: "United States Fever",
    92: "Do Whales Eat Vegetables?",
    96: "Winter Olympic Z Words"
}

for i in range(0, 99, 4) {
    Batch4Cheevo(i, CategoryCheevo[i])
}

// Leaderboards

function IlLeaderboard(puzzle) {
    leaderboard(
        title = format("{0} Time Attack", CategoryLookup[puzzle]),
        description = "Get the fastest time you can!",
        start = unless(!DsId) && PuzzleIndex == puzzle && PuzzleCompleted,
        cancel = always_false(),
        submit = always_true(),
        value = PuzzleMinutes * 60 + PuzzleSeconds,
        format = "SECS",
        lower_is_better = true
    )
}

for i in CategoryLookup {
    IlLeaderboard(i)
}

// rich presence

RpChar1 = rich_presence_macro("ASCIIChar", byte(0x1cb535 + SelectedProfile * 11))
RpChar2 = rich_presence_macro("ASCIIChar", byte(0x1cb536 + SelectedProfile * 11))
RpChar3 = rich_presence_macro("ASCIIChar", byte(0x1cb537 + SelectedProfile * 11))
RpChar4 = rich_presence_macro("ASCIIChar", byte(0x1cb538 + SelectedProfile * 11))
RpChar5 = rich_presence_macro("ASCIIChar", byte(0x1cb539 + SelectedProfile * 11))
RpChar6 = rich_presence_macro("ASCIIChar", byte(0x1cb53a + SelectedProfile * 11))
RpChar7 = rich_presence_macro("ASCIIChar", byte(0x1cb53b + SelectedProfile * 11))
RpChar8 = rich_presence_macro("ASCIIChar", byte(0x1cb53c + SelectedProfile * 11))

RpPage = rich_presence_macro("Number", PuzzlePage)
RpPuzzleNumber = rich_presence_macro("Number", PuzzleIndex + 1)
RpCategory = rich_presence_lookup("Category", PuzzleIndex, CategoryLookup, "Unknown")

TotalMinutes = byte(0x1cb710 + SelectedProfile * 4)
TotalSeconds = byte(0x1cb711 + SelectedProfile * 4)

RpCompleted = rich_presence_macro("Number", byte(0x1cb6fb + SelectedProfile))
RpTotalHours = rich_presence_macro("Number", byte(0x1cb70e + SelectedProfile * 4))
RpTotalMinutes = rich_presence_macro("Number", TotalMinutes)
RpTotalSeconds = rich_presence_macro("Number", TotalSeconds)

CurrentMinutes = byte(0x1c827c)
CurrentSeconds = byte(0x1c81e8)

RpCurrentHours = rich_presence_macro("Number", byte(0x1c81cc))
RpCurrentMinutes = rich_presence_macro("Number", CurrentMinutes)
RpCurrentSeconds = rich_presence_macro("Number", CurrentSeconds)

RpTotals00 = "Total {10}/100 ⏲️ {11}:0{12}:0{13}"
RpTotals0L = "Total {10}/100 ⏲️ {11}:0{12}:{13}"
RpTotalsL0 = "Total {10}/100 ⏲️ {11}:{12}:0{13}"
RpTotalsLL = "Total {10}/100 ⏲️ {11}:{12}:{13}"

RpWords00 = "Words {14}/14 ⏲️ {14}:0{15}:0{16}"
RpWords0L = "Words {14}/14 ⏲️ {14}:0{15}:{16}"
RpWordsL0 = "Words {14}/14 ⏲️ {14}:{15}:0{16}"
RpWordsLL = "Words {14}/14 ⏲️ {14}:{15}:{16}"

rich_presence_conditional_display(
    !DsId,
    "Not yet up to Word Searching"
)

rich_presence_conditional_display(
    PuzzleState <= 5 && TotalMinutes < 10 && TotalSeconds < 10,
    "{2}{3}{4}{5}{6}{7}{8}{9} is thinking of a word search puzzle on page {0} - " +
    RpTotals00,
    RpPage,
    0,
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpCompleted,
    RpTotalHours,
    RpTotalMinutes,
    RpTotalSeconds
)

rich_presence_conditional_display(
    PuzzleState <= 5 && TotalMinutes < 10,
    "{2}{3}{4}{5}{6}{7}{8}{9} is thinking of a word search puzzle on page {0} - " +
    RpTotals0L,
    RpPage,
    0,
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpCompleted,
    RpTotalHours,
    RpTotalMinutes,
    RpTotalSeconds
)

rich_presence_conditional_display(
    PuzzleState <= 5 && TotalSeconds < 10,
    "{2}{3}{4}{5}{6}{7}{8}{9} is thinking of a word search puzzle on page {0} - " +
    RpTotalsL0,
    RpPage,
    0,
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpCompleted,
    RpTotalHours,
    RpTotalMinutes,
    RpTotalSeconds
)

rich_presence_conditional_display(
    PuzzleState <= 5,
    "{2}{3}{4}{5}{6}{7}{8}{9} is thinking of a word search puzzle on page {0} - " +
    RpTotalsLL,
    RpPage,
    0,
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpCompleted,
    RpTotalHours,
    RpTotalMinutes,
    RpTotalSeconds
)

rich_presence_conditional_display(
    PuzzleState == 0x16 && TotalMinutes < 10 && TotalSeconds < 10,
    "{2}{3}{4}{5}{6}{7}{8}{9} Completed Puzzle {0}: {1} - " + RpTotals00,
    RpPuzzleNumber,
    RpCategory,
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpCompleted,
    RpTotalHours,
    RpTotalMinutes,
    RpTotalSeconds
)

rich_presence_conditional_display(
    PuzzleState == 0x16 && TotalMinutes < 10,
    "{2}{3}{4}{5}{6}{7}{8}{9} Completed Puzzle {0}: {1} - " + RpTotals0L,
    RpPuzzleNumber,
    RpCategory,
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpCompleted,
    RpTotalHours,
    RpTotalMinutes,
    RpTotalSeconds
)

rich_presence_conditional_display(
    PuzzleState == 0x16 && TotalSeconds < 10,
    "{2}{3}{4}{5}{6}{7}{8}{9} Completed Puzzle {0}: {1} - " + RpTotalsL0,
    RpPuzzleNumber,
    RpCategory,
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpCompleted,
    RpTotalHours,
    RpTotalMinutes,
    RpTotalSeconds
)

rich_presence_conditional_display(
    PuzzleState == 0x16,
    "{2}{3}{4}{5}{6}{7}{8}{9} Completed Puzzle {0}: {1} - " + RpTotalsLL,
    RpPuzzleNumber,
    RpCategory,
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpCompleted,
    RpTotalHours,
    RpTotalMinutes,
    RpTotalSeconds
)

rich_presence_conditional_display(
    PuzzleState == 0x1e && TotalMinutes < 10 && TotalSeconds < 10,
    "{2}{3}{4}{5}{6}{7}{8}{9} Wishes to beat their best time on Puzzle {0}: {1} - " +
    RpTotals00,
    RpPuzzleNumber,
    RpCategory,
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpCompleted,
    RpTotalHours,
    RpTotalMinutes,
    RpTotalSeconds
)

rich_presence_conditional_display(
    PuzzleState == 0x1e && TotalMinutes < 10,
    "{2}{3}{4}{5}{6}{7}{8}{9} Wishes to beat their best time on Puzzle {0}: {1} - " +
    RpTotals0L,
    RpPuzzleNumber,
    RpCategory,
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpCompleted,
    RpTotalHours,
    RpTotalMinutes,
    RpTotalSeconds
)

rich_presence_conditional_display(
    PuzzleState == 0x1e && TotalSeconds < 10,
    "{2}{3}{4}{5}{6}{7}{8}{9} Wishes to beat their best time on Puzzle {0}: {1} - " +
    RpTotalsL0,
    RpPuzzleNumber,
    RpCategory,
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpCompleted,
    RpTotalHours,
    RpTotalMinutes,
    RpTotalSeconds
)

rich_presence_conditional_display(
    PuzzleState == 0x1e,
    "{2}{3}{4}{5}{6}{7}{8}{9} Wishes to beat their best time on Puzzle {0}: {1} - " +
    RpTotalsLL,
    RpPuzzleNumber,
    RpCategory,
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpCompleted,
    RpTotalHours,
    RpTotalMinutes,
    RpTotalSeconds
)

rich_presence_conditional_display(
    PuzzleState == 0x1f,
    "Learning how to Word Search."
)

rich_presence_conditional_display(
    PuzzleState == 0x20,
    "Learning who made Word Searcher."
)

rich_presence_conditional_display(
    PuzzleState == 0x65 && TotalMinutes < 10 && TotalSeconds < 10,
    "{2}{3}{4}{5}{6}{7}{8}{9} Pausing on Puzzle {0}: {1} - " + RpTotals00,
    RpPuzzleNumber,
    RpCategory,
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpCompleted,
    RpTotalHours,
    RpTotalMinutes,
    RpTotalSeconds
)

rich_presence_conditional_display(
    PuzzleState == 0x65 && TotalMinutes < 10,
    "{2}{3}{4}{5}{6}{7}{8}{9} Pausing on Puzzle {0}: {1} - " + RpTotals0L,
    RpPuzzleNumber,
    RpCategory,
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpCompleted,
    RpTotalHours,
    RpTotalMinutes,
    RpTotalSeconds
)

rich_presence_conditional_display(
    PuzzleState == 0x65 && TotalSeconds < 10,
    "{2}{3}{4}{5}{6}{7}{8}{9} Pausing on Puzzle {0}: {1} - " + RpTotalsL0,
    RpPuzzleNumber,
    RpCategory,
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpCompleted,
    RpTotalHours,
    RpTotalMinutes,
    RpTotalSeconds
)

rich_presence_conditional_display(
    PuzzleState == 0x65,
    "{2}{3}{4}{5}{6}{7}{8}{9} Pausing on Puzzle {0}: {1} - " + RpTotalsLL,
    RpPuzzleNumber,
    RpCategory,
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpCompleted,
    RpTotalHours,
    RpTotalMinutes,
    RpTotalSeconds
)

rich_presence_conditional_display(
    PuzzleState == 0x66,
    "Who is Word Searching?"
)

rich_presence_conditional_display(
    PuzzleState == 0x67 && TotalMinutes < 10 && TotalSeconds < 10,
    "{2}{3}{4}{5}{6}{7}{8}{9} Thinking of Resuming Puzzle {0}: {1} - " + RpTotals00,
    RpPuzzleNumber,
    RpCategory,
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpCompleted,
    RpTotalHours,
    RpTotalMinutes,
    RpTotalSeconds
)

rich_presence_conditional_display(
    PuzzleState == 0x67 && TotalSeconds < 10,
    "{2}{3}{4}{5}{6}{7}{8}{9} Thinking of Resuming Puzzle {0}: {1} - " + RpTotalsL0,
    RpPuzzleNumber,
    RpCategory,
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpCompleted,
    RpTotalHours,
    RpTotalMinutes,
    RpTotalSeconds
)

rich_presence_conditional_display(
    PuzzleState == 0x67 && TotalMinutes < 10,
    "{2}{3}{4}{5}{6}{7}{8}{9} Thinking of Resuming Puzzle {0}: {1} - " + RpTotals0L,
    RpPuzzleNumber,
    RpCategory,
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpCompleted,
    RpTotalHours,
    RpTotalMinutes,
    RpTotalSeconds
)

rich_presence_conditional_display(
    PuzzleState == 0x67,
    "{2}{3}{4}{5}{6}{7}{8}{9} Thinking of Resuming Puzzle {0}: {1} - " + RpTotalsLL,
    RpPuzzleNumber,
    RpCategory,
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpCompleted,
    RpTotalHours,
    RpTotalMinutes,
    RpTotalSeconds
)

rich_presence_conditional_display(
    PuzzleState == 0x69 || PuzzleState == 0x6a,
    "Removing a Profile in Word Searcher."
)

rich_presence_conditional_display(
    PuzzleState == 0x15 && TotalMinutes < 10 && TotalSeconds < 10,
    "{2}{3}{4}{5}{6}{7}{8}{9} Playing Puzzle {0}: {1} - " + RpTotals00,
    RpPuzzleNumber,
    RpCategory,
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpCompleted,
    RpTotalHours,
    RpTotalMinutes,
    RpTotalSeconds
)

rich_presence_conditional_display(
    PuzzleState == 0x15 && TotalMinutes < 10,
    "{2}{3}{4}{5}{6}{7}{8}{9} Playing Puzzle {0}: {1} - " + RpTotals0L,
    RpPuzzleNumber,
    RpCategory,
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpCompleted,
    RpTotalHours,
    RpTotalMinutes,
    RpTotalSeconds
)

rich_presence_conditional_display(
    PuzzleState == 0x15 && TotalSeconds < 10,
    "{2}{3}{4}{5}{6}{7}{8}{9} Playing Puzzle {0}: {1} - " + RpTotalsL0,
    RpPuzzleNumber,
    RpCategory,
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpCompleted,
    RpTotalHours,
    RpTotalMinutes,
    RpTotalSeconds
)

rich_presence_conditional_display(
    PuzzleState == 0x15,
    "{2}{3}{4}{5}{6}{7}{8}{9} Playing Puzzle {0}: {1} - " + RpTotalsLL,
    RpPuzzleNumber,
    RpCategory,
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpCompleted,
    RpTotalHours,
    RpTotalMinutes,
    RpTotalSeconds
)

rich_presence_display(
    "Welcome to Word Searcher."
)
