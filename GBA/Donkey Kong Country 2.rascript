// Donkey Kong Country 2
// #ID = 751

// Variables

GameState = byte(0x6ba)

MusicId = word(0)

Mode = byte(0x5d0)
MainGame = Mode == 0
CoopGame = Mode == 1
DiddyDash = Mode == 2

Engine = byte(0x6d4)
EngineFunky = Engine == 2
EngineBird = Engine == 1
EngineBug = Engine == 4

NoCheats = unless(word(0x5d4) != 0)

MainWorld = word(0x638) // Should be byte
MainStage = word(0x63a) // Should be byte

DiddyDashProgress = byte(0x8f04)
DiddyDashFinish = prev(DiddyDashProgress) == 7 && DiddyDashProgress == 8

DiddyDashWorld = byte(0x6c6)
DiddyDashStage = byte(0x6c8)
DiddyDashTimer = word(0x818)

WorldLookup = {
    0: "Gangplank Galleon",
    1: "Crocodile Cauldron",
    2: "Krem Quay",
    3: "Krazy Kremland",
    4: "Gloomy Gulch",
    5: "K. Rool's Keep",
    6: "The Flying Krock",
    7: "Lost World",
    8: "The Overworld"
}

MainStageLookup = {
    0: "Pirate Panic",
    1: "Mainbrace Mayhem",
    2: "Cranky's Hut",
    3: "Gangplank Galley",
    4: "Kong Kollege",
    5: "Lockjaw's Locker",
    6: "Bonus Bonanza",
    7: "Topsail Trouble",
    8: "Funky's Flights II",
    9: "Krow's Nest",
    0x10: "Hot-Head Hop",
    0x11: "Bonus Bonanza",
    0x12: "Kannon's Klaim",
    0x13: "Funky's Flights II",
    0x14: "Lava Lagoon",
    0x15: "Kong Kollege",
    0x16: "Red-Hot Ride",
    0x17: "Cranky's Hut",
    0x18: "Squawks' Shaft",
    0x19: "Kleever's Kiln",
    0x1a: "Klubba's Kiosk",
    0x20: "Barrel Bayou",
    0x21: "Glimmer's Galleon",
    0x22: "Kong Kollege",
    0x23: "Funky's Flights II",
    0x24: "Krockhead Klamber",
    0x25: "Cranky's Hut",
    0x26: "Klubba's Kiosk",
    0x27: "Rattle Battle",
    0x28: "Slime Climb",
    0x29: "Bonus Bonanza",
    0x2a: "Bramble Blast",
    0x2b: "Kudgel's Kontest",
    0x30: "Hornet Hole",
    0x31: "Kong Kollege",
    0x32: "Target Terror",
    0x33: "Bramble Scramble",
    0x34: "Funky's Flights II",
    0x35: "Rickety Race",
    0x36: "Cranky's Hut",
    0x37: "Bonus Bonanza",
    0x38: "Mudhole Marsh",
    0x39: "Klubba's Kiosk",
    0x3a: "Rambi Rumble",
    0x3b: "King Zing Sting",
    0x40: "Ghostly Grove",
    0x41: "Cranky's Hut",
    0x42: "Haunted Hall",
    0x43: "Gusty Glade",
    0x44: "Kong Kollege",
    0x45: "Bonus Bonanza",
    0x46: "Parrot Chute Panic",
    0x47: "Klubba's Kiosk",
    0x48: "Funky's Flights II",
    0x49: "Web Woods",
    0x4a: "Kreepy Krow",
    0x50: "Arctic Abyss",
    0x51: "Klubba's Kiosk",
    0x52: "Cranky's Hut",
    0x53: "Castle Crush",
    0x54: "Clapper's Cavern",
    0x55: "Kong Kollege",
    0x56: "Windy Well",
    0x57: "Chain Link Chamber",
    0x58: "Funky's Flights II",
    0x59: "Toxic Tower",
    0x5a: "Bonus Bonanza",
    0x5b: "Stronghold Showdown",
    0x60: "Screech's Sprint",
    0x61: "Kong Kollege",
    0x62: "Funky's Flights II",
    0x63: "K. Rool Duel",
    0x70: "Klubba's Kiosk",
    0x71: "Krocodile Kore",
    0x72: "Cranky's Hut",
    0x73: "Jungle Jinx",
    0x74: "Fiery Furnace",
    0x75: "Black Ice Battle",
    0x76: "Klobber Karnage",
    0x77: "Animal Antics",
}

DiddyDashStageLookup = {
    0: "Pirate Panic",
    1: "Mainbrace Mayhem",
    2: "Gangplank Galley",
    3: "Lockjaw's Locker",
    4: "Topsail Trouble",
    10: "Hot-Head Hop",
    11: "Kannon's Klaim",
    12: "Lava Lagoon",
    13: "Red-Hot Ride",
    14: "Squawks' Shaft",
    20: "Barrel Bayou",
    21: "Glimmer's Galleon",
    22: "Krockhead Klamber",
    23: "Rattle Battle",
    24: "Slime Climb",
    25: "Bramble Blast",
    30: "Hornet Hole",
    31: "Target Terror",
    32: "Bramble Scramble",
    33: "Rickety Race",
    34: "Mudhole Marsh",
    35: "Rambi Rumble",
    40: "Ghostly Grove",
    41: "Haunted Hall",
    42: "Gusty Glade",
    43: "Parrot Chute Panic",
    44: "Web Woods",
    50: "Arctic Abyss",
    51: "Windy Well",
    52: "Castle Crush",
    53: "Clapper's Cavern",
    54: "Chain Link Chamber",
    55: "Toxic Tower",
    60: "Screech's Sprint",
    70: "Jungle Jinx",
    71: "Black Ice Battle",
    72: "Klobber Karnage",
    73: "Fiery Furnace",
    74: "Animal Antics"
}

DiddyDashCheevoData = [
    [0, 0, 0x4b0, "20 seconds"],
    [0, 1, 0x708, "30 seconds"],
    [0, 2, 0x708, "30 seconds"],
    [0, 3, 0xce4, "55 seconds"],
    [0, 4, 0xce4, "55 seconds"],
    [1, 0, 0xe10, "1 minute"],
    [1, 1, 0xd98, "58 seconds"],
    [1, 2, 0x1518, "1m30s"],
    [1, 3, 0x26ac, "2m45s"],
    [1, 4, 0xe10, "1 minute"],
    [2, 0, 0x1194, "1m15s"],
    [2, 1, 0x19c8, "1m50s"],
    [2, 2, 0xf3c, "1m5s"],
    [2, 3, 0xf3c, "1m5s"],
    [2, 4, 0x1068, "1m10s"],
    [2, 5, 0x17ac, "1m41s"],
    [3, 0, 0x1770, "1m40s"],
    [3, 1, 0x1464, "1m27s"],
    [3, 2, 0x1c20, "2 minutes"],
    [3, 3, 0x1518, "1m30s"],
    [3, 4, 0x1770, "1m40s"],
    [3, 5, 0x1518, "1m30s"],
    [4, 0, 0xe10, "1 minute"],
    [4, 1, 0x1af4, "1m55s"],
    [4, 2, 0x1068, "1m10s"],
    [4, 3, 0x1c20, "2 minutes"],
    [4, 4, 0x26ac, "2m45s"],
    [5, 0, 0x1770, "1m40s"],
    [5, 1, 0x2904, "2m55s"],
    [5, 2, 0x3e1c, "4m25s"],
    [5, 3, 0x1068, "1m10s"],
    [5, 4, 0x189c, "1m45s"],
    [5, 5, 0x1c20, "2 minutes"],
    [6, 0, 0x1c20, "2 minutes"],
    [7, 0, 0x1194, "1m15s"],
    [7, 1, 0x10e0, "1m12s"],
    [7, 2, 0x18d8, "1m46s"],
    [7, 3, 0x1770, "1m40s"],
    [7, 4, 0x2a30, "3 minutes"],
]

FunkyFlightStage = byte(0x76d)
FunkyFlightRemainingTimer = word(0x6028)
FunkyRunningTimer = word(0x6028)
FunkyFlightMode = byte(0x76c) < 2

// Cheevos

function DiddyDashCheevo(row) {
    title = DiddyDashStageLookup[row[0] * 10 + row[1]]
    achievement(
        title = title,
        description = format("Beat {0} in less than {1} in Diddy's Dash.", title, row[3]),
        points = 5,
        trigger = DiddyDash && NoCheats &&
            DiddyDashWorld == row[0] && DiddyDashStage == row[1] &&
            DiddyDashTimer < row[2] && trigger_when(DiddyDashFinish)
    )
}

for i in DiddyDashCheevoData {
    DiddyDashCheevo(i)
}

achievement(
    title = "Kranked", points = 25,
    description = "Beat all of Cranky's times in Diddy's Dash.",
    id = 21986, badge = "21874", published = "3/26/2015 3:27:09 AM", modified = "10/14/2019 3:30:01 PM",
    trigger = DiddyDashWorld < 0x09 && DiddyDashStage < 0x09 && DiddyDashTimer < 0x9000 && NoCheats && 
              word(0x00082C) < 0x1FF && bit2(0x00082C) == 0x01 && bit1(0x00082C) == 0x01 && bit0(0x00082C) == 0x01 && 
              word(0x000832) == 0x00 && word(0x000830) < 0x4B0 && word(0x000830) != 0x00 &&
              any_of(range(0, 38), s => word(0x830 + (s * 4)) != word(0x8c3c + (s * 4)))
)

FunkyFlightStageOrderLookup = {
    0: "Aerial Loop",
    1: "Submerged Stint",
    2: "Kongstruction",
    3: "Kongnapped",
    4: "Cool Sounds",
    5: "Kongnapped 2",
    6: "Toxic Kongstruction"
}

FunkyFlightStageLookup = {
    1: "Aerial Loop",
    2: "Kongnapped",
    3: "Kongstruction",
    4: "Cool Sounds",
    5: "Submerged Stint",
    6: "Kongnapped 2",
    7: "Toxic Kongstruction",
}

FunkyFlightSpeedrunData = [
    [1, 0x3e1c, "35 seconds", 0x2152c, 0x14],
    [5, 0x78b3, "1m25s", 0xe998, 0x01],
    [3, 0x3138, "1m30s", 0x1e734, 0x01],
    [2, 0x3cf0, "40 seconds", 0x2238c, 0x05],
    [4, 0x13ec, "1m35s", 0x25730, 0x01],
    [6, 0x13ec, "1m35s", 0xc7dc, 0x05],
    [7, 0x56b7, "3m50s", 0xcd90, 0x01]
]

function FunkyFlightSpeedrunCheevo(row) {
    title = FunkyFlightStageLookup[row[0]]
    achievement(
        title = title,
        description = format("Beat {0} in less than {1} seconds in Funky's Flights.", title, row[2]),
        points = 5,
        trigger = EngineFunky && byte(0x76c) < 2 && FunkyFlightStage == row[0] &&
            FunkyFlightRemainingTimer > row[1] &&
            trigger_when(prev(byte(row[3])) == row[4] && byte(row[3]) == row[4] + 1)
    )
}

for i in FunkyFlightSpeedrunData {
    FunkyFlightSpeedrunCheevo(i)
}

function FunkyDeltaProtection(base) {
    targets = []
    for i in range(0, 6) {
        case = always_true()
        if i == 0 {
            case = case && __ornext(prev(word(base)) == 0 || prev(word(base)) >= 0x834)
        }
        else {
            case = case && prev(word(base)) < 0x834
        }
        if i == 1 {
            case = case && __ornext(prev(word(base + 4) )== 0 || prev(word(base + 4)) >= 0x13ec)
        }
        else {
            case = case && prev(word(base + 4)) < 0x13ec
        }
        if i == 2 {
            case = case && __ornext(prev(word(base + 8)) == 0 || prev(word(base + 8)) >= 0x1518)
        }
        else {
            case = case && prev(word(base + 8)) < 0x1518
        }
        if i == 3 {
            case = case && __ornext(prev(word(base + 12)) == 0 || prev(word(base + 12)) >= 0x960)
        }
        else {
            case = case && prev(word(base + 12)) < 0x960
        }
        if i == 4 {
            case = case && __ornext(prev(word(base + 16)) == 0 || prev(word(base + 16)) >= 0x1644)
        }
        else {
            case = case && prev(word(base + 16)) < 0x1644
        }
        if i == 5 {
            case = case && __ornext(prev(word(base + 20)) == 0 || prev(word(base + 20)) >= 0x1644)
        }
        else {
            case = case && prev(word(base + 20)) < 0x1644
        }
        if i == 5 {
            case = case && __ornext(prev(word(base + 24)) == 0 || prev(word(base + 24)) >= 0x35e8)
        }
        else {
            case = case && prev(word(base + 24)) < 0x35e8
        }
        array_push(targets, case)
    }
    return targets
}

FunkyBestTime = {
    0: 0x834,
    1: 0x13ec,
    2: 0x1518,
    3: 0x960,
    4: 0x1644,
    5: 0x1644,
    6: 0x35e8
}

function FunkyFastFlier(base) {
    funCurr = []
    funPrev = []
    for i in FunkyBestTime {
        mem = word(base + i * 4)
        array_push(funCurr, once(mem < FunkyBestTime[i] && mem != 0))
        array_push(funPrev, once(prev(mem) < FunkyBestTime[i] && prev(mem) != 0))
    }
    allHits = measured(tally_of(funCurr, 7, s => once(s)))
    oneMore = tally_of(funPrev, 6, s => once(s))
    tooMuch = unless(tally_of(funPrev, 7, s => once(s)))
    
    return oneMore && allHits && tooMuch
}

achievement(
    title = "Funky Fast Flier", points = 10,
    description = "Earn all Funky's Flights speedrun achievements (all in Main or all in Bonus).",
    id = 21994, badge = "21876", published = "3/26/2015 3:27:23 AM", modified = "10/2/2019 12:40:01 PM",
    trigger = word(0x0006D4) < 0x05 && FunkyFlightMode &&
              ((word(0x000798) < 0x834 && word(0x00079C) < 0x13EC && word(0x0007A0) < 0x1518 && word(0x0007A4) < 0x960 && 
                word(0x0007A8) < 0x1644 && word(0x0007AC) < 0x1644 && word(0x0007B0) < 0x35E8 && word(0x0007B0) != 0x00 && 
                word(0x0007B2) == 0x00 && FunkyFastFlier(0x798)) ||
               (FunkyFastFlier(0x7cc)))
)

achievement(
    title = "Bag a Bug", points = 5,
    description = "Bag 20 or more bugs in Bag a Bug.",
    id = 21995, badge = "21875", published = "3/26/2015 3:27:25 AM", modified = "12/2/2019 4:55:25 PM",
    trigger = EngineBug &&
              ((byte(0x01007C) > 0x13 && byte(0x01007C) < 0x32 && byte(0x010014) == 0x06 && word(0x010058) == 0x00) ||
               (byte(0x010174) > 0x13 && byte(0x010174) < 0x32 && byte(0x010108) == 0x06 && word(0x010150) == 0x00))
)

BossSpeedCheevoData = [
    ["Krow", 0, 9, 0xe10, "1 minute",],
    ["Kleever", 1, 9, 0x12c0, "1m20s"],
    ["Kudgel", 2, 11, 0x1554, "1m31s"],
    ["King Zing Sting", 3, 11, 0x1068, "1m10s"],
    ["Kreepy Krow", 4, 10, 0x1068, "1m10s"],
    ["Kerozene", 5, 11, 0x1644, "1m35s"],
]

BossSpeedrunWin = prev(word(0x8e8c)) == 1 && trigger_when(word(0x8e8c) == 4)
BossTimer = word(0x8e94)

function BossSpeedCheevo(row) {
    title = row[0]
    if (row[1] == 0) {
        title = "Klobbered " + title
    }
    achievement(
        title = title,
        description = format("Defeat {0} in less than {1} in a timed fight.", row[0], row[4]),
        points = 5,
        trigger = MainGame && MainWorld == row[1] && MainStage == row[2] &&
            BossTimer < row[3] && BossSpeedrunWin
    )
}

for i in BossSpeedCheevoData {
    BossSpeedCheevo(i)
}

achievement(
    title = "K-O-N-G", points = 1,
    description = "Find all KONG letters in a stage.",
    id = 22002, badge = "21873", published = "3/26/2015 3:27:37 AM", modified = "3/26/2015 7:34:59 PM",
    trigger = MainGame && MainWorld < 0x0F && bit3(0x0005D4) == 0x00 && word(0x0001E4) == 0x02 && 
              word(0x0001E8) == 0x02 && word(0x0001EC) == 0x02 && word(0x0001F0) == 0x02
)

NoFreedom = bit3(0x5d4) == 0

ProgressiveBossData = [
    ["Gangplank Galleon", 0, 4, 0x663],
    ["Crocodile Cauldron", 1, 5, 0x663],
    ["Krem Quay", 2, 6, 0x663],
    ["Krazy Kremland", 3, 7, 0x663],
    ["Gloomy Gulch", 4, 0, 0x664],
    ["K. Rool's Keep", 5, 1, 0x664]
]

function ProgressiveBossCheevo(row) {
    tbit = bit(row[2], row[3])
    achievement(
        title = row[0],
        description = format("Defeat the boss of {0}.", row[0]),
        points = 5,
        trigger = MainGame && NoFreedom && byte(0x64b) != 0xff &&
            MainWorld == row[1] && tbit > prev(tbit) &&
            MusicId != 0x11
    )
}

for i in ProgressiveBossData {
    ProgressiveBossCheevo(i)
}

Krool1 = bit2(0x664)
Krool2 = bit5(0x64b)

achievement(
    title = "Kruel", points = 10,
    description = "Defeat Kaptain K. Rool and rescue Donkey Kong.",
    id = 22009, badge = "21855", published = "3/26/2015 3:27:49 AM", modified = "3/26/2015 7:35:11 PM",
    trigger = MainGame && MainWorld < 0x0F && bit3(0x0005D4) == 0x00 && Krool1 > prev(Krool1) && 
              byte(0x00064B) != 0xFF && MusicId != 0x11
)

achievement(
    title = "Kapsized", points = 10,
    description = "Defeat the boss of Lost World.",
    id = 22010, badge = "21856", published = "3/26/2015 3:27:51 AM", modified = "10/14/2019 3:30:01 PM",
    trigger = MainGame && MainWorld < 0x0F && bit3(0x0005D4) == 0x00 && Krool2 > prev(Krool2) && 
              byte(0x00064B) != 0xFF && MusicId != 0x11
)

W1Items = [
    bit4(0x663), bit0(0x665), bit1(0x665), bit2(0x665),
    bit3(0x665), bit4(0x665), bit0(0x66f), bit1(0x66f),
    bit2(0x66f), bit3(0x66f), bit4(0x66f), bit5(0x66f),
    bit0(0x65b), bit1(0x65b), bit2(0x65b), bit3(0x65b),
    bit4(0x65b), bit5(0x65b), bit0(0x660), bit1(0x660),
    bit2(0x660), bit0(0x662), bit5(0x66c), bit6(0x66b)
]

W2Items = [
    bit5(0x663), bit5(0x665), bit6(0x665), bit7(0x665),
    bit0(0x666), bit1(0x666), bit6(0x66f), bit7(0x66f),
    bit0(0x670), bit1(0x670), bit2(0x670), bit6(0x65b),
    bit7(0x65b), bit0(0x65c), bit1(0x65c), bit2(0x65c),
    bit3(0x65c), bit4(0x65c), bit3(0x660), bit4(0x660),
    bit5(0x660), bit1(0x662), bit2(0x662), bit7(0x66b),
    bit6(0x66c)
]

W3Items = [
    bit6(0x663), bit5(0x65c), bit6(0x65c), bit7(0x65c),
    bit0(0x65d), bit1(0x65d), bit2(0x65d), bit3(0x65d),
    bit6(0x660), bit7(0x660), bit0(0x661), bit3(0x662),
    bit4(0x662), bit2(0x666), bit3(0x666), bit4(0x666),
    bit5(0x666), bit6(0x666), bit7(0x666), bit3(0x670),
    bit4(0x670), bit5(0x670), bit6(0x670), bit7(0x670),
    bit0(0x671), bit0(0x66c), bit7(0x66c)
]

W4Items = [
    bit7(0x663), bit4(0x65d), bit5(0x65d), bit6(0x65d),
    bit7(0x65d), bit0(0x65e), bit1(0x661), bit2(0x661),
    bit3(0x661), bit4(0x661), bit5(0x662), bit6(0x662),
    bit0(0x667), bit1(0x667), bit2(0x667), bit3(0x667),
    bit4(0x667), bit5(0x667), bit1(0x671), bit2(0x671),
    bit3(0x671), bit4(0x671), bit5(0x671), bit6(0x671),
    bit0(0x66d), bit1(0x66c)
]

W5Items = [
    bit0(0x664), bit1(0x65e), bit2(0x65e), bit3(0x65e),
    bit4(0x65e), bit5(0x65e), bit6(0x65e), bit7(0x65e),
    bit5(0x661), bit7(0x662), bit0(0x663), bit1(0x663),
    bit6(0x667), bit7(0x667), bit0(0x668), bit1(0x668),
    bit2(0x668), bit7(0x671), bit0(0x672), bit1(0x672),
    bit2(0x672), bit3(0x672), bit2(0x66c), bit1(0x66d)
]

W6Items = [
    bit1(0x664), bit0(0x65f), bit1(0x65f), bit2(0x65f),
    bit3(0x65f), bit4(0x65f), bit5(0x65f), bit6(0x65f),
    bit6(0x661), bit7(0x661), bit2(0x663), bit3(0x663),
    bit3(0x668), bit4(0x668), bit5(0x668), bit6(0x668),
    bit7(0x668), bit0(0x669), bit4(0x672), bit5(0x672),
    bit6(0x672), bit7(0x672), bit0(0x673), bit1(0x673),
    bit3(0x66c), bit2(0x66d)
]

W7Items = [
    bit2(0x664), bit7(0x65f), bit1(0x669), bit2(0x673), bit3(0x66d)
]

W8Items = [
    bit5(0x64b), bit4(0x66c), bit2(0x669), bit3(0x669),
    bit4(0x669), bit5(0x669), bit6(0x669), bit3(0x673),
    bit4(0x673), bit5(0x673), bit6(0x673), bit7(0x673)
]

Pages = [
    bit7(0x669), bit0(0x66a), bit1(0x66a), bit2(0x66a),
    bit3(0x66a), bit4(0x66a), bit5(0x66a), bit6(0x66a),
    bit7(0x66a), bit0(0x66b), bit1(0x66b), bit2(0x66b),
    bit3(0x66b), bit4(0x66b), bit5(0x66b)
]

FunkyItems = [
    bit5(0x66c), bit6(0x66c), bit7(0x66c), bit0(0x66d), bit1(0x66d), bit2(0x66d), bit3(0x66d)
]

ExpressoItems = [
    bit6(0x66b),
    bit7(0x66b),
    bit0(0x66c),
    bit1(0x66c),
    bit2(0x66c),
    bit3(0x66c),
    bit4(0x66c),
]

SwankyQuizzes = [
    bit0(0x68c), bit1(0x68c), bit2(0x68c), bit3(0x68c),
    bit4(0x68c), bit5(0x68c), bit6(0x68c), bit7(0x68c),
    bit0(0x68d), bit1(0x68d), bit2(0x68d), bit3(0x68d),
    bit4(0x68d), bit5(0x68d), bit6(0x68d), bit7(0x68d),
    bit0(0x68e), bit1(0x68e)
]

WrinklyHints = [
    bit4(0x680), bit5(0x680), bit6(0x680), bit7(0x680),
    bit1(0x680), bit2(0x680), bit3(0x680),
    bit0(0x681), bit1(0x681), bit2(0x681), bit3(0x681),
    bit4(0x681), bit5(0x681), bit6(0x681), bit7(0x681),
    bit0(0x682), bit1(0x682), bit2(0x682), bit3(0x682),
    bit4(0x682), bit5(0x682), bit6(0x682), bit7(0x682),
    bit0(0x683), bit1(0x683), bit2(0x683), bit3(0x683),
    bit4(0x683), bit5(0x683), bit6(0x683), bit7(0x683),
    bit0(0x684), bit1(0x684), bit2(0x684), bit3(0x684),
    bit4(0x684), bit5(0x684), bit6(0x684), bit7(0x684),
    bit0(0x685), bit1(0x685), bit2(0x685), bit3(0x685),
    bit4(0x685), bit5(0x685), 
]

CrankyHints = [
    bit7(0x686),
    bit0(0x687), bit1(0x687), bit2(0x687), bit3(0x687),
    bit4(0x687), bit5(0x687), bit6(0x687), bit7(0x687),
    bit0(0x688), bit1(0x688), bit2(0x688), bit3(0x688),
    bit4(0x688), bit5(0x688), bit6(0x688), bit7(0x688),
    bit0(0x689), bit1(0x689), bit2(0x689), bit3(0x689),
    bit4(0x689), bit5(0x689), bit6(0x689), bit7(0x689),
    bit0(0x68a), bit1(0x68a), bit2(0x68a), bit3(0x68a),
    bit4(0x68a), bit5(0x68a), bit6(0x68a), bit7(0x68a),
    bit0(0x68b), bit1(0x68b), bit2(0x68b), bit3(0x68b),
    bit4(0x68b), bit5(0x68b), bit6(0x68b), bit7(0x68b),
]

function CollectionProtection(coll) {
    curr = []
    prev = []
    for i in coll {
        array_push(curr, i)
        array_push(prev, prev(i))
    }
    allHits = measured(
        sum_of(curr, s => s) == length(coll),
        when=byte(0x6c4) == 1)
    oneMore = sum_of(prev, s => s) == length(coll) - 1
    //tooMuch = unless(tally_of(prev, length(coll), s => once(s)))
    
    return oneMore && allHits// && tooMuch
}

KollectorData = [
    ["Gangplank Galleon", "DK Coins, Kremkoins, and Feathers", 10, W1Items],
    ["Crocodile Cauldron", "DK Coins, Kremkoins, and Feathers", 10, W2Items],
    ["Krem Quay", "DK Coins, Kremkoins, and Feathers", 10, W3Items],
    ["Krazy Kremland", "DK Coins, Kremkoins, and Feathers", 10, W4Items],
    ["Gloomy Gulch", "DK Coins, Kremkoins, and Feathers", 10, W5Items],
    ["K. Rool's Keep", "DK Coins, Kremkoins, and Feathers", 10, W6Items],
    ["The Flying Krock", "DK Coins, Kremkoins, and Feathers", 5, W7Items],
    ["Lost World", "DK Coins and Feathers", 10, W8Items]
]

function KollectorCheevo(row) {
    achievement(
        title = row[0] + " Kollector",
        description = format("Collect all {0} in {1}.", row[1], row[0]),
        points = row[2],
        trigger = MainGame && MainWorld < 0x0f && bit3(0x5d4) == 0 && byte(0x64b) != 0xff &&
            CollectionProtection(row[3])
    )
}

for i in KollectorData {
    KollectorCheevo(i)
}

achievement(
    title = "Kapture The Memories", points = 25,
    description = "Complete all pages of the scrapbook.",
    id = 22019, badge = "21865", published = "3/26/2015 3:28:08 AM", modified = "10/31/2019 12:52:36 AM",
    trigger = MainGame && MainWorld < 0x0F && bit3(0x0005D4) == 0x00 && byte(0x00064B) != 0xFF && 
              CollectionProtection(Pages)
)

AllBits = []
for i in W1Items {
    array_push(AllBits, i)
}
for i in W2Items {
    array_push(AllBits, i)
}
for i in W3Items {
    array_push(AllBits, i)
}
for i in W4Items {
    array_push(AllBits, i)
}
for i in W5Items {
    array_push(AllBits, i)
}
for i in W6Items {
    array_push(AllBits, i)
}
for i in W7Items {
    array_push(AllBits, i)
}
for i in W8Items {
    array_push(AllBits, i)
}
for i in Pages {
    array_push(AllBits, i)
}
for i in ExpressoItems {
    array_push(AllBits, i)
}

// Ticket 63514: I've completed the required statement to unlock the Achievement, yet it doesn't unlock!
//               
//               I'm playing on Pizza Boy Pro
//               Version: 2.6.9
//               RetroAchievements Hash: a1f160ee30ed36edea341a6f1c6a4efc
//               Emulator: RAVBA
//               Emulator Version: 2.6.9
achievement(
    title = "Konquered", points = 25,
    description = "Achieve 102% completion.",
    id = 22020, badge = "21866", published = "3/26/2015 3:28:10 AM", modified = "10/31/2019 12:52:40 AM",
    trigger = MainGame && MainWorld < 0x0F && bit3(0x0005D4) == 0x00 && byte(0x00064B) != 0xFF && 
              CollectionProtection(AllBits)
)

achievement(
    title = "Funky", points = 10,
    description = "Acquire all DK Coins from all of Funky's challenges.",
    id = 22021, badge = "21867", published = "3/26/2015 3:28:12 AM", modified = "10/31/2019 12:52:44 AM",
    trigger = MainGame && MainWorld < 0x0F && bit3(0x0005D4) == 0x00 && byte(0x00064B) != 0xFF && 
              CollectionProtection(FunkyItems)
)

achievement(
    title = "Expresso", points = 10,
    description = "Acquire all DK Coins from all of Expresso's races.",
    id = 22022, badge = "21868", published = "3/26/2015 3:28:13 AM", modified = "10/31/2019 12:52:49 AM",
    trigger = MainGame && MainWorld < 0x0F && bit3(0x0005D4) == 0x00 && byte(0x00064B) != 0xFF && 
              CollectionProtection(ExpressoItems)
)

achievement(
    title = "Swanky", points = 10,
    description = "Complete all of Swanky's quizzes at all of his locations",
    id = 22023, badge = "21869", published = "3/26/2015 3:28:15 AM", modified = "10/31/2019 12:52:52 AM",
    trigger = MainGame && MainWorld < 0x0F && bit3(0x0005D4) == 0x00 && byte(0x00064B) != 0xFF && 
              CollectionProtection(SwankyQuizzes)
)

achievement(
    title = "Wrinkly", points = 10,
    description = "Receive all of Wrinkly's tips from all of her locations.",
    id = 22024, badge = "21870", published = "3/26/2015 3:28:16 AM", modified = "10/31/2019 12:52:56 AM",
    trigger = MainGame && MainWorld < 0x0F && bit3(0x0005D4) == 0x00 && byte(0x00064B) != 0xFF && 
              CollectionProtection(WrinklyHints)
)

achievement(
    title = "Cranky", points = 10,
    description = "Receive all of Cranky's tips from all of his locations.",
    id = 22025, badge = "21871", published = "3/26/2015 3:28:18 AM", modified = "10/31/2019 12:53:00 AM",
    trigger = MainGame && MainWorld < 0x0F && bit3(0x0005D4) == 0x00 && byte(0x00064B) != 0xFF && 
              CollectionProtection(CrankyHints)
)

FileInGameTime = dword(0x5d8)

achievement(
    title = "Kursory Kong", points = 50,
    description = "Complete the game in less than 1 hour and 30 minutes.",
    id = 22026, badge = "21872", published = "3/26/2015 3:28:19 AM", modified = "10/31/2019 12:53:05 AM",
    trigger = MainGame && MainWorld == 0x06 && bit3(0x0005D4) == 0x00 && byte(0x00064B) != 0xFF && 
              MainStage == 0x03 && word(0x0005DA) > 0x01 && word(0x0005DA) < 0x05 && bit1(0x00064C) == 0x01 && 
              bit3(0x00064B) == 0x01 && MusicId == 0x27 && prev(MusicId) == 0x25 &&
              FileInGameTime < 0x4f1a0
)

// Leaderboards

leaderboard(
    id = 231, title = "Any% Speedrun",
    description = "Beat the game as fast as you can. (Submit at The Flying Krock Boss)",
    start  = MainGame && MainWorld == 0x06 && byte(0x0005D4) < 0x08 && byte(0x00064B) != 0xFF && 
             MainStage == 0x03 && word(0x0005DA) > 0x01 && word(0x0005DA) < 0x200 && byte(0x00064C) > 0x01 && 
             byte(0x00064C) < 0x04 && MusicId == 0x27 && prev(MusicId) == 0x25,
    cancel = MusicId != 0x27,
    submit = MainGame && MainWorld == 0x06 && byte(0x0005D4) < 0x08 && byte(0x00064B) != 0xFF && 
             MainStage == 0x03 && word(0x0005DA) > 0x01 && word(0x0005DA) < 0x200 && byte(0x00064C) > 0x01 && 
             byte(0x00064C) < 0x04 && MusicId == 0x27 && prev(MusicId) == 0x27,
    value = FileInGameTime,
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 727, title = "102% Speedrun",
    description = "Beat the game as fast as you can with 102% completion. (Submit at Lost World Boss)",
    start  = MainGame && MainWorld == 0x07 && byte(0x0005D4) < 0x08 && byte(0x00064B) != 0xFF && 
             MainStage == 0x01 && word(0x0005DA) > 0x01 && word(0x0005DA) < 0x200 && byte(0x00064C) > 0x01 && 
             byte(0x00064C) < 0x04 && MusicId == 0x27 && prev(MusicId) == 0x25 && word(0x00065B) == 0xFFFF && 
             word(0x00065D) == 0xFFFF && word(0x00065F) == 0xFFFF && word(0x000661) == 0xFFFF && byte(0x000663) == 0xFF && 
             byte(0x000664) >= 0x07 && word(0x000665) == 0xFFFF && word(0x000667) == 0xFFFF && word(0x000669) == 0xFFFF && 
             word(0x00066B) == 0xFFFF && word(0x00066F) == 0xFFFF && word(0x000671) == 0xFFFF && byte(0x000673) == 0xFF && 
             byte(0x00066D) >= 0x0F,
    cancel = MusicId != 0x27,
    submit = MainGame && MainWorld == 0x07 && byte(0x0005D4) < 0x08 && byte(0x00064B) != 0xFF && 
             MainStage == 0x01 && word(0x0005DA) > 0x01 && word(0x0005DA) < 0x200 && byte(0x00064C) > 0x01 && 
             byte(0x00064C) < 0x04 && MusicId == 0x27 && prev(MusicId) == 0x27 && word(0x00065B) == 0xFFFF && 
             word(0x00065D) == 0xFFFF && word(0x00065F) == 0xFFFF && word(0x000661) == 0xFFFF && byte(0x000663) == 0xFF && 
             byte(0x000664) >= 0x07 && word(0x000665) == 0xFFFF && word(0x000667) == 0xFFFF && word(0x000669) == 0xFFFF && 
             word(0x00066B) == 0xFFFF && word(0x00066F) == 0xFFFF && word(0x000671) == 0xFFFF && byte(0x000673) == 0xFF && 
             byte(0x00066D) >= 0x0F,
    value = FileInGameTime,
    format = "FRAMES", lower_is_better = true
)

function DiddyDashLeaderboard(id) {
    world = id / 10
    stage = id % 10
    title = DiddyDashStageLookup[id]
    leaderboard(
        title = title,
        description = format("Finish {0} as fast as you can in Diddy's Dash.", title),
        start = DiddyDashWorld == world && DiddyDashStage == stage &&
            word(0x81a) == 0 && DiddyDashTimer == 0 && DiddyDashProgress == 0 && NoCheats && DiddyDash,
        cancel = byte(0x5d0) != 2,
        submit = DiddyDashTimer > 0 && DiddyDashFinish,
        value = DiddyDashTimer,
        format = "FRAMES",
        lower_is_better = true
    )
}


for i in DiddyDashStageLookup {
    DiddyDashLeaderboard(i)
}

FunkyValueLookup = {
    1: 18000,
    2: 18000,
    3: 18000,
    4: 10800,
    5: 35999,
    6: 10800,
    7: 35999
}

function FunkyFlightLeaderboard(row) {
    title = FunkyFlightStageLookup[row[0]]
    leaderboard(
        title = title,
        description = format("Finish {0} as fast as you can in Funky's Flights.", title),
        start = EngineFunky && prev(Engine) == 2 && FunkyFlightMode && FunkyFlightStage == row[0] &&
            word(row[3]) == 0 && byte(row[3] - 4) == row[4] + 1,
        cancel = !EngineFunky,
        submit = prev(word(row[3])) == row[4] && word(row[3]) == row[4] + 1,
        value = FunkyValueLookup[row[0]] - FunkyRunningTimer,
        format = "FRAMES",
        lower_is_better = true
    )
}

for i in FunkyFlightSpeedrunData {
    FunkyFlightLeaderboard(i)
}

// Rich Presence

EmojiTimer = "⏲️"
EmojiBalloon = "🎈"

RpFunkyStage = rich_presence_lookup("FunkyStage", FunkyFlightStage, FunkyFlightStageLookup)
RpWorld = rich_presence_lookup("World", MainWorld, WorldLookup)

rich_presence_conditional_display(
    byte(0x5d4) != 0,
    "Have Diddy and Dixie joined the Kremling Krew?"
)

rich_presence_conditional_display(
    GameState <= 1,
    "Hoist the flag! We're off to Krem Isle!"
)

ExpressoTrackLookup = {
    0: "Ship Deck Dash",
    1: "Magma Spurt",
    2: "Swampy Swoop",
    3: "Fairground Fall",
    4: "Spooky Sprint",
    5: "Castle Creep",
    6: "Lost World Leap"
}

rich_presence_conditional_display(
    EngineBird,
    "Racing with the other birds in {0}.",
    rich_presence_lookup("ExpressoRace", byte(0x6de), ExpressoTrackLookup)
)

rich_presence_conditional_display(
    EngineBug,
    "Collected {0} bugs from Klubba in Bag a Bug.",
    rich_presence_macro("Number", byte(0x1007c))
)

rich_presence_conditional_display(
    EngineFunky,
    "Working for Funky in {0}. {1}{2}",
    RpFunkyStage,
    EmojiTimer,
    rich_presence_value("FunkyTimer", FunkyRunningTimer, "FRAMES")
)

BonusGameLookup = {
    0: "Expresso's Racing",
    1: "Funky's Flights",
    2: "Bag a Bug"
}

rich_presence_conditional_display(
    GameState == 0x02,
    "Will the Kong Quest begin or will distractions take over?"
)

rich_presence_conditional_display(
    GameState == 0x03,
    "Thinking of playing {0} instead of going on the Kong Quest.",
    rich_presence_lookup("BonusGame", byte(0xd8e8), BonusGameLookup)
)

rich_presence_conditional_display(
    GameState == 0x04 || GameState == 0x0b,
    "Preparing for Expresso's Racing."
)

rich_presence_conditional_display(
    GameState == 0x05,
    "Thinking of racing {0} laps in {1} with Expresso.",
    rich_presence_macro("Number", byte(0xd82c)),
    rich_presence_lookup("ExpressoRace", byte(0xd82a), ExpressoTrackLookup)
)

rich_presence_conditional_display(
    GameState == 0x07,
    "Customizing some options before racing with Expresso."
)

rich_presence_conditional_display(
    GameState == 0x13,
    "Looking at the best lap times for Expresso's Racing."
)

rich_presence_conditional_display(
    GameState == 0x14,
    "Thinking of flying in {0} for Funky.",
    rich_presence_lookup("FunkyStageOrder", byte(0xd70e), FunkyFlightStageOrderLookup)
)

rich_presence_conditional_display(
    GameState == 0x17,
    "Finished {0} with {1}{2} remaining.",
    RpFunkyStage,
    EmojiTimer,
    rich_presence_value("FunkyTimer", FunkyRunningTimer, "FRAMES")
)

rich_presence_conditional_display(
    GameState == 0x19,
    "Receiving instructions for {0} from Funky.",
    RpFunkyStage
)

rich_presence_conditional_display(
    GameState == 0x1b,
    "Want to play Bag a Bug? Klubba looks threatening..."
)

rich_presence_conditional_display(
    ((MusicId == 0x16 && prior(MusicId) == 0x11) ||
    (MusicId == 0x17 && prior(MusicId) == 0x16)),
    "Wait, intro cutscenes now?"
)

rich_presence_conditional_display(
    GameState >= 0x1d && GameState <= 0x1e && MainWorld == 6 &&
    ((MusicId == 0x27 && prior(MusicId) == 0x25) || 
    (MusicId == 0x09 && prior(MusicId) == 0x27)),
    "Kaptain K. Rool is walking the plank."
)

rich_presence_conditional_display(
    GameState >= 0x1d && GameState <= 0x1e && MainWorld == 7 &&
    ((MusicId == 0x27 && prior(MusicId) == 0x25) || 
    (MusicId == 0x09 && prior(MusicId) == 0x27)),
    "Kaptain K. Rool is walking the plank. Again."
)

rich_presence_conditional_display(
    GameState >= 0x1d && GameState <= 0x1e && MainWorld == 8,
    "Diddy & Dixie are figuring out where to go on Krem Isle."
)

rich_presence_conditional_display(
    MusicId == 0x26,
    "Give The Kast of Kharacters a hand."
)

rich_presence_conditional_display(
    GameState == 0x26 || byte(0x5e4) == 0xff,
    "Diddy & Dixie are walking the plank."
)

rich_presence_conditional_display(
    GameState == 0x23,
    "Are Diddy & Dixie heroes to Cranky?"
)

rich_presence_conditional_display(
    GameState == 0x1f || GameState == 0x21,
    "Departing for the Kong Quest momentarily."
)

rich_presence_conditional_display(
    GameState == 0x22,
    "...what are Diddy and Dixie doing?"
)

rich_presence_conditional_display(
    DiddyDash,
    "Dashing with Diddy through {0} in {1}. {2}{3}",
    rich_presence_lookup("DiddyStage", DiddyDashWorld * 10 + DiddyDashStage, DiddyDashStageLookup),
    rich_presence_lookup("World", DiddyDashWorld, WorldLookup),
    EmojiTimer,
    rich_presence_value("FunkyTimer", DiddyDashTimer, "FRAMES")
    
)

rich_presence_conditional_display(
    GameState == 0x2a || GameState == 0x2b || GameState == 0x2d,
    "Preparing to Dash with Diddy."
)

rich_presence_conditional_display(
    GameState == 0x27,
    "Completed Dashing with Diddy through {0} in {1}.",
    rich_presence_lookup("DiddyStage", DiddyDashWorld * 10 + DiddyDashStage, DiddyDashStageLookup),
    rich_presence_lookup("World", DiddyDashWorld, WorldLookup)
)

rich_presence_display(
    "Diddy & Dixie are at {1} within {2}. {3}{4} {5}{6}",
    "fighting",
    rich_presence_lookup("Stage", MainWorld * 16 + MainStage, MainStageLookup, "Some Location"),
    RpWorld,
    EmojiBalloon,
    rich_presence_macro("Number", byte(0x5e4)),
    "🍌",
    rich_presence_macro("Number", byte(0x5f6))
)
