// Bomberman Max: Ain Version [Subset - Max Charabom Levels]
// #ID = 23793


SaveVerify = byte(0xa000) == 0x43
ActiveCharabomId = byte(0xa011)
CharabomCount = byte(0xa012)
Music = byte(0xc000)
World = low4(0xc2d0)
Level = byte(0xc2d1)
BombLevel = low4(0xc2f3)
FireLevel = low4(0xc2f4)
SpedLevel = low4(0xc2f5)
Lives = byte(0xc2f7)
TimeMinutes = low4(0xc300)
TimeSeconds = byte(0xc301)
GoalStatus = byte(0xc62c)
Success = GoalStatus == 1
Retrying = GoalStatus == 255

ActiveCharabomUnl = byte(0xa110 + (ActiveCharabomId * 8))
ActiveCharabomLvl = byte(0xa112 + (ActiveCharabomId * 8))
ActiveCharabomAtk = byte(0xa113 + (ActiveCharabomId * 8))
ActiveCharabomDef = byte(0xa114 + (ActiveCharabomId * 8))
ActiveCharabomSpe = byte(0xa115 + (ActiveCharabomId * 8))

CheevoData = [
    ["Draco", 10, 60],
    ["Shell", 10, 60],
    ["Pommy", 10, 60],
    ["Elephan", 10, 60],
    ["Seadran", 10, 60],
    ["Marine Eel", 10, 60],
    ["Knuckle Pommy", 10, 60],
    ["Panther Fang", 10, 60],
    ["Twin Dragon", 10, 60],
    ["Sea Balloon", 10, 60],
    ["Beast Pommy", 10, 60],
    ["Big Ox", 10, 60],
    ["Puteladon", 10, 60],
    ["Sharkin", 10, 60],
    ["Hammer Pommy", 10, 60],
    ["Unicornos", 10, 60],
    ["Iron Dragon", 10, 60],
    ["Iron Squid", 10, 60],
    ["Animal Pommy", 10, 60],
    ["Mecha Kong", 10, 60],
    ["Aqua Dragon", 25, 70],
    ["Pommy Dragon", 25, 70],
    ["Thunder Kong", 25, 70],
    ["Thunder Shark", 25, 70],
    ["Rock Snakey", 25, 70],
    ["Fire Force", 25, 70],
    ["Shardra", 25, 85],
    ["Ox Battra", 25, 85],
    ["Heat Rock", 25, 85],
    ["Oct Kong", 25, 85],
]

function MaxLevelCheevo(id) {
    data = CheevoData[id]
    name = data[0]
    points = data[1]
    level = data[2]
    maxStat = level * 3
    base = 0xa110 + (id * 8)
    attack = byte(base + 3)
    defense = byte(base + 4)
    special = byte(base + 5)
    achievement(
        title = format("Maxed {0}", name),
        points = points,
        description = format("Raise {0} to its maximum level.", name),
        trigger = SaveVerify && Music >= 0x81 && Music <= 0x85 &&
            ActiveCharabomId == prev(ActiveCharabomId) &&
            ActiveCharabomId == id &&
            byte(base) == 1 &&
            prev(attack) + prev(defense) + prev(special) == maxStat - 1 &&
            measured(attack + defense + special == maxStat)
    )
}

for i in range(0, 29) {
    MaxLevelCheevo(i)
}

// RP

function LastSong(val) => Music == val || prior(Music) == val

EmojiTime = "⏲️"
EmojiBot = "🤖"
EmojiBomb = "💣"
EmojiRang = "💥"
EmojiFire = "🔥"
EmojiElec = "⚡"
EmojiAqua = "⛆"
EmojiRock = "🌏"
EmojiAtk = "⚔️"
EmojiDef = "🛡️"
EmojiSpe = "⭐"

CharabomName = {
    0: "Draco",
    1: "Shell",
    2: "Pommy",
    3: "Elephan",
    4: "Seadran",
    5: "Marine Eel",
    6: "Knuckle Pommy",
    7: "Panther Fang",
    8: "Twin Dragon",
    9: "Sea Balloon",
    10: "Beast Pommy",
    11: "Big Ox",
    12: "Puteladon",
    13: "Sharkin",
    14: "Hammer Pommy",
    15: "Unicornos",
    16: "Iron Dragon",
    17: "Iron Squid",
    18: "Animal Pommy",
    19: "Mecha Kong",
    20: "Aqua Dragon",
    21: "Pommy Dragon",
    22: "Thunder Kong",
    23: "Thunder Shark",
    24: "Rock Snakey",
    25: "Fire Force",
    26: "Shardra",
    27: "Ox Battra",
    28: "Heat Rock",
    29: "Oct Kong"
}

CharabomElem = {
    0: EmojiFire,
    1: EmojiAqua,
    2: EmojiElec,
    3: EmojiRock,
    4: EmojiFire,
    5: EmojiAqua,
    6: EmojiElec,
    7: EmojiRock,
    8: EmojiFire,
    9: EmojiAqua,
    10: EmojiElec,
    11: EmojiRock,
    12: EmojiFire,
    13: EmojiAqua,
    14: EmojiElec,
    15: EmojiRock,
    16: EmojiFire,
    17: EmojiAqua,
    18: EmojiElec,
    19: EmojiRock,
    20: (EmojiAqua + EmojiFire),
    21: (EmojiFire + EmojiElec),
    22: (EmojiElec + EmojiRock),
    23: (EmojiAqua + EmojiElec),
    24: (EmojiAqua + EmojiRock),
    25: (EmojiRock + EmojiFire),
    26: (EmojiFire + EmojiAqua + EmojiElec),
    27: (EmojiFire + EmojiRock + EmojiElec),
    28: (EmojiFire + EmojiAqua + EmojiRock),
    29: (EmojiAqua + EmojiRock + EmojiElec)
}

WorldLookup = {
    0: "1",
    1: "2",
    2: "3",
    3: "4",
    4: "5"
}

TwoDigit1 = {
    0: "01",
    1: "02",
    2: "03",
    3: "04",
    4: "05",
    5: "06",
    6: "07",
    7: "08",
    8: "09",
    9: "10",
    10: "11",
    11: "12",
    12: "13",
    13: "14",
    14: "15",
    15: "16",
    16: "17",
    17: "18",
    18: "19",
    19: "20",
    20: "21",
    21: "22",
    22: "23",
    23: "24"
}

RpWorld = rich_presence_lookup("World", World, WorldLookup, "X")
RpLevel = rich_presence_lookup("Level", Level, TwoDigit1, "YY")
RpCharabomName = rich_presence_lookup(
    "CharaName", ActiveCharabomId, CharabomName, "POOOOOX!"
)

rich_presence_conditional_display(
    byte(0xc4e3) == 1,
    "Enjoying the tunes without the stress of Charaboms or Ain."
)

rich_presence_conditional_display(
    World == 0xe,
    "The day is saved thanks to Product Placement!"
)

rich_presence_conditional_display(
    LastSong(0x8c),
    "Selecting a stage like selecting an Ain pen."
)

rich_presence_conditional_display(
    LastSong(0x8d),
    "Learning the objective for stage S{0}-{1}",
    RpWorld,
    RpLevel
)

rich_presence_conditional_display(
    LastSong(0x9e),
    "World {0} Cleared! Celebrate with pens.",
    RpWorld
)

rich_presence_conditional_display(
    LastSong(0x88),
    "Welcome to Bomberman MAX Product Placement edition."
)

rich_presence_conditional_display(
    LastSong(0x14) || LastSong(0x94),
    "Plot dump? Go buy some Ain pens."
)

rich_presence_conditional_display(
    LastSong(0xff) || LastSong(0x00),
    "Booting up the product placement."
)

rich_presence_conditional_display(
    Lives == 0 || LastSong(0x98) || LastSong(0x90),
    "Game Over!"
)

rich_presence_conditional_display(
    CharabomCount == 0,
    "S{0}-{1} {2}{3} {4}{5} {6}{7} {8}{9} w/no Charaboms",
    RpWorld,
    RpLevel,
    EmojiTime,
    rich_presence_value("Seconds", TimeMinutes * 60 + TimeSeconds, "SECS"),
    EmojiBot,
    rich_presence_macro("Number", Lives - 1),
    EmojiBomb,
    rich_presence_macro("Number", BombLevel),
    EmojiRang,
    rich_presence_macro("Number", FireLevel)
)

rich_presence_conditional_display(
    Success && LastSong(0x8e),
    "Leaving S{0}-{1} {2}{3} {4}{5} {6}{7} {8}{9}",
    RpWorld,
    RpLevel,
    EmojiTime,
    rich_presence_value("Seconds", TimeMinutes * 60 + TimeSeconds, "SECS"),
    EmojiBot,
    rich_presence_macro("Number", Lives - 1),
    EmojiBomb,
    rich_presence_macro("Number", BombLevel),
    EmojiRang,
    rich_presence_macro("Number", FireLevel)
)

rich_presence_conditional_display(
    Retrying,
    "Retrying S{0}-{1} {2}{3} {4}{5} {6}{7} {8}{9}",
    RpWorld,
    RpLevel,
    EmojiTime,
    rich_presence_value("Seconds", TimeMinutes * 60 + TimeSeconds, "SECS"),
    EmojiBot,
    rich_presence_macro("Number", Lives - 1),
    EmojiBomb,
    rich_presence_macro("Number", BombLevel),
    EmojiRang,
    rich_presence_macro("Number", FireLevel)
)

rich_presence_display(
    "S{0}-{1} {2}{3} {4}{5} {6}{7} {8}{9} raising {10}{11} Lv {12} {13}{14} {15}{16} {17}{18}",
    RpWorld,
    RpLevel,
    EmojiTime,
    rich_presence_value("Seconds", TimeMinutes * 60 + TimeSeconds, "SECS"),
    EmojiBot,
    rich_presence_macro("Number", Lives - 1),
    EmojiBomb,
    rich_presence_macro("Number", BombLevel),
    EmojiRang,
    rich_presence_macro("Number", FireLevel),
    RpCharabomName,
    rich_presence_lookup("CharaElem", ActiveCharabomId, CharabomElem, "FAKE"),
    rich_presence_macro("Number", ActiveCharabomLvl),
    EmojiAtk,
    rich_presence_macro("Number", ActiveCharabomAtk),
    EmojiDef,
    rich_presence_macro("Number", ActiveCharabomDef),
    EmojiSpe,
    rich_presence_macro("Number", ActiveCharabomSpe)
)
