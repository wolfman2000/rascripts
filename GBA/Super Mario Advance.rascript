// Super Mario Advance
// #ID = 505



// Memory

LivesCount = byte(0x1161)

PressedStart = bit3(0x117a) > prev(bit3(0x117a))
PressedA = bit0(0x117a) > prev(bit0(0x117a))

GlobalGame = byte(0x19b0)
LocalGame = byte(0x19b1)

TitleScreen = GlobalGame != 3 && GlobalGame != 4
SMB2 = GlobalGame == 3 && LocalGame == 0
MBC = GlobalGame == 4 && LocalGame == 1

Warping = byte(0x19ae)
BossClear = byte(0x19bc)

Smb2Stage = byte(0x1a2e)
Smb2Pause = byte(0x1a63)

AceCoinCount = bitcount(0x1c35)
EggCount = bitcount(0x1c37)
MushroomCount = byte(0x1c77)
CharId = low4(0x1c70)
Hawkeye = byte(0x1c9f)

MbcStage = byte(0x1dfc)

ActiveClearTracker = byte(0x1148 + CharId)

MusicIdFull = word(0x6ec0)

LevelShortLookup = {
    0: "1-1",
    1: "1-2",
    2: "1-3",
    3: "2-1",
    4: "2-2",
    5: "2-3",
    6: "3-1",
    7: "3-2",
    8: "3-3",
    9: "4-1",
    10: "4-2",
    11: "4-3",
    12: "5-1",
    13: "5-2",
    14: "5-3",
    15: "6-1",
    16: "6-2",
    17: "6-3",
    18: "7-1",
    19: "7-2"
}

LevelNameLookup = {
    0x00: "Stage 1-1",
    0x01: "Stage 1-2",
    0x02: "Stage 1-3",
    0x03: "Stage 2-1",
    0x04: "Stage 2-2",
    0x05: "Stage 2-3",
    0x06: "Stage 3-1",
    0x07: "Stage 3-2",
    0x08: "Stage 3-3",
    0x09: "Stage 4-1",
    0x0a: "Stage 4-2",
    0x0b: "Stage 4-3",
    0x0c: "Stage 5-1",
    0x0d: "Stage 5-2",
    0x0e: "Stage 5-3",
    0x0f: "Stage 6-1",
    0x10: "Stage 6-2",
    0x11: "Stage 6-3",
    0x12: "Stage 7-1",
    0x13: "Stage 7-2",
    0x1d: "Yoshi Egg Challenges?",
    0x30: "File Select",
    0xff: "Mario Bros Classic",
}

PlayerLookup = {
    0: "Mario",
    1: "Peach",
    2: "Toad",
    3: "Luigi"
}

PlayerFullLookup = {
    0: "Mario",
    1: "Princess Peach",
    2: "Toad",
    3: "Luigi"
}

// Dependent Functions

function BeatStage(stage) {
    fallback = Hawkeye == 2
    if stage % 3 == 2 || stage == 19 { // Boss at the end of x-3
        fallback = prev(BossClear) == 0xb4 && BossClear == 0x64
    }
    return fallback
}

// Cheevos

WorldCheevos = [
    [1, "Mouser", 2, "Grassland? Check.", 5],
    [2, "Triclyde", 5, "Desert? Also Check.", 5],
    [3, "Robirdo", 8, "Forest? Half Check.", 5],
    [4, "Fryguy", 11, "Jungle? Too Soon.", 5],
    [5, "Clawgrip", 14, "Ice World? Too Late.", 5],
    [6, "Mouser (Again?)", 17, "Fire World? Close Enough.", 5],
    [7, "Wart", 19, "Boss! But Of Course.", 10]
]

for i in WorldCheevos {
    achievement(
        title = i[3],
        points = i[4],
        description = format("Defeat {1} of World {0}.", i[0], i[1]),
        trigger = SMB2 && Smb2Stage == i[2] && BeatStage(i[2])
    )
}

WarpCheevos = [
    [2, "I Forgot My Winter Coat"],
    [6, "I Forgot My Safari Gear"],
    [10, "I Forgot My Sunscreen"],
    [14, "I Forgot My Vegetable Basket"]
    
]

for i in WarpCheevos {
    achievement(
        title = i[1],
        points = 5,
        description = format("Find the warp path in Stage {0}.", LevelShortLookup[i[0]]),
        trigger = SMB2 && Smb2Stage == i[0] &&
            LivesCount == prev(LivesCount) &&
            MusicIdFull == 0xa6f0 && prev(MusicIdFull) == 0xac68
    )
}

MushroomCheevos = [
    [0, "Wild Mushroom Galette", 3],
    [1, "Rigatoni with Mushroom Sauce", 3],
    [2, "Hungarian Mushroom Soup", 3],
    [3, "Lentil Soup with Quinoa and Mushrooms", 3],
    [4, "Coconut Curry Ramen", 3],
    [5, "Sautéed Mushrooms", 3],
    [6, "Spinach Mushroom Strata", 3],
    [7, "Creamy Mushroom Sauce", 3],
    [8, "Philly Cheese Steak Skillet", 3],
    [9, "Wild Mushroom Chowder with Leeks", 2],
    [10, "Creamy Brussels Sprouts w/Wild Mushrooms", 3],
    [11, "Vegetable Pot Pie", 3],
    [12, "Mushroom Stew", 3],
    [13, "Coconut Chicken Soup", 3],
    [14, "Wine Braised Beef with Mushrooms", 3],
    [15, "4 Cheese and Mushroom Rolled Lasagna", 3],
    [16, "Coq au Vin", 2],
    [17, "Veal with Mushroom Cream Sauce", 3],
    [18, "Wild Mushroom Risotto", 3],
    [19, "Pecan Stuffed Mushroom", 3]
]

for i in MushroomCheevos {
    achievement(
        title = i[1],
        points = 5,
        description = format(
            "Get all health mushrooms in Stage {0} and complete the stage.",
            LevelShortLookup[i[0]]
        ),
        trigger = measured(
            MushroomCount == i[2],
            when = SMB2 && Smb2Stage == i[0]
        ) && BeatStage(i[0])
    )
}

AceCheevos = [
    [0, "Just Getting Warmed Up"],
    [1, "Magic Carpet Ride"],
    [2, "A Squeaky Mouse"],
    [3, "The Sandy Search"],
    [4, "Sunny Skies, Shy Guys"],
    [5, "Tri The Desert at Night"],
    [6, "Salmon Coin Search"],
    [7, "Underground Search"],
    [8, "Tower Climb"],
    [9, "Slip Sliding Away"],
    [10, "A Whale of a Good Time"],
    [11, "Hot Search"],
    [12, "Topsy Turvy Search"],
    [13, "In the Jungle"],
    [14, "Crab Walk"],
    [15, "Quickly Grab Them!"],
    [16, "Night Flight"],
    [17, "Tri Under the Wall"],
    [18, "Sky High Search"],
    [19, "A Search is only Skin Deep"]
]

for i in AceCheevos {
    achievement(
        title = i[1],
        points = 5,
        description = format(
            "Get all 5 Ace Coins in Stage {0} and complete the stage.",
            LevelShortLookup[i[0]]
        ),
        trigger = measured(
            AceCoinCount == 5,
            when = SMB2 && Smb2Stage == i[0]
        ) && BeatStage(i[0])
    )
}

EggCheevos = [
    [0, "Over Easy"],
    [1, "Sunny Side Down"],
    [2, "Hard Boiled"],
    [3, "Eggs Poached"],
    [4, "Over Medium"],
    [5, "Shirred"],
    [6, "Steamed"],
    [7, "Scrambled"],
    [8, "Sunny Side Up"],
    [9, "Over Hard"],
    [10, "in a Frittata"],
    [11, "Fried"],
    [12, "in a Basket"],
    [13, "in a Quiche"],
    [14, "Curried"],
    [15, "Soft Boiled"],
    [16, "Baked"],
    [17, "Deviled"],
    [18, "in an Omelette"],
    [19, "in an Egg Salad"]
]

for i in EggCheevos {
    achievement(
        title = "I Want My Eggs " + i[1],
        points = 10,
        description = format(
            "Get both Yoshi Eggs in Stage {0} and complete the stage.",
            LevelShortLookup[i[0]]
        ),
        trigger = measured(
            EggCount == 2,
            when = SMB2 && Smb2Stage == i[0]
        ) && BeatStage(i[0])
    )
}

StageCheevos = [
    "Hero of the Day",
    "Float To Success",
    "A Fungus Amongus",
    "Green Mario"
]

for i in PlayerLookup {
    achievement(
        id = 12436 + i,
        title = StageCheevos[i],
        points = 5,
        description = format("Complete a stage as {0}.", PlayerFullLookup[i]),
        trigger = SMB2 && CharId == i && ActiveClearTracker > prev(ActiveClearTracker)
    )
}

Smb2StartGame = Smb2Stage == 0 && prev(Smb2Stage) == 255

SingleCheevos = [
    "Hero of the Year",
    "Floated to New Heights",
    "Fungus Victorious",
    "Green Mario Saves the Day"
]

function FullGameCheevo(i) {
    others = always_true()
    for j in range(0, 3) {
        if (i != j) {
            others = others && byte(0x1148 + j) == 0
        }
    }
    achievement(
        id = 12440 + i,
        title = SingleCheevos[i],
        points = 10,
        description = format("Complete the game using only {0}.", PlayerFullLookup[i]),
        trigger = SMB2 && byte(0x1148 + i) != 0 &&
            trigger_when(Smb2Stage == 0x13 && BeatStage(0x13)) &&
            others
    )
}

for i in PlayerLookup {
    FullGameCheevo(i)
}

achievement(
    title = "All Just a Dream", points = 25,
    description = "Complete the game without dying (no save/quit or try again allowed).",
    id = 12444, badge = "12237", published = "9/4/2014 2:54:45 PM", modified = "11/20/2022 7:45:44 PM",
    trigger = once(Smb2StartGame) &&
        never(!SMB2) &&
        never(LivesCount < prev(LivesCount)) &&
        never(Smb2Pause >= 2 && PressedA) &&
        never(Smb2Pause >= 2 && PressedStart) &&
        trigger_when(Smb2Stage == 0x13) &&
        trigger_when(BeatStage(0x13))
)

achievement(
    title = "All Just a REALLY BAD Dream", points = 50,
    description = "Complete the game without dying or warping (no save/quit or try again allowed).",
    id = 12445, badge = "12238", published = "9/4/2014 2:54:48 PM", modified = "11/20/2022 7:45:44 PM",
    trigger = once(Smb2StartGame) &&
        never(!SMB2) &&
        never(LivesCount < prev(LivesCount)) &&
        never(Smb2Pause >= 2 && PressedA) &&
        never(Smb2Pause >= 2 && PressedStart) &&
        never(Warping == 1) &&
        trigger_when(Smb2Stage == 0x13) &&
        trigger_when(BeatStage(0x13))
)

MbcPhaseCheevos = [
    ["Give Me Five", 1, "Complete", 5, 5],
    ["Hang Ten!", 5, "Complete", 10, 10],
    ["Twenty is Plenty", 10, "Complete", 20, 20],
    ["Thirty is the New Twenty", 10, "Complete", 30, 30],
    ["Over the Hill!", 10, "Complete", 40, 40],
    ["Fifty is so Spiffy!", 25, "Complete", 50, 50],
    ["Are you a Wizard?!", 50, "Reach", 99, 98]
]

for i in MbcPhaseCheevos {
    achievement(
        title = i[0],
        points = i[1],
        description = format(
            "{0} Phase {1} of Mario Bros. Classic.",
            i[2],
            i[3]
        ),
        trigger = MBC && prev(MbcStage) == i[4] && MbcStage == i[4] + 1
    )
}

// Rich Presence

EmojiLives = "🚶"

RpLivesCount = rich_presence_macro("Number", LivesCount)

rich_presence_conditional_display(
    TitleScreen,
    "So...which game in this mini-collection?"
)

rich_presence_conditional_display(
    MBC && MbcStage == 0,
    "Thinking of playing some Mario Bros. Classic."
)

rich_presence_conditional_display(
    MBC,
    "Mario Bros. Classic, Stage {0}, {1} {2} & Score {3}",
    rich_presence_macro("Number", MbcStage),
    EmojiLives,
    rich_presence_macro("Number", byte(0x1e35)),
    rich_presence_macro("Number", dword(0x1e10))
)

rich_presence_conditional_display(
    SMB2 && byte(0x7fa) == 0x45,
    "And it was all a dream...or was it?"
)

rich_presence_conditional_display(
    Smb2Stage == 0xff,
    "{0} is about to start the journey through subcon.",
    rich_presence_lookup("Char", byte(0x1e01), PlayerLookup)
)

rich_presence_display("{2} in {0}, {1} {4} & Score {3}",
    rich_presence_lookup("LevelName", byte(0x001A2E), LevelNameLookup),
    EmojiLives,
    rich_presence_lookup("Char", CharId, PlayerLookup),
    rich_presence_macro("Number", word(0x114c) * 10),
    RpLivesCount
)
