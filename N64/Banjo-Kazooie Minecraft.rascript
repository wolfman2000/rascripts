// ~Hack~ Banjo-Kazooie: Ft. Minecraft
// #ID = 21544

WorldId = byte(0x383302)
LocalNoteCount = byte(0x385f60)

TotalNoteScore = byte(0x385ff9) + byte(0x385ffb) +
    byte(0x385ff4) + byte(0x385ff7) +
    byte(0x385ff1) + byte(0x385ffa)

WorldLookup = {
    0x02: "Ice Valley",
    0x04: "Deep Jungle",
    0x06: "Minecraft's Lair",
    0x07: "Desert Ruins",
    0x08: "The Abandoned Mines",
    0x09: "The Nether",
    0x0a: "The Village",
    0x0b: "The File Selection Screen",
    0x0c: "The Final Battle",
    0x0d: "The Final Cutscene",
}

function Sum2D(item) {
    return sum_of(item, i => sum_of(item[i], j => j))
}

Jiggies = {
    0x0a: [
        bit0(0x3832c8),
        bit3(0x3832c8),
        bit4(0x3832c8),
        bit5(0x3832c8),
        bit6(0x3832c8),
        bit7(0x3832c8),
        bit1(0x3832cf),
        bit2(0x3832cf),
        bit3(0x3832cf),
        bit4(0x3832cf)
    ],
    0x08: [
        bit0(0x3832ca),
        bit1(0x3832ca),
        bit2(0x3832ca),
        bit3(0x3832ca),
        bit4(0x3832ca),
        bit5(0x3832ca),
        bit6(0x3832ca),
        bit7(0x3832ca),
        bit0(0x3832cb),
        bit7(0x3832cb),
    ],
    0x07: [
        bit1(0x3832cb),
        bit2(0x3832cb),
        bit3(0x3832cb),
        bit4(0x3832cb),
        bit5(0x3832cb),
        bit6(0x3832cb),
        bit0(0x3832c4),
        bit5(0x3832c4),
        bit7(0x3832c4),
        bit6(0x3832c4),
    ],
    0x04: [
        bit0(0x3832c0),
        bit7(0x3832c0),
        bit0(0x3832c7),
        bit1(0x3832c7),
        bit2(0x3832c7),
        bit3(0x3832c7),
        bit4(0x3832c7),
        bit5(0x3832c7),
        bit6(0x3832c7),
        bit7(0x3832c7),
    ],
    0x02: [
        bit1(0x3832c1),
        bit2(0x3832c1),
        bit3(0x3832c1),
        bit4(0x3832c1),
        bit0(0x3832c2),
        bit3(0x3832c2),
        bit4(0x3832c2),
        bit5(0x3832c2),
        bit6(0x3832c2),
        bit7(0x3832c2),
    ],
    0x09: [
        bit2(0x3832c8),
        bit1(0x3832c8),
        bit0(0x3832c9),
        bit1(0x3832c9),
        bit2(0x3832c9),
        bit3(0x3832c9),
        bit4(0x3832c9),
        bit5(0x3832c9),
        bit6(0x3832c9),
        bit7(0x3832c9),
    ],
}

Tokens = {
    0x0a: [
        bit1(0x3832f4),
        bit2(0x3832f4),
        bit0(0x3832f5),
        bit3(0x3832f5),
        bit4(0x3832f5),
        bit5(0x3832f5),
        bit6(0x3832f5),
        bit7(0x3832f5)
    ],
    0x08: [
        bit0(0x3832f8),
        bit3(0x3832f8),
        bit4(0x3832f8),
        bit5(0x3832f8),
        bit6(0x3832f8),
        bit7(0x3832f8),
        bit1(0x3832fe),
        bit2(0x3832fe),
        bit3(0x3832fe),
        bit4(0x3832fe),
        bit5(0x3832fe),
        bit6(0x3832fe),
        bit1(0x3832ff),
        bit2(0x3832ff),
    ],
    0x07: [
        bit1(0x3832f5),
        bit2(0x3832f5),
        bit0(0x3832f6),
        bit1(0x3832f6),
        bit2(0x3832f6),
        bit3(0x3832f6),
        bit4(0x3832f6),
        bit5(0x3832f6),
        bit6(0x3832f6),
        bit7(0x3832f6),
    ],
    0x04: [
        bit1(0x3832f0),
        bit2(0x3832f0),
        bit3(0x3832f0),
        bit4(0x3832f0),
        bit5(0x3832f0),
        bit6(0x3832f0),
        bit0(0x3832f1),
        bit5(0x3832f1),
        bit6(0x3832f1),
        bit7(0x3832f1),
    ],
    0x02: [
        bit1(0x3832f2),
        bit2(0x3832f2),
        bit3(0x3832f2),
        bit4(0x3832f2),
        bit5(0x3832f2),
        bit6(0x3832f2),
        bit7(0x3832f2),
        bit0(0x3832f3),
        bit6(0x3832f3),
        bit7(0x3832f3),
    ],
    0x09: [],
}

Honeycombs = {
    0x0a: [
        bit1(0x3832e1),
        bit2(0x3832e1),
    ],
    0x08: [
        bit5(0x3832e2),
        bit6(0x3832e2)
    ],
    0x07: [
        bit3(0x3832e2),
        bit4(0x3832e2),
    ],
    0x04: [
        bit0(0x3832e3),
        bit7(0x3832e3),
    ],
    0x02: [
        bit3(0x3832e3),
        bit4(0x3832e3),
    ],
    0x09: [
        bit0(0x3832e2),
        bit7(0x3832e2),
    ],
}

function World(data) => WorldId == data && prev(WorldId) == data

// Cheevos

function AllJiggiesCheevo(world) {
    name = WorldLookup[world]
    allJiggies = Jiggies[world]
    if length(allJiggies) != 0 {
    itemCount = length(allJiggies)
    prevCount = sum_of(allJiggies, j => prev(j))
    currCount = sum_of(allJiggies, j => j)
    achievement(
        title = format("Puzzling In {0}", name),
        points = 10,
        description = format("Collect all jiggies in {0}.", name),
        trigger = World(world) && prevCount == itemCount - 1 && measured(currCount == itemCount)
    )
    }
}

function AllTokensCheevo(world) {
    name = WorldLookup[world]
    allItems = Tokens[world]
    itemCount = length(allItems)
    if (itemCount > 0) {
    prevCount = sum_of(allItems, j => prev(j))
    currCount = sum_of(allItems, j => j)
    achievement(
        title = format("Magic In {0}", name),
        points = 5,
        description = format("Collect all mumbo tokens in {0}.", name),
        trigger = World(world) && prevCount == itemCount - 1 &&
            measured(currCount == itemCount)
    )
    }
}

function AllHoneyCheevo(world) {
    name = WorldLookup[world]
    allItems = Honeycombs[world]
    if length(allItems) > 0 {
    prevCount = sum_of(allItems, j => prev(j))
    currCount = sum_of(allItems, j => j)
    achievement(
        title = format("Strength In {0}", name),
        points = 10,
        description = format("Collect all extra honeycomb pieces in {0}.", name),
        trigger = World(world) && prevCount == 1 && measured(currCount == 2)
    )
    }
}

function AllNotesCheevo(world) {
    achievement(
        title = "Music In " + WorldLookup[world],
        points = 5,
        description = format("Collect all 100 notes in {0}.", WorldLookup[world]),
        trigger = World(world) && LocalNoteCount == 100 && prev(LocalNoteCount) < 100
    )
}

DoorData = [
    [0x0a, 50, bit2(0x3831ac), "The Abandoned Mines"],
    [0x0a, 180, bit3(0x3831ac), "Desert Ruins"],
    [0x0a, 260, bit4(0x3831ac), "Deep Jungle"],
    [0x0a, 350, bit5(0x3831ac), "Ice Valley"],
    [0x0a, 450, bit6(0x3831ac), "The Center of Minecraft's Lair"]
]

function DoorCheevo(door) {
    achievement(
        title = format("The {0} Note Door", door[1]),
        points = 5,
        description = format("Open the way forward to {0}.", door[3]),
        trigger = World(door[0]) && TotalNoteScore >= door[1] && door[2] > prev(door[2])
    )
}

for i in DoorData {
    DoorCheevo(i)
}

achievement(
    title = "Nether-do-well",
    points = 10,
    description = "Enter The Nether for the first time.",
    trigger = WorldId == 0x09 && prev(WorldId) != 0x09 &&
        Sum2D(Jiggies) >= 10 &&
        sum_of(Jiggies[0x09], s => s) == 0
)

for i in Jiggies {
    AllJiggiesCheevo(i)
    AllTokensCheevo(i)
    AllHoneyCheevo(i)
    AllNotesCheevo(i)
}

achievement(
    title = "Can The World Return To Normal Now?",
    points = 25,
    description = "Survive the Minecraft Lair and defeat Gruntilda!",
    trigger = WorldId == 0x0d && prev(byte(0x281898)) == 0xff && byte(0x281898) == 0xaa
)

// RP

EmojiNote = "🎵"
EmojiJiggy = "🧩"
EmojiToken = "💀"
EmojiHoney = "🍯"

rich_presence_display(
    "Banjo & Kazooie in {0} {1}{2} ({3}) {4}{5} {6}{7} {8}{9}",
    rich_presence_lookup("World", WorldId, WorldLookup, "The Minecraft Universe"),
    EmojiNote,
    rich_presence_macro("Number", LocalNoteCount),
    rich_presence_macro("Number", TotalNoteScore),
    EmojiJiggy,
    rich_presence_macro("Number", Sum2D(Jiggies)),
    EmojiToken,
    rich_presence_macro("Number", Sum2D(Tokens)),
    EmojiHoney,
    rich_presence_macro("Number", Sum2D(Honeycombs))
)

