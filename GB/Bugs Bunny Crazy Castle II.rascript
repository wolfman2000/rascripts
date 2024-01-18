// Bugs Bunny Crazy Castle II
// #ID = 688

MusicIdFull = word(0xc181)
MusicId = byte(0xc182)
StageId = byte(0xc380)
Lives = byte(0xc399)
Keys = byte(0xc3b8)

function ActiveMusic(val) {
    return MusicId == val || (MusicId == 0 && prior(MusicId) == val)
}

function BeatLevel(stage) {
    fallback = MusicIdFull == 0x7efc &&
        prev(MusicId) != 0x7e && prev(MusicId) != 0x7f
    if (stage == 28) {
        fallback = prev(MusicIdFull) == 0 && MusicIdFull == 0x7c80
    }
    return StageId == stage && fallback
        
}

GameOverMusic = MusicIdFull >= 0x67c2 && MusicIdFull <= 0x67db
TitleScreenMusic = MusicIdFull >= 0x68a9 && MusicIdFull <= 0x68d0

// Cheevos

TwoLevelData = [
    [0, "Rhapsody Rabbit", 5],
    [2, "8 Ball Bunny", 5],
    [4, "Gorilla My Dreams", 5],
    [6, "High Diving Hare", 5],
    [8, "Wabbit Twouble", 5],
    [10, "Falling Hare", 5],
    [12, "Rabbit Hood", 5],
    [14, "Hare Conditioned", 10],
    [16, "Acrobatty Bunny", 10],
    [18, "Baseball Bugs", 10],
    [20, "Herr Meets Hare", 10],
    [22, "Haredevil Hare", 10],
    [24, "Hair-Raising Hare", 10],
    [26, "What's Opera, Doc?", 10]
]

function BeatTwoLevelsCheevo(i) {
    achievement(
        title = i[1],
        points = i[2],
        description = format(
            "Beat levels {0} and {1} in a row without returning to the title screen.",
            i[0] + 1,
            i[0] + 2
        ),
        trigger = once(BeatLevel(i[0])) && once(BeatLevel(i[0] + 1)) &&
            never(GameOverMusic) &&
            never(TitleScreenMusic)
    )
}

for i in TwoLevelData {
    BeatTwoLevelsCheevo(i)
}

function BeatFourLevelsCheevo(i) {
    achievement(
        title = "Test " + i,
        points = 5,
        description = format("Beat levels {0} - {1} in a row.", i + 1, i + 4),
        trigger = once(BeatLevel(i)) && once(BeatLevel(i + 1)) &&
            once(BeatLevel(i + 2)) && once(BeatLevel(i + 3)) &&
            never(MusicId == 0x67) && never(MusicId == 0x68)
    )
}

function BeatSingleLevelCheevo(i) {
    achievement(
        title = "Test " + i,
        points = 5,
        description = format("Beat level {0}.", i + 1),
        trigger = Lives != 0 && BeatLevel(i)
    )
}

achievement(
    title = "Transylvania 6-5000",
    points = 10,
    description = "Defeat the witch and rescue your sweethart. (Must beat levels 27 & 28 first)",
    trigger = once(BeatLevel(26)) && once(BeatLevel(27)) && once(BeatLevel(28)) &&
        never(GameOverMusic) &&
            never(TitleScreenMusic)
)

// Leaderboards

for i in range(0, 27) {
    leaderboard(
        title = format("Stage {0} Time Attack", i + 1),
        description = "Clear as fast as you can.",
        start = StageId == i &&
            prev(MusicId) >= 0x7d && prev(MusicId) <= 0x7e &&
            MusicId != 0x7d && MusicId != 0x7e,
        cancel = MusicId == 0x76 || StageId != i ||
            (GameOverMusic) || TitleScreenMusic,
        submit = BeatLevel(i),
        value = always_true(),
        format = "FRAMES",
        lower_is_better = true
    )
}

// RP

PassLookup = {
    0: "A",
    1: "B",
    2: "C",
    3: "D",
    4: "E",
    5: "F",
    6: "G",
    7: "H",
    8: "I",
    9: "J",
    10: "K",
    11: "L",
    12: "M",
    13: "N",
    14: "O",
    15: "P",
    16: "Q",
    17: "R",
    18: "S",
    19: "T",
    20: "U",
    21: "V",
    22: "W",
    23: "X",
    24: "Y",
    25: "Z"
}

Bow = "🏹"
Bomb = "💣"

WeaponLookup = {
    0: Bow,
    1: Bomb,
    2: Bow,
    3: Bomb,
    4: Bow,
    5: Bomb,
    6: Bow,
    7: Bomb,
    8: Bow,
    9: Bomb,
    10: Bow,
    11: Bomb,
    12: Bow,
    13: Bomb,
    14: Bow,
    15: Bomb,
    16: Bow,
    17: Bomb,
    18: Bow,
    19: Bomb,
    20: Bow,
    21: Bomb,
    22: Bow,
    23: Bomb,
    24: Bow,
    25: Bomb,
    26: Bow,
    27: Bomb,
    28: Bow,
}

EmojiBunny = "🐰"
EmojiKey = "🔑"

RpStage = rich_presence_macro("Number", StageId + 1)
RpLives = rich_presence_macro("Number", Lives)
RpPass1 = rich_presence_lookup("Pass", byte(0xc3a6), PassLookup)
RpPass2 = rich_presence_lookup("Pass", byte(0xc3a7), PassLookup)
RpPass3 = rich_presence_lookup("Pass", byte(0xc3a8), PassLookup)
RpPass4 = rich_presence_lookup("Pass", byte(0xc3a9), PassLookup)
RpWeapon = rich_presence_lookup("Weapon", StageId, WeaponLookup)

rich_presence_conditional_display(
    MusicId == 0x61,
    "Bugs is hoping that {0}{1}{2}{3} is a good password.",
    RpPass1,
    RpPass2,
    RpPass3,
    RpPass4
)

rich_presence_conditional_display(
    StageId == 28 && once(prev(MusicIdFull) == 0 && MusicIdFull == 0x7c80),
    "Bugs has rescued the fair maiden from the Crazy Castle."
)

rich_presence_conditional_display(
    MusicId == 0x67,
    "Bugs is kicked out of the Crazy Castle."
)

rich_presence_conditional_display(
    MusicId >= 0x70 && MusicId <= 0x71,
    "Bugs is entering the Crazy Castle."
)

rich_presence_conditional_display(
    MusicId >= 0x7d && MusicId <= 0x7e,
    "Bugs is about to enter Stage {0} {1}{2}",
    RpStage,
    EmojiBunny,
    RpLives
)

rich_presence_conditional_display(
    MusicId == 0x68,
    "Welcome to the Crazy Castle. Again."
)

rich_presence_conditional_display(
    ActiveMusic(0x7f) || MusicId == 0x69 || (MusicId == 0x7e && byte(0xc181) >= 0xfc),
    "Bugs has finished Stage {0} {1}{2}",
    RpStage,
    EmojiBunny,
    RpLives
)

rich_presence_display(
    "Bugs is currently in Stage {0} {1}{2} {3}{4} {5}{6}",
    RpStage,
    EmojiBunny,
    RpLives,
    EmojiKey,
    rich_presence_macro("Number", Keys),
    RpWeapon,
    rich_presence_macro("Number", byte(0xc3cd))
)
