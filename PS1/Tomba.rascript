// Tomba! | Tombi! | Ore! Tomba
// #ID = 11276

GlobalPointer = tbyte(0x1ff3f0)
SaneCheck = GlobalPointer != 0

Location = byte(0xfffff670 + GlobalPointer)
SubLocation = byte(0xfffff672 + GlobalPointer)
InGameTime = dword(0xfffff678 + GlobalPointer)
AdventurePoints = dword(0xfffff67c + GlobalPointer)
CurHP = byte(0xfffff680 + GlobalPointer)
TookDamage = CurHP < prev(CurHP)
MaxHP = byte(0xfffff681 + GlobalPointer)
Lives = byte(0xfffff690 + GlobalPointer)
LifeLost = Lives < prev(Lives)
ActiveJewel = byte(0xfffff6a0 + GlobalPointer)
JewelRedLevel = byte(0xfffffaa8 + GlobalPointer)
JewelGreenLevel = byte(0xfffffaa9 + GlobalPointer)
JewelBlueLevel = byte(0xfffffaaa + GlobalPointer)

MissionGrandpasBracelet = byte(0xfffffab4 + GlobalPointer)

SubLocationMath = Location * 0x100 + SubLocation
SubLocationMathPrev = prev(Location) * 0x100 + prev(SubLocation)
SubLocationMathPrior = prior(Location) * 0x100 + prior(SubLocation)

SubLocationLookup = {
    0x0000: "The Village of All Beginnings",
    0x0001: "The Forest of All Beginnings",
    0x0002: "The Forest Of All Beginnings",
    0x0003: "The 100 Year Old Man's Home",
    0x0004: "The Dirt Motocross Start",
    0x0005: "The Ol' Pond",
    0x0100: "The Forest of 100 Flowers",
    0x0101: "The Forest of 100 Flowers",
    0x0102: "Wobbly Wharf",
    0x0103: "The Watch Tower",
    0x0104: "Charity Square",
    0x0200: "Dwarf Village",
    0x0201: "Dwarf Village Elder",
    0x0202: "Dwarf Village Prison",
    0x0203: "Dwarf Village Underground",
    0x0204: "The Million Year Old Man's Home",
    0x0205: "The Small, STrange Room",
    0x0301: "Stormy Mountain",
    0x0300: "Stormy Mountain",
    0x0302: "Lava Caves",
    0x0303: "The Phoenix's Nest",
    0x0304: "Stormy Mountain",
    0x0305: "Stormy Mountain",
    0x0400: "Haunted Mansion North",
    0x0401: "Haunted Mansion West",
    0x0402: "Haunted Mansion South",
    0x0403: "Haunted Mansion East",
    0x0404: "Haunted Mansion Interior",
    0x0405: "Haunted Mansion Interior",
    0x0406: "Haunted Mansion Interior",
    0x0407: "Haunted Mansion Interior",
    0x0408: "Haunted Mansion Interior",
    0x0409: "Haunted Mansion Interior",
    0x040a: "Haunted Mansion Interior",
    0x040b: "Haunted Mansion Interior",
    0x040c: "Haunted Mansion Interior",
    0x040d: "Haunted Mansion Interior",
    0x040e: "Haunted Mansion Interior",
    0x040f: "The 1,000 Year Old Man's Home",
    0x0410: "Haunted Mansion Interior",
    0x0411: "Haunted Mansion Interior",
    0x0412: "Haunted Mansion Interior",
    0x0413: "Haunted Mansion Interior",
    0x0414: "Haunted Mansion Interior",
    0x0415: "Haunted Mansion Interior",
    0x0416: "Haunted Mansion Interior",
    0x0417: "Haunted Mansion Interior",
    0x0418: "Haunted Mansion Interior",
    0x0419: "Haunted Mansion Interior",
    0x0501: "Baccus Village",
    0x0500: "Baccus Village",
    0x0502: "Baccus Village",
    0x0503: "Baccus Village",
    0x0600: "Dirt Motocross",
    0x0601: "The Dirt Motocross Finish",
    0x0602: "The Mermaid's Singing Rock",
    0x0800: "Baccus Lake",
    0x0801: "Baccus Lake",
    0x0900: "Mushroom Forest",
    0x0901: "Mansion Exterior",
    0x0903: "Mansion Treasure Room",
    0x0904: "Mansion Stairs (Up)",
    0x0902: "Mansion Bas",
    0x0905: "Mansion Stairs (Down)",
    0x0906: "Mushroom Forest Slide",
    0x0a00: "Masakari Jungle",
    0x0a01: "Masakari Jungle",
    0x0a02: "Masakari Jungle",
    0x0a03: "Trick VIllage",
    0x0a04: "Masakari Jungle",
    0x0a05: "Masakari River",
    0x0a06: "Old Tree Hill",
    0x0a07: "Trick Village",
    0x0a08: "The 10,000 Year Old Man's Home",
    0x0b02: "The Lumberjack Factory",
    0x0d00: "Charity Square Top",
    0x0d01: "The Ending",
    0x0e00: "The Stormy Evil Pig",
    0x0e01: "The Mouse Evil Pig",
    0x0e02: "The Underwater Evil Pig",
    0x0e03: "The Fire Evil Pig",
    0x0e04: "The Forest Evil Pig",
    0x0e05: "The Deep Jungle Evil Pig",
    0x0e06: "The Haunted Evil Pig",
    0x0e07: "The Master Evil Pig",
    0x1001: "The Lumberjack Factory",
    0x1004: "The Clock Tower",
    0x1005: "The Clock Tower",
    0x1006: "The Clock Tower",
    0x1101: "Iron Castle",
    0x1102: "Iron Castle",
    0x1103: "Iron Castle",
    0x1104: "Iron Castle",
    0x1105: "Iron Castle",
    0x1201: "The Y Crossing",
    0x1202: "The Witch's Home",
    0x1302: "The Hidden Village",
}

MissionOffsets = {
    0: 0, // Grandpa's Bracelet
    1: 1, // 100 year old man
    2: 2, // fog
    3: 3, // take me home
    4: 4, // motocross
    5: 5, // who?
    6: 7, // hide & seek
    7: 8, // swim
    8: 9, // kokka eggs
    9: 10, // tale of pigs
    10: 11, // 1000 year old man
    11: 12, // dwarf elder
    12: 13, // language
    13: 14, // lost child
    14: 15, // flower seeds
    15: 16, // AP box
    16: 17, // save dwarves
    17: 19, // lost & found,
    18: 20, // stop fight
    19: 21, // escape
    20: 22, // look & see
    21: 23, // doggo
    22: 24, // What's this?
    23: 25, // mansion treasures
    24: 26, // to phoenix mountain
    25: 27, // broke fountain
    26: 28, // familiar
    27: 29, // stormy bag
    28: 30, // phoenix mountain 
    29: 31, // where did i...?
    30: 33, // digger
    31: 34, // lava caves
    32: 35, // master of skies
    33: 36, // funga?
    34: 37, // monster hunt
    35: 38, // death fruit juice
    36: 39, // flower garden
    37: 40, // flower tears
    38: 41, // smile
    39: 42, // cry
    40: 43, // can't stop crying
    41: 44, // red fortune
    42: 46, // baby mouse
    43: 47, // cheese
    44: 49, // alcohol,
    45: 50, // baccus lake
    46: 51, // small key hole
    47: 53, // mouse bag
    48: 54, // haunted mansion
    49: 55, // large key hole
    50: 56, // big key paint
    51: 57, // magic egg
    52: 58, // red powers
    53: 62, // knowledge tree
    54: 63, // pump rocks
    55: 64, // refreshing drink
    56: 65, // tear bottle
    57: 73, // need power
    58: 77, // civ machine
    59: 78, // charles
    60: 79, // under forest
    61: 80, // 100 flower forest
    62: 81, // boss treasure
    63: 82, // hungry
    64: 85, // jungle pig
    65: 86, // herbs for Baron
    66: 87, // knowledge fruit
    67: 88, // seaweed
    68: 90, // blue powers
    69: 102, // rusty door
    70: 103, // cute witch
    71: 104, // food for fuel
    72: 105, // need bomb
    73: 111, // baccus village
    74: 112, // necklace
    75: 113, // baron strong
    76: 114, // witch lost,
    77: 115, // safe mushroom
    78: 116, // power up tool
    79: 118, // 10k old man
    80: 119, // mighty fish
    81: 120, // make candy
    82: 121, // mermaid singing rock
    83: 123, // underwater pig
    84: 124, // trick village
    85: 125, // thieves door
    86: 126, // 10 math beads
    87: 127, // 5 golden items
    88: 128, // unbreakable wire
    89: 129, // green powers
    90: 132, // take two
    91: 133, // brone medal
    92: 134, // silver medal
    93: 135, // gold medal
    94: 144, // 1M wish
    95: 145, // dig like mole
    96: 146, // blue fortune
    97: 150, // ride raft
    98: 151, // take out
    99: 153, // what's underwater?
    100: 156, // source of evil magic
    101: 157, // seven friends
    102: 159, // 8th evil bag?
    103: 160, // real evil pig
    104: 161, // underground treasure
    105: 164, // flower tower
    106: 166, // hungry monkey
    107: 167, // peach flower gas
    108: 168, // 8th evil bag (real)
    109: 169, // biting plant flower
    110: 170, // when wind dies down
    111: 171, // phoenix favorite
    112: 172, // fire pig bag
    113: 173, // charles pants
    114: 174, // haunted pig bag
    115: 175, // greatest smile
    116: 176, // greatest pout
    117: 177, // cooking
    118: 178, // leaf butterflies
    119: 179, // where's light?
    120: 180, // barrel roll!
    121: 181, // ready, set, go
    122: 182, // magic mirror
    123: 183, // jungle pig bag
    124: 185, // precious treasure
    125: 187, // mysterious mushroom
    126: 188, // leaf slider
    127: 189, // red + blue
    128: 190, // troubled thief
    129: 191, // thief forgot
}

function MissionBit7(index) => bit7(index + 0xfffffab4 + GlobalPointer)
function MissionAddr(index) => byte(index + 0xfffffab4 + GlobalPointer)
function MissionAddrPrior(index) => prior(MissionAddr(index))

function MissionDone(index) => MissionAddr(index) == 0xff

function MissionFoundStart(index) =>
    prev(MissionAddr(MissionOffsets[index])) == 0 &&
    MissionAddr(MissionOffsets[index]) == 1
function MissionFoundComplete(index, target = 1) =>
    prev(MissionAddr(MissionOffsets[index])) == target &&
    MissionDone(MissionOffsets[index])
function MissionAnyComplete(index, target = 1) =>
    prev(MissionAddr(MissionOffsets[index])) <= target &&
    MissionDone(MissionOffsets[index])
function MissionAnyCompleteTrigger(index, target = 1) =>
    prev(MissionAddr(MissionOffsets[index])) <= target &&
    trigger_when(MissionDone(MissionOffsets[index]))

// Achievements

achievement(
    title = "The First Event of Many to Come", points = 1,
    description = "Clear the Fog in the Village of All Beginnings",
    id = 83254, badge = "99483", published = "9/8/2019 10:08:19 PM", modified = "2/19/2020 7:34:31 PM",
    trigger = SaneCheck && SubLocationMath == 0 && MissionFoundComplete(2)
)

achievement(
    title = "Beginner's Dwarf Language", points = 1,
    description = "Learn to Speak Dwarf",
    id = 83255, badge = "99482", published = "9/8/2019 10:08:31 PM", modified = "2/19/2020 7:31:02 PM",
    trigger = SaneCheck && SubLocationMath == 0x0201 && MissionFoundComplete(12, 4)
)

achievement(
    title = "The Dwarf Elder", points = 1,
    description = "Talk to the Dwarf Elder after saving the missing dwarves",
    id = 83256, badge = "99481", published = "9/8/2019 10:08:42 PM", modified = "2/19/2020 7:27:34 PM",
    trigger = SaneCheck && SubLocationMath == 0x0201 && MissionAnyComplete(11)
)

achievement(
    title = "Phoenix Ride Gone Wrong", points = 1,
    description = "Land in Baccus Village",
    id = 83257, badge = "99480", published = "9/8/2019 10:08:56 PM", modified = "2/19/2020 7:24:28 PM",
    trigger = SaneCheck && SubLocationMath == 0x0500 && MissionFoundStart(47) 
)

achievement(
    title = "Wine is the Lake Water?", points = 1,
    description = "Fix the pump at Baccus Lake then clear \"A Drink for Grownups\" at Town Hall",
    id = 83258, badge = "99484", published = "9/8/2019 10:09:03 PM", modified = "2/19/2020 7:35:32 PM",
    trigger = SaneCheck && SubLocationMath == 0x0501 && MissionAnyComplete(44, 2)
)

achievement(
    title = "The Master of the Skies", points = 1,
    description = "Ride the Phoenix to the Masakari Jungle",
    id = 83259, badge = "99485", published = "9/8/2019 10:09:10 PM", modified = "2/19/2020 7:36:07 PM",
    trigger = SaneCheck && SubLocationMath == 0x0a00 && MissionFoundStart(123)
)

achievement(
    title = "The Civilization Machine", points = 1,
    description = "Restore power to The Village of Civilization",
    id = 83260, badge = "99486", published = "9/8/2019 10:09:15 PM", modified = "2/19/2020 7:36:46 PM",
    trigger = SaneCheck && SubLocationMath == 0x1105 && MissionAnyComplete(57)
)

achievement(
    title = "Lava Caves Restored", points = 5,
    description = "Capture the Fire Evil Pig in the Green Bag",
    id = 80648, badge = "87676", published = "8/18/2019 12:10:25 AM", modified = "4/6/2022 9:51:41 PM",
    trigger = SaneCheck && SubLocationMath == 0x0e03 && MissionAnyComplete(31)
)

achievement(
    title = "Haunted Mansion Restored", points = 5,
    description = "Capture the Haunted Evil Pig in the Pink Bag",
    id = 80649, badge = "87677", published = "8/18/2019 12:10:33 AM", modified = "2/19/2020 7:46:10 PM",
    trigger = SaneCheck && SubLocationMath == 0x0e06 && MissionAnyComplete(48)
)

achievement(
    title = "Baccus Village Restored", points = 5,
    description = "Capture the Mouse Evil Pig in the Orange Bag",
    id = 80650, badge = "87678", published = "8/18/2019 12:10:39 AM", modified = "2/19/2020 7:38:23 PM",
    trigger = SaneCheck && SubLocationMath == 0x0e01 && MissionAnyComplete(73)
)

achievement(
    title = "Phoenix Mountain Restored", points = 5,
    description = "Capture the Stormy Evil Pig in the Red Bag",
    id = 80651, badge = "87679", published = "8/18/2019 12:10:44 AM", modified = "2/19/2020 7:43:55 PM",
    trigger = SaneCheck && SubLocationMath == 0x0e00 && MissionAnyComplete(28)
)

achievement(
    title = "Trick Village Restored", points = 5,
    description = "Capture the Underwater Evil Pig in the Yellow Bag",
    id = 80652, badge = "87680", published = "8/18/2019 12:10:53 AM", modified = "2/19/2020 7:43:21 PM",
    trigger = SaneCheck && SubLocationMath == 0x0e02 && MissionAnyComplete(84)
)

achievement(
    title = "The 100 Flower Forest Restored", points = 5,
    description = "Capture the Forest Evil Pig in the Blue Bag",
    id = 80653, badge = "87681", published = "8/18/2019 12:10:59 AM", modified = "2/19/2020 7:42:40 PM",
    trigger = SaneCheck && SubLocationMath == 0x0e04 && MissionAnyComplete(61)
)

achievement(
    title = "Masakari Jungle Restored", points = 5,
    description = "Capture the Deep Jungle Evil Pig in the Navy Bag",
    id = 80654, badge = "87682", published = "8/18/2019 12:11:05 AM", modified = "4/6/2022 6:39:06 PM",
    trigger = SaneCheck && SubLocationMath == 0x0e05 && MissionAnyComplete(64)
)

achievement(
    title = "Master Evil Pig Defeated", points = 5,
    description = "Capture the Master Evil Pig in the Black Bag",
    id = 80655, badge = "87683", published = "8/18/2019 12:11:13 AM", modified = "2/19/2020 7:40:02 PM",
    trigger = SaneCheck && SubLocationMath == 0x0e07 && MissionAnyComplete(103)
)

achievement(
    title = "Grandpa's Bracelet", points = 25,
    description = "Find the bracelet stolen by the Koma Pigs",
    id = 80673, badge = "87627", published = "8/18/2019 12:13:25 AM", modified = "2/19/2020 7:39:10 PM",
    trigger = SaneCheck && SubLocationMath == 0x0d01 && MissionFoundComplete(0)
)

AllMissions = sum_of(MissionOffsets, index => bit7(MissionOffsets[index] + 0xfffffab4 + GlobalPointer))

achievement(
    title = "100 Percent Young Man", points = 50,
    description = "Clear all 130 Events",
    id = 80674, badge = "87628", published = "8/18/2019 12:13:30 AM", modified = "4/10/2022 3:09:00 PM",
    trigger = SaneCheck && SubLocationMath == 0x0d01 && MissionFoundComplete(0) &&
        measured(AllMissions == 130)
)

DamagelessPigData = [
    [0x0e03, 31, "Got Roasted", "Fire"],
    [0x0e06, 48, "Got Hog Warts", "Haunted"],
    [0x0e01, 73, "Got Crushed", "Mouse"],
    [0x0e00, 28, "Got Blown Away", "Stormy"],
    [0x0e02, 84, "Got Water Filled Lungs", "Underwater"],
    [0x0e04, 61, "Got Allergies", "Forest"],
    [0x0e05, 64, "Got Fumigated", "Deep Jungle"],
    [0x0e07, 103, "Cried \"Wee\" All the Way Home", "Master"]
]
function DamagelessPigCheevo(data) {
    achievement(
        title = format("This Little Piggy {0}", data[2]),
        description = format("Capture the {0} Evil Pig without taking damage", data[3]),
        points = 10,
        trigger = never(!SaneCheck) &&
            never(TookDamage) &&
            never(Lives == 0) &&
            never(SubLocationMath != data[0]) &&
            once(LifeLost || SubLocationMathPrev != data[0]) &&
            MissionAnyCompleteTrigger(data[1])
    )
}

for i in DamagelessPigData {
    DamagelessPigCheevo(i)
}

Key100 = byte(0xfffffdba + GlobalPointer)
Key1K = byte(0xfffffdd8 + GlobalPointer)
Key10K = byte(0xfffffde0 + GlobalPointer)
Key1M = byte(0xfffffde1 + GlobalPointer)

achievement(
    title = "The 100 Year Old Man", points = 2,
    description = "Learn about the Evil Pigs and get the 100 Year Old Key",
    id = 80640, badge = "87608", published = "8/18/2019 12:09:15 AM", modified = "2/19/2020 10:38:25 PM",
    trigger = SaneCheck && SubLocationMath == 0x0003 &&
        Key100 == 1 && prev(Key100) == 0 &&
        MissionDone(MissionOffsets[1]) &&
        MissionDone(MissionOffsets[8]) &&
        MissionAddrPrior(MissionOffsets[8]) == 1
)

achievement(
    title = "The 1,000 Year Old Man", points = 2,
    description = "Free him from captivity and get the 1,000 Year Old Key",
    id = 80641, badge = "87609", published = "8/18/2019 12:09:21 AM", modified = "2/19/2020 10:30:00 PM",
    trigger = SaneCheck && SubLocationMath == 0x040f &&
        Key1K == 1 && prior(Key1K) == 0 &&
        MissionDone(MissionOffsets[10]) &&
        MissionDone(MissionOffsets[51]) &&
        MissionAddrPrior(MissionOffsets[51]) <= 1
)

achievement(
    title = "The 10,000 Year Old Man", points = 2,
    description = "Collect the Math Beads and get the 10,000 Year Old Key",
    id = 80642, badge = "87610", published = "8/18/2019 12:09:28 AM", modified = "2/19/2020 10:37:35 PM",
    trigger = SaneCheck && SubLocationMath == 0x0a08 &&
        Key10K == 1 && prior(Key10K) == 0 &&
        MissionDone(MissionOffsets[79]) &&
        MissionDone(MissionOffsets[86]) &&
        MissionAddrPrior(MissionOffsets[86]) == 1
)

achievement(
    title = "The Million Year Old Man", points = 2,
    description = "Find him and get the Million Year Old Key",
    id = 80643, badge = "87612", published = "8/18/2019 12:09:34 AM", modified = "9/7/2020 3:28:31 AM",
    trigger = SaneCheck && SubLocationMath == 0x0204 &&
        Key1M == 1 && prior(Key1M) == 0 &&
        MissionDone(MissionOffsets[100]) &&
        MissionAddrPrior(MissionOffsets[100]) == 1
)

Bell100 = byte(0xfffffdb9 + GlobalPointer)
Bell1K = byte(0xfffffe30 + GlobalPointer)
Bell10K = byte(0xfffffe4b + GlobalPointer)
Bell1M = byte(0xfffffe4c + GlobalPointer)

achievement(
    title = "100 Year Old Bell", points = 5,
    description = "Find the 100 Year Old Bell in a 100 Year Old Chest",
    id = 80644, badge = "87614", published = "8/18/2019 12:09:42 AM", modified = "9/7/2020 3:28:26 AM",
    trigger = SaneCheck && SubLocationMath == 0x0000 &&
        Bell100 == 1 && prev(Bell100) == 0 &&
        Key100 == 1 && MissionDone(MissionOffsets[1])
)

achievement(
    title = "1,000 Year Old Bell", points = 5,
    description = "Find the 1,000 Year Old Bell in a 1,000 Year Old Chest",
    id = 80645, badge = "87615", published = "8/18/2019 12:09:47 AM", modified = "9/7/2020 3:28:11 AM",
    trigger = SaneCheck && SubLocationMath == 0x0900 &&
        Bell1K == 1 && prev(Bell1K) == 0 &&
        Key1K == 1 && MissionDone(MissionOffsets[10])
)

achievement(
    title = "10,000 Year Old Bell", points = 5,
    description = "Find the 10,000 Year Old Bell in a 10,000 Year Old Chest",
    id = 80646, badge = "87616", published = "8/18/2019 12:10:07 AM", modified = "2/12/2021 10:26:36 PM",
    trigger = SaneCheck && SubLocationMath == 0x0005 &&
        Bell10K == 1 && prev(Bell10K) == 0 &&
        Key10K == 1 && MissionDone(MissionOffsets[79])
)

achievement(
    title = "Million Year Old Bell", points = 5,
    description = "Find the Million Year Old Bell in a Million Year Old Chest",
    id = 80647, badge = "87617", published = "8/18/2019 12:10:15 AM", modified = "9/7/2020 3:28:22 AM",
    trigger = SaneCheck && SubLocationMath == 0x0103 &&
        Bell1M == 1 && prev(Bell1M) == 0 &&
        Key1M == 1 && MissionDone(MissionOffsets[100])
)

Emotion = byte(0xffffffc1 + GlobalPointer)

achievement(
    title = "The Greatest Smile", points = 1,
    description = "Have a Laugh in the Mushroom Forest",
    id = 80664, badge = "87618", published = "8/18/2019 12:12:19 AM", modified = "2/19/2020 10:40:09 PM",
    trigger = SaneCheck && SubLocationMath == 0x0900 &&
        prev(Emotion) != 1 && prev(Emotion) <= 2 && Emotion == 1
)

achievement(
    title = "The Greatest Pout", points = 1,
    description = "These mushrooms make me sad",
    id = 83157, badge = "89740", published = "9/7/2019 1:57:31 AM", modified = "4/8/2022 10:18:00 PM",
    trigger = SaneCheck && SubLocationMath == 0x0900 &&
        prev(Emotion) <= 1 && Emotion == 2
)

achievement(
    title = "Emotions On Demand", points = 5,
    description = "Obtain the Ordinary and Mysterious Mushrooms",
    id = 83263, badge = "99487", published = "9/8/2019 10:10:59 PM", modified = "4/8/2022 10:29:50 PM",
    trigger = SaneCheck && SubLocationMath == 0x0900 &&
        prev(MissionBit7(MissionOffsets[77])) + prev(MissionBit7(MissionOffsets[125])) == 1 &&
        measured(MissionBit7(MissionOffsets[77]) + MissionBit7(MissionOffsets[125]) == 2)
)

achievement(
    title = "Animal Dash", points = 5,
    description = "Acquire the Animal Dash ability from Charles",
    id = 80665, badge = "87619", published = "8/18/2019 12:12:28 AM", modified = "2/19/2020 10:42:21 PM",
    trigger = SaneCheck && SubLocationMath == 0x0000 &&
        MissionAnyComplete(106)
)

achievement(
    title = "I Can Swim", points = 5,
    description = "Learn to Swim from Charles",
    id = 83261, badge = "99488", published = "9/8/2019 10:09:48 PM", modified = "9/1/2022 5:59:32 PM",
    trigger = SaneCheck && SubLocationMath == 0x0a01 &&
        MissionAnyComplete(7)
)

achievement(
    title = "Going Underwater", points = 5,
    description = "Learn to Dive from the Mermaid",
    id = 83262, badge = "99489", published = "9/8/2019 10:09:56 PM", modified = "2/19/2020 10:43:20 PM",
    trigger = SaneCheck && SubLocationMath == 0x0408 &&
        MissionAnyComplete(99)
)

SequelIds = [6, 13, 70, 1]

achievement(
    title = "You'll need these for the sequel", points = 5,
    description = "Clear Hide and Go Seek, A Lost Child, The Cute Witch, and The 100 Year Old Wise Man",
    id = 80666, badge = "136630", published = "8/18/2019 12:12:32 AM", modified = "9/2/2022 6:16:03 PM",
    trigger = SaneCheck &&
        sum_of(SequelIds, i => prev(MissionBit7(MissionOffsets[i]))) == 3 &&
        measured(sum_of(SequelIds, i => MissionBit7(MissionOffsets[i])) == 4)
)

achievement(
    title = "Ready to Race?", points = 5,
    description = "Get to the Motocross Course and start a race",
    id = 83158, badge = "89741", published = "9/7/2019 1:57:38 AM", modified = "2/19/2020 10:57:57 PM",
    trigger = SaneCheck && SubLocationMathPrior == 0x0004 &&
        SubLocationMath == 0x0600 &&
        MissionFoundStart(82)
)

achievement(
    title = "Red and Blue makes Gray?", points = 5,
    description = "Clear \"Red + Blue = ?\" and have the Taboo status ailment for the first time",
    id = 83264, badge = "99490", published = "9/8/2019 10:11:06 PM", modified = "4/6/2022 5:23:11 PM",
    trigger = SaneCheck && SubLocationMath == 0x0900 &&
        MissionAnyComplete(127)
)

Baron = byte(0xfffffdc2 + GlobalPointer)

achievement(
    title = "The Dog With Special Powers", points = 5,
    description = "Obtain Baron before capturing the 7 Evil Pigs",
    id = 83266, badge = "99491", published = "9/8/2019 10:11:23 PM", modified = "2/19/2020 10:53:57 PM",
    trigger = SaneCheck && SubLocationMath == 0x0200 &&
        Baron == 1 && prev(Baron) == 0
)

achievement(
    title = "5 Golden Items", points = 25,
    description = "Find the 5 Golden Items and bring them to the 10,000 Year Old Man",
    id = 83268, badge = "99492", published = "9/8/2019 10:11:36 PM", modified = "4/6/2022 5:20:04 PM",
    trigger = SaneCheck && SubLocationMath == 0x0a08 &&
        MissionAnyComplete(87)
)

achievement(
    title = "Power Up for Tools!?", points = 5,
    description = "Equip the Grapplejack",
    id = 83265, badge = "99493", published = "9/8/2019 10:11:17 PM", modified = "9/2/2022 12:55:42 PM",
    trigger = SaneCheck &&
        byte(0xffffffc2 + GlobalPointer) == 0x09 &&
        byte(0xfffffdd6 + GlobalPointer) == 0x01 &&
        MissionDone(MissionOffsets[78])
)

DashPants = byte(0xfffffdcc + GlobalPointer)
FlashPants = byte(0xfffffdd0 + GlobalPointer)
JumpPants = byte(0xfffffdd1 + GlobalPointer)

achievement(
    title = "Fashionista", points = 5,
    description = "Own all four types of pants",
    id = 83267, badge = "99494", published = "9/8/2019 10:11:30 PM", modified = "9/7/2020 3:28:56 AM",
    trigger = SaneCheck &&
        prev(DashPants) + prev(FlashPants) + prev(JumpPants) + 1 == 3 &&
        measured(DashPants + FlashPants + JumpPants + 1 == 4)
)

BunkFlowers = byte(0xfffffdf6 + GlobalPointer)

achievement(
    title = "Jumping for Flowers inside the Cave", points = 10,
    description = "Collect 5 Bunk Flowers inside the Lava Caves without losing a life or leaving the area",
    id = 80667, badge = "87621", published = "8/18/2019 12:12:41 AM", modified = "10/2/2023 1:41:55 PM",
    trigger = never(!SaneCheck) &&
        never(LifeLost) &&
        never(SubLocationMath != 0x0302) &&
        trigger_when(repeated(5, BunkFlowers > prev(BunkFlowers)))
)

achievement(
    title = "Max Vitality", points = 10,
    description = "Have 16 Health",
    id = 80668, badge = "87622", published = "8/18/2019 12:12:49 AM", modified = "1/23/2022 8:22:43 PM",
    trigger = SaneCheck && __ornext(prev(MaxHP) == 8 || prev(MaxHP) == 15) &&
        MaxHP == 16
)

JewelFire = byte(0xfffffe16 + GlobalPointer)
JewelWater = byte(0xfffffe17 + GlobalPointer)
JewelWind = byte(0xfffffe18 + GlobalPointer)
ActiveJewelExp = byte(0xfffffaaf + GlobalPointer)

achievement(
    title = "Jewel of Fire", points = 10,
    description = "Unlock and use your Red Hidden Powers",
    id = 80669, badge = "87623", published = "8/18/2019 12:12:59 AM", modified = "2/20/2020 4:19:15 PM",
    trigger = SaneCheck && JewelRedLevel == 9 && prev(JewelRedLevel) == 9 &&
        MissionDone(MissionOffsets[52]) &&
        JewelFire == 1 && prev(JewelFire) == 1 &&
        ActiveJewel == 1 && prev(ActiveJewel) == 1 &&
        ActiveJewelExp == 0 && prev(ActiveJewelExp) == 0x3c
)

achievement(
    title = "Jewel of Water", points = 10,
    description = "Unlock and use your Blue Hidden Powers",
    id = 80670, badge = "87624", published = "8/18/2019 12:13:04 AM", modified = "2/20/2020 4:19:36 PM",
    trigger = SaneCheck && JewelBlueLevel == 9 && prev(JewelBlueLevel) == 9 &&
        MissionDone(MissionOffsets[68]) &&
        JewelWater == 1 && prev(JewelWater) == 1 &&
        ActiveJewel == 2 && prev(ActiveJewel) == 2 &&
        ActiveJewelExp == 0 && prev(ActiveJewelExp) == 0x3c
)

achievement(
    title = "Jewel of Wind", points = 10,
    description = "Unlock and use your Green Hidden Powers",
    id = 80671, badge = "87625", published = "8/18/2019 12:13:09 AM", modified = "2/20/2020 4:19:47 PM",
    trigger = SaneCheck && JewelGreenLevel == 9 && prev(JewelGreenLevel) == 9 &&
        MissionDone(MissionOffsets[89]) &&
        JewelWind == 1 && prev(JewelWind) == 1 &&
        ActiveJewel == 3 && prev(ActiveJewel) == 3 &&
        ActiveJewelExp == 0 && prev(ActiveJewelExp) == 0x3c
)

achievement(
    title = "Adventurer Millionaire", points = 10,
    description = "Accumulate 1 Million Adventure Points",
    id = 80672, badge = "87626", published = "8/18/2019 12:13:19 AM", modified = "2/20/2020 3:47:23 PM",
    trigger = SaneCheck && prev(AdventurePoints) >= 490000 &&
        prev(AdventurePoints) < 1000000 &&
        measured(AdventurePoints >= 1000000)
)

TreasureData = [
    [1, 0x00],
    [6, 0x02],
    [7, 0x02],
    [5, 0x06],
    [6, 0x06],
    [0, 0x20],
    [5, 0x20],
    [0, 0x21],
    [3, 0x21],
    [0, 0x23],
    [1, 0x23],
    [2, 0x23],
    [3, 0x23],
    [0, 0x24],
    [1, 0x24],
    [0, 0x27],
    [1, 0x40],
    [2, 0x40],
    [3, 0x40],
    [4, 0x40],
    [5, 0x40],
    [6, 0x40],
    [7, 0x40],
    [0, 0x41],
    [1, 0x41],
    [2, 0x41],
    [3, 0x41],
    [4, 0x41],
    [5, 0x41],
    [6, 0x41],
    [7, 0x41],
    [0, 0x60],
    [1, 0x60],
    [2, 0x60],
    [3, 0x60],
    [4, 0x60],
    [3, 0x61],
    [4, 0x61],
    [5, 0x61],
    [6, 0x61],
    [1, 0x65],
    [2, 0x65],
    [3, 0x65],
    [4, 0x65],
    [5, 0x65],
    [6, 0x65],
    [7, 0x65],
    [0, 0x66],
    [1, 0x66],
    [2, 0x66],
    [3, 0x66],
    [4, 0x66],
    [0, 0x80],
    [1, 0x80],
    [2, 0x80],
    [3, 0x80],
    [4, 0x80],
    [5, 0x80],
    [6, 0x80],
    [7, 0x80],
    [6, 0x82],
    [7, 0x82],
    [0, 0xa0],
    [0, 0x120],
    [3, 0x120],
    [4, 0x120],
    [6, 0x120],
    [7, 0x120],
    [0, 0x121],
    [1, 0x121],
    [7, 0x122],
    [0, 0x123],
    [1, 0x123],
    [2, 0x123],
    [3, 0x123],
    [4, 0x123],
    [5, 0x123],
    [6, 0x123],
    [7, 0x141],
    [0, 0x142],
    [1, 0x142],
    [2, 0x142],
    [3, 0x142],
    [4, 0x142],
    [4, 0x145],
    [5, 0x145],
    [6, 0x145],
    [7, 0x145],
    [0, 0x146],
    [1, 0x146],
    [0, 0x146],
    [3, 0x146],
    [0, 0x219],
    [1, 0x6d0]
]

achievement(
    title = "Treasure Collector", points = 50,
    description = "Open every treasure chest",
    id = 83159, badge = "89742", published = "9/7/2019 2:54:28 AM", modified = "9/2/2022 8:26:56 PM",
    trigger = SaneCheck &&
        sum_of(TreasureData, d => prev(bit(d[0], d[1] + 0xfffff6a4 + GlobalPointer))) == 93 &&
        measured(sum_of(TreasureData, d => bit(d[0], d[1] + 0xfffff6a4 + GlobalPointer)) == 94)
)

// Leaderboards

leaderboard(
    id = 5960, title = "Speedrun",
    description = "Complete the game in the fastest time",
    start  = SaneCheck && byte(0x09C10C) == 0xFF && prev(byte(0x09C10C)) == 0x01,
    cancel = always_false(),
    submit = always_true(),
    value = InGameTime,
    format = "FRAMES"
)

leaderboard(
    id = 5961, title = "Adventure Points",
    description = "Complete the game with the most AP",
    start  = SaneCheck && byte(0x09C10C) == 0xFF && prev(byte(0x09C10C)) == 0x01,
    cancel = always_false(),
    submit = always_true(),
    value = AdventurePoints,
    format = "SCORE"
)

// Rich Presence

EmojiFire = "🔥"
EmojiWater = "🌊"
EmojiWind = "🌪️"

ActiveJewelLookup = {
    1: EmojiFire,
    2: EmojiWater,
    3: EmojiWind
}

RpLocation = rich_presence_lookup("Locale", SubLocationMath, SubLocationLookup, "some location")

rich_presence_conditional_display(
    SubLocationMath == 0x0d01,
    "Mission Success! Bracelet Secure!"
)

rich_presence_conditional_display(
    InGameTime != 0,
    "Tomba{4} is at {0} - HP {1}/{2} AP {3} {5}{6} {7}{8} {9}{10}",
    RpLocation,
    rich_presence_macro("Number", CurHP),
    rich_presence_macro("Number", MaxHP),
    rich_presence_macro("Number", AdventurePoints),
    rich_presence_lookup("Jewel", ActiveJewel, ActiveJewelLookup),
    EmojiFire,
    rich_presence_macro("Number", JewelRedLevel + 1),
    EmojiWind,
    rich_presence_macro("Number", JewelGreenLevel + 1),
    EmojiWater,
    rich_presence_macro("Number", JewelBlueLevel + 1)
)

rich_presence_conditional_display(
    GlobalPointer != 0,
    "Searching for Grandpa's Bracelet"
)

rich_presence_display("It's Tomba Time! Whoopee! (Camp)")
