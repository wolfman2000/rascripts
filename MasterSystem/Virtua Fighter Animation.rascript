// Virtua Fighter Animation
// #ID = 10723

// Achievements

StoryMode = byte(0x806) == 0
Streak = byte(0x807)
PrevStreak = prev(Streak)
PlayerWin = byte(0x421)
PlayerHealth = byte(0x422)
CpuHealth = byte(0x432)

function StoryCheevo(streak, title, points) {
    achievement(
        title = title,
        points = points,
        description = format("Win the Act {0} battle in story mode.", streak + 1),
        trigger = StoryMode && PrevStreak == streak &&
            byte(0x420) >= 1 && byte(0x420) <= 7 &&
            prev(PlayerWin) == 1 &&
            PlayerWin == 2
    )
}

StoryCheevo(0, "No Potstickers For Me, Thanks", 5)
StoryCheevo(1, "Bounce With Me", 5)
StoryCheevo(2, "Better Than Pirate Scum?", 5)
StoryCheevo(3, "I'm Coming, I'm Coming, Sheesh!", 5)
StoryCheevo(4, "European Rematch", 5)
StoryCheevo(5, "Brainwashing Battle", 5)
StoryCheevo(6, "Confusing Logic Indeed", 5)
StoryCheevo(7, "The Ultimate Fight?", 10)

achievement(
    title = "Keep It In The Ring. Or Don't.",
    points = 5,
    description = "Win any match via ring-out.",
    trigger = PlayerHealth != 0 && CpuHealth != 0 && prev(PlayerWin) + 1 == PlayerWin &&
        byte(0x420) >= 1 && byte(0x420) <= 7 &&
        byte(0x430) >= 1 && byte(0x430) <= 8 &&
        __ornext(byte(0x1888) < 0x08 || byte(0x1888) > 0xf7)
)

achievement(
    title = "That Felt Easy",
    points = 10,
    description = "Knock your opponent down (not out) without losing any health.",
    trigger = prev(PlayerHealth) == 50 && PlayerHealth == 50 &&
        prev(CpuHealth) != 0 && CpuHealth == 0 &&
        byte(0x420) >= 1 && byte(0x420) <= 7 &&
        byte(0x430) >= 1 && byte(0x430) <= 8 &&
        prev(byte(0x1888)) >= 0x08 && prev(byte(0x1888)) <= 0xf7
)

FighterLookup = {
    0x01: "Akira",
    0x02: "Pai",
    0x03: "Sarah",
    0x04: "Jacky",
    0x05: "Kage",
    0x06: "Wolf",
    0x07: "Lau",
    0x08: "DURAL",
}

function CharacterCheevo(id, title) {
    target = always_true()
    for i in range(0, 7) {
        target = target &&
            once(PrevStreak == i && prev(PlayerWin) == 1 && PlayerWin == 2)
    }
    achievement(
        title = title,
        points = 10,
        description = format("Beat the game using just {0}.", FighterLookup[id]),
        trigger = never(byte(0x420) != id) &&
            never(Streak == 0 && prev(Streak) != 0) &&
            target
    )
}

for i in range(1, 7) {
    CharacterCheevo(i, "Victory With " + FighterLookup[i])
}

achievement(
    title = "Reach For The Stars",
    points = 25,
    description = "Beat the game (either mode) without using a continue.",
    trigger = never(byte(0x431) == 2) &&
        once(
            prev(Streak) == 0 &&
            PlayerHealth == 50 &&
            CpuHealth == 50 &&
            byte(0x431) == 0 &&
            byte(0x421) == 0 &&
            byte(0x409) == 30) &&
        trigger_when(prev(Streak) == 7 && prev(PlayerWin) == 1 && PlayerWin == 2)
)

// RP

rich_presence_conditional_display(
    byte(0x420) == 0 || byte(0x420) > 8 || byte(0x430) == 0 || byte(0x430) > 8,
    "No fighting yet, sorry."
)

rich_presence_conditional_display(
    StoryMode && Streak == 8,
    "The end of the story"
)

rich_presence_conditional_display(
    StoryMode,
    "Playing Act {0} of the story",
    rich_presence_macro("Number", byte(0x807) + 1)
)

rich_presence_display(
    "Time for 8-bit battles: {0} vs {1}",
    rich_presence_lookup("Fighter", byte(0x420), FighterLookup),
    rich_presence_lookup("Fighter", byte(0x430), FighterLookup)
)
