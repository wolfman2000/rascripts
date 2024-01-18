// 5-in-1 Solitaire
// #ID = 21510

// Setup

LangBit = bit1(0xc62f30)
VersionA40 = LangBit * 0xa40
VersionA40I = ~LangBit * 0xa40
VersionA50I = ~LangBit * 0xa50
VersionA80 = LangBit * 0xa80
VersionA80I = ~LangBit * 0xa80
VersionA90 = LangBit * 0xa90
VersionA90I = ~LangBit * 0xa90

GolfLoopStacks = dword(0x86586c + VersionA40I)
SpiderSuitCount = dword(0x86595c + VersionA40I)
KlondikeDrawCards = dword(0x8657e8 + VersionA40I)
GapsRandom = dword(0x865880 + VersionA40I)
GapsShufflesLeft = dword(0x865958 + VersionA40I)

KlondikeTimedGame = dword(0x865808 + VersionA40I)
FreecellTimedGame = dword(0x865818 + VersionA40I)
SpiderTimedGame = dword(0x865828 + VersionA40I)
GolfTimedGame = dword(0x865838 + VersionA40I)
GapsTimedGame = dword(0x865848 + VersionA40I)

TimeSeconds = dword(0x865954 + VersionA40I)
TimeMinutes = dword(0x865950 + VersionA40I)
TimeHours = dword(0x86594c + VersionA40I)

TimeTotalSeconds = TimeHours * 3600 + TimeMinutes * 60 + TimeSeconds

GolfUndoStack = dword(0x8659d8 + VersionA40I)
SpiderUndoStack = dword(0x867f54 + VersionA90I)
KlondikeUndoStack = dword(0x865ca0 + VersionA50I)
FreecellUndoStack = dword(0x85c3bc + VersionA40I)
GapsUndoStack = dword(0x85c560 + VersionA40I)

LoadedGame = low4(0xc638dc + VersionA80I)

Score = dword(0x867cf4 + VersionA90I)
MoveCount = dword(0x867cf8 + VersionA90I)
GameOver = dword(0x866f50 + VersionA90I) == 1
WonGame = dword(0x866f4c + VersionA90I) == 1 && prev(dword(0x866f4c + VersionA90I)) == 0

// Achievements

achievement(
    title = "Golf Victory",
    points = 5,
    description = "Win a game of Golf.",
    trigger = LoadedGame == 0 && MoveCount != 0 && WonGame
)

achievement(
    title = "Golf Hard Victory",
    points = 10,
    description = "Win a game of Golf -- without looping stacks.",
    trigger = LoadedGame == 0 && MoveCount != 0 && GolfLoopStacks == 0 && WonGame
)

achievement(
    title = "Golf Clean Victory",
    points = 10,
    description = "Win a game of Golf without undoing a single time.",
    trigger = never(LoadedGame != 0) &&
        never(GameOver) &&
        never(GolfUndoStack < prev(GolfUndoStack)) &&
        once(MoveCount == 1 && prev(MoveCount) == 0) &&
        trigger_when(WonGame)
)

achievement(
    title = "Spider Victory",
    points = 3,
    description = "Win a game of Spider.",
    trigger = LoadedGame == 1 && MoveCount != 0 && WonGame
)

achievement(
    title = "Spider Medium Victory",
    points = 5,
    description = "Win a game of Spider without using just one suit.",
    trigger = LoadedGame == 1 && SpiderSuitCount > 1 && MoveCount != 0 && WonGame
)

achievement(
    title = "Spider Hard Victory",
    points = 10,
    description = "Win a game of Spider using all four suits.",
    trigger = LoadedGame == 1 && SpiderSuitCount == 4 && MoveCount != 0 && WonGame
)

achievement(
    title = "Spider Clean Victory",
    points = 10,
    description = "Win a game of Spider with at least two suits, but without undoing a single time.",
    trigger = never(LoadedGame != 1) &&
        never(GameOver) &&
        never(SpiderUndoStack < prev(SpiderUndoStack)) &&
        never(SpiderSuitCount <= 1) &&
        once(MoveCount == 1 && prev(MoveCount) == 0) &&
        trigger_when(WonGame)
)

achievement(
    title = "Klondike Victory",
    points = 5,
    description = "Win a game of Klondike.",
    trigger = LoadedGame == 2 && MoveCount != 0 && WonGame
)

achievement(
    title = "Klondike Hard Victory",
    points = 10,
    description = "Win a game of Klondike while drawing three cards at a time.",
    trigger = LoadedGame == 2 && KlondikeDrawCards == 1 && MoveCount != 0 && WonGame
)

achievement(
    title = "Klondike Clean Victory",
    points = 10,
    description = "Win a game of Klondike without undoing a single time.",
    trigger = never(LoadedGame != 2) &&
        never(GameOver) &&
        never(KlondikeUndoStack < prev(KlondikeUndoStack)) &&
        once(MoveCount != 0 && prev(MoveCount) == 0) &&
        trigger_when(WonGame)
)

achievement(
    title = "Freecell Victory",
    points = 10,
    description = "Win a game of Freecell.",
    trigger = LoadedGame == 3 && MoveCount != 0 && WonGame
)

achievement(
    title = "Freecell Clean Victory",
    points = 10,
    description = "Win a game of Freecell without undoing a single time.",
    trigger = never(LoadedGame != 3) &&
        never(GameOver) &&
        never(FreecellUndoStack < prev(FreecellUndoStack)) &&
        once(MoveCount != 0 && prev(MoveCount) == 0) &&
        trigger_when(WonGame)
)

achievement(
    title = "Gaps Victory",
    points = 5,
    description = "Win a game of Gaps.",
    trigger = LoadedGame == 4 && MoveCount != 0 && WonGame
)

achievement(
    title = "Gaps Hard Victory",
    points = 10,
    description = "Win a game of Gaps while using the random shuffle option.",
    trigger = LoadedGame == 4 && GapsRandom == 1 && MoveCount != 0 && WonGame
)

achievement(
    title = "Gaps Clean Victory",
    points = 10,
    description = "Win a game of Gaps without undoing a single time.",
    trigger = never(LoadedGame != 4) &&
        never(GameOver) &&
        never(GapsUndoStack < prev(GapsUndoStack) && GapsShufflesLeft == prev(GapsShufflesLeft)) &&
        once(MoveCount == 1 && prev(MoveCount) == 0) &&
        trigger_when(WonGame)
)

// Leaderboards

leaderboard(
    title = "Golf Best Time - Loop Stacks Allowed",
    description = "Win Golf as fast as you can. You can loop stacks.",
    start = LoadedGame == 0 && MoveCount != 0 && WonGame &&
        GolfLoopStacks == 1 && GolfTimedGame == 1,
    cancel = always_false(),
    submit = always_true(),
    value = TimeTotalSeconds,
    lower_is_better = true,
    format = "SECS"
)

leaderboard(
    title = "Golf Best Time - Loop Stacks Banned",
    description = "Win Golf as fast as you can. You cannot loop stacks.",
    start = LoadedGame == 0 && MoveCount != 0 && WonGame &&
        GolfLoopStacks == 0 && GolfTimedGame == 1,
    cancel = always_false(),
    submit = always_true(),
    value = TimeTotalSeconds,
    lower_is_better = true,
    format = "SECS"
)

leaderboard(
    title = "Spider Best Time - 1 Suit",
    description = "Win Spider as fast as you can with 1 suit.",
    start = LoadedGame == 1 && MoveCount != 0 && WonGame &&
        SpiderSuitCount == 1 && SpiderTimedGame == 1,
    cancel = always_false(),
    submit = always_true(),
    value = TimeTotalSeconds,
    lower_is_better = true,
    format = "SECS"
)

leaderboard(
    title = "Spider Best Time - 2 Suits",
    description = "Win Spider as fast as you can with 2 suits.",
    start = LoadedGame == 1 && MoveCount != 0 && WonGame &&
        SpiderSuitCount == 2 && SpiderTimedGame == 1,
    cancel = always_false(),
    submit = always_true(),
    value = TimeTotalSeconds,
    lower_is_better = true,
    format = "SECS"
)

leaderboard(
    title = "Spider Best Time - 4 Suits",
    description = "Win Spider as fast as you can with 4 suits.",
    start = LoadedGame == 1 && MoveCount != 0 && WonGame &&
        SpiderSuitCount == 4 && SpiderTimedGame == 1,
    cancel = always_false(),
    submit = always_true(),
    value = TimeTotalSeconds,
    lower_is_better = true,
    format = "SECS"
)

leaderboard(
    title = "Klondike Best Time - 1 Card Draw",
    description = "Win Klondike as fast as you can with 1 card draw.",
    start = LoadedGame == 2 && MoveCount != 0 && WonGame &&
        KlondikeDrawCards == 0 && KlondikeTimedGame == 1,
    cancel = always_false(),
    submit = always_true(),
    value = TimeTotalSeconds,
    lower_is_better = true,
    format = "SECS"
)

leaderboard(
    title = "Klondike Best Time - 3 Card Draw",
    id = 72429,
    description = "Win Klondike as fast as you can with 3 card draw.",
    start = LoadedGame == 2 && MoveCount != 0 && WonGame &&
        KlondikeDrawCards == 1 && KlondikeTimedGame == 1,
    cancel = always_false(),
    submit = always_true(),
    value = TimeTotalSeconds,
    lower_is_better = true,
    format = "SECS"
)

leaderboard(
    title = "Freecell Best Time",
    description = "Win Freecell as fast as you can. Good luck.",
    start = LoadedGame == 3 && MoveCount != 0 && WonGame && FreecellTimedGame == 1,
    cancel = always_false(),
    submit = always_true(),
    value = TimeTotalSeconds,
    lower_is_better = true,
    format = "SECS"
)

leaderboard(
    title = "Gaps Best Time - Random Shuffle Off",
    description = "Win Gaps as fast as you can. Random shuffle is disabled here.",
    start = LoadedGame == 4 && MoveCount != 0 && WonGame &&
        GapsRandom == 0 && GapsTimedGame == 1,
    cancel = always_false(),
    submit = always_true(),
    value = TimeTotalSeconds,
    lower_is_better = true,
    format = "SECS"
)

leaderboard(
    title = "Gaps Best Time - Random Shuffle On",
    description = "Win Gaps as fast as you can. Random shuffle is enabled here.",
    start = LoadedGame == 4 && MoveCount != 0 && WonGame &&
        GapsRandom == 1 && GapsTimedGame == 1,
    cancel = always_false(),
    submit = always_true(),
    value = TimeTotalSeconds,
    lower_is_better = true,
    format = "SECS"
)

// RP

GameLookup = {
    0: "Golf",
    1: "Spider",
    2: "Klondike",
    3: "Freecell",
    4: "Gaps",
    5: "Options"
}

EmojiScore = "💯"
EmojiMoves = "🗒️"
EmojiTimer = "⏲️"
RpGame = rich_presence_lookup("Game", LoadedGame, GameLookup)
RpMove = rich_presence_macro("Number", MoveCount)
RpScore = rich_presence_macro("Number", Score)
RpScoreNeg = rich_presence_macro("Number", ~Score + 1)

rich_presence_conditional_display(
    LoadedGame == 5,
    "Adjusting the Solitaire decks."
)

rich_presence_conditional_display(
    GameOver,
    "Bad shuffle on {0} {1}{2}",
    RpGame,
    EmojiMoves,
    RpMove
)

rich_presence_conditional_display(
    MoveCount == 0,
    "About to play {0}",
    RpGame
)

rich_presence_conditional_display(
    MoveCount > 0xffff0000,
    "Deciding what to play."
)

rich_presence_display(
    "Playing {0} {1}{2} {3}{4}",
    RpGame,
    EmojiMoves,
    RpMove,
    EmojiScore,
    RpScore
)
