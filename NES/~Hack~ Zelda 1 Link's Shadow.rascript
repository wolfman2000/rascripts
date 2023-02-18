// ~Hack~ Legend of Zelda, The: Link's Shadow
// #ID = 15967

function PickedUpItem(address) => address > prev(address)

World = low4(0x10)
GameState = byte(0x12)
MainGame = (GameState >= 0x02 && GameState <= 0x0d) || GameState == 0x10

ActiveSaveSlot = low4(0x16)

CurrentScreen = byte(0xeb)
OverworldReturnSlot = byte(0x526)

Npc01 = byte(0x350)

ActiveSong = byte(0x609)

SlotBase = 0x62d
DeathCountBase = 0x630
ZeroDeaths = byte(DeathCountBase + ActiveSaveSlot) == 0

ActiveQuest = byte(SlotBase + ActiveSaveSlot)
Quest1 = ActiveQuest == 0
Quest2 = ActiveQuest == 1

Sword = low4(0x657)
Arrow = low4(0x659)
Bow = low4(0x65a)
Lamp = low4(0x65b)
Ocarina = low4(0x65c)
IceRod = low4(0x65f)

Raft = low4(0x660)
ScrollFire = low4(0x661)
Tunic = low4(0x662)
Ladder = low4(0x663)
ShadowKey = low4(0x664)
GoronBracelet = low4(0x665)
Permit = low4(0x666)

Compass1 = bitcount(0x667)
Map1 = bitcount(0x668)
Compass9 = bitcount(0x669)
Map9 = bitcount(0x66a)

Rupees = byte(0x66d)

HeartContainers = high4(0x66f)

CrystalBase = 0x671

Boomerang = low4(0x674)
BoomerangGale = low4(0x675)
HylianShield = low4(0x676)

QuestLookup = {
    0: "1st",
    1: "2nd"
}

DungeonInfo = { // Dungeon Name, points, screen with crystal, overworld return screen
    0: ["Deku Tree", 5, 0x22, 0x3e],
    1: ["Dodongo's Cavern", 5, 0x1d, 0x0d],
    2: ["Deep Pond Temple", 5, 0x65, 0x0f],
    3: ["Palace of Gold", 5, 0x63, 0x71],
    4: ["Woodland Temple", 10, 0x33, 0x3c],
    5: ["Bloody Temple", 10, 0x07, 0x08],
    6: ["Temple of the Hidden Falls", 10, 0x0d, 0x45],
    7: ["Forbidden Palace", 10, 0x38, 0x00],
    8: ["Shadow Temple", 10, 0x71, 0x7f],
    10: ["Temple of Darkness", 10, 0x08, 0x3c],
    11: ["Narrow Catacombs", 10, 0x46, 0x0d],
    12: ["Temple of the Frozen Shores", 10, 0x1a, 0x72],
    13: ["Palace of Gold 2", 10, 0x00, 0x71],
    14: ["The Farland Temple", 10, 0x4f, 0x01],
    15: ["The Fire Temple", 10, 0x53, 0x6f],
    16: ["Temple of the Hidden Falls 2", 10, 0x2f, 0x45],
    17: ["Desert Temple", 10, 0x0f, 0x00],
    18: ["Shadow Temple 2", 10, 0xff, 0x7f]
}

IllegalReset = tbyte(0x62d) == 0 && dword(0x650) == 0 && word(0x654) == 0

IllegalCore1 = byte(0x62d) == 1 && high4(0x650) >= 8
IllegalCore2 = byte(0x62e) == 1 && high4(0x652) >= 8
IllegalCore3 = byte(0x62f) == 1 && high4(0x654) >= 8
IllegalCoreA = ActiveQuest == 1 && HeartContainers >= 8

IllegalFile1 = disable_when(IllegalCore1, until=IllegalReset)
IllegalFile2 = disable_when(IllegalCore2, until=IllegalReset)
IllegalFile3 = disable_when(IllegalCore3, until=IllegalReset)
IllegalFileA = disable_when(IllegalCoreA, until=IllegalReset)

// Cheat Protection

Protection = IllegalFile1 && IllegalFile2 && IllegalFile3 && IllegalFileA

// Cheevos

function CrystalEndCheevo(quest, dungeon) {
    index = quest * 10 + dungeon
    info = DungeonInfo[index]
    if (info[3] != 0xff) {
    achievement(
        title = format("{0} Clear", info[0]),
        points = info[1],
        description = format(
            "Collect the crystal at the end of Map {0} on the {1} Quest.",
            dungeon + 1,
            QuestLookup[quest]
        ),
        trigger = Protection && ActiveQuest == quest && World == dungeon + 1 &&
            // OverworldReturnSlot == info[3] &&
            CurrentScreen == info[2] &&
            bit(dungeon, CrystalBase) > prev(bit(dungeon, CrystalBase))
    )
    }
}

for i in range(0, 1) {
    for j in range(0, 7) {
        CrystalEndCheevo(i, j)
    }
}

OverworldInfo = {
    0x2e: ["Only You Can Prevent Forest Fires", 5, "Lamp", Lamp > prev(Lamp)],
    0x18: ["Purchasing Swords Is Bazaar", 5, "Sword", Sword == 1 && prev(Sword) == 0]
}

function OverworldCheevo(quest, screen) {
    index = quest * 0x100 + screen
    info = OverworldInfo[index]
    achievement(
        title = info[0],
        points = info[1],
        description = format(
            "Collect the {0} on the {1} Quest.",
            info[2],
            QuestLookup[quest]
        ),
        trigger = Protection && Quest1 && World == 0 && ActiveSong == 0 && info[3]
    )
}

for i in OverworldInfo {
    quest = 0
    screen = i
    if i > 0x100 {
        quest = 1
        screen = screen - 0x100
    }
    OverworldCheevo(quest, screen)
}

// Freebie Item Cheevos

function GeneralItemCheevo(title, points, item, quest, world, screen, ret, misc) {
    RetReturn = OverworldReturnSlot == ret
    if world == 0 {
        RetReturn = always_true()
    }
    achievement(
        title = title,
        points = points,
        description = format("Collect the {0} on the {1} Quest.", item, QuestLookup[quest]),
        trigger = Protection &&
            ActiveQuest == quest && World == world && CurrentScreen == screen &&
            misc
    )
}

GeneralItemData = [
    ["May Your Aim Be True", 5, "Bow", 0, 1, 0x21, 0x3e,
    PickedUpItem(Bow)],
    ["No Sumo Wrestling This Time", 5, "Goron Bracelet", 0, 2, 0x7e, 0x0d,
    PickedUpItem(GoronBracelet) && ActiveSong == 0x40],
    ["Let The Music Flow", 5, "Ocarina", 0, 3, 0x27, 0x0f,
        PickedUpItem(Ocarina) && ActiveSong == 0x40
    ],
    [
        "I Mean, It's In The Way...", 5, "Boomerang", 0, 3, 0x37, 0x0f,
        PickedUpItem(Boomerang) && ActiveSong == 0x40
    ],
    ["You Are Permitted To Have 5 Points", 5, "Permit", 0, 0, 0x65, 1,
        PickedUpItem(Permit)
    ],
    [
        "Knight Of The Wind", 5, "Gale Boomerang", 0, 4, 0x50, 0x71,
        PickedUpItem(BoomerangGale)
    ],
    ["Phoenix Wright vs. Maya Fey", 5, "Ladder", 0, 4, 0x13, 0x71,
    PickedUpItem(Ladder)],
    ["But Don't Talk About The Club", 5, "Knight's Sword", 0, 0, 0x2e, 1,
    Sword == 2 && prev(Sword) < 2],
    ["Waterfall Climb Ability Not Included", 5, "Zora Tunic", 0, 0, 0x75, 0,
    Tunic == 1 && prev(Tunic) != 1],
    ["Time To Chill", 5, "Ice Rod", 0, 5, 0x04, 0x3c, PickedUpItem(IceRod)],
    ["So An Icy Hot Patch In Projectile Form?", 5, "Scroll of Icy Fire", 0, 6, 0x1e, 0x08,
    PickedUpItem(ScrollFire)],
    ["Please Don't Cause Any Forest Fires", 5, "Super Lamp", 0, 8, 0x67, 0x00,
    Lamp == 2 && prev(Lamp) < 2],
    ["Alright, Who Got A Chuckle Out Of This?", 5, "Raft", 0, 8, 0x29, 0x00,
    PickedUpItem(Raft)],
    ["That Belongs In The Sacred Grove!", 10, "Master Sword", 0, 0, 0x2f, 0,
    Sword == 3 && prev(Sword) < 3],
    ["This Is Not The ψ-Blade",
    10, "Shadow Key", 0, 7, 0x1c, 0x45, PickedUpItem(ShadowKey)],
    ["There Are No Heat Rooms In This Game", 10, "Goron Tunic", 0, 9, 0x25, 0x7f,
        Tunic == 2 && prev(Tunic) < 2
    ],
    ["Kingdom Hearts...Is Light!", 10, "Light Arrows", 0, 9, 0x02, 0x7f,
    Arrow == 2 && prev(Arrow) < 2],
    ["Slow Burn", 10, "Lamp", 1, 1, 0x36, 0x3c, Lamp == 1 && prev(Lamp) == 0],
    ["Not In The Way, But Definitely Wanted", 10, "Boomerang", 1, 2, 0x35, 0x0d,
    PickedUpItem(Boomerang) && ActiveSong == 0x40],
    ["Powered By Darkness And Anger", 10, "Goron Bracelet", 1, 2, 0x56, 0x0d,
        PickedUpItem(GoronBracelet) && ActiveSong == 0x40
    ],
    [
        "More Angry Than Happy", 10, "Sword", 1, 3, 0x4b, 0x72,
        Sword == 1 && prev(Sword) == 0
    ],
    [
        "Game Boy Weaknesses Need Not Apply", 10, "Ocarina", 1, 3, 0x5b, 0x72,
        PickedUpItem(Ocarina)
    ],
    [
        "To Whom Again?", 10, "Permit", 1, 0, 0x65, 0xff, PickedUpItem(Permit)
    ],
    [
        "This Is SO Not Worth The Lag", 10, "Gale Boomerang", 1, 4, 0x40, 0xff,
        PickedUpItem(BoomerangGale)
    ],
    [
        "Aiming Frustrations At The Set Creator", 10, "Bow", 1, 5, 0x2e, 0x01,
        PickedUpItem(Bow)
    ],
    [
        "Apollo Justice vs. Athena Cykes", 10, "Ladder", 1, 5, 0x3e, 0x01,
        PickedUpItem(Ladder)
    ],
    [
        "Seemingly Necessary Protection", 10, "Zora Tunic", 1, 0, 0x75, 0xff,
        Tunic == 1 && prev(Tunic) != 1
    ],
    [
        "Maybe This Time There Will Be Order?", 10, "Raft", 1, 6, 0x41, 0x6f,
        PickedUpItem(Raft)
    ],
    [
        "Magic Meter Need Not Apply", 10, "Ice Rod", 1, 6, 0x4e, 0x6f,
        PickedUpItem(IceRod)
    ],
    [
        "Could Have Used This Two Dungeons Ago", 10, "Knight's Sword", 1, 7, 0x67, 0x45,
        Sword == 2 && prev(Sword) < 2
    ],
    [
        "WORST! Prerequisite For Sub-Par Item! EVER!", 25, "Scroll of Icy Fire", 1, 7,
        0x57, 0x45, PickedUpItem(ScrollFire)
    ],
    [
        "What Is Left To Burn?", 10, "Super Lamp", 1, 8, 0x5e, 0x00,
        Lamp == 2 && prev(Lamp) != 2
    ],
    [
        "Riku Knows A Thing Or Two", 10, "Shadow Key", 1, 8, 0x17, 0x00,
        PickedUpItem(ShadowKey)
    ],
    [
        "I'm Surprised This Still Exists", 10, "Goron Tunic", 1, 9, 0x61, 0x7f,
        Tunic == 2 && prev(Tunic) != 2
    ],
    [
        "Light At The End Of The Tunnel", 10, "Light Arrows", 1, 9, 0x74, 0x7f,
        Arrow == 2 && prev(Arrow) < 2
    ]
]

for i in GeneralItemData {
    GeneralItemCheevo(i[0], i[1], i[2], i[3], i[4], i[5], i[6], i[7])
}

achievement(
    title = "Selective Fireball Protection",
    points = 5,
    description = "Purchase a Hylian Shield.",
    trigger = Protection && 
        Rupees >= 160 && World == 0 && Npc01 == 0x77 && PickedUpItem(HylianShield)
)

WorldOffset = {
    0: 0,
    1: 1,
    2: 1,
    3: 1,
    4: 1,
    5: 1,
    6: 1,
    7: 2,
    8: 2,
    9: 2
}

Hc1Data = [
    [0, 0x01],
    [0, 0x12],
    [0, 0x42],
    [0, 0x69],
    [0, 0x6d],
    [1, 0x32],
    [2, 0x2d],
    [3, 0x75],
    [4, 0x62],
    [5, 0x44],
    [6, 0x07],
    [7, 0x07],
    [8, 0x3d]
]

function LocationToRam(world, screen) {
    return 0x67f + (WorldOffset[world] * 0x80) + screen
}

achievement(
    title = "Full Of Heart And Hope [m]",
    points = 10,
    description = "Collect every heart container on the 1st Quest.",
    trigger = Protection && prev(HeartContainers) == 14 &&
        measured(1 + HeartContainers == 16, when=Quest1) &&
        any_of(Hc1Data, h => World == h[0] && CurrentScreen == h[1] &&
            bit4(LocationToRam(h[0], h[1])) >
            prev(bit4(LocationToRam(h[0], h[1])))
        )
)

D1Data = [
    [1, 0x55],
    [1, 0x52],
    [2, 0x4d],
    [2, 0x4f],
    [3, 0x68],
    [3, 0x69],
    [4, 0x71],
    [4, 0x40],
    [5, 0x56],
    [5, 0x25],
    [6, 0x5a],
    [6, 0x29],
    [7, 0x5d],
    [7, 0x4b],
    [8, 0x26],
    [8, 0x28],
    [9, 0x42],
    [9, 0x22]
]

achievement(
    title = "Navigating The Shadow Realm",
    points = 10,
    description = "Collect every map and compass on the 1st Quest.",
    trigger = Protection && 
        prev(Compass1) + prev(Compass9) + prev(Map1) + prev(Map9) == 17 &&
        measured(Compass1 + Compass9 + Map1 + Map9 == 18, when=Quest1) &&
        any_of(D1Data, d => World == d[0] && CurrentScreen == d[1] &&
            bit4(LocationToRam(d[0], d[1])) > prev(bit4(LocationToRam(d[0], d[1])))
        )
)

R1Data = [
    0x02,
    0x06,
    0x0b,
    0x0c,
    0x0e,
    0x22,
    0x25,
    0x33,
    0x3d,
    0x40,
    0x44,
    0x48,
    0x4a,
    0x50,
    0x54,
    0x58,
    0x59,
    0x5d,
    0x60,
    0x66,
    0x68,
    0x78
]

achievement(
    title = "Stupid 8-bit Limitations",
    points = 10,
    description = "Collect every moblin traitor rupee stash on the 1st Quest.",
    trigger = Protection && 
        World == 0 && sum_of(R1Data, r => prev(bit4(LocationToRam(0, r)))) == 21 &&
        measured(
            sum_of(R1Data, r => bit4(LocationToRam(0, r))) == 22, when=Quest1
        ) &&
        any_of(R1Data, r => CurrentScreen == r && bit4(LocationToRam(0, r)) > prev(bit4(LocationToRam(0, r))))
)

achievement(
    title = "So Who Was Helping Me This Entire Time?",
    points = 10,
    description = "Rescue Zelda on the 1st Quest.",
    trigger = Protection && Quest1 && World == 9 && CurrentScreen == 0x71 &&
        OverworldReturnSlot == 0x7f && prev(ActiveSong) == 0x20 && ActiveSong == 0x06
)

achievement(
    title = "Reflection Without Death [m]",
    points = 25,
    description = "Beat the 1st Quest without taking any deaths.",
    trigger = Protection && Quest1 && ZeroDeaths && MainGame &&
        trigger_when(World == 9 && CurrentScreen == 0x71 &&
        OverworldReturnSlot == 0x7f && prev(ActiveSong) == 0x20 && ActiveSong == 0x06)
)

Hc2Data = [
    [0, 0x12],
    [0, 0x39],
    [0, 0x42],
    [0, 0x47],
    [0, 0x69],
]

achievement(
    title = "Not As Full As I'd Like [m]",
    points = 10,
    description = "Collect every heart container on the 2nd Quest.",
    trigger = Protection && prev(HeartContainers) == 6 &&
        measured(1 + HeartContainers == 8, when=Quest2) &&
        any_of(Hc2Data, h => World == h[0] && CurrentScreen == h[1] &&
            bit4(LocationToRam(h[0], h[1])) >
            prev(bit4(LocationToRam(h[0], h[1])))
        )
)

D2Data = [
    [1, 0x66],
    [1, 0x48],
    [2, 0x65],
    [2, 0x45],
    [3, 0x2a],
    [3, 0x0a],
    [4, 0x60],
    [4, 0x50],
    [5, 0x6c],
    [5, 0x3c],
    [6, 0x64],
    [6, 0x34],
    [7, 0x1b],
    [7, 0x39],
    [8, 0x6e],
    [8, 0x6d],
    [9, 0x32],
    [9, 0x22]
]

achievement(
    title = "Navigating Is More Painful Than Expected",
    points = 10,
    description = "Collect every map and compass on the 2nd Quest.",
    trigger = Protection && 
        prev(Compass1) + prev(Compass9) + prev(Map1) + prev(Map9) == 17 &&
        measured(Compass1 + Compass9 + Map1 + Map9 == 18, when=Quest2) &&
        any_of(D2Data, d => World == d[0] && CurrentScreen == d[1] &&
            bit4(LocationToRam(d[0], d[1])) > prev(bit4(LocationToRam(d[0], d[1])))
        )
)

R2Data = [
    0x02,
    0x06,
    0x0b,
    0x0c,
    0x0e,
    0x18,
    0x22,
    0x25,
    0x28,
    0x2f,
    0x33,
    0x37,
    0x3d,
    0x40,
    0x44,
    0x48,
    0x4a,
    0x50,
    0x54,
    0x59,
    0x5d,
    0x60,
    0x66,
    0x68,
    0x6a,
    0x78
]

achievement(
    title = "Someone Hack In A Wallet Upgrade",
    points = 10,
    description = "Collect every moblin traitor rupee stash on the 2nd Quest.",
    trigger = Protection && 
        World == 0 && sum_of(R2Data, r => prev(bit4(LocationToRam(0, r)))) == 25 &&
        measured(
            sum_of(R2Data, r => bit4(LocationToRam(0, r))) == 26, when=Quest2
        ) &&
        any_of(R2Data, r => CurrentScreen == r && bit4(LocationToRam(0, r)) > prev(bit4(LocationToRam(0, r))))
)

achievement(
    title = "Alright, Second Quest Was Evil This Time",
    points = 25,
    description = "Rescue Zelda on the 2nd Quest.",
    trigger = Protection && Quest2 && World == 9 && CurrentScreen == 0x13 &&
        OverworldReturnSlot == 0x7f && prev(ActiveSong) == 0x20 && ActiveSong == 0x06
)

achievement(
    title = "One With Your Shadow [m]",
    points = 50,
    description = "Beat the 2nd Quest without taking any deaths.",
    trigger = Protection && Quest2 && ZeroDeaths && MainGame &&
        trigger_when(World == 9 && CurrentScreen == 0x13 &&
        OverworldReturnSlot == 0x7f && prev(ActiveSong) == 0x20 && ActiveSong == 0x06)
)

// Rich Presence

RpLetter = {
    0x0a: "A",
    0x0b: "B",
    0x0c: "C",
    0x0d: "D",
    0x0e: "E",
    0x0f: "F",
    0x10: "G",
    0x11: "H",
    0x12: "I",
    0x13: "J",
    0x14: "K",
    0x15: "L",
    0x16: "M",
    0x17: "N",
    0x18: "O",
    0x19: "P",
    0x1a: "Q",
    0x1b: "R",
    0x1c: "S",
    0x1d: "T",
    0x1e: "U",
    0x1f: "V",
    0x20: "W",
    0x21: "X",
    0x22: "Y",
    0x23: "Z",
    0x62: "-",
    0x63: ".",
    0x28: ",",
    0x29: "!",
    0x2a: "'",
    0x2b: "&",
    0x2c: ".",
    0x00: "0",
    0x01: "1",
    0x02: "2",
    0x03: "3",
    0x04: "4",
    0x05: "5",
    0x06: "6",
    0x07: "7",
    0x08: "8",
    0x09: "9",
    0x24: " "
}

RpHeartMax = {
    0: "16",
    1: "8"
}

RpDungeonLookup = {
    1: "Deku Tree",
    2: "Dodongo's Cavern",
    3: "Deep Pond Temple",
    4: "Palace of Gold",
    5: "Woodland Temple",
    6: "Bloody Temple",
    7: "Temple of the Hidden Falls",
    8: "Forbidden Palace",
    9: "Shadow Temple",
    11: "Temple of Darkness",
    12: "Narrow Catacombs",
    13: "Temple of the Frozen Shores",
    14: "Palace of Gold",
    15: "Farland Temple",
    16: "Fire Temple",
    17: "Temple of the Hidden Falls",
    18: "Desert Temple",
    19: "Shadow Temple"
}

RpEmojiSkull = "💀"
RpEmojiHeart = "❤️"
RpEmojiCrystal = "💎"

RpChar1 = rich_presence_lookup("Char", byte(0x638 + (ActiveSaveSlot * 8)), RpLetter, "")
RpChar2 = rich_presence_lookup("Char", byte(0x639 + (ActiveSaveSlot * 8)), RpLetter, "")
RpChar3 = rich_presence_lookup("Char", byte(0x63a + (ActiveSaveSlot * 8)), RpLetter, "")
RpChar4 = rich_presence_lookup("Char", byte(0x63b + (ActiveSaveSlot * 8)), RpLetter, "")
RpChar5 = rich_presence_lookup("Char", byte(0x63c + (ActiveSaveSlot * 8)), RpLetter, "")
RpChar6 = rich_presence_lookup("Char", byte(0x63d + (ActiveSaveSlot * 8)), RpLetter, "")
RpChar7 = rich_presence_lookup("Char", byte(0x63e + (ActiveSaveSlot * 8)), RpLetter, "")
RpChar8 = rich_presence_lookup("Char", byte(0x63f + (ActiveSaveSlot * 8)), RpLetter, "")
RpDeathCount = rich_presence_macro("Number", byte(DeathCountBase + ActiveSaveSlot))
RpHeartContainers = rich_presence_macro("Number", HeartContainers + 1)
RpMaxHC = rich_presence_lookup("MaxHC", ActiveQuest, RpHeartMax)
RpActiveQuest = rich_presence_macro("Number", ActiveQuest + 1)
RpCrystalCount = rich_presence_macro("Number", bitcount(CrystalBase))
RpWorld = rich_presence_lookup(
    "World", ActiveQuest * 10 + World, RpDungeonLookup, "the Overworld"
)

rich_presence_conditional_display(
    once(IllegalCore1) && never(IllegalReset),
    "Link's Shadow has corrupted your brain."
)

rich_presence_conditional_display(
    once(IllegalCore2) && never(IllegalReset),
    "Link's Shadow has corrupted your heart."
)

rich_presence_conditional_display(
    once(IllegalCore3) && never(IllegalReset),
    "Link's Shadow has corrupted your power."
)

rich_presence_conditional_display(
    once(IllegalCoreA) && never(IllegalReset),
    "Link's Shadow has corrupted your soul."
)

rich_presence_conditional_display(
    MainGame,
    "[Quest {8}] In {9} - {10}{11} {12}{13}/{14} {15}{16}/8",
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpActiveQuest,
    RpWorld,
    RpEmojiSkull,
    RpDeathCount,
    RpEmojiHeart,
    RpHeartContainers,
    RpMaxHC,
    RpEmojiCrystal,
    RpCrystalCount
)

rich_presence_conditional_display(
    GameState == 0x13,
    "Quest {8} Complete! - {10}{11} {12}{13}/{14} {15}{16}/8",
    RpChar1,
    RpChar2,
    RpChar3,
    RpChar4,
    RpChar5,
    RpChar6,
    RpChar7,
    RpChar8,
    RpActiveQuest,
    RpWorld,
    RpEmojiSkull,
    RpDeathCount,
    RpEmojiHeart,
    RpHeartContainers,
    RpMaxHC,
    RpEmojiCrystal,
    RpCrystalCount
)

rich_presence_conditional_display(
    GameState <= 0x01 || GameState == 0x0e || GameState == 0x0f,
    "Preparing to deal with Link's Shadow"
)

rich_presence_display("Learning of Link's Shadow")
