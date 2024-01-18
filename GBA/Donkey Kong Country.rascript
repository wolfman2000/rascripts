// Donkey Kong Country
// #ID = 750

// Variables

MusicId = byte(0)
GlobalState = byte(0x7ef0)
PartialState = byte(0xa738)
DKAttackMiniState = byte(0x1008)
OverworldArea = byte(0x100c)
LevelNumber = byte(0x1010)
Lives = byte(0xfc8)
Bananas = word(0xfdc)

OnMenus = GlobalState == 0x89
OnMap = GlobalState == 0x95

DKAttackLevelSelect = MusicId == 6 &&
    DKAttackMiniState == 0x10

DKAttackSecondsLeft = byte(0x1045)

DKAttackWorldUI = byte(0xa8bc)
DKAttackLevelUI = byte(0xa8ea)

LevelLookup = {
    384: "Jungle Hijinxs in DK Attack",
    386: "Ropey Rampage in DK Attack",
    388: "Reptile Rumble in DK Attack",
    390: "Coral Capers in DK Attack",
    392: "Barrel Cannon Canyon in DK Attack",
    394: "Winky's Walkway in DK Attack",
    396: "Mine Cart Carnage in DK Attack",
    398: "Bouncy Bonanza in DK Attack",
    400: "Stop and Go Station in DK Attack",
    402: "Millstone Mayhem in DK Attack",
    404: "Vulture Culture in DK Attack",
    406: "Tree Top Town in DK Attack",
    408: "Forest Frenzy in DK Attack",
    410: "Temple Tempest in DK Attack",
    412: "Orang-utan Gang in DK Attack",
    414: "Clam City in DK Attack",
    416: "Snow Barrel Blast in DK Attack",
    418: "Slipslide Ride in DK Attack",
    420: "Ice Age Alley in DK Attack",
    422: "Croctopus Chase in DK Attack",
    424: "Torchlight Trouble in DK Attack",
    426: "Rope Bridge Rumble in DK Attack",
    428: "Oil Drum Alley in DK Attack",
    430: "Trick Track Trek in DK Attack",
    432: "Elevator Antics in DK Attack",
    434: "Poison Pond in DK Attack",
    436: "Mine Cart Madness in DK Attack",
    438: "Blackout Basement in DK Attack",
    440: "Tanked Up Trouble in DK Attack",
    442: "Manic Mincers in DK Attack",
    444: "Misty Mine in DK Attack",
    446: "Loopy Lights in DK Attack",
    448: "Platform Perils in DK Attack",
    32: "Jungle Hijinxs",
    33: "Ropey Rampage",
    35: "Reptile Rumble",
    36: "Coral Capers",
    38: "Barrel Cannon Canyon",
    40: "Very Gnawty's Lair",
    64: "Winky's Walkway",
    66: "Mine Cart Madness",
    67: "Bouncy Bonanza",
    68: "Stop and Go Station",
    70: "Millstone Mayhem",
    72: "Necky's Nuts",
    96: "Vulture Culture",
    97: "Tree Top Town",
    98: "Forest Frenzy",
    100: "Orang-utan Gang",
    101: "Clam City",
    104: "Temple Tempest",
    105: "Bumble B Rumble",
    128: "Snow Barrel Blast",
    129: "Slipslide Ride",
    130: "Croctopus Chase",
    133: "Ice Age Alley",
    135: "Rope Bridge Rumble",
    136: "Torchlight Trouble",
    137: "Really Gnawty Rampage",
    160: "Oil Drum Alley",
    161: "Trick Track Trek",
    162: "Poison Pond",
    164: "Elevator Antics",
    165: "Blackout Basement",
    167: "Mine Cart Madness",
    169: "Boss Dumb Drum",
    192: "Tanked Up Trouble",
    193: "Manic Mincers",
    194: "Misty Mine",
    197: "Loopy Lights",
    199: "Platform Perils",
    200: "Necky's Revenge",
    224: "Kongo Jungle",
    225: "Monkey Mines",
    226: "Vine Valley",
    227: "Gorilla Glacier",
    228: "Kremkroc Industries Inc.",
    229: "Chimp Caverns",
    230: "Gang-Plank Galleon",
    449: "Jungle Hijinxs as a Hero",
    450: "Ropey Rampage as a Hero",
    452: "Reptile Rumble as a Hero",
    453: "Coral Capers as a Hero",
    455: "Barrel Cannon Canyon as a Hero",
    457: "Very Gnawty's Lair as a Hero",
    481: "Winky's Walkway as a Hero",
}

achievement(
    title = "Jungle KONG", description = "Collect all the KONG letters in the Kongo Jungle.", points = 10,
    id = 2589, badge = "243726", published = "9/1/2013 6:26:31 AM", modified = "5/23/2022 1:12:27 PM",
    trigger = byte(0x00100C) == 0x00 && (prev(low4(0x0011FC)) + prev(bit4(0x0011FC))) < 0x10 && (low4(0x0011FC) +
               bit4(0x0011FC)) == 0x10
)

achievement(
    title = "Miner KONG", description = "Find all the K-O-N-G letters in Monkey Mines.", points = 10,
    id = 2686, badge = "243727", published = "9/4/2013 7:27:28 AM", modified = "5/23/2022 1:12:27 PM",
    trigger = byte(0x00100C) == 0x01 && (prev(bit5(0x0011FC)) + prev(bit6(0x0011FC)) + prev(bit7(0x0011FC)) +
               prev(bit0(0x0011FD)) + prev(bit1(0x0011FD))) < 0x05 && (bit5(0x0011FC) + bit6(0x0011FC) + bit7(0x0011FC)
               + bit0(0x0011FD) + bit1(0x0011FD)) == 0x05
)

achievement(
    title = "Forest KONG", description = "Find all the K-O-N-G letters in Vine Valley.", points = 10,
    id = 2689, badge = "243728", published = "9/5/2013 3:18:14 AM", modified = "5/23/2022 1:12:27 PM",
    trigger = byte(0x00100C) == 0x02 && (prev(bit2(0x0011FD)) + prev(bit3(0x0011FD)) + prev(bit4(0x0011FD)) +
               prev(bit5(0x0011FD)) + prev(bit6(0x0011FD)) + prev(bit7(0x0011FD))) < 0x06 && (bit2(0x0011FD) +
               bit3(0x0011FD) + bit4(0x0011FD) + bit5(0x0011FD) + bit6(0x0011FD) + bit7(0x0011FD)) == 0x06
)

achievement(
    title = "Snow KONG", description = "Find all the K-O-N-G letters in Gorilla Glacier.", points = 10,
    id = 2695, badge = "243729", published = "9/5/2013 5:50:37 AM", modified = "5/23/2022 1:12:28 PM",
    trigger = byte(0x00100C) == 0x03 && (prev(bit0(0x0011FE)) + prev(bit1(0x0011FE)) + prev(bit2(0x0011FE)) +
               prev(bit3(0x0011FE)) + prev(bit4(0x0011FE)) + prev(bit5(0x0011FE))) < 0x06 && (bit0(0x0011FE) +
               bit1(0x0011FE) + bit2(0x0011FE) + bit3(0x0011FE) + bit4(0x0011FE) + bit5(0x0011FE)) == 0x06
)

achievement(
    title = "Factory KONG", description = "Find all the K-O-N-G letters in Kremkroc Industries, Inc.", points = 10,
    id = 2698, badge = "243730", published = "9/5/2013 7:41:28 AM", modified = "5/23/2022 1:12:28 PM",
    trigger = byte(0x00100C) == 0x04 && (prev(bit6(0x0011FE)) + prev(bit7(0x0011FE)) + prev(bit0(0x0011FF)) +
               prev(bit1(0x0011FF)) + prev(bit2(0x0011FF)) + prev(bit3(0x0011FF))) < 0x06 && (bit6(0x0011FE) +
               bit7(0x0011FE) + bit0(0x0011FF) + bit1(0x0011FF) + bit2(0x0011FF) + bit3(0x0011FF)) == 0x06
)

achievement(
    title = "Cave KONG", description = "Find all the K-O-N-G letters in the Chimp Caverns.", points = 10,
    id = 2701, badge = "243731", published = "9/5/2013 8:07:24 PM", modified = "5/23/2022 1:12:28 PM",
    trigger = byte(0x00100C) == 0x05 && (prev(bit4(0x0011FF)) + prev(bit5(0x0011FF)) + prev(bit6(0x0011FF)) +
               prev(bit7(0x0011FF)) + prev(bit0(0x001200))) < 0x05 && (bit4(0x0011FF) + bit5(0x0011FF) + bit6(0x0011FF)
               + bit7(0x0011FF) + bit0(0x001200)) == 0x05
)

achievement(
    title = "KONG Island", description = "Find all the K-O-N-G letters in the game.", points = 25,
    id = 2703, badge = "243732", published = "9/5/2013 8:14:03 PM", modified = "5/23/2022 1:12:29 PM",
    trigger = byte(0x00100C) >= 0x00 && byte(0x00100C) <= 0x05 && (prev(byte(0x0011FC)) + prev(byte(0x0011FD)) +
               prev(byte(0x0011FE)) + prev(byte(0x0011FF)) + prev(bit0(0x001200))) < 0x3FD && (byte(0x0011FC) +
               byte(0x0011FD) + byte(0x0011FE) + byte(0x0011FF) + bit0(0x001200)) == 0x3FD
)

achievement(
    title = "Bonus Jungle", description = "Find all the bonus rooms in Kongo Jungle.", points = 10,
    id = 2590, badge = "243733", published = "9/1/2013 6:26:35 AM", modified = "5/23/2022 1:12:29 PM",
    trigger = byte(0x00100C) == 0x00 && (prev(byte(0x00101D)) + prev(bit0(0x00101E))) < 0x100 && (byte(0x00101D) +
               bit0(0x00101E)) == 0x100
)

achievement(
    title = "Bonus Mine", description = "Find all the bonus rooms in Monkey Mines.", points = 10,
    id = 2685, badge = "243734", published = "9/4/2013 7:24:48 AM", modified = "5/23/2022 1:12:29 PM",
    trigger = byte(0x00100C) == 0x01 && (prev(bit1(0x00101E)) + prev(bit3(0x00101E)) + prev(high4(0x00101E)) +
               prev(bit0(0x00101F)) + prev(bit1(0x00101F))) < 0x13 && (bit1(0x00101E) + bit3(0x00101E) + high4(0x00101E)
               + bit0(0x00101F) + bit1(0x00101F)) == 0x13
)

achievement(
    title = "Bonus Forest", description = "Find all the bonus rooms in Vine Valley.", points = 10,
    id = 2690, badge = "243735", published = "9/5/2013 3:22:55 AM", modified = "5/23/2022 1:12:30 PM",
    trigger = byte(0x00100C) == 0x02 && (prev(bit2(0x00101F)) + prev(bit3(0x00101F)) + prev(high4(0x00101F)) +
               prev(byte(0x001020))) < 0x110 && (bit2(0x00101F) + bit3(0x00101F) + high4(0x00101F) + byte(0x001020)) ==
               0x110
)

achievement(
    title = "Bonus Glacier",
    description = "Find all the bonus rooms in Gorilla Glacier.",
    points = 10,
    id = 2696,
    trigger = byte(0x00100C) == 0x03 &&
        byte(0x001021) == 0xFF && bit0(0x001022) == 0x01 &&
        bit1(0x001022) == 0x01 && bit2(0x001022) == 0x01 &&
        bit3(0x001022) == 0x01 && byte(0x000000) == 0x06
)

achievement(
    title = "Bonus Factory", description = "Find all the bonus rooms in Kremkroc Industries, Inc.", points = 10,
    id = 2699, badge = "243737", published = "9/5/2013 7:45:45 AM", modified = "5/23/2022 1:12:31 PM",
    trigger = byte(0x00100C) == 0x04 && (prev(high4(0x001022)) + prev(byte(0x001023)) + prev(bit0(0x001024)) +
               prev(bit1(0x001024))) < 0x110 && (high4(0x001022) + byte(0x001023) + bit0(0x001024) + bit1(0x001024)) ==
               0x110
)

achievement(
    title = "Bonus Cave", description = "Find all the bonus rooms in the Chimp Caverns.", points = 10,
    id = 2702, badge = "243738", published = "9/5/2013 8:10:07 PM", modified = "5/23/2022 1:12:31 PM",
    trigger = byte(0x00100C) == 0x05 && (prev(bit3(0x001024)) + prev(high4(0x001024)) + prev(low4(0x001025)) +
               bit4(0x001025)) < 0x20 && (bit3(0x001024) + high4(0x001024) + low4(0x001025) + bit4(0x001025)) == 0x20
)

achievement(
    title = "Bonus Island", description = "Find all the bonus rooms in the game.", points = 25,
    id = 2704, badge = "243739", published = "9/5/2013 8:20:44 PM", modified = "5/23/2022 1:12:31 PM",
    trigger = byte(0x00100C) >= 0x00 && byte(0x00100C) <= 0x05 && (prev(byte(0x00101D)) + prev(byte(0x00101E)) +
               prev(byte(0x00101F)) + prev(byte(0x001020)) + prev(byte(0x001021)) + prev(byte(0x001022)) +
               prev(byte(0x001023)) + prev(byte(0x001024)) + prev(low4(0x001025)) + prev(bit4(0x001025))) < 0x804 && 
              (byte(0x00101D) + byte(0x00101E) + byte(0x00101F) + byte(0x001020) + byte(0x001021) + byte(0x001022) +
               byte(0x001023) + byte(0x001024) + low4(0x001025) + bit4(0x001025)) == 0x804
)

achievement(
    title = "Scrapbook Kong", description = "Find all the scrapbook pictures in the game.", points = 25,
    id = 2709, badge = "243740", published = "9/7/2013 12:08:27 AM", modified = "5/23/2022 1:12:32 PM",
    trigger = unless(high4(0x00117E) == 0x0F) && unless(bit4(0x001008) == 0x01) && byte(0x000000) != 0x02 && 
              (prev(byte(0x001178)) + prev(byte(0x001179)) + prev(byte(0x00117A)) + prev(byte(0x00117B)) +
               prev(byte(0x00117C)) + prev(byte(0x00117D)) + prev(low4(0x00117E))) < 0x609 && (byte(0x001178) +
               byte(0x001179) + byte(0x00117A) + byte(0x00117B) + byte(0x00117C) + byte(0x00117D) + low4(0x00117E)) ==
               0x609
)

BossCheevoData = [
    ["Very Gnawty", 5, 0, 8],
    ["Master Necky", 5, 1, 8],
    ["Queen B.", 5, 2, 9],
    ["Really Gnawty", 5, 3, 9],
    ["Dumb Drum", 5, 4, 9],
    ["Master Necky Snr.", 5, 5, 8],
]

function GeneralBossCheevo(data) {
    achievement(
        title = data[0],
        description = "Defeat " + data[0] + ".",
        points = 5,
        trigger = OverworldArea == data[2] && LevelNumber == data[3] && MusicId == 3
    )
}

for i in BossCheevoData {
    GeneralBossCheevo(i)
}

achievement(
    title = "Baddies Bashed", description = "Complete the game.", points = 10,
    id = 2715, badge = "243741", published = "9/7/2013 7:23:33 AM", modified = "5/23/2022 1:12:32 PM",
    trigger = byte(0x00101C) == 0x01 && bit1(0x00117C) == 0x01
)

achievement(
    title = "Time to be the Hero", description = "Beat the game on Hero Mode.", points = 50,
    id = 2716, badge = "243742", published = "9/7/2013 7:31:53 AM", modified = "5/23/2022 1:12:32 PM",
    trigger = bit4(0x001008) == 0x01 && byte(0x00101C) == 0x01 && bit1(0x00117C) == 0x01
)

achievement(
    title = "King K.Rool", description = "Defeat King K. Rool with both Kongs alive.", points = 10,
    id = 2714, badge = "243749", published = "9/7/2013 7:13:55 AM", modified = "5/23/2022 1:12:35 PM",
    trigger = byte(0x000FD6) == 0x01 && byte(0x00100C) == 0x06 && byte(0x001010) == 0x06 && byte(0x000000) == 0x03
)

achievement(
    title = "K-O-N-G", description = "Obtain all the KONG letters in a level.", points = 5,
    id = 2591, badge = "243750", published = "9/1/2013 6:26:51 AM", modified = "5/23/2022 1:12:36 PM",
    trigger = (bit1(0x000F34) + bit1(0x000F38) + bit1(0x000F3C) + bit1(0x000F40)) == 0x04 && (prev(bit1(0x000F34)) +
               prev(bit1(0x000F38)) + prev(bit1(0x000F3C)) + prev(bit1(0x000F40))) == 0x03
)

AnimalNames = {
    0: "Rambi",
    1: "Expresso",
    2: "Enguarde",
    3: "Winky"
}

function AnimalBonusCheevo(i) {
    name = AnimalNames[i]
    id = 2592 + i
    target = 0x1004 + i
    achievement(
        id = id,
        title = name,
        description = format(
            "Gain access to the {0} bonus room.",
            name
        ),
        points = 5,
        trigger = byte(target) == 3 && prev(byte(target)) == 2
    )
}

for i in AnimalNames {
    AnimalBonusCheevo(i)
}

InitialDanceHighScores = {
    0: 20000,
    1: 25000,
    2: 30000,
    3: 35000,
    4: 40000,
    5: 50000
}

DanceStepCount = {
    0: 31,
    1: 30,
    2: 57,
    3: 64,
    4: 56,
    5: 84,
}

DanceTune = {
    0: 0x1a,
    1: 0x1d,
    2: 0x1b,
    3: 0x1e,
    4: 0x1f,
    5: 0x20,
}

WorldShort = {
    0: "Kongo Jungle",
    1: "Monkey Mines",
    2: "Vine Valley",
    3: "Gorilla Glacier",
    4: "Kremkroc",
    5: "Chimp Caverns",
}

DanceHits = byte(0x5378)
DancePerfects = byte(0x5379)
DanceCombo = byte(0x537a)

function ExtraDanceComboCheevo(i) {
    stepCount = DanceStepCount[i]
    achievement(
        title = format("{0} Full Combo", WorldShort[i]),
        description = format("[Extras] Get no misses on the {0} Dance.", WorldShort[i]),
        points = 10,
        trigger = PartialState == 0x14 && byte(0x11c2) == i &&
            once(MusicId == DanceTune[i] && prev(MusicId) != DanceTune[i]) &&
            never(PartialState == 0x08) &&
            never(DanceCombo == 0 && MusicId == 6) &&
            DanceHits + DancePerfects == DanceCombo &&
            DanceStepCount[i] == DanceCombo
    )
}

for i in DanceStepCount {
    ExtraDanceComboCheevo(i)
}

DancePerfection = any_of(
    [0,1,2,3,4,5],
    e => once(MusicId == DanceTune[e] && prev(MusicId) != DanceTune[e]) &&
        DanceStepCount[e] == DanceCombo && never(DanceCombo == 0 && MusicId == 6)
)

achievement(
    title = "If I Hear That's Great ONE MORE TIME...",
    description = "[Extras] Get all perfects on any of Candy's Dances.",
    points = 25,
    trigger = PartialState == 0x14 && DancePerfects == DanceCombo && DancePerfection
)

achievement(
    title = "That's GREAT Fishing!",
    points = 10,
    description = "[Extras] Get 400000 points in Funky's Fishing.",
    trigger = MusicId == 0x22 && OverworldArea == 0xff &&
        prev(dword(0x6790)) < 400000 && dword(0x6790) >= 400000
)

DKAttackStageLookup = {
    0: "Jungle Hijinxs",
    1: "Ropey Rampage",
    2: "Reptile Rumble",
    3: "Coral Capers",
    4: "Barrel Cannon Canyon",
    5: "Winky's Walkway",
    6: "Mine Cart Carnage",
    7: "Bouncy Bonanza",
    8: "Stop and Go Station",
    9: "Millstone Mayhem",
    10: "Vulture Culture",
    11: "Tree Top Town",
    12: "Forest Frenzy",
    13: "Temple Tempest",
    14: "Orang-utan Gang",
    15: "Clam City",
    16: "Snow Barrel Blast",
    17: "Slipslide Ride",
    18: "Ice Age Alley",
    19: "Croctopus Chase",
    20: "Torchlight Trouble",
    21: "Rope Bridge Rumble",
    22: "Oil Drum Alley",
    23: "Trick Track Trek",
    24: "Elevator Antics",
    25: "Poison Pond",
    26: "Mine Cart Madness",
    27: "Blackout Basement",
    28: "Tanked Up Trouble",
    29: "Manic Mincers",
    30: "Misty Mine",
    31: "Loopy Lights",
    32: "Platform Perils",
    33: "Gang-Plank Galleon",
    34: "Very Gnawty's Lair",
    35: "Necky's Nuts",
    36: "Bumble B Rumble",
    37: "Really Gnawty Rampage",
    38: "Boss Dumb Drum",
    39: "Necky's Revenge",
}

DKAttackSRank = {
    0: 130000,
    1: 120000,
    2: 125000,
    3: 55000,
    4: 160000,
    5: 180000,
    6: 130000,
    7: 155000,
    8: 140000,
    9: 170000,
    10: 200000,
    11: 120000,
    12: 110000,
    13: 130000,
    14: 145000,
    15: 70000,
    16: 120000,
    17: 135000,
    18: 130000,
    19: 130000,
    20: 100000,
    21: 100000,
    22: 180000,
    23: 120000,
    24: 120000,
    25: 100000,
    26: 90000,
    27: 150000,
    28: 120000,
    29: 100000,
    30: 120000,
    31: 180000,
    32: 250000
}

function LevelWarpCheevo(i) {
    achievement(
        title = format("Fast Travel In {0}", DKAttackStageLookup[i]),
        points = 5,
        description = format("Find the warp barrel in {0}.", DKAttackStageLookup[i]),
        trigger = byte(0x44) == i && MusicId == 0x26
    )    
}

for i in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 23] {
    LevelWarpCheevo(i)
}

DkAttackStageScore = dword(0x1170)
DkAttackFinalScore = dword(0x1174)
DkAttackEvalSeconds = byte(0x1045)
DkAttackStage = byte(0x1000)

DkAttackEvalScreen = byte(0x1014) == 5
DkAttackFailed = byte(0x1014) != 1 && !DkAttackEvalScreen

function StartDkAttackStage(i) {
    return prev(DkAttackStage) == 0xff && DkAttackStage == i
}

function SRankCheevo(i) {
    stage = DKAttackStageLookup[i]
    achievement(
        title = format("S-Rank - {0}", stage),
        points = 10,
        description = format("[DK Attack] Get an S Rank on {0}.", stage),
        trigger = once(prev(DkAttackStage) == 0xff && DkAttackStage == i) &&
            never(DkAttackStage != i && DkAttackStage != 0xff && word(0x1a1) > 0x100) &&
            never(DkAttackStage == 0x20 && byte(0x8f) == 0xff && !DkAttackEvalScreen) && 
            never(byte(0x1014) == 0x00 && GlobalState == 0x89) &&
            never(byte(0x1014) != 0x01 && byte(0x1014) != 0x05) &&
            DkAttackFinalScore >= DKAttackSRank[i] && DkAttackEvalSeconds == 0 &&
            byte(0x1014) == 5
    )
}

for i in DKAttackSRank {
    SRankCheevo(i)
}

// Leaderboards

leaderboard(
    id = 68, title = "Any %",
    description = "Get the quickest time for beating the game.",
    start  = byte(0x00100C) == 0x06 && byte(0x001010) == 0x06 && byte(0x00101C) == 0x01 && byte(0x00101C) !=
              prev(byte(0x00101C)),
    cancel = byte(0x00101C) == 0x00,
    submit = byte(0x00101C) == 0x01,
    value = word(0x000FC0) * 1 + word(0x000FC2) * 65536,
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 69, title = "101 %",
    description = "Get the quickest time for beating the game and finding everything.",
    start  = byte(0x00101C) == 0x01 && byte(0x00101C) != prev(byte(0x00101C)) && word(0x001178) == 0xFFFF && 
             word(0x00117A) == 0xFFFF && word(0x00117C) == 0xFFFF && byte(0x00117E) == 0x0F && word(0x0011FC) == 0xFFFF && 
             word(0x0011FE) == 0xFFFF && byte(0x001200) == 0x01 && byte(0x00101D) == 0xFF && word(0x00101E) == 0xFFFB && 
             word(0x001020) == 0xFFFF && word(0x001022) == 0xFFFF && byte(0x001024) == 0xFF && low4(0x001025) == 0x0F && 
             bit4(0x001025) == 0x01,
    cancel = byte(0x00101C) == 0x00,
    submit = byte(0x00101C) == 0x01,
    value = word(0x000FC0) * 1 + word(0x000FC2) * 65536,
    format = "FRAMES", lower_is_better = true
)

leaderboard(
    id = 71, title = "Hero Speedrun",
    description = "Get the quickest time for beating Hero Mode.",
    start  = byte(0x00101C) == 0x01 && byte(0x00101C) != prev(byte(0x00101C)) && bit4(0x001008) == 0x01,
    cancel = byte(0x00101C) == 0x00,
    submit = byte(0x00101C) == 0x01,
    value = word(0x000FC0) * 1 + word(0x000FC2) * 65536,
    format = "FRAMES", lower_is_better = true
)

DKAttackBoardId = {
    0: 32,
    1: 70,
    2: 36,
    3: 37,
    4: 38,
    5: 39,
    6: 40,
    7: 41,
    8: 42,
    9: 43,
    10: 44,
    11: 45,
    12: 46,
    13: 49,
    14: 47,
    15: 48,
    16: 51,
    17: 52,
    18: 54,
    19: 53,
    20: 56,
    21: 55,
    22: 57,
    23: 58,
    24: 60,
    25: 59,
    26: 62,
    27: 61,
    28: 63,
    29: 64,
    30: 65,
    31: 66,
    32: 67
}

function DkAttackBoard(i) {
    leaderboard(
        id = DKAttackBoardId[i],
        title = DKAttackStageLookup[i],
        description = format(
            "Acquire the highest score in {0} in DK Attack.",
            DKAttackStageLookup[i]
        ),
        start = StartDkAttackStage(i),
        cancel = DkAttackFailed,
        submit = DkAttackStageScore < DkAttackFinalScore &&
            DkAttackEvalSeconds == 0 && DkAttackEvalScreen,
        value = DkAttackFinalScore,
        format = "SCORE"
    )
}

for i in DKAttackBoardId {
    DkAttackBoard(i)
}

StartedDancing = prev(GlobalState) != 0xb3 && GlobalState == 0xb3

function ExtraDanceStudioBoard(i) {
    name = WorldShort[i]
    leaderboard(
        title = format(
            "Extra {0} Dance",
            name
        ),
        description = format(
            "Get the highest score on the {0} Dance in Extras Mode.",
            name
        ),
        start = PartialState == 0x14 && byte(0x11c2) == i &&
            once(MusicId == DanceTune[i] && prev(MusicId) != DanceTune[i]) &&
            never(PartialState == 0x08),
        cancel = always_false(),
        submit = always_true(),
        value = dword(0x52c4),
        format = "SCORE"
    )
}

for i in WorldShort {
    ExtraDanceStudioBoard(i)
}

leaderboard(
    title = "Extra Funky's Fishing",
    description = "Get the highest score you can!",
    start = once(OverworldArea == 0xff && MusicId == 0x22) &&
        word(0x67f8) == 0 && prev(word(0x67f8)) == 0 &&
        never(MusicId == 0x06),
    cancel = always_false(),
    submit = always_true(),
    value = dword(0x6790),
    format = "SCORE"
)

// Rich Presence

DKAttackUILevels = {
    0: "Jungle Hijinxs",
    1: "Ropey Rampage",
    2: "Reptile Rumble",
    3: "Coral Capers",
    4: "Barrel Cannon Canyon",
    10: "Winky's Walkway",
    11: "Mine Cart Carnage",
    12: "Bouncy Bonanza",
    13: "Stop & Go Station",
    14: "Millstone Mayhem",
    20: "Vulture Culture",
    21: "Tree Top Town",
    22: "Forest Frenzy",
    23: "Orang-Utan Gang",
    24: "Clam City",
    25: "Temple Tempest",
    30: "Snow Barrel Blast",
    31: "Slipslide Ride",
    32: "Croctopus Chase",
    33: "Ice Age Alley",
    34: "Rope Bridge Rumble",
    35: "Torchlight Trouble",
    40: "Oil Drum Alley",
    41: "Trick Track Trek",
    42: "Poison Pond",
    43: "Elevator Antics",
    44: "Blackout Basement",
    45: "Mine Cart Madness",
    50: "Tanked Up Trouble",
    51: "Manic Mincers",
    52: "Misty Mine",
    53: "Loopy Lights",
    54: "Platform Perils"
}

WorldLocations = {
    0: "Kongo Jungle",
    1: "Monkey Mines",
    2: "Vine Valley",
    3: "Gorilla Glacier",
    4: "Kremkroc Industries Inc.",
    5: "Chimp Caverns",
    6: "Gang-Plank Galleon"
}

MainMenuOptions = {
    0: "The Main Game",
    1: "DK Attack",
    2: "Some Extras"
}

ExtraOptions = {
    0: "Funky's Fishing",
    1: "Candy's Dance Studio",
}

MainGameLevelMap = {
    0: "Jungle Hijinxs",
    1: "Ropey Rampage",
    2: "Cranky's Cabin",
    3: "Reptile Rumble",
    4: "Coral Capers",
    5: "Funky's Fishing",
    6: "Barrel Cannon Canyon",
    7: "Candy's Dance Studio",
    8: "Very Gnawty's Lair",
    20: "Winky's Walkway",
    21: "Cranky's Cabin",
    22: "Mine Cart Carnage",
    23: "Bouncy Bonanza",
    24: "Stop & Go Station",
    25: "Funky's Fishing",
    26: "Millstone Mayhem",
    27: "Candy's Dance Studio",
    28: "Necky's Nuts",
    40: "Vulture Culture",
    41: "Tree Top Town",
    42: "Forest Frenzy",
    43: "Funky's Fishing",
    44: "Orang-Utan Gang",
    45: "Clam City",
    46: "Cranky's Cabin",
    47: "Candy's Dance Studio",
    48: "Temple Tempest",
    49: "Bumble B Rumble",
    60: "Snow Barrel Blast",
    61: "Slipslide Ride",
    62: "Croctopus Chase",
    63: "Candy's Dance Studio",
    64: "Cranky's Cabin",
    65: "Ice Age Alley",
    66: "Funky's Fishing",
    67: "Rope Bridge Rumble",
    68: "Torchlight Trouble",
    69: "Really Gnawty Rampage",
    80: "Oil Drum Alley",
    81: "Trick Track Trek",
    82: "Poison Pond",
    83: "Funky's Fishing",
    84: "Elevator Antics",
    85: "Blackout Basement",
    86: "Candy's Dance Studio",
    87: "Mine Cart Madness",
    88: "Cranky's Cabin",
    89: "Boss Dumb Drum",
    100: "Tanked Up Trouble",
    101: "Manic Mincers",
    102: "Misty Mine",
    103: "Funky's Fishing",
    104: "Cranky's Cabin",
    105: "Loopy Lights",
    106: "Candy's Dance Studio",
    107: "Platform Perils",
    108: "Necky's Revenge",
}

MainGameLevelEnter = {
    2: "Visiting",
    5: "Visiting",
    7: "Visiting",
    8: "Challenging",
    21: "Visiting",
    25: "Visiting",
    27: "Visiting",
    28: "Challenging",
    43: "Visiting",
    46: "Visiting",
    47: "Visiting",
    49: "Challenging",
    63: "Visiting",
    64: "Visiting",
    66: "Visiting",
    69: "Challenging",
    83: "Visiting",
    86: "Visiting",
    88: "Visiting",
    89: "Challenging",
    103: "Visiting",
    104: "Visiting",
    106: "Candy's Dance Studio",
    108: "Challenging",
}

RpBalloon = "🎈"
RpBanana = "🍌"
RpFishingPole = "🎣"
RpScore = "💯"
RpDancer = "💃"
RpClock = "⏲️"
RpLives = rich_presence_macro("Number", Lives)
RpBananas = rich_presence_macro("Number", Bananas)
RpWorldLocation = rich_presence_lookup("World", LevelNumber, WorldLocations)
RpWorldStats = rich_presence_lookup("World", byte(0x515e), WorldLocations)
RpMainChoice = rich_presence_lookup("Title", byte(0xa74c), MainMenuOptions)
RpWorldShort = rich_presence_lookup("WorldShort", byte(0x11c2), WorldShort)
RpDanceScore = rich_presence_macro("Number", dword(0x52c4))

RpMainGameLevel = rich_presence_lookup(
    "MainLevel",
    byte(0x100c) * 20 + byte(0x1010),
    MainGameLevelMap,
    "Gang-Plank Galleon"
)

RpMainGameType = rich_presence_lookup(
    "MainEnter",
    byte(0x100c) * 20 + byte(0x1010),
    MainGameLevelEnter,
    "Playing"
)

RpDKAttackMinutes = rich_presence_macro("Number", byte(0x1044))
// RpDKAttackSeconds = rich_presence_macro("Number", DKAttackSecondsLeft % 60)
RpDKAttackSeconds = rich_presence_macro("Number", DKAttackSecondsLeft)

RpInternalStage = rich_presence_lookup("DKStage", byte(0x44), DKAttackStageLookup)

NotDkAttack = dword(0x1170) == 0xffffffff

InLevel = GlobalState == 0x8f || GlobalState == 0xc5 ||
    (GlobalState == 0xe9 && prev(GlobalState) == 0x8f) ||
    (GlobalState == 0xe9 && prev(GlobalState) == 0xc5) 

HeroFlag = {
    0: "",
    1: "[Hero Mode] "
}

RpHeroMode = rich_presence_lookup("HeroMode", bit4(0x1008), HeroFlag)

rich_presence_conditional_display(
    byte(0x1014) == 4 && PartialState == 4,
    "[DK Attack] Failed on {0}",
    RpInternalStage
)

rich_presence_conditional_display(
    byte(0x1014) == 5 && (PartialState == 4 || PartialState == 15),
    "[DK Attack] Success on {0}! {1}{2}",
    RpInternalStage,
    RpScore,
    rich_presence_macro("Number", dword(0x1174))
)

rich_presence_conditional_display(
    once(prev(DkAttackStage) == 0xff && DkAttackStage <= 0x20) &&
        never(PartialState == 3) && never(GlobalState == 0x89) &&
        DKAttackSecondsLeft < 10,
    "[DK Attack] Playing {0} {1}{2}:0{3} {4}{5}",
    RpInternalStage,
    RpClock,
    RpDKAttackMinutes,
    RpDKAttackSeconds,
    RpScore,
    rich_presence_macro("Number", dword(0x1174))
)

rich_presence_conditional_display(
    once(prev(DkAttackStage) == 0xff && DkAttackStage <= 0x20) &&
        never(PartialState == 3) && never(GlobalState == 0x89),
    "[DK Attack] Playing {0} {1}{2}:{3} {4}{5}",
    RpInternalStage,
    RpClock,
    RpDKAttackMinutes,
    RpDKAttackSeconds,
    RpScore,
    rich_presence_macro("Number", dword(0x1174))
)

rich_presence_conditional_display(
    DKAttackLevelSelect,
    "[DK Attack] Thinking of Playing {0}",
    rich_presence_lookup("DKStageUi", DKAttackWorldUI * 10 + DKAttackLevelUI, DKAttackUILevels)
)

rich_presence_conditional_display(
    MusicId == 0x22 && OverworldArea == 0xff,
    "[Extras] Funky Fishing! {0} {1}{2} Level {3}",
    RpFishingPole,
    RpScore,
    rich_presence_macro("Number", dword(0x6790)),
    rich_presence_macro("Number", byte(0x6780))
)

rich_presence_conditional_display(
    MusicId == 0x06 && PartialState == 0x0e,
    "[Extras] Fishing Done! {0} {1}{2} Level {3}",
    RpFishingPole,
    RpScore,
    rich_presence_macro("Number", dword(0x6790)),
    rich_presence_macro("Number", byte(0x6780))
)

rich_presence_conditional_display(
    GlobalState == 0xb3 && prior(PartialState) != 0x4b,
    "[Extras] Performing the {0} Dance with Candy {1} {2}{3}",
    RpWorldShort,
    RpDancer,
    RpScore,
    RpDanceScore
)

rich_presence_conditional_display(
    PartialState == 0x14,
    "[Extras] Results of the {0} Dance - Hits {1} Perfects {2} Best Kombo {3} {4}{5}",
    RpWorldShort,
    rich_presence_macro("Number", byte(0x5378)),
    rich_presence_macro("Number", byte(0x5379)),
    rich_presence_macro("Number", byte(0x537a)),
    RpScore,
    RpDanceScore
)

rich_presence_conditional_display(
    PartialState == 0x10 && prior(PartialState) == 0x14,
    "[Extras] Results of the {0} Dance - Hits {1} Perfects {2} Best Kombo {3} {4}{5}",
    RpWorldShort,
    rich_presence_macro("Number", byte(0x5378)),
    rich_presence_macro("Number", byte(0x5379)),
    rich_presence_macro("Number", byte(0x537a)),
    RpScore,
    rich_presence_macro("Number", dword(0x11c4))
)

rich_presence_conditional_display(
    PartialState == 0x0d && MusicId == 0x06,
    "[Extras] About to Fish for Funky {0}",
    RpFishingPole
)

rich_presence_conditional_display(
    PartialState == 0x08 && MusicId == 0x06,
    "[Extras] About to Perform the {0} Dance with Candy {1}",
    RpWorldShort,
    RpDancer
)

rich_presence_conditional_display(
    MusicId == 0x18,
    "{0}Konquered King K.Rool and Rescued the Banana Hoard",
    RpHeroMode
)

rich_presence_conditional_display(
    MusicId >= 0x1a && MusicId <= 0x20 && prior(PartialState) == 0x4b,
    "{6}Dancing with Candy in {0} {5} {1}{2} {3}{4}",
    RpWorldStats,
    RpBalloon,
    RpLives,
    RpBanana,
    RpBananas,
    RpDancer,
    RpHeroMode
)

rich_presence_conditional_display(
    MusicId == 0x22 && OverworldArea < 6,
    "{6}Fishing for Funky in {0} {5} {1}{2} {3}{4}",
    RpWorldStats,
    RpBalloon,
    RpLives,
    RpBanana,
    RpBananas,
    RpFishingPole,
    RpHeroMode
)

rich_presence_conditional_display(
    MusicId == 2,
    "{1}Thinking Of Playing {0}",
    RpMainChoice,
    RpHeroMode
)

rich_presence_conditional_display(
    OnMenus && MusicId == 6 &&
        (PartialState == 5 || PartialState == 6 && prior(PartialState) == 5),
    "{1}Thinking Of Playing {0}",
    rich_presence_lookup("ExtraGame", byte(0xa942), ExtraOptions),
    RpHeroMode
)

rich_presence_conditional_display(
    NotDkAttack && (!OnMap || MusicId == 0x07),
    "{6}{5} {0} {1}{2} {3}{4}",
    RpMainGameLevel,
    RpBalloon,
    RpLives,
    RpBanana,
    RpBananas,
    RpMainGameType,
    RpHeroMode
)

rich_presence_conditional_display(
    GlobalState == 0xcb,
    "{5}Viewing Page {0} of the Scrapbook {1}{2} {3}{4}",
    rich_presence_macro("Number", byte(0xa610) + 1),
    RpBalloon,
    RpLives,
    RpBanana,
    RpBananas,
    RpHeroMode
)

rich_presence_conditional_display(
    GlobalState == 0xdd,
    "{5}Viewing Stats of {0} {1}{2} {3}{4}",
    RpWorldStats,
    RpBalloon,
    RpLives,
    RpBanana,
    RpBananas,
    RpHeroMode
)

rich_presence_conditional_display(
    OnMap && OverworldArea == 6,
    "{5}Thinking of Visiting {0} {1}{2} {3}{4}",
    RpWorldLocation,
    RpBalloon,
    RpLives,
    RpBanana,
    RpBananas,
    RpHeroMode
)

rich_presence_conditional_display(
    OnMap,
    "{6}Thinking of {5} {0} {1}{2} {3}{4}",
    RpMainGameLevel,
    RpBalloon,
    RpLives,
    RpBanana,
    RpBananas,
    RpMainGameType,
    RpHeroMode
)

rich_presence_display("Donkey Konging")
