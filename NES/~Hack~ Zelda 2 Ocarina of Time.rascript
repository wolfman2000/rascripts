// ~Hack~ Zelda II: Ocarina of Time
// #ID = 17102

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

function GotItem(ind, add) => bit(ind, add) < prev(bit(ind, add))

// Cheevos

achievement(
    title = "Have To Get Started Somewhere",
    points = 5,
    description = "Level up any stat of your choice.",
    trigger = InGame && PrevTotalPow() == 3 && CurrTotalPow() == 4
)

achievement(
    title = "Support For Din",
    points = 10,
    description = "Max your attack stat.",
    trigger = InGame && prev(PowAT) == 7 && PowAT == 8
)

achievement(
    title = "Support For Nayru",
    points = 10,
    description = "Max your magic stat.",
    trigger = InGame && prev(PowMP) == 7 && PowMP == 8
)

achievement(
    title = "Support For Farore",
    points = 10,
    description = "Max your health stat.",
    trigger = InGame && prev(PowHP) == 7 && PowHP == 8
)

SpellData = [
    ["Defense", "Shield", 0, 0x24, 0x06, 0x2c, 0x77b],
    ["Nature", "Heal", 0, 0x0a, 0x06, 0x31, 0x77d],
    ["Attack", "Fire", 2, 0x28, 0x06, 0x2d, 0x77f],
    ["Reflection", "Reflect", 2, 0x29, 0x06, 0x2f, 0x780],
    ["Magic", "Light", 2, 0x2b, 0x06, 0x33, 0x782],
    ["Ressurection?", "Raise", 2, 0x2a, 0x06, 0x31, 0x781],
    ["Agility", "Jump", 0, 0x25, 0x06, 0x2f, 0x77c],
    ["Transformation", "Fairy", 0, 0x27, 0x06, 0x33, 0x77e],
]

function LearnSpellCheevo(data) {
    achievement(
        title = "The Great Fairy of " + data[0],
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

ChildTimelineExp = [
    // [1, 0x615, 0, 0x2b, 0x02, 0x02],
    [5, 0x617, 0, 0x2e, 0x02, 0x04]
]

LostWoodsExp = [
    [6, 0x632, 0, 0x24, 0x04, 0x38]    
]

AdultTimelineExp = [
    //[4, 0x645, 0, 0x0a, 0x04, 0x0d],
    //[1, 0x650, 0, 0x21, 0x04, 0x17],
    //[5, 0x656, 0, 0x2c, 0x04, 0x01],
    //[4, 0x646, 0, 0x0c, 0x04, 0x0e],
    //[2, 0x677, 0, 0x2f, 0x06, 0x31],
    //[5, 0x65f, 0, 0x3e, 0x04, 0x1d],
    //[5, 0x653, 0, 0x26, 0x04, 0x00]
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
    [0, "The Child Timeline", ChildTimelineExp, 0],
    [1, "The Lost Woods", LostWoodsExp, 0],
    [1, "Death Mountain", DeathMtnExp, 0],
    // [2, "East Hyrule", AdultTimelineExp, 0],
    [1, "Dark Link Island", DarkLinkExp, 0],
]

ItemData = [
    [0, 1, 0x603, 0x07, 0x02, 0x1b, "A Burning Feeling From Within", "lit deku stick from the Deku Tree", 5],
    [0, 2, 0x796, 0x2d, 0x06, 0x32, "And How Do I Stab The Cloud With This?", "up-thrust technique", 5],
    [0, 3, 0x604, 0x09, 0x02, 0x0e, "Just Needs Dodongos", "key from Dodongo's Cavern", 5],
    [0, 5, 0x607, 0x0e, 0x02, 0x02, "Soothing The Not-So-Savage Diety", "ocarina from Jabu Jabu's Belly", 5],
    [0, 7, 0x684, 0x08, 0x08, 0x34, "More ALTTP Than OOT", "power glove", 5],
    [2, 4, 0x645, 0x0a, 0x04, 0x0b, "More Hover Than Iron", "boots from Ice Cavern", 5],
    [2, 2, 0x6bb, 0x37, 0x18, 0x35, "Dancing Abilities Not Included", "hammer", 5],
    [2, 1, 0x696, 0x2d, 0x16, 0x34, "Gossip Stones Would Be Nice Right About Now", "mask of truth", 5],
    [1, 5, 0x6a9, 0x12, 0x14, 0x34, "More Water Than Hover", "boots from Shadow Temple", 5],
    [2, 4, 0x796, 0x2c, 0x06, 0x16, "Getting Down In The Valley", "down-thrust technique", 5],
    [0, 4, 0x68d, 0x1a, 0x0a, 0x35, "Not As Polished As Before", "shield from Spirit Temple", 5],
    [1, 7, 0x630, 0x20, 0x02, 0x17, "Cuckoo For Cucco Meat", "cucco", 10],
    [0, 2, 0x6a0, 0x01, 0x12, 0x36, "So Who Taught This?", "song: Zelda's Lullaby", 5],
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
    ["Saria", "Forest", 0, 0x0d, 0x08, 0x34, 0x78d],
    ["Darunia", "Fire", 2, 0x3a, 0x18, 0x35, 0x792],
    ["Ruto", "Water", 2, 0x29, 0x16, 0x34, 0x791],
    ["Impa", "Shadow", 1, 0x1c, 0x14, 0x34, 0x790],
    ["Nabooru", "Spirit", 0, 0x22, 0x0a, 0x35, 0x78e],
    ["Rauru", "Light", 0, 0x0e, 0x12, 0x36, 0x78f],
]

function CrystalCheevo(data) {
    achievement(
        title = "Rescuing " + data[0],
        points = 10,
        description = format("Free the spirit of {1} in the {0} Temple.", data[1], data[0]),
        trigger = InGame && MapId == data[2] &&
            RoomId == data[3] && LocationId == data[4] && SideViewId == data[5] &&
            byte(data[6]) > prev(byte(data[6]))
    )
}

for i in CrystalData {
    CrystalCheevo(i)
}

DamagelessData = [
    ["Horsehead Master [m]", "Horsehead", "Forest Temple", 0, 0x0d, 0x08, 0x34, 0x20],
    ["Volvagia Master [m]", "Volvagia", "Fire Temple", 2, 0x3a, 0x18, 0x35, 0x6e],
    ["Gooma Master [m]", "Gooma", "Water Temple", 2, 0x29, 0x16, 0x34, 0x90],
    ["Carock Master [m]", "Carock", "Shadow Temple", 1, 0x1c, 0x14, 0x34, 0x10],
    ["Helmethead Master [m]", "Helmethead", "Spirit Temple", 0, 0x22, 0x0a, 0x35, 0xd2],
    ["Rebonack Master [m]", "Rebonack", "Light Temple", 0, 0x0e, 0x12, 0x36, 0x48],
    ["Thunderbird Master [m]", "Thunderbird", "Ganon's castle", 2, 0x2e, 0x0c, 0x36, 0xf4],
//    ["No Doubting Yourself", "Dark Link", "Great", 2, 0x36, 0x0c, 0x36, 0xf8],
]

function DamagelessCheevo(data) {
    achievement(
        title = data[0],
        points = 25,
        description = format(
            "Defeat {0} in {1} without losing health.", data[1], data[2]
        ),
        trigger = 
            never(!InGame) &&
            never(MapId != data[3]) &&
            never(RoomId != data[4]) &&
            never(LocationId != data[5]) &&
            never(SideViewId != data[6]) &&
            never(Lives < prev(Lives)) &&
            never(byte(0x774) < prev(byte(0x774))) &&
            never(byte(0x3b) * 0x100 + byte(0x4d) > 0x26f) &&
            once(byte(0xc7) == data[7] && prev(byte(0xc7)) == 0) &&
            once(ScreenLock) &&
            trigger_when(byte(0x793) > prev(byte(0x793))) &&
            trigger_when(once(prev(byte(0xc7)) == data[7] && byte(0xc7) != 0 &&
                byte(0xc7) < data[7]))
    )
}

for i in DamagelessData {
    if i[1] != "Helmethead" && i[1] != "Thunderbird" {
        DamagelessCheevo(i)
    }
    else if i[1] == "Helmethead" {
        achievement(
            title = i[0],
            points = 25,
            description = format(
                "Clear Helmethead's room (including Helmethead himself) in Spirit Temple without losing health."
            ),
            trigger =
                never(!InGame) &&
                never(MapId != i[3]) &&
                never(RoomId < 0x1f) &&
                never(RoomId > 0x22) &&
                never(RoomId == 0x1f && prev(RoomId) == 0x22) &&
                never(
                    RoomId == 0x22 && byte(0x3b) * 0x100 + byte(0x4d) > 0x26f &&
                    prev(byte(0x3b)) * 100 + prev(byte(0x4d)) <= 0x26f &&
                    prev(byte(0x3b)) * 100 + prev(byte(0x4d)) >= 0x260
                ) &&
                disable_when(
                    RoomId == 0x22 && byte(0x774) < prev(byte(0x774)),
                    until=Lives < prev(Lives) || (RoomId == 0x1f && prev(RoomId) == 0x22)
                )  &&
                once(RoomId == 0x22 && prev(RoomId) == 0x1f) &&
                trigger_when(once(ScreenLock)) &&
                trigger_when(once(byte(0xc7) == 0x30)) &&
                trigger_when(once(byte(0xc7) != 0 && prev(byte(0xc7)) == 0x30)) &&
                trigger_when(byte(0x793) > prev(byte(0x793)))
        )
    }
    else {
        achievement(
            title = i[0],
            points = 25,
            description = "Defeat Thunderbird in Ganon's Castle without losing health.",
            trigger = 
                never(!InGame) &&
                never(MapId != i[3]) &&
                never(RoomId < 0x2d) &&
                never(RoomId > 0x2e) &&
                disable_when(
                    RoomId == 0x2e && byte(0x774) < prev(byte(0x774)),
                    until = Lives < prev(Lives) || RoomId > 0x2e || RoomId < 0x2d
                ) &&
                once(RoomId == 0x2e && prev(RoomId) == 0x2d) &&
                trigger_when(once(ScreenLock)) &&
                trigger_when(once(byte(0xc6) == 0xc0)) &&
                trigger_when(once(byte(0xc6) != 0 && prev(byte(0xc6)) == 0xc0)) &&
                trigger_when(byte(0x793) > prev(byte(0x793)))
                
        )
    }
}

achievement(
    title = "Go Back To The Water Temple And STAY There!",
    description = "Defeat Dark Link in Ganon's Palace and win the game.",
    points = 25,
    trigger =
        InGame && MapId == 2 && RoomId == 0x36 && LocationId == 0x0c &&
            SideViewId == 0x36 && byte(0xeb) == 0x20
)

achievement(
    title = "Preventing The Downfall Timeline [m]",
    description = "Beat the game without a single game over.",
    points = 50,
    trigger =
        InGame && MapId == 2 && RoomId == 0x36 && LocationId == 0x0c &&
            SideViewId == 0x36 && byte(0xeb) == 0x20 && byte(0x79f) == 0
        
)

MagicContainerData = [
    [7, 0x62d, 1, 0x1a, 0x04, 0x22],
    [7, 0x66a, 2, 0x14, 0x06, 0x22],
    [2, 0x643, 2, 0x07, 0x04, 0x0a],
    [3, 0x616, 0, 0x2d, 0x02, 0x18],
    [0, 0x607, 0, 0x0f, 0x02, 0x0f],
    // This one is actually the medicine bottle [0, 0x607, 0, 0, 0x0f, 0x02, 0x0f]
]

HeartContainerData = [
    [5, 0x613, 0, 0x26, 0x02, 0x05],
    [2, 0x62a, 1, 0x15, 0x04, 0x1a],
    [3, 0x67d, 2, 0x3b, 0x06, 0x22],
    [6, 0x62d, 1, 0x1a, 0x02, 0x1a],
    [3, 0x677, 2, 0x2f, 0x06, 0x14],
]

function ContainerCheevo(type, data, kind) {
    sum = 0
    alts = []
    for i in data {
        
        sum = sum + ~bit(i[0], i[1])

        cond = RoomId == i[3] && LocationId == i[4] && SideViewId == i[5] &&
            MapId == i[2] &&
            bit(i[0], i[1]) != prev(bit(i[0], i[1]))
        array_push(alts, cond)
    }
    achievement(
        title = type,
        points = 10,
        description = "Collect every " + kind + " Container.",
        trigger = InGame && measured(sum == length(alts)) &&
            any_of(alts, s => s)
    )
}

ContainerCheevo("Where's My Other Twelve?", HeartContainerData, "Heart")
ContainerCheevo("Where's The Half Magic?", MagicContainerData, "Magic")

achievement(
    title = "Surprisingly Rare Commodity",
    points = 5,
    description = "Collect the extra life in Castle Market Town.",
    trigger = InGame && MapId == 0 && RoomId == 0x20 && LocationId == 0x06 &&
        SideViewId == 0x2c && GotItem(6, 0x670)
)

// RP

EmojiSword = "🗡️"
EmojiMagic = "🧝"
EmojiHeart = "❤️"
EmojiDeath = "💀"
EmojiLives = "🚶"

MapLookup = {
    0: "Hyrule", // Usually child
    1: "The Mountain/Maze",
    2: "Hyrule" // Usually adult
}

PriorMapLookup = {
    0: "Death Mountain",
    1: "The Lost Woods",
    2: "Dark Island"
}

LocationLookup = {
    0x08: "Forest Temple",
    0x0a: "Spirit Temple",
    0x0c: "Ganon's Castle",
    0x0e: "The Ending",
    0x12: "Light Temple",
    0x14: "Shadow Temple",
    0x16: "Fire Temple",
    0x18: "Water Temple"
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
    "{0}{1} {2}{3} {4}{5} {6}{7} {8}{9} EXP {10}/{11} in Hyrule",
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
    rich_presence_macro("Number", ExpTarget)
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
    "Preparing to Start a Journey Through Time"
)

