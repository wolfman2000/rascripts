// ~Homebrew~ Minesweeper
// #ID = 22414

Flags = byte(0x9)
YouWon = byte(0xc) == 1 && prev(byte(0xc)) == 0
Winner = byte(0xc) == 1

GameState = byte(0x3fa)
StartedGame = prev(GameState) == 0x17 && GameState == 0x20
StartedSmall = StartedGame && Flags == 10 && prev(Flags) == 0
StartedMedium = StartedGame && Flags == 40 && prev(Flags) == 0
StartedLarge = StartedGame && Flags == 99 && prev(Flags) == 0
ReturnedToTitle = prev(GameState) != 0x11 && GameState == 0x11

// cheevos

achievement(
    title = "You Come To Me As Beginners",
    description = "Clear the small board.",
    points = 2,
    trigger = once(StartedSmall) &&
        YouWon && never(ReturnedToTitle)
)

achievement(
    title = "When I'm Through With You...",
    description = "Clear the medium board.",
    points = 5,
    trigger = once(StartedMedium) &&
        YouWon && never(ReturnedToTitle)
)

achievement(
    title = "You'll Be Experts",
    description = "Clear the large board.",
    points = 10,
    trigger = once(StartedLarge) &&
        YouWon && never(ReturnedToTitle)
)

achievement(
    title = "Careful! There's Mines Under There!",
    description = "Clear the small board without using flags.",
    points = 3,
    trigger = once(StartedSmall) &&
        trigger_when(YouWon) && never(ReturnedToTitle) && never(Flags < prev(Flags))
)

achievement(
    title = "Calm Down: It's Never The First One",
    description = "Clear the medium board without using flags.",
    points = 10,
    trigger = once(StartedMedium) &&
        trigger_when(YouWon) && never(ReturnedToTitle) && never(Flags < prev(Flags))
)

achievement(
    title = "Anybody Wanna Play Hearts?",
    description = "Clear the large board without using flags.",
    points = 25,
    trigger = once(StartedLarge) &&
        trigger_when(YouWon) && never(ReturnedToTitle) && never(Flags < prev(Flags))
)

// leaderboards

leaderboard(
    title = "Small Board RTA",
    description = "Solve as fast as you can!",
    start = StartedSmall,
    cancel = ReturnedToTitle,
    submit = YouWon,
    value = always_true(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    title = "Medium Board RTA",
    description = "Solve as fast as you can!",
    start = StartedMedium,
    cancel = ReturnedToTitle,
    submit = YouWon,
    value = always_true(),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    title = "Large Board RTA",
    description = "Solve as fast as you can!",
    start = StartedLarge,
    cancel = ReturnedToTitle,
    submit = YouWon,
    value = always_true(),
    format = "FRAMES",
    lower_is_better = true
)

// rich presence

UiSizeLookup = {
    0: "Small",
    1: "Medium",
    2: "Large"
}

rich_presence_conditional_display(
    once(StartedSmall) && Winner && never(ReturnedToTitle),
    "Mines were swept on the small board."
)

rich_presence_conditional_display(
    once(StartedMedium) && Winner && never(ReturnedToTitle),
    "Mines were swept on the medium board."
)

rich_presence_conditional_display(
    once(StartedLarge) && Winner && never(ReturnedToTitle),
    "Mines were swept on the large board."
)

rich_presence_conditional_display(
    once(StartedSmall) && never(ReturnedToTitle),
    "Sweeping Mines on the small board."
)

rich_presence_conditional_display(
    once(StartedMedium) && never(ReturnedToTitle),
    "Sweeping Mines on the medium board."
)

rich_presence_conditional_display(
    once(StartedLarge) && never(ReturnedToTitle),
    "Sweeping Mines on the large board."
)

rich_presence_conditional_display(
    GameState == 0x17,
    "Shuffling the mines around..."
)

rich_presence_conditional_display(
    GameState == 0x14,
    "Selecting a board size: thinking {0}.",
    rich_presence_lookup("Size", low4(0x3f2), UiSizeLookup)
)

rich_presence_display(
    "You are here to sweep mines!"
)
