// ~Hack~ Zelda II: The Triforce Of Courage
// #ID = 24139

InGame = bit5(0x27) == 0

Lives = byte(0x700)
Deaths = byte(0x79f)

MapId = byte(0x706)
RoomId = byte(0x561)
LocationId = byte(0x76e)
SideViewId = byte(0x748)

function Room() => MapId * 0x100 + RoomId

ScreenLock = byte(0x728) > prev(byte(0x728))

ExpTarget = word_be(0x770)
ExpCurr = word_be(0x775)

PowAT = byte(0x777)
PowMP = byte(0x778)
PowHP = byte(0x779)

function CurrTotalPow() => PowAT + PowMP + PowHP
function PrevTotalPow() => prev(PowAT) + prev(PowMP) + prev(PowHP)

// Cheevos

achievement(
    title = "The First Of Many",
    points = 5,
    description = "Level up any stat of your choice.",
    trigger = InGame && PrevTotalPow() == 3 && CurrTotalPow() == 4
)

achievement(
    title = "Leveling For Din",
    points = 25,
    description = "Max your attack stat.",
    trigger = InGame && prev(PowAT) == 7 && PowAT == 8
)

achievement(
    title = "Leveling For Nayru",
    points = 25,
    description = "Max your magic stat.",
    trigger = InGame && prev(PowMP) == 7 && PowMP == 8
)

achievement(
    title = "Leveling For Farore",
    points = 25,
    description = "Max your health stat.",
    trigger = InGame && prev(PowHP) == 7 && PowHP == 8
)

SpellData = [
    ["Damnum Resistere", "Shield", 0, 0x24, 0x06, 0x2c, 0x77b],
    ["Salire Altiorem", "Jump", 0, 0x25, 0x06, 0x2e, 0x77c],
    ["Vulnera Sana", "Life", 0, 0x26, 0x06, 0x30, 0x77d],
    ["Mutare Pixie", "Fairy", 0, 0x27, 0x06, 0x32, 0x77e],
    ["Ignis Projecto", "Fire", 2, 0x28, 0x06, 0x2c, 0x77f],
    ["Cogita Auferet", "Reflect", 2, 0x29, 0x06, 0x2e, 0x780],
    ["Occulta Revelare", "Spell", 2, 0x2a, 0x06, 0x31, 0x781],
    ["Fulgur Inpulsa", "Thunder", 2, 0x2b, 0x06, 0x32, 0x782]
]

function LearnSpellCheevo(data) {
    achievement(
        title = data[0],
        points = 5,
        description = format("Learn the {0} spell.", data[1]),
        trigger = InGame && MapId == data[2] && RoomId == data[3] &&
            LocationId == data[4] && SideViewId == data[5] &&
            byte(data[6]) > prev(byte(data[6]))
    )
}

for i in SpellData {
    LearnSpellCheevo(i)
}

WestHyruleExp = [
    [1, 0x615, 0, 0x2b, 0x02, 0x02],
    [5, 0x617, 0, 0x2e, 0x02, 0x04]
]

ParapaPalaceExp = [
    [5, 0x683, 0, 0x06, 0x08, 0x34],
    [6, 0x685, 0, 0x0a, 0x08, 0x34],
    [2, 0x684, 0, 0x09, 0x08, 0x34]
]

DeathMtnExp = [
    [1, 0x622, 0, 0x05, 0x02, 0x08],
    [5, 0x624, 0, 0x08, 0x02, 0x0e],
    [6, 0x62d, 0, 0x1a, 0x02, 0x38]
]

MidoroPalaceExp = [
    [4, 0x68f, 0, 0x1e, 0x0a, 0x35],
    [2, 0x68a, 0, 0x15, 0x0a, 0x35],
    [1, 0x68d, 0, 0x1b, 0x0a, 0x35],
    [7, 0x690, 0, 0x20, 0x0a, 0x35]
]

IslandPalaceExp = [
    [1, 0x6a0, 0, 0x01, 0x12, 0x36],
    [5, 0x6a1, 0, 0x02, 0x12, 0x36],
    [5, 0x6a2, 0, 0x04, 0x12, 0x36],
    [2, 0x6a2, 0, 0x05, 0x12, 0x36],
    [1, 0x6a3, 0, 0x07, 0x12, 0x36],
    [5, 0x6a6, 0, 0x0c, 0x12, 0x36],
    [0, 0x6a6, 0, 0x0d, 0x12, 0x36]
]

EastHyruleExp = [
    [4, 0x645, 0, 0x0a, 0x04, 0x0d],
    [1, 0x650, 0, 0x21, 0x04, 0x17],
    [5, 0x656, 0, 0x2c, 0x04, 0x01],
    [4, 0x646, 0, 0x0c, 0x04, 0x0e],
    [2, 0x677, 0, 0x2f, 0x06, 0x31],
    [5, 0x65f, 0, 0x3e, 0x04, 0x1d],
    [5, 0x653, 0, 0x26, 0x04, 0x00]
]

DarkLinkExp = [
    [5, 0x625, 0, 0x0a, 0x04, 0x12]
]

MazePalaceExp = [
    [0, 0x6a9, 0, 0x13, 0x14, 0x34],
    [5, 0x6b0, 0, 0x20, 0x14, 0x34],
    [5, 0x6a8, 0, 0x10, 0x14, 0x34],
    [5, 0x6ad, 0, 0x1a, 0x14, 0x34]
]

WaterPalaceExp = [
    [5, 0x693, 0, 0x26, 0x16, 0x34],
    [2, 0x695, 0, 0x2b, 0x16, 0x34],
    [1, 0x697, 0, 0x2f, 0x16, 0x34],
    [7, 0x69b, 0, 0x36, 0x16, 0x34],
    [6, 0x69e, 0, 0x3c, 0x16, 0x34],
    // room next door had surprise Gooma?
    [1, 0x69c, 0, 0x39, 0x16, 0x34],
    [6, 0x69d, 0, 0x3a, 0x16, 0x34],
    [6, 0x69f, 0, 0x3e, 0x16, 0x34],
    [7, 0x697, 0, 0x2e, 0x16, 0x34],
    [2, 0x69a, 0, 0x35, 0x16, 0x34]
]

HiddenPalaceExp = [
    [5, 0x6b3, 0, 0x26, 0x18, 0x35],
    [1, 0x6b2, 0, 0x25, 0x18, 0x35],
    [1, 0x6b3, 0, 0x27, 0x18, 0x35],
    [3, 0x6b6, 0, 0x2d, 0x18, 0x35],
    [3, 0x6bb, 0, 0x37, 0x18, 0x35],
    [1, 0x6bd, 0, 0x3b, 0x18, 0x35],
    [6, 0x6b5, 0, 0x2a, 0x18, 0x35],
    [0, 0x6b7, 0, 0x2f, 0x18, 0x35],
    [5, 0x6b7, 0, 0x2e, 0x18, 0x35]
]

PBagPoints = [
    [0, "West Hyrule", WestHyruleExp, 0],
    [0, "Parapa Palace", ParapaPalaceExp, 1],
    [1, "Death Mountain", DeathMtnExp, 0],
    [0, "Midoro Palace", MidoroPalaceExp, 1],
    [0, "Island Palace", IslandPalaceExp, 1],
    [2, "East Hyrule", EastHyruleExp, 0],
    [1, "Dark Link Island", DarkLinkExp, 0],
    [1, "Maze Palace", MazePalaceExp, 1],
    [2, "Water Palace", WaterPalaceExp, 1],
    [2, "Hidden Palace", HiddenPalaceExp, 1]
]

function RupeeBagCheevo(data) {
    exp = data[2]
    sum = 0
    alts = []
    for i in exp {
        if (i[2] == 1) {
            sum = sum + bit(i[0], i[1])
        }
        else {
            sum = sum + ~bit(i[0], i[1])
        }
        cond = RoomId == i[3] && LocationId == i[4] && SideViewId == i[5] &&
            bit(i[0], i[1]) != prev(bit(i[0], i[1]))
        array_push(alts, cond)
    }
    
    baseTitle = format("Experienced in {0}", data[1])
    if (data[3] == 1) {
        baseTitle = baseTitle + " [m]"
    }
    
    achievement(
        title = baseTitle,
        points = 10,
        description = format("Collect every static rupee in {0}.", data[1]),
        trigger = InGame && MapId == data[0] && measured(sum == length(exp)) &&
            any_of(alts, s => s)
    )
}

for i in PBagPoints {
    RupeeBagCheevo(i)
}

ItemData = [
    [0, 7, 0x684, 0x08, 0x08, 0x34, "Well That's Different", "hammer", 5],
    [1, 0, 0x62a, 0x15, 0x02, 0x1c, "About Time: I Have Blisters Here!", "boots", 10],
    [0, 1, 0x606, 0x0d, 0x02, 0x0e, "So That's Why It's Not Dark", "candle", 5],
    [0, 7, 0x68a, 0x14, 0x0a, 0x35, "Push Them Not Pulverize Them", "power bracelet", 5],
    [0, 0, 0x6a5, 0x0b, 0x12, 0x36, "Sailing Away My Friends", "raft", 5],
    [2, 2, 0x796, 0x2d, 0x06, 0x2e, "Now To Break Bricks Like Mario", "up-thrust technique", 5],
    [1, 0, 0x6af, 0x1f, 0x14, 0x34, "The Book Of Mudora Was Better", "holy book", 5],
    [2, 3, 0x69e, 0x3d, 0x16, 0x34, "No Ocarina This Time", "flute (or recorder)", 5],
    [2, 4, 0x6b6, 0x2c, 0x18, 0x35, "Master Of Unlocking", "almighty key", 10]
]

function ItemCheevo(data) {
    address = bit(data[1], data[2])
    achievement(
        title = data[6],
        points = data[8],
        description = format("Obtain the {0}.", data[7]),
        trigger = InGame && MapId == data[0] &&
            address != prev(address) &&
            RoomId == data[3] && LocationId == data[4] && SideViewId == data[5]
    )
}

for i in ItemData {
    ItemCheevo(i)
}

CrystalData = [
    ["No Rappers Here", "Parapa", 0, 0x0d, 0x08, 0x34, 0x78d],
    ["At Least It's Not Called Silly", "Midoro", 0, 0x22, 0x0a, 0x35, 0x78e],
    ["No Sightings Of Gilligan", "Island", 0, 0x0e, 0x12, 0x36, 0x78f],
    ["More Maze Inside Than Out", "Maze", 1, 0x1c, 0x14, 0x34, 0x790],
    ["Can Oceans Be Contained?", "Water", 2, 0x29, 0x16, 0x34, 0x791],
    ["No Master Emerald, Sorry", "Hidden", 2, 0x3a, 0x18, 0x35, 0x792]
]

function CrystalCheevo(data) {
    achievement(
        title = data[0],
        points = 10,
        description = format("Place the crystal in {0} Palace.", data[1]),
        trigger = InGame && MapId == data[2] &&
            RoomId == data[3] && LocationId == data[4] && SideViewId == data[5] &&
            byte(data[6]) > prev(byte(data[6]))
    )
}

for i in CrystalData {
    CrystalCheevo(i)
}

DamagelessData = [
    ["No Horsing Around [m]", "Horsehead", "Parapa", 0, 0x0d, 0x08, 0x34, 0x78],
    ["No Helmets Necessary [m]", "Helmethead", "Midoro", 0, 0x22, 0x0a, 0x35, 0xd2],
    ["No Saddles Required [m]", "Rebonack", "Island", 0, 0x0e, 0x12, 0x36, 0xb4],
    ["No Bad Luck For Seven Years [m]", "Carock", "Maze", 1, 0x1c, 0x14, 0x34, 0x20],
    ["No Need For Maces [m]", "Gooma", "the end of Water", 2, 0x29, 0x16, 0x34, 0xff],
    ["No Halitosis Issues [m]", "Volvagia", "Hidden", 2, 0x3a, 0x18, 0x35, 0xff],
    ["No Resistances To Fighting Types", "Thunderbird", "Great", 2, 0x35, 0x0c, 0x36, 0xc0],
//    ["No Doubting Yourself", "Dark Link", "Great", 2, 0x36, 0x0c, 0x36, 0xf8],
]

function DamagelessCheevo(data) {
    achievement(
        title = data[0],
        points = 25,
        description = format(
            "Defeat {0} in {1} Palace without losing health.", data[1], data[2]
        ),
        trigger = 
            never(!InGame) &&
            never(MapId != data[3]) &&
            never(RoomId != data[4]) &&
            never(LocationId != data[5]) &&
            never(SideViewId != data[6]) &&
            never(Lives < prev(Lives)) &&
            never(byte(0x774) < prev(byte(0x774))) &&
            never(byte(0x3b) * 0x100 + byte(0x4d) > 0x1ef) &&
            once(byte(0xc7) == data[7] && prev(byte(0xc7)) == 0) &&
            once(ScreenLock) &&
            trigger_when(byte(0x793) > prev(byte(0x793))) &&
            trigger_when(once(prev(byte(0xc7)) == data[7] && byte(0xc7) != 0 &&
                byte(0xc7) < data[7]))
    )
}

for i in DamagelessData {
    DamagelessCheevo(i)
}

achievement(
    title = "[VOID] No Doubting Yourself",
    description = "Defeat Dark Link in Great Palace without losing health.",
    points = 50,
    trigger =
        never(!InGame) &&
        never(MapId != 2) &&
        never(RoomId != 0x36) &&
        never(LocationId != 0x0c) &&
        never(SideViewId != 0x36) &&
        never(Lives < prev(Lives)) &&
        never(byte(0x774) < prev(byte(0x774))) &&
        once(byte(0xc2) == 0x08 && prev(byte(0xc7)) == 0) &&
        once(ScreenLock) &&
        trigger_when(byte(0xeb) == 0x20) &&
        trigger_when(once(prev(byte(0xc2)) == 0x08 && byte(0xc2) != 0 && byte(0xc2) < 0x08))
)

achievement(
    title = "Shadows Be Gone!",
    description = "Defeat Dark Link in Great Palace and win the game.",
    points = 25,
    trigger =
        InGame && MapId == 2 && RoomId == 0x36 && LocationId == 0x0c &&
            SideViewId == 0x36 && byte(0xeb) == 0x20
)

achievement(
    title = "The Courage To Excel [m]",
    description = "Beat the game without a single game over.",
    points = 50,
    trigger =
        InGame && MapId == 2 && RoomId == 0x36 && LocationId == 0x0c &&
            SideViewId == 0x36 && byte(0xeb) == 0x20 && byte(0x79f) == 0
        
)

MagicContainerData = [
    [6, 0x632, 0, 1, 0x24, 0x02, 0x27],
    [0, 0x616, 0, 0, 0x2d, 0x02, 0x03],
    [1, 0x659, 0, 2, 0x33, 0x04, 0x15],
    [6, 0x677, 0, 2, 0x2e, 0x06, 0x31],
    // This one is actually the medicine bottle [0, 0x607, 0, 0, 0x0f, 0x02, 0x0f]
]

HeartContainerData = [
    [5, 0x613, 0, 0, 0x26, 0x02, 0x05],
    [1, 0x608, 0, 0, 0x11, 0x02, 0x10],
    [1, 0x643, 0, 2, 0x07, 0x04, 0x0a],
    [6, 0x657, 0, 2, 0x2e, 0x04, 0x1a]
]

function ContainerCheevo(type, data) {
    sum = 0
    alts = []
    for i in data {
        if (i[2] == 1) {
            sum = sum + bit(i[0], i[1])
        }
        else {
            sum = sum + ~bit(i[0], i[1])
        }
        cond = RoomId == i[4] && LocationId == i[5] && SideViewId == i[6] &&
            MapId == i[3] &&
            bit(i[0], i[1]) != prev(bit(i[0], i[1]))
        array_push(alts, cond)
    }
    achievement(
        title = "Full Of " + type,
        points = 10,
        description = "Collect every " + type + " Container.",
        trigger = InGame && measured(sum == length(alts)) &&
            any_of(alts, s => s)
    )
}

ContainerCheevo("Heart", HeartContainerData)
ContainerCheevo("Magic", MagicContainerData)

achievement(
    title = "Extra Close To Home",
    points = 5,
    description = "Collect the extra life south of your starting position.",
    trigger = InGame && MapId == 0 && RoomId == 0x33 && LocationId == 0x02 &&
        SideViewId == 0x18 && bit1(0x619) < prev(bit1(0x619))
)

achievement(
    title = "Extra In The Swamp",
    points = 5,
    description = "Collect the extra life in the swamp area.",
    trigger = InGame && MapId == 0 && RoomId == 0x39 && LocationId == 0x02 &&
        SideViewId == 0x20 && bit1(0x61c) < prev(bit1(0x61c))
)

achievement(
    title = "Extra In The Water",
    points = 5,
    description = "Collect the extra life east of Darunia.",
    trigger = InGame && MapId == 2 && RoomId == 0x39 && LocationId == 0x04 &&
        SideViewId == 0x19 && bit1(0x65c) < prev(bit1(0x65c))
)

achievement(
    title = "Extra In Hiding [m]",
    points = 5,
    description = "Collect the extra life within Hidden Palace.",
    trigger = InGame && MapId == 2 && RoomId == 0x36 && LocationId == 0x18 &&
        SideViewId == 0x35 && bit4(0x6bb) < prev(bit4(0x6bb))
)

achievement(
    title = "Extra In Greatness",
    points = 5,
    description = "Collect the extra life within Great Palace.",
    trigger = InGame && MapId == 2 && RoomId == 0x29 && LocationId == 0x0c &&
        SideViewId == 0x36 && bit0(0x6d4) < prev(bit0(0x6d4))
)

// RP

EmojiSword = "🗡️"
EmojiMagic = "🧝"
EmojiHeart = "❤️"
EmojiDeath = "💀"
EmojiLives = "🚶"

MapLookup = {
    0: "West Hyrule",
    1: "The Mountain/Maze",
    2: "East Hyrule"
}

PriorMapLookup = {
    0: "Death Mountain",
    2: "Dark Island"
}

LocationLookup = {
    0x08: "Parapa Palace",
    0x0a: "Midoro Palace",
    0x0c: "Great Palace",
    0x0e: "The Ending",
    0x12: "Island Palace",
    0x14: "Maze Palace",
    0x16: "Water Palace",
    0x18: "Hidden Palace"
}

rich_presence_conditional_display(
    InGame && LocationId >= 8,
    "{0}{1} {2}{3} {4}{5} {6}{7} {8}{9} EXP {10}/{11} in {12}",
    EmojiDeath,
    rich_presence_macro("Number", Deaths),
    EmojiLives,
    rich_presence_macro("Number", Lives),
    EmojiSword,
    rich_presence_macro("Number", PowAT),
    EmojiMagic,
    rich_presence_macro("Number", PowMP),
    EmojiHeart,
    rich_presence_macro("Number", PowHP),
    rich_presence_macro("Number", ExpCurr),
    rich_presence_macro("Number", ExpTarget),
    rich_presence_lookup("Dungeon", LocationId, LocationLookup)
)

rich_presence_conditional_display(
    InGame && MapId == 1,
    "{0}{1} {2}{3} {4}{5} {6}{7} {8}{9} EXP {10}/{11} in {12}",
    EmojiDeath,
    rich_presence_macro("Number", Deaths),
    EmojiLives,
    rich_presence_macro("Number", Lives),
    EmojiSword,
    rich_presence_macro("Number", PowAT),
    EmojiMagic,
    rich_presence_macro("Number", PowMP),
    EmojiHeart,
    rich_presence_macro("Number", PowHP),
    rich_presence_macro("Number", ExpCurr),
    rich_presence_macro("Number", ExpTarget),
    rich_presence_lookup("PriorMap", MapId, PriorMapLookup)
)


rich_presence_conditional_display(
    InGame,
    "{0}{1} {2}{3} {4}{5} {6}{7} {8}{9} EXP {10}/{11} in {12}",
    EmojiDeath,
    rich_presence_macro("Number", Deaths),
    EmojiLives,
    rich_presence_macro("Number", Lives),
    EmojiSword,
    rich_presence_macro("Number", PowAT),
    EmojiMagic,
    rich_presence_macro("Number", PowMP),
    EmojiHeart,
    rich_presence_macro("Number", PowHP),
    rich_presence_macro("Number", ExpCurr),
    rich_presence_macro("Number", ExpTarget),
    rich_presence_lookup("Map", MapId, MapLookup)
)

rich_presence_display(
    "Preparing to Display Courage"
)
