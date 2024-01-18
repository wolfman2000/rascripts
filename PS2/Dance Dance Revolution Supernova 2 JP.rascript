// Dance Dance Revolution SuperNOVA 2 [Japan]
// #ID = 25890

function ChartPass(addr) => bitcount(addr) == 1 || bitcount(addr) == 2

MachineDiff = byte(0x5186d4)
ValidMachineDiff = never(MachineDiff < 3)

NormalStageCount = byte(0x5186d5)
function CanReachExtraStage() => NormalStageCount != 0

EvaluationActive = byte(0x5b22b1) == 1
ActivatedSong = byte(0x5d0091) == 7 && prev(byte(0x5d0091)) == 0
InSong = byte(0x5d0091) == 7

LoadedSongId = byte(0x8dc2a0)
LoadedCourseId = byte(0x8dc2a4)

GameState = dword(0x1fcc95c)

GsTutorial = GameState == 0x21e0b0
GsSelectStyle = GameState == 0x1d7490
GsGameSelectMusic = GameState == 0x1dba70
GsGameGameplay = GameState == 0x197830
GsGameEvaluation = GameState == 0x1f2ad0
GsHyperMasterMode = GameState == 0x2eca60
GsSelectCourse = GameState == 0x31bad0

EnteredFirst = byte(0x995257)
P1First = EnteredFirst == 0
P2First = EnteredFirst == 1
ActivePlayerOffset = 0x5c7a0
ActiveButtonOffset = 0x280

ActiveButtonPointer = ActiveButtonOffset * EnteredFirst
ActivePlayerPointer = ActivePlayerOffset * EnteredFirst
SelectMusicActiveDiffPointer = 2 * EnteredFirst

P1UpHeld = dword(0x56108c)
P1RightHeld = dword(0x561098)
P1DownHeld = dword(0x5610a4)
P1LeftHeld = dword(0x5610b0)
P1TriangleHeld = dword(0x5610bc)
P1CircleHeld = dword(0x5610c8)
P1XHeld = dword(0x5610d4)
P1SquareHeld = dword(0x5610e0)
P1R1Held = dword(0x5610ec)
P1R2Held = dword(0x5610f8)
P1L1Held = dword(0x561104)
P1L2Held = dword(0x561110)

P2UpHeld = dword(0x56130c)
P2RightHeld = dword(0x561318)
P2DownHeld = dword(0x561324)
P2LeftHeld = dword(0x561330)
P2TriangleHeld = dword(0x56133c)
P2CircleHeld = dword(0x561348)
P2XHeld = dword(0x561354)
P2SquareHeld = dword(0x561360)
P2R1Held = dword(0x56136c)
P2R2Held = dword(0x561378)
P2L1Held = dword(0x561384)
P2L2Held = dword(0x561390)

PADiff = byte(0x8dc340 + ActivePlayerPointer)

PASongMarvelous = dword(0x8dc3f8 + ActivePlayerPointer)
PASongPerfect = dword(0x8dc3fc + ActivePlayerPointer)
PASongGreat = dword(0x8dc400 + ActivePlayerPointer)
PASongGood = dword(0x8dc404 + ActivePlayerPointer)
PASongAlmost = dword(0x8dc408 + ActivePlayerPointer)
PASongBoo = dword(0x8dc40c + ActivePlayerPointer)
PASongAllStep = dword(0x8dc414 + ActivePlayerPointer)

PASongOK = dword(0x8dc418 + ActivePlayerPointer)
PASongNG = dword(0x8dc41c + ActivePlayerPointer)
PASongNoHold = dword(0x8dc420 + ActivePlayerPointer)
PASongAllHold = dword(0x8dc424 + ActivePlayerPointer)

PASessionScore = dword(0x8dc2e4 + ActivePlayerPointer)
PACheckpointScore = dword(0x8dc2e0 + ActivePlayerPointer)
PAGameplaySongScore = PASessionScore - PACheckpointScore

PACourseHealthType = byte(0x8dc347 + ActivePlayerPointer)

PASongMaxCombo = dword(0x8dc438 + ActivePlayerPointer)

PACourseMarvelous = dword(0x8dc440 + ActivePlayerPointer)
PACoursePerfect = dword(0x8dc444 + ActivePlayerPointer)
PACourseGreat = dword(0x8dc448 + ActivePlayerPointer)
PACourseGood = dword(0x8dc44c + ActivePlayerPointer)
PACourseAlmost = dword(0x8dc450 + ActivePlayerPointer)
PACourseBoo = dword(0x8dc454 + ActivePlayerPointer)

PACourseOK = dword(0x8dc460 + ActivePlayerPointer)
PACourseNG = dword(0x8dc464 + ActivePlayerPointer)
PACourseNoHold = dword(0x8dc468 + ActivePlayerPointer)

PAEvaluationCourseScore = dword(0x8dc2e4 + ActivePlayerPointer)

PAFail = byte(0x8dc566 + ActivePlayerPointer)

ActiveMode = byte(0x99521c)
ActiveAdvancedMode = byte(0x99521d)

SelectedStyle = byte(0x995254)
Single = never(SelectedStyle != 1)
Double = never(SelectedStyle != 2)
Versus = never(SelectedStyle != 5)

PASongDiff = byte(0x8dc344 + ActivePlayerPointer)
PAGameDiff = SelectedStyle * 10 + PASongDiff

HmmSinglePass = byte(0xa3e8b2) == 1 && prev(byte(0xa3e8b2)) == 0
HmmStyle = byte(0xa3e8b4)
HmmSingle = HmmStyle == 0
HmmDouble = HmmStyle == 1
HmmLastAny = byte(0xa3e8b8)

HmmLastSingle = byte(0x5163ae)

HmmSlot1 = byte(0x5163c4)
HmmSlot2 = byte(0x5163c8)
HmmSlot3 = byte(0x5163cc)
HmmSlot4 = byte(0x5163d0)
HmmSlot5 = byte(0x5163d4)
HmmSlot6 = byte(0x5163d8)

HmmEquip1 = byte(0x5163dc)
HmmEquip2 = byte(0x5163dd)
HmmEquip3 = byte(0x5163de)
HmmEquip4 = byte(0x5163df)
HmmEquip5 = byte(0x5163e0)
HmmEquip6 = byte(0x5163e4)

ModCategoryLookup = {
    0: "Speed",
    1: "Boost",
    2: "Appearance",
    3: "Turn",
    4: "Dark",
    5: "Scroll",
    6: "Arrow",
    7: "Cut",
    8: "Freeze Arrow",
    9: "Jump",
    10: "Character",
    11: "Stage"
}

SelectMusicDiffLookup = {
    11: "BEG",
    12: "BSP",
    13: "DSP",
    14: "ESP",
    15: "CSP",
    22: "BDP",
    23: "DDP",
    24: "EDP",
    25: "CDP"
}

GameplayDiffLookup = {
    11: "BSP",
    12: "DSP",
    13: "ESP",
    16: "CSP",
    17: "BEG",
    21: "BDP",
    22: "DDP",
    23: "EDP",
    26: "CDP"
}

SelectingStyleLookup = {
    0: "Single",
    1: "Versus",
    2: "Double",
}

SelectedStyleLookup = {
    1: "Single",
    2: "Double",
    5: "Versus"
}

SingleMissionLookup = {
    0: "A-01",
    1: "A-02",
    2: "A-03",
    3: "A-04",
    4: "A-BOSS",
    5: "B-01",
    6: "B-02",
    7: "B-03",
    8: "B-04",
    9: "B-05",
    10: "B-06",
    11: "B-07",
    12: "B-BOSS",
    13: "C-01",
    14: "C-02",
    15: "C-03",
    16: "C-04",
    17: "C-05",
    18: "C-06",
    19: "C-BOSS",
    20: "D-01",
    21: "D-02",
    22: "D-03",
    23: "D-04",
    24: "D-05",
    25: "D-06",
    26: "D-07",
    27: "D-BOSS",
    28: "E-01",
    29: "E-02",
    30: "E-03",
    31: "E-04",
    32: "E-05",
    33: "E-06",
    34: "E-07",
    35: "E-BOSS",
    36: "F-01",
    37: "F-02",
    38: "F-03",
    39: "F-04",
    40: "F-05",
    41: "F-06",
    42: "F-07",
    43: "F-08",
    44: "F-BOSS",
    45: "G-01",
    46: "G-02",
    47: "G-03",
    48: "G-04",
    49: "G-05",
    50: "G-06",
    51: "G-07",
    52: "G-08",
    53: "G-BOSS",
    54: "H-01",
    55: "H-02",
    56: "H-03",
    57: "H-04",
    58: "H-05",
    59: "H-06",
    60: "H-07",
    61: "H-08",
    62: "H-BOSS",
    63: "I-01",
    64: "I-02",
    65: "I-03",
    66: "I-04",
    67: "I-05",
    68: "I-06",
    69: "I-07",
    70: "I-08",
    71: "I-BOSS",
    72: "J-01",
    73: "J-02",
    74: "J-03",
    75: "J-04",
    76: "J-05",
    77: "J-06",
    78: "J-07",
    79: "J-08",
    80: "J-BOSS",
    81: "K-01",
    82: "K-02",
    83: "K-03",
    84: "K-04",
    85: "K-05",
    86: "K-06",
    87: "K-07",
    88: "K-08",
    89: "K-BOSS",
    90: "L-01",
    91: "L-02",
    92: "L-03",
    93: "L-04",
    94: "L-05",
    95: "L-06",
    96: "L-07",
    97: "L-08",
    98: "L-BOSS"
}

DoubleMissionLookup = {
    0: "A-01",
    1: "A-02",
    2: "A-03",
    3: "A-04",
    4: "A-BOSS",
    5: "B-01",
    6: "B-02",
    7: "B-03",
    8: "B-04",
    9: "B-05",
    10: "B-06",
    11: "B-07",
    12: "B-BOSS",
    13: "C-01",
    14: "C-02",
    15: "C-03",
    16: "C-04",
    17: "C-05",
    18: "C-06",
    19: "C-BOSS",
    20: "D-01",
    21: "D-02",
    22: "D-03",
    23: "D-04",
    24: "D-05",
    25: "D-06",
    26: "D-07",
    27: "D-BOSS",
    28: "E-01",
    29: "E-02",
    30: "E-03",
    31: "E-04",
    32: "E-05",
    33: "E-06",
    34: "E-07",
    35: "E-BOSS",
    36: "F-01",
    37: "F-02",
    38: "F-03",
    39: "F-04",
    40: "F-05",
    41: "F-06",
    42: "F-07",
    43: "F-08",
    44: "F-BOSS",
    45: "G-01",
    46: "G-02",
    47: "G-03",
    48: "G-04",
    49: "G-05",
    50: "G-06",
    51: "G-07",
    52: "G-08",
    53: "G-BOSS",
    54: "H-01",
    55: "H-02",
    56: "H-03",
    57: "H-04",
    58: "H-05",
    59: "H-06",
    60: "H-07",
    61: "H-08",
    62: "H-BOSS",
    63: "I-01",
    64: "I-02",
    65: "I-03",
    66: "I-04",
    67: "I-05",
    68: "I-06",
    69: "I-07",
    70: "I-08",
    71: "I-BOSS",
    72: "J-01",
    73: "J-02",
    74: "J-03",
    75: "J-04",
    76: "J-05",
    77: "J-06",
    78: "J-07",
    79: "J-08",
    80: "J-BOSS",
    81: "K-01",
    82: "K-02",
    83: "K-03",
    84: "K-04",
    85: "K-05",
    86: "K-06",
    87: "K-07",
    88: "K-08",
    89: "K-BOSS",
    90: "L-01",
    91: "L-02",
    92: "L-03",
    93: "L-04",
    94: "L-05",
    95: "L-06",
    96: "L-BOSS"
}

AllMissionLookup = {}
for i in SingleMissionLookup {
    AllMissionLookup[i] = SingleMissionLookup[i]
}
for i in DoubleMissionLookup {
    AllMissionLookup[i + 100] = DoubleMissionLookup[i]
}

CourseLookup = {
    0x00: "popularity",
    0x01: "popularity -DIFFICULT-",
    0x02: "electricity energy",
    0x03: "electricity energy -DIFFICULT-",
    0x04: "Japanese-POPS",
    0x05: "Japanese-POPS -DIFFICULT-",
    0x06: "COVERS",
    0x07: "COVERS -DIFFICULT-",
    0x08: "A Midtown Night's Dream",
    0x09: "A Midtown Night's Dream -DIFFICULT-",
    0x0a: "HARD CORE",
    0x0b: "HARD CORE -DIFFICULT-",
    0x0c: "VICTORY OR DEFEAT",
    0x0d: "VICTORY OR DEFEAT -DIFFICULT-",
    0x0e: "GRAND CROSS Version SILVER",
    0x0f: "GRAND CROSS Version SILVER -DIFFICULT-",
    0x10: "BEMANI SPIRITS",
    0x11: "BEMANI SPIRITS -DIFFICULT-",
    0x12: "Japanese-POPS EX",
    0x13: "popularity EX",
    0x14: "FUTURE ROCK",
    0x15: "BPM=130",
    0x16: "jun",
    0x17: "V For Vibes",
    0x18: "BARRIER",
    0x19: "CIRCUIT VOYAGE",
    0x1a: "GRAND CROSS version GOLD",
    0x1b: "BOSS RUSH (Ver. SN2)",
    0x1c: "SuperNOVA2",
    0x1d: "Challenger",
    0x1e: "DDR HITS 1",
    0x1f: "DDR HITS 2",
    0x20: "DDR HITS 3",
    0x21: "BEST 1-4",
    0x22: "BEST 1-4 -DIFFICULT-",
    0x23: "BEST LONG",
    0x24: "BEST LONG -DIFFICULT-",
    0x25: "RANDOM ALL",
    0x26: "RANDOM ALL -DIFFICULT-",
    0x27: "SUPER RANDOM",
    0x2c: "ORDER 1",
    0x2d: "ORDER 2",
    0x2e: "ORDER 3",
    0x2f: "ORDER 4",
    0x30: "ORDER 5",
    0x31: "ORDER 6",
    0x32: "ORDER 7",
    0x33: "ORDER 8",
    0x34: "ORDER 9",
    0x35: "ORDER 10"
}

SelectMusicLookup = {
    0x00: "AIN'T NO MOUNTAIN HIGH ENOUGH",
    0x01: "ANGELUS -アンジェラス-",
    0x02: "Beginning of the End",
    0x03: "Burn Baby Burn",
    0x04: "COME CLEAN",
    0x05: "EternuS",
    0x06: "Fevah",
    0x07: "My Favorite Things",
    0x08: "stealth",
    0x09: "SUNRISE (JASON NEVINS REMIX)",
    0x0a: "switch",
    0x0b: "The World Around Me",
    0x0c: "Two Months Off",
    0x0d: "Unbelievable",
    0x0e: "Until Forever",
    0x0f: "WAITING FOR TONIGHT",
    0x10: "dazzle",
    0x11: "LEAVE ME ALONE",
    0x12: "Malacca",
    0x13: "puzzle",
    0x14: "S・A・G・A",
    0x15: "The flower in your smile",
    0x16: "TimeHollow",
    0x17: "A thing called LOVE",
    0x18: "dream of love",
    0x19: "Electrified",
    0x1a: "Every Day, Every Night (NM STYLE)",
    0x1b: "Freeway Shuffle",
    0x1c: "GIRIGILI門前雀羅",
    0x1d: "L'amour et la liberté (Darwin & DJ Silver remix)",
    0x1e: "木星～組曲『惑星』より", // Jupiter.
    0x1f: "Music In The Rhythm",
    0x20: "Poseidon",
    0x21: "Saturn",
    0x22: "Shades of Grey",
    0x23: "SUNKiSS♥DROP",
    // 0x24 respects jun Side
    // 0x25 respects Alison Side (default)
    0x26: "Trust -DanceDanceRevolution mix-",
    0x27: "Uranus",
    0x28: "Vem brincar",
    0x29: "volcano",
    0x2a: "Why not",
    0x2b: "Arrabbiata",
    0x2c: "Blind Justice ～Torn souls, Hurt Faiths～",
    0x2d: "Bloody Tears (IIDX EDITION)",
    0x2e: "CaptivAte～誓い～",
    0x2f: "FIRE",
    0x30: "MARS WAR 3",
    0x31: "Raspberry♥Heart (English version)",
    0x32: "STARS☆☆☆（Re-tuned by HΛL） - DDR EDITION -",
    0x33: "Venus",
    0x34: "Votum stellarum -forest #25 DDR RMX-",
    0x35: "AFRONOVA",
    0x36: "AM-3P",
    0x37: "B4U",
    0x38: "BRILLIANT 2U",
    0x39: "CAN'T STOP FALLIN' IN LOVE",
    0x3a: "CANDY☆",
    0x3b: "D2R",
    0x3c: "DEAD END",
    0x3d: "DROP THE BOMB",
    0x3e: "DYNAMITE RAVE",
    0x3f: "Groove",
    0x40: "INSIDE YOUR HEART",
    0x41: "Kind Lady",
    0x42: "Look To The Sky",
    0x43: "PARANOiA",
    0x44: "STILL IN MY HEART",
    0x45: "Sweet Sweet ♥ Magic",
    0x46: "TOMORROW",
    0x47: "TRUE♥LOVE",
    0x48: "un deux trois",
    0x49: "AM-3P (\"CHAOS\" Special)",
    0x4a: "B4U (\"VOLTAGE\" Special)",
    0x4b: "BRILLIANT 2U (\"STREAM\" Special)",
    0x4c: "D2R (\"FREEZE\" Special)",
    0x4d: "DEAD END (\"GROOVE RADAR\" Special)",
    0x4e: "DYNAMITE RAVE (\"AIR\" Special)",
    0x4f: "UNREAL",
    0x50: "NGO",
    0x51: "TRIP MACHINE PhoeniX",
    0x52: "PARANOiA (HADES)",
    0x53: "Pluto",
    0x54: "Pluto Relinquish",
    0x5b: "ROULETTE",
    0x5c: "RANDOM",
    0x5d: "EDIT DATA",
}

AllSongIds = []
for i in SelectMusicLookup {
    if i <= 0x54 {
        array_push(AllSongIds, i)
    }
}

// 39 songs are available for free.
FreeSongIds = [
    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09,
    0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x16, 0x17, 0x18, 0x19,
    0x1a, 0x1b, 0x1c, 0x1f, 0x22, 0x26, 0x28, 0x29, 0x2a, 0x2c,
    0x31, 0x35, 0x39, 0x3a, 0x3d, 0x3f, 0x41, 0x42, 0x44, 0x47
]

BuySongIds = []
for i in AllSongIds {
    if none_of(FreeSongIds, f => f == i) {
        array_push(BuySongIds, i)
    }
}

ChallengeOnlyIds = [
    0x49, 0x4a, 0x4b, 0x4c, 0x4d, 0x4e
]
ChallengePlusIds = [
    0x27, 0x38, 0x3e, 0x50, 0x51, 0x52, 0x53, 0x54
]

BossSongIds = [
    0x4f, 0x50, 0x51, 0x52, 0x53, 0x54
]

SongOffsetLookup = {
    0x01: "AIN'T NO MOUNTAIN HIGH ENOUGH",
    0x02: "ANGELUS -アンジェラス-",
    0x03: "Beginning of the End",
    0x04: "Burn Baby Burn",
    0x07: "Fevah",
    0x0a: "SUNRISE (JASON NEVINS REMIX)",
    0x12: "LEAVE ME ALONE",
    0x18: "A thing called LOVE",
    0x23: "Shades of Grey",
    0x25: "SUNKiSS♥DROP ~jun Side~",
    0x26: "SUNKiSS♥DROP",
    0x38: "B4U",
    0x42: "Kind Lady",
    0x50: "UNREAL", // Expected this at another ID.
    0x51: "NGO",
    0x52: "TRIP MACHINE PhoeniX",
}

ModeLookup = {
    0x00: "Tutorial",
    0x01: "Beginner Mode",
    0x02: "Standard Mode",
}



// Misc Cheevos

achievement(
    title = "JUST! Get This Over With NOW!",
    points = 2,
    description = "Complete the tutorial with all JUST ranks.",
    trigger = ValidMachineDiff && Single &&
        prev(GameState) == 0x21e0b0 &&
        PASongGood == 0 &&
        PASongAlmost == 0 &&
        PASongBoo == 0 &&
        PASongNG == 0 &&
        PASongNoHold == 0 &&
        trigger_when(GsGameSelectMusic)
)

achievement(
    title = "This Had To Appear Somewhere, Didn't It? [m]",
    points = 2,
    description = "Utilize the Konami Code to reveal more characters to purchase. (see comment)",
    trigger = GameState == 0x275800 && 
        any_of(range(0,11,1), i => byte(0x5304d2 + i) == 0x0a && prev(byte(0x8304d2 + i)) != 0x0a)
)

// Hyper Master Mode

HmmStyleLookup = {
    0: "Single",
    1: "Double"
}

function HmmLevelToArea(num) {
    if num <= 4 {
        return "A"
    }
    if num <= 12 {
        return "B"
    }
    if num <= 19 {
        return "C"
    }
    if num <= 27 {
        return "D"
    }
    if num <= 35 {
        return "E"
    }
    if num <= 44 {
        return "F"
    }
    if num <= 53 {
        return "G"
    }
    if num <= 62 {
        return "H"
    }
    if num <= 71 {
        return "I"
    }
    if num <= 80 {
        return "J"
    }
    if num <= 89 {
        return "K"
    }
    return "L"
}

HmmSingleBossIds = [4, 12, 19, 27, 35, 44, 53, 62, 71, 80, 89, 98]
HmmDoubleBossIds = [4, 12, 19, 27, 35, 44, 53, 62, 71, 80, 89, 96]

function PointBoost(num) {
    if num == 3 {
        return 4
    }
    if num == 4 {
        return 5
    }
    if num == 5 {
        return 10
    }
    return 25
}

HmmAreaData = {
    4: ["Simple", 3],
    12: ["Moderate", 3],
    19: ["Ordinary", 3],
    27: ["Superior", 4],
    35: ["Marvelous", 4],
    44: ["Genuine", 4],
    53: ["Paramount", 5],
    62: ["Exorbitant", 5],
    71: ["Catastrophic", 5],
    80: ["Apocalyptic", 5],
    89: ["Ridiculous", 5],
    96: ["Blasphemous", 10],
    98: ["Blasphemous", 10]
}

function HmmAreaClear(style, id) {
    data = HmmAreaData[id]
    level = SingleMissionLookup[id]
    base = 0x5163e9
    if (style == 1) {
        level = DoubleMissionLookup[id]
        base = 0x516d49
    }
    target = base + (24 * id)
    achievement(
        title = format(
            "{0} {1} Area Clear",
            HmmStyleLookup[style],
            data[0]
        ),
        points = data[1],
        description = format(
            "Clear {0} in Hyper Master Mode on {1}.",
            level,
            HmmStyleLookup[style]
        ),
        trigger = GsHyperMasterMode && HmmStyle == style &&
            HmmLastAny == id &&
            byte(target) >= 5 && prev(byte(target)) < 5
    )
}

function HmmAreaFullClear(style, min, max) {
    target = 0
    base = 0x5163e9
    if (style == 1) {
        base = 0x516d49
    }
    levels = []
    for i in range(min, max) {
        target = target + 10
        array_push(levels, base + (24 * i))
    }
    data = HmmAreaData[max]
    achievement(
        title = format(
            "{0} {1} Full Clear",
            HmmStyleLookup[style],
            data[0]
        ),
        points = PointBoost(data[1]),
        description = format(
            "Max out all clear bars in Area {0} in Hyper Master Mode on {1}.",
            HmmLevelToArea(max),
            HmmStyleLookup[style]
        ),
        trigger = GsHyperMasterMode && HmmStyle == style &&
            HmmLastAny >= min && HmmLastAny <= max &&
            sum_of(levels, s => prev(byte(s))) < target &&
            measured(sum_of(levels, s => byte(s)) == target)
    )
}

function HmmAreaHyperClear(style, min, max) {
    base = 0x5163fc
    if style == 1 {
        base = 0x516d5c
    }
    levels = []
    for i in range(min, max) {
        array_push(levels, base + (24 * i))
    }
    data = HmmAreaData[max]
    achievement(
        title = format(
            "{0} {1} Hyper Clear",
            HmmStyleLookup[style],
            data[0]
        ),
        points = data[1],
        description = format(
            "Get one million points on any one mission in Area {0} in Hyper Master Mode on {1}.",
            HmmLevelToArea(max),
            HmmStyleLookup[style]
        ),
        trigger = GsHyperMasterMode && HmmStyle == style &&
        HmmLastAny >= min && HmmLastAny <= max &&
        any_of(levels, s => prev(dword(s)) < 1000000 && dword(s) >= 1000000)
        // always_false()
    )
}

for i in range(0, 11) {
    min = 0
    if (i > 0) {
        min = HmmSingleBossIds[i - 1] + 1
    }
    max = HmmSingleBossIds[i]
    HmmAreaClear(0, max)
    HmmAreaHyperClear(0, min, max)
    HmmAreaFullClear(0, min, max)
}

for i in range(0, 11) {
    min = 0
    if (i > 0) {
        min = HmmDoubleBossIds[i - 1] + 1
    }
    max = HmmDoubleBossIds[i]
    HmmAreaClear(1, max)
    HmmAreaHyperClear(1, min, max)
    HmmAreaFullClear(1, min, max)
}

// Various passing/FC based cheevos for Arcade Mode.

function CollectionPass(songId) {
    base = 0x510200 + (0x60 * songId)
    localTargets = []
    if (none_of(ChallengeOnlyIds, e => e == songId)) {
        array_push(localTargets, base + 0x52) // BSP
        array_push(localTargets, base + 0x53) // DSP
        array_push(localTargets, base + 0x54) // ESP
        array_push(localTargets, base + 0x56) // BEG
        array_push(localTargets, base + 0x57) // BDP
        array_push(localTargets, base + 0x58) // DDP
        array_push(localTargets, base + 0x59) // EDP
    }
    if (any_of(ChallengeOnlyIds, e => e == songId) || any_of(ChallengePlusIds, e => e == songId)) {
        array_push(localTargets, base + 0x55) // CSP
        array_push(localTargets, base + 0x5a) // CDP
    }
    
    // transform the local targets into compatible forms early.
    localCurr = array_map(localTargets, s => once(ChartPass(s)))
    localPrev = array_map(localTargets, s => 
        once(prev(bitcount(s)) == 1 || prev(bitcount(s)) == 2)
    )
    
    return [localCurr, localPrev]
}

function CollectionChartAaFc(songId, comboOffset, gradeOffset) {
    base = 0x510200 + (0x60 * songId)
    combo1 = word(base + comboOffset)
    combo2 = word(base + comboOffset + 0x14)
    grade = byte(base + gradeOffset)
    localCurr = [
        once(
            (combo1 == combo2 && combo2 != 0) ||
            grade == 1 || grade == 2
        )
    ]
    localPrev = [
        once(
            (prev(combo1) == prev(combo2) && prev(combo2) != 0) ||
            prev(grade) == 1 || prev(grade) == 2
        )
    ]
    return [localCurr, localPrev]
}

function CollectionDspAaFc(songId) => CollectionChartAaFc(songId, 0x2c, 0x53)
function CollectionEspAaFc(songId) => CollectionChartAaFc(songId, 0x2e, 0x54)
function CollectionCspAaFc(songId) => CollectionChartAaFc(songId, 0x30, 0x55)
function CollectionDdpAaFc(songId) => CollectionChartAaFc(songId, 0x36, 0x58)
function CollectionEdpAaFc(songId) => CollectionChartAaFc(songId, 0x38, 0x59)
function CollectionCdpAaFc(songId) => CollectionChartAaFc(songId, 0x3a, 0x5a)

function CollectionTraditionalData(coll, callee, dummy) {
    playCurr = []
    playPrev = []
    for i in coll {
        currPrev = callee(i)
        array_push(playCurr, currPrev[0])
        array_push(playPrev, currPrev[1])
    }
    return [playCurr, playPrev]
}

function CollectionDoubleChartData(coll, callee, callee2) {
    playCurr = []
    playPrev = []
    for i in coll {
        if none_of(ChallengeOnlyIds, e => e == i) {
            currPrev = callee(i)
            array_push(playCurr, currPrev[0])
            array_push(playPrev, currPrev[1])
        }
        if (any_of(ChallengeOnlyIds, e => e == i) || any_of(ChallengePlusIds, e => e == i)) {
            currPrev = callee2(i)
            array_push(playCurr, currPrev[0])
            array_push(playPrev, currPrev[1])
        }
    }
    return [playCurr, playPrev]
}

function BeatSongsCheevo(coll, descBase, restrictions, getData, callee, callee2, target, wordTarget, title, points) {
    mainData = getData(coll, callee, callee2)
    allHits = tally_of(
        mainData[0],
        target,
        s => once(any_of(s, t => t))
    )
    deltaFix = tally_of(
        mainData[1],
        target - 1,
        s => once(any_of(s, t => t))
    )
    fallback = unless(tally_of(
        mainData[1],
        target,
        s => once(any_of(s, t => t))
    ))

    achievement(
        title = title,
        points = points,
        description = "[Game Mode] " + format(descBase, wordTarget),
        trigger = never(!GsGameEvaluation && !GsGameSelectMusic && !GsGameGameplay) &&
            restrictions &&
            deltaFix && measured(allHits, GsGameEvaluation) && fallback
    )
}

function BeatFreeSongsCheevo(target, title, points) {
    wordTarget = target
    if (target == 40) {
        wordTarget = "all 40"
    }
    
    BeatSongsCheevo(
        FreeSongIds,
        "Clear {0} of the default songs. No restrictions imposed.",
        always_true(),
        CollectionTraditionalData,
        CollectionPass,
        always_false(),
        target,
        wordTarget,
        title,
        points
    )
}

BeatFreeSongsCheevo(10, "Getting Used To The Soundtrack", 3)
BeatFreeSongsCheevo(20, "Alright, I Dig This", 4)
BeatFreeSongsCheevo(30, "No Beginner Anymore", 5)
BeatFreeSongsCheevo(40, "No More Freebies", 10)

// Unlocking/Store Bought Cheevos

function PayCurr(addr) => bit0(addr) + bit1(addr) * 2 + bit2(addr) * 4
function PayPrev(addr) => prev(bit0(addr)) + prev(bit1(addr)) * 2 + prev(bit2(addr)) * 4

function BuyStuffCheevo(target, title, points, desc, base, collection, value) {
    buyCurr = []
    buyPrev = []
    for i in collection {
        array_push(buyCurr, once(PayCurr(base + i) == 4))
        array_push(buyPrev, once(PayPrev(base + i) == 4))
    }
    
    allHits = tally_of(
        buyCurr,
        target,
        s => once(s)
    )
    deltaFix = tally_of(
        buyPrev,
        target - 1,
        s => once(s)
    )
    fallback = unless(tally_of(
        buyPrev,
        target,
        s => once(s)
    ))
    
    achievement(
        title = title,
        points = points,
        description = desc,
        trigger = never(!GsHyperMasterMode && GameState != 0x33a030) &&
            deltaFix && measured(allHits) && fallback
    )
}

BuyStuffCheevo(
    22,
    "So That's The Name Of That Tune",
    5,
    "Buy 22 songs from the shop.",
    0x530461,
    BuySongIds,
    0x0c
)
BuyStuffCheevo(
    43,
    "So How Good Is This In Vinyl?",
    10,
    "Buy all 43 songs from the shop.",
    0x530461,
    BuySongIds,
    0x0c
)

BuyStuffCheevo(
    10,
    "Workout Sessions Getting Longer",
    5,
    "Buy 10 courses from the shop.",
    0x5304b6,
    range(0, 20),
    0x0c
)

BuyStuffCheevo(
    21,
    "You're Breaking Out In A Sweat!",
    10,
    "Buy all 21 courses from the shop.",
    0x5304b6,
    range(0, 20),
    0x0c
)

BuyStuffCheevo(
    5,
    "Making New Notes On Things",
    5,
    "Buy all 5 arrow types from the shop.",
    0x5304cb,
    range(0, 4),
    0x04
)

BuyStuffCheevo(
    3,
    "This Mode Is Difficult Indeed",
    10,
    "Buy all 3 advanced modes from the shop.",
    0x5304de,
    range(0, 2),
    0x04
)

BuyStuffCheevo(
    2,
    "Knew We Were Missing Some Folks",
    10,
    "Buy both characters that don't require codes from the shop.",
    0x5304d0,
    range(0, 1),
    0x04
)

BuyStuffCheevo(
    12,
    "Always Have Spare Dancing Clothes",
    10,
    "Buy all 12 alternate characters/outfits from the shop.",
    0x5304d2,
    range(0, 11),
    0x04
)

BuyStuffCheevo(
    21,
    "Build Your Own Dancer",
    5,
    "Buy 21 custom modules for Hyper Master Mode from the shop.",
    0x5304e1,
    range(0, 84),
    0x04
)

BuyStuffCheevo(
    42,
    "Some Assembly Required",
    10,
    "Buy 42 custom modules for Hyper Master Mode from the shop.",
    0x5304e1,
    range(0, 84),
    0x04
)

BuyStuffCheevo(
    64,
    "Warning: Not A Real Life Toy",
    10,
    "Buy 64 custom modules for Hyper Master Mode from the shop.",
    0x5304e1,
    range(0, 84),
    0x04
)

BuyStuffCheevo(
    85,
    "Domo Arigato Mr. Roboto",
    25,
    "Buy all 85 custom modules for Hyper Master Mode from the shop.",
    0x5304e1,
    range(0, 84),
    0x04
)

function BeatUnlockedSongsCheevo(target, title, points) {
    wordTarget = target
    if (target == 43) {
        wordTarget = "all 43"
    }
    
    BeatSongsCheevo(
        BuySongIds,
        "Clear {0} of the store-bought songs.",
        ValidMachineDiff,
        CollectionTraditionalData,
        CollectionPass,
        always_false(),
        target,
        wordTarget,
        title,
        points
    )
}

BeatUnlockedSongsCheevo(11, "A New Collection To Go Through", 3)
BeatUnlockedSongsCheevo(22, "Yeah, Plenty Of Bangers", 4)
BeatUnlockedSongsCheevo(33, "Starting To Get Intimidating...", 5)
BeatUnlockedSongsCheevo(43, "I'd Rather Play Cartoon Heroes", 10)

function AaFcSongsCheevo(coll, fork, callee1, callee2, title, points, desc, target) {
    BeatSongsCheevo(
        coll,
        desc,
        ValidMachineDiff,
        fork,
        callee1,
        callee2,
        target,
        "all " + target,
        title,
        points
    )
}

AaFcSongsCheevo(
    range(0, 0x0f),
    CollectionTraditionalData,
    CollectionDspAaFc,
    always_false(),
    "Licensed DSP Master",
    5,
    "Get AA or FC ranks on {0} licensed songs on DSP.",
    16
)

AaFcSongsCheevo(
    range(0, 0x0f),
    CollectionTraditionalData,
    CollectionEspAaFc,
    always_false(),
    "Licensed ESP Master",
    10,
    "Get AA or FC ranks on {0} licensed songs on ESP.",
    16
)

AaFcSongsCheevo(
    range(0, 0x0f),
    CollectionTraditionalData,
    CollectionDdpAaFc,
    always_false(),
    "Licensed DDP Master",
    5,
    "Get AA or FC ranks on {0} licensed songs on DDP.",
    16
)

AaFcSongsCheevo(
    range(0, 0x0f),
    CollectionTraditionalData,
    CollectionEdpAaFc,
    always_false(),
    "Licensed EDP Master",
    10,
    "Get AA or FC ranks on {0} licensed songs on EDP.",
    16
)

OriginalFreeIds = [
    0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b,
    0x1c, 0x1f, 0x22, 0x26, 0x28, 0x29, 0x2a
]

AaFcSongsCheevo(
    OriginalFreeIds,
    CollectionTraditionalData,
    CollectionDspAaFc,
    always_false(),
    "Original DSP Master",
    5,
    "Get AA or FC ranks on {0} default original songs on DSP.",
    length(OriginalFreeIds)
)

AaFcSongsCheevo(
    OriginalFreeIds,
    CollectionTraditionalData,
    CollectionEspAaFc,
    always_false(),
    "Original ESP Master",
    10,
    "Get AA or FC ranks on {0} default original songs on ESP.",
    length(OriginalFreeIds)
)

AaFcSongsCheevo(
    OriginalFreeIds,
    CollectionTraditionalData,
    CollectionDdpAaFc,
    always_false(),
    "Original DDP Master",
    5,
    "Get AA or FC ranks on {0} default original songs on DDP.",
    length(OriginalFreeIds)
)

AaFcSongsCheevo(
    OriginalFreeIds,
    CollectionTraditionalData,
    CollectionEdpAaFc,
    always_false(),
    "Original EDP Master",
    10,
    "Get AA or FC ranks on {0} default original songs on EDP.",
    length(OriginalFreeIds)
)

BemaniFreeIds = [0x2c, 0x31, 0x35, 0x39, 0x3a, 0x3d, 0x3f, 0x41, 0x42, 0x44, 0x47]

AaFcSongsCheevo(
    BemaniFreeIds,
    CollectionTraditionalData,
    CollectionDspAaFc,
    always_false(),
    "Bemani DSP Master",
    5,
    "Get AA or FC ranks on {0} default classic BEMANI songs on DSP.",
    length(BemaniFreeIds)
)

AaFcSongsCheevo(
    BemaniFreeIds,
    CollectionTraditionalData,
    CollectionEspAaFc,
    always_false(),
    "Bemani ESP Master",
    10,
    "Get AA or FC ranks on {0} default classic BEMANI songs on ESP.",
    length(BemaniFreeIds)
)

AaFcSongsCheevo(
    BemaniFreeIds,
    CollectionTraditionalData,
    CollectionDdpAaFc,
    always_false(),
    "Bemani DDP Master",
    5,
    "Get AA or FC ranks on {0} default classic BEMANI songs on DDP.",
    length(BemaniFreeIds)
)

AaFcSongsCheevo(
    BemaniFreeIds,
    CollectionTraditionalData,
    CollectionEdpAaFc,
    always_false(),
    "Bemani EDP Master",
    10,
    "Get AA or FC ranks on {0} default classic BEMANI songs on EDP.",
    length(BemaniFreeIds)
)

OriginalShopIds = [0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x1d, 0x1e, 0x20, 0x21, 0x23, 0x27]

AaFcSongsCheevo(
    OriginalShopIds,
    CollectionTraditionalData,
    CollectionDspAaFc,
    always_false(),
    "Original Premium DSP Master",
    5,
    "Get AA or FC ranks on all premium original songs on DSP.",
    length(OriginalShopIds)
)

AaFcSongsCheevo(
    OriginalShopIds,
    CollectionDoubleChartData,
    CollectionEspAaFc,
    CollectionCspAaFc,
    "Original Premium ESP/CSP Master",
    10,
    "Get AA or FC ranks on all premium original songs on ESP and CSP.",
    length(OriginalShopIds) + 1
)

AaFcSongsCheevo(
    OriginalShopIds,
    CollectionTraditionalData,
    CollectionDdpAaFc,
    always_false(),
    "Original Premium DDP Master",
    5,
    "Get AA or FC ranks on all premium original songs on DDP.",
    length(OriginalShopIds)
)

AaFcSongsCheevo(
    OriginalShopIds,
    CollectionDoubleChartData,
    CollectionEdpAaFc,
    CollectionCdpAaFc,
    "Original Premium EDP/CDP Master",
    10,
    "Get AA or FC ranks on all premium original songs on EDP and CDP.",
    length(OriginalShopIds) + 1
)

BemaniShopIds = [0x2b, 0x2d, 0x2e, 0x2f, 0x30, 0x32, 0x33, 0x34, 0x36, 0x37,
0x38, 0x3b, 0x3c, 0x3e, 0x40, 0x43, 0x45, 0x46, 0x48]

AaFcSongsCheevo(
    BemaniShopIds,
    CollectionTraditionalData,
    CollectionDspAaFc,
    always_false(),
    "Bemani Premium DSP Master",
    5,
    "Get AA or FC ranks on all premium BEMANI songs on DSP.",
    length(BemaniShopIds)
)

AaFcSongsCheevo(
    BemaniShopIds,
    CollectionDoubleChartData,
    CollectionEspAaFc,
    CollectionCspAaFc,
    "Bemani Premium ESP/CSP Master",
    10,
    "Get AA or FC ranks on all premium BEMANI songs on ESP and CSP.",
    length(BemaniShopIds) + 2
)

AaFcSongsCheevo(
    BemaniShopIds,
    CollectionTraditionalData,
    CollectionDdpAaFc,
    always_false(),
    "Bemani Premium DDP Master",
    5,
    "Get AA or FC ranks on all premium BEMANI songs on DDP.",
    length(BemaniShopIds)
)

AaFcSongsCheevo(
    BemaniShopIds,
    CollectionDoubleChartData,
    CollectionEdpAaFc,
    CollectionCdpAaFc,
    "Bemani Premium EDP/CDP Master",
    10,
    "Get AA or FC ranks on all premium BEMANI songs on EDP and CDP.",
    length(BemaniShopIds) + 2
)

AaFcSongsCheevo(
    range(0x49, 0x4e),
    CollectionTraditionalData,
    CollectionCspAaFc,
    always_false(),
    "Groovy CSP Master",
    25,
    "Get AA or FC ranks on all Groove Radar Songs on CSP.",
    6
)

AaFcSongsCheevo(
    range(0x49, 0x4e),
    CollectionTraditionalData,
    CollectionCdpAaFc,
    always_false(),
    "Groovy CDP Master",
    25,
    "Get AA or FC ranks on all Groove Radar Songs on CDP.",
    6
)

AaFcSongsCheevo(
    range(0x4f, 0x4f + 5),
    CollectionTraditionalData,
    CollectionDspAaFc,
    always_false(),
    "Boss DSP Master",
    10,
    "Get AA or FC ranks on all Boss Songs on DSP.",
    6
)

AaFcSongsCheevo(
    range(0x4f, 0x4f + 5),
    CollectionDoubleChartData,
    CollectionEspAaFc,
    CollectionCspAaFc,
    "Boss ESP/CSP Master",
    50,
    "Get AA or FC ranks on all Boss Songs on ESP and CSP.",
    11
)

AaFcSongsCheevo(
    range(0x4f, 0x4f + 5),
    CollectionTraditionalData,
    CollectionDdpAaFc,
    always_false(),
    "Boss DDP Master",
    10,
    "Get AA or FC ranks on all Boss Songs on DDP.",
    6
)

AaFcSongsCheevo(
    range(0x4f, 0x4f + 5),
    CollectionDoubleChartData,
    CollectionEdpAaFc,
    CollectionCdpAaFc,
    "Boss EDP/CDP Master",
    50,
    "Get AA or FC ranks on all Boss Songs on ESP and CDP.",
    11
)

// Extra Stage Cheevos

ActiveStageNum = byte(ActivePlayerPointer + 0x8dc32c)
ActiveStageGrade = byte(ActiveStageNum * 0x18 + 0x8dc35c)
EvalStageDiff = byte(ActiveStageNum * 0x18 + 0x8dc35d)

PriorStageSong = byte(((ActiveStageNum) - 1) * 0x18 + 0x8dc350)
PriorStageSong2 = byte(((ActiveStageNum) - 2) * 0x18 + 0x8dc350)

P1ActiveStageNum = byte(0x8dc32c)
P1ActiveStageSong = byte(P1ActiveStageNum * 0x18 + 0x8dc350)
P1ActiveStageScore = dword(P1ActiveStageNum * 0x18 + 0x8dc354)
P1ActiveStageGrade = byte(P1ActiveStageNum * 0x18 + 0x8dc35c)
P1EvalStageDiff = byte(P1ActiveStageNum * 0x18 + 0x8dc35d)
P1PriorStageSong = byte(((P1ActiveStageNum) - 1) * 0x18 + 0x8dc350)
P1PriorStageSong2 = byte(((P1ActiveStageNum) - 2) * 0x18 + 0x8dc350)

// Hardcoding these to minimize add address chaos.
P2ActiveStageNum = byte(0x938acc)
P2ActiveStageSong = byte(P2ActiveStageNum * 0x18 + 0x938af0)
P2ActiveStageScore = byte(P2ActiveStageNum * 0x18 + 0x938af4)
P2ActiveStageGrade = byte(P2ActiveStageNum * 0x18 + 0x938afc)
P2EvalStageDiff = byte(P2ActiveStageNum * 0x18 + 0x938afd)
P2PriorStageSong = byte(((P2ActiveStageNum) - 1) * 0x18 + 0x938af0)
P2PriorStageSong2 = byte(((P2ActiveStageNum) - 2) * 0x18 + 0x938af0)

achievement(
    title = "May The Alarms Go Away On Future Mixes",
    points = 5,
    description = "Earn an Extra Stage on any boss (red) song. [Difficult+]",
    trigger = ValidMachineDiff && SelectedStyle != 5 && CanReachExtraStage() &&
        LoadedSongId >= 0x4f && LoadedSongId <= 0x54 && ActiveMode == 0 &&
        ((
            P1First &&
            P1EvalStageDiff > 1 && P1EvalStageDiff < 7 &&
            P1ActiveStageGrade >= 1 && P1ActiveStageGrade <= 2
        ) ||
        (
            P2First &&
            P2EvalStageDiff > 1 && P2EvalStageDiff < 7 &&
            P2ActiveStageGrade >= 1 && P2ActiveStageGrade <= 2
        )) &&
        // Respect the AddAddress situation: we want to compare to a value.
        (
            (NormalStageCount == 1 && ActiveStageNum == 1) ||
            (NormalStageCount == 2 && ActiveStageNum == 2) ||
            (NormalStageCount == 3 && ActiveStageNum == 3) ||
            (NormalStageCount == 4 && ActiveStageNum == 4)
        )
)

achievement(
    title = "Encore. Encore!",
    points = 10,
    description = "Earn an Encore Extra Stage on any other boss (red) song. [Difficult+]",
    trigger = ValidMachineDiff && SelectedStyle != 5 && CanReachExtraStage() &&
        LoadedSongId >= 0x4f && LoadedSongId <= 0x54 && ActiveMode == 0 &&
        ((
            P1First &&
            P1EvalStageDiff > 1 && P1EvalStageDiff < 7 &&
            P1ActiveStageGrade >= 1 && P1ActiveStageGrade <= 2 &&
            P1PriorStageSong - 1 != LoadedSongId
        ) ||
        (
            P2First &&
            P2EvalStageDiff > 1 && P2EvalStageDiff < 7 &&
            P2ActiveStageGrade >= 1 && P2ActiveStageGrade <= 2 &&
            P2PriorStageSong - 1 != LoadedSongId
        )) &&
        // Respect the AddAddress situation: we want to compare to a value.
        (
            (NormalStageCount == 1 && ActiveStageNum == 2) ||
            (NormalStageCount == 2 && ActiveStageNum == 3) ||
            (NormalStageCount == 3 && ActiveStageNum == 4) ||
            (NormalStageCount == 4 && ActiveStageNum == 5)
        )
)

achievement(
    title = "You Are Supreme!",
    points = 10,
    description = "Complete the Encore Extra Stage on a third boss (red) song. [Difficult+]",
    trigger = ValidMachineDiff && SelectedStyle != 5 && CanReachExtraStage() &&
        LoadedSongId >= 0x4f && LoadedSongId <= 0x54 && ActiveMode == 0 &&
        ((
            P1First &&
            P1EvalStageDiff > 1 && P1EvalStageDiff < 7 &&
            P1ActiveStageGrade >= 1 && P1ActiveStageGrade < 7 &&
            P1PriorStageSong - 1 != LoadedSongId &&
            P1PriorStageSong2 - 1 != LoadedSongId
        ) ||
        (
            P2First &&
            P2EvalStageDiff > 1 && P2EvalStageDiff < 7 &&
            P2ActiveStageGrade >= 1 && P2ActiveStageGrade < 7 &&
            P2PriorStageSong - 1 != LoadedSongId &&
            P2PriorStageSong2 - 1 != LoadedSongId
        )) &&
        // Respect the AddAddress situation: we want to compare to a value.
        (
            (NormalStageCount == 1 && ActiveStageNum == 3) ||
            (NormalStageCount == 2 && ActiveStageNum == 4) ||
            (NormalStageCount == 3 && ActiveStageNum == 5) ||
            (NormalStageCount == 4 && ActiveStageNum == 6)
        )
)

achievement(
    title = "Good News: Greats Now Allowed",
    points = 10,
    description = "[Game Mode] Get an AAA on any non-beginner chart.",
    trigger = 
        never(!GsGameEvaluation && !GsGameSelectMusic && !GsGameGameplay) &&
        ValidMachineDiff && never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(prev(GameState) != 0x1f2ad0 && GsGameSelectMusic) &&
        once(prev(GameState) != 0x1dba70 && GsGameGameplay) &&
        ((
            P1First &&
            P1EvalStageDiff < 7 &&
            P1ActiveStageGrade == 1
        ) ||
        (
            P2First &&
            P2EvalStageDiff < 7 &&
            P2ActiveStageGrade == 1
        ))
)

achievement(
    title = "Bad News: This Still Exists",
    points = 25,
    description = "[Game Mode] Get a Perfect Full Combo on any non-beginner chart.",
    trigger =
        never(!GsGameEvaluation && !GsGameSelectMusic && !GsGameGameplay) &&
        ValidMachineDiff && never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(prev(GameState) != 0x1f2ad0 && GsGameSelectMusic) &&
        once(prev(GameState) != 0x1dba70 && GsGameGameplay) &&
        PASongGreat == 0 && PASongGood == 0 && PASongAlmost == 0 &&
        PASongBoo == 0 && PASongNG == 0 && PASongNoHold == 0 &&
        ((
            P1First &&
            P1EvalStageDiff < 7 &&
            trigger_when(P1ActiveStageGrade == 1)
        ) || (
            P2First &&
            P2EvalStageDiff < 7 &&
            trigger_when(P2ActiveStageGrade == 1)
        ))
)

// Course Mode Cheevos
// Remember: we ONLY care about regular life bar passes this time around.
// Battery is to be done on a subset for later.

CoursePoints = {
    100: 3,
    200: 3,
    101: 4,
    201: 4,
    102: 3,
    202: 3,
    103: 4,
    203: 4,
    104: 4,
    204: 4,
    105: 5,
    205: 5,
    106: 4,
    206: 4,
    107: 5,
    207: 5,
    108: 4,
    208: 4,
    109: 5,
    209: 5,
    110: 4,
    210: 4,
    111: 5,
    211: 5,
    112: 4,
    212: 4,
    113: 5,
    213: 5,
    114: 3,
    214: 3,
    115: 4,
    215: 4,
    116: 4,
    216: 4,
    117: 5,
    217: 5,
    118: 3,
    218: 3,
    119: 4,
    219: 4,
    120: 5,
    220: 5,
    121: 4,
    221: 4,
    122: 4,
    222: 4,
    123: 4,
    223: 4,
    124: 10,
    224: 10,
    125: 5,
    225: 5,
    126: 5,
    226: 5,
    127: 25,
    227: 50,
    128: 10,
    228: 10,
    129: 10,
    229: 25,
    130: 5,
    230: 5,
    131: 5,
    231: 5,
    132: 5,
    232: 5,
    133: 4,
    233: 4,
    134: 5,
    234: 5,
    135: 5,
    235: 5,
    136: 10,
    236: 10,
    137: 4,
    237: 4,
    138: 5,
    238: 5,
    139: 5,
    239: 5
}

function Cut() => bit3(0x8dc34c + ActivePlayerPointer) == 1
function Freeze() => bit7(0x8dc34d + ActivePlayerPointer) == 0
function Jump1() => bit5(0x8dc34e + ActivePlayerPointer) == 1
function Jump2() => bit6(0x8dc34e + ActivePlayerPointer) == 1

function CourseClearCheevo(style, id) {
    title = format("{0} {1}", CourseLookup[id], SelectedStyleLookup[style])
    base = 0x5135ec
    if (style == 2) {
        base = 0x5135ee
    }
    passCheck = word(base + (60 * id))
    achievement(
        title = title,
        points = CoursePoints[style * 100 + id],
        description = format(
            "Clear the stated course with the regular lifebar on {0}. No omissive mods allowed.",
            SelectedStyleLookup[style]
        ),
        trigger = never(!GsGameEvaluation && !GsSelectCourse && !GsGameGameplay) &&
        ValidMachineDiff && never(SelectedStyle != style) &&
        never(ActiveMode != 3) &&
        never(ActiveAdvancedMode != 0) &&
        never(LoadedCourseId != id) &&
        never(prev(GameState) != 0x31bad0 && GsSelectCourse) &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(LoadedCourseId != 0x27 && Cut()) &&
        never(LoadedCourseId != 0x27 && Freeze()) &&
        never(LoadedCourseId != 0x27 && Jump1()) &&
        never(LoadedCourseId != 0x27 && Jump2()) &&
        once(
            prev(GameState) == 0x31bad0 && GsGameGameplay
        ) &&
        trigger_when(passCheck > prev(passCheck))
    )
}

for s in range(0, 0x27) {
    for i in range(1, 2) {
        CourseClearCheevo(i, s)
    }
}

// Specific Song Challenge Cheevos
// Can be in either game mode or Hyper Master Mode.

NoEasyModules = never(byte(0x5163c4) != 0 && byte(0x5163c4) < 0x24) &&
    never(byte(0x5163c8) != 0 && byte(0x5163c8) < 0x24) &&
    never(byte(0x5163cc) != 0 && byte(0x5163cc) < 0x24) &&
    never(byte(0x5163d0) != 0 && byte(0x5163d0) < 0x24)

function ModuleActive(val) => byte(0x5163c4) == val || byte(0x5163c8) == val ||
    byte(0x5163cc) == val || byte(0x5163d0) == val || byte(0x5163d4) == val ||
    byte(0x5163d8) == val


function MinARank(addr) {
    return addr != 0 && addr <= 3
}

function MinScore(score, addr) => prev(dword(addr)) == 0 && dword(addr) >= score

function SpeedMod() => bit4(0x8dc34d + ActivePlayerPointer) * 16 +
    bit3(0x8dc34d + ActivePlayerPointer) * 8 +
    bit2(0x8dc34d + ActivePlayerPointer) * 4 +
    bit1(0x8dc34d + ActivePlayerPointer) * 2 +
    bit0(0x8dc34d + ActivePlayerPointer)

function Min2x() {
    return SpeedMod() >= 4
}

function Shuffle() => byte(0x8dc345 + ActivePlayerPointer) >= 5

function Reverse() => bit5(0x8dc34d + ActivePlayerPointer) == 1

function Mirror() => byte(0x8dc345 + ActivePlayerPointer) == 3

function Hidden() => bit0(0x8dc34c + ActivePlayerPointer) == 1
function Sudden() => bit1(0x8dc34c + ActivePlayerPointer) == 1
function Boost() => bit6(0x8dc34c + ActivePlayerPointer) == 1

function Dark() => bit4(0x8dc34e + ActivePlayerPointer) == 1

function Rainbow() => bit2(0x8dc34e + ActivePlayerPointer) == 1
function Note() => bit7(0x8dc34e + ActivePlayerPointer) == 1
function Flat() => bit0(0x8dc34e + ActivePlayerPointer) == 0
function Vivid() => !Flat() && !Rainbow() && !Note()

ModProtection = never(bit3(0x8dc34c + ActivePlayerPointer) == 1) && // Little 
    never(bit7(0x8dc34d + ActivePlayerPointer) == 0) && // Freeze
    never(bit5(0x8dc34e + ActivePlayerPointer) == 1) && // Jump Off 1
    never(bit6(0x8dc34e + ActivePlayerPointer) == 1) // Jump Off 2

CommonAFinish = ((
    P1First &&
    trigger_when(MinARank(P1ActiveStageGrade))
) || (
    P2First &&
    trigger_when(MinARank(P2ActiveStageGrade))
))

EvaluationNowActive = EvaluationActive && prev(byte(0x5b22b1)) == 0

achievement(
    title = "Wolf Waltz: Getting Over It",
    points = 10,
    description = format(
        "Get at least an A rank on {0} Expert on at least 2x Boost. [Game]",
        SelectMusicLookup[0]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 0) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Boost()) &&
        never(!Min2x()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        CommonAFinish &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Self Reflections Necessary At Times",
    points = 10,
    description = format(
        "Get 850000 points or more on {0} Expert using Mirror Reverse. [Game]",
        SelectMusicLookup[1]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 1) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Mirror()) &&
        never(!Reverse()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(PAGameplaySongScore >= 850000) &&
        ((
            P1First &&
            trigger_when(P1EvalStageDiff == 3)
        ) || (
            P2First &&
            trigger_when(P2EvalStageDiff == 3)
        )) &&
        trigger_when(EvaluationNowActive)
)

PALifeBar = word(0x8dc2d6 + ActivePlayerPointer)

achievement(
    title = "Wolf Waltz: Always Room For New Beginnings",
    points = 10,
    description = format(
        "Drain your health bar on {0} Expert after getting reaching 875000 points. [Game]",
        SelectMusicLookup[2]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 2) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(GsGameEvaluation) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        prev(PALifeBar) != 0 &&
        trigger_when(PAGameplaySongScore >= 875000) &&
        trigger_when(PALifeBar == 0)
)

achievement(
    title = "Wolf Waltz: Stop, Drop, And Roll",
    points = 10,
    description = format(
        "Get at least an A rank on {0} Expert using 2x Left/Right Note. [Game]",
        SelectMusicLookup[3]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle != 1) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 3) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Note()) &&
        never(SpeedMod() != 4) &&
        never(byte(0x8dc345 + ActivePlayerPointer) != 2 &&
            byte(0x8dc345 + ActivePlayerPointer) != 4) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        CommonAFinish &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Washing Away The Sanity",
    points = 10,
    description = format(
        "Get at least an A rank on {0} Expert using at most 2x Hidden Reverse. [Game]",
        SelectMusicLookup[4]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 4) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(SpeedMod() > 4) &&
        never(!Reverse()) &&
        never(!Hidden()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        CommonAFinish &&
        trigger_when(EvaluationNowActive)
)


achievement(
    title = "Wolf Waltz: Making Sense Of Your One Dream",
    points = 10,
    description = format(
        "Get to the end of {0} Expert with 250 combo or more while using the Super Shuffle module. [HMM]",
        SelectMusicLookup[5]
    ),
    trigger = ValidMachineDiff &&
        never(ActiveMode != 1) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 5) &&
        NoEasyModules &&
        never(!ModuleActive(0x2c)) &&
        never(HmmDouble) &&
        never(HmmLastAny != 74) &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        once(ActivatedSong) &&
        trigger_when(PASongMaxCombo >= 250) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Disco Was Good",
    points = 10,
    description = format(
        "Clear {0} Expert with at least 50 goods. [Game]",
        SelectMusicLookup[6]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 6) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(PASongGood >= 50) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Flexibility Bordering On Information Overload",
    points = 10,
    description = format(
        "Clear {0} Expert using all seven non-ommisive mods. [Game]",
        SelectMusicLookup[7]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 7) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(SpeedMod() == 2) &&
        never(!Boost()) &&
        never(!Hidden() && !Sudden()) &&
        never(byte(0x8dc345 + ActivePlayerPointer) == 1) &&
        never(!Reverse()) &&
        never(!Dark()) &&
        never(Vivid()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Blame Konami For The Info Page",
    points = 10,
    description = format(
        "Clear {0} using both its namesake mod and Shuffle. No Beginner difficulty. [Game]",
        SelectMusicLookup[8]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 8) &&
        never(PASongDiff == 7) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Hidden()) &&
        never(!Sudden()) &&
        never(!Shuffle()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Clear Blue Skies",
    points = 10,
    description = format(
        "Get an A or better on {0} Expert using at least 1.5x Boost Rainbow. [Game]",
        SelectMusicLookup[9]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 9) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(SpeedMod() == 2) &&
        never(!Boost()) &&
        never(!Rainbow()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        CommonAFinish &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Renmants of In The Groove",
    points = 10,
    description = format(
        "Get to the end of {0} Expert with at least 130 combo and the Stepzone module. [HMM]",
        SelectMusicLookup[10]
    ),
    trigger = ValidMachineDiff &&
        never(ActiveMode != 1) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 10) &&
        NoEasyModules &&
        never(!ModuleActive(0x53)) &&
        never(!ModuleActive(0x55)) &&
        never(HmmLastAny != 26) &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        once(ActivatedSong) &&
        trigger_when(PASongMaxCombo >= 130) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: When Songs Get Egotistical",
    points = 10,
    description = format(
        "Get to the end of {0} Expert Single using the Center module. [HMM]",
        SelectMusicLookup[11]
    ),
    trigger = ValidMachineDiff &&
        never(ActiveMode != 1) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 11) &&
        NoEasyModules &&
        never(!ModuleActive(0x29)) &&
        never(!ModuleActive(0x55)) &&
        never(HmmDouble) &&
        never(HmmLastAny != 64) &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        once(ActivatedSong) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Two Misses Only...",
    points = 10,
    description = format(
        "Clear {0} Expert. Max combo must be exactly 100. You must get exactly two boos. [GAME]",
        SelectMusicLookup[12]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 12) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(prev(PASongBoo) <= 2 && PASongBoo > 2) &&
        never(prev(PASongMaxCombo) <= 100 && PASongMaxCombo > 100) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(PASongBoo == 2) &&
        trigger_when(PASongMaxCombo == 100) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Burdened With Problems And Questions",
    points = 10,
    description = format(
        "Get an A rank or better on {0} Expert using at least 2x Boost Reverse. [Game]",
        SelectMusicLookup[13]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 13) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Boost()) &&
        never(!Reverse()) &&
        never(!Min2x()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        CommonAFinish &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Taking The Journey Slowly",
    points = 10,
    description = format(
        "Clear {0} Expert on 1x Vivid. Never reach 10 combo. [Game]",
        SelectMusicLookup[14]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 14) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(SpeedMod() != 2) &&
        never(!Vivid()) &&
        never(prev(PASongMaxCombo) < 10 && PASongMaxCombo >= 10) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

PALastJudgment = byte(0x8dc58a + ActivePlayerPointer)

function MustJudgmentStep(step, judgment) {
    return never(
        PALastJudgment != judgment &&
        prev(PASongAllStep) + 1 == step &&
        PASongAllStep == step
    )
}

function AtLeastJudgmentStep(step, judgment) {
    return never(
        PALastJudgment > judgment && PALastJudgment != 0 &&
        prev(PASongAllStep) + 1 == step &&
        PASongAllStep == step
    )
}

function MustMissStep(step) => MustJudgmentStep(step, 6)
function AtLeastGreatStep(step) => AtLeastJudgmentStep(step, 3)
function AtLeastPerfectStep(step) => AtLeastJudgmentStep(step, 2)
function AtLeastMarvelousStep(step) => AtLeastJudgmentStep(step, 1)

achievement(
    title = "Wolf Waltz: Waiting Can Be Painful",
    points = 10,
    description = format(
        "Clear {0} Expert. Miss all notes when the word \"Waiting\" is said. [Game]",
        SelectMusicLookup[15]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 15) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        ((
            unless(SelectedStyle == 2) &&
            MustMissStep(0x09) &&
            MustMissStep(0x0a) &&
            MustMissStep(0x9e) &&
            MustMissStep(0x9f) &&
            MustMissStep(0xbb) &&
            MustMissStep(0xbc) &&
            MustMissStep(0xd9) &&
            MustMissStep(0xda) &&
            MustMissStep(0xf6) &&
            MustMissStep(0xf7)
        ) || (
            unless(SelectedStyle == 1) &&
            MustMissStep(0x0a) &&
            MustMissStep(0x0b) &&
            MustMissStep(0x7f) &&
            MustMissStep(0x80) &&
            MustMissStep(0x98) &&
            MustMissStep(0x99) &&
            MustMissStep(0xb1) &&
            MustMissStep(0xb2) &&
            MustMissStep(0xca) &&
            MustMissStep(0xcb) &&
            MustMissStep(0xe3) &&
            MustMissStep(0xe4)
        )) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Nature Can Be Stunning",
    points = 10,
    description = format(
        "Score 850000 points or more on {0} Expert with at least 2x Sudden. [Game]",
        SelectMusicLookup[16]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 16) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Min2x()) &&
        never(!Sudden()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(PAGameplaySongScore >= 850000) &&
        ((
            P1First &&
            trigger_when(P1EvalStageDiff == 3)
        ) || (
            P2First &&
            trigger_when(P2EvalStageDiff == 3)
        )) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: The Lonely Chaotic Mind",
    points = 10,
    description = format(
        "Get to the end of {0} Expert using the StepZone, Shuffle, and Center modules. [HMM]",
        SelectMusicLookup[17]
    ),
    trigger = ValidMachineDiff &&
        never(ActiveMode != 1) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 17) &&
        NoEasyModules &&
        never(!ModuleActive(0x29)) &&
        never(!ModuleActive(0x2b)) &&
        never(!ModuleActive(0x55)) &&
        never(HmmDouble) &&
        never(HmmLastAny != 1) &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        once(ActivatedSong) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Small States Can Use Boosts",
    points = 5,
    description = format(
        "Clear {0} Expert using 1.5x Boost Vivid and the Small arrow type. [Game]",
        SelectMusicLookup[18]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 18) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(byte(0x5186ed) != 5) &&
        never(SpeedMod() != 3) &&
        never(!Boost()) &&
        never(!Vivid()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Missing Pieces",
    points = 10,
    description = format(
        "Get a full combo on {0} Expert using the View 3 and View 4 modules. [HMM]",
        SelectMusicLookup[19]
    ),
    trigger = ValidMachineDiff &&
        never(ActiveMode != 1) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 19) &&
        NoEasyModules &&
        never(!ModuleActive(0x26)) &&
        never(!ModuleActive(0x27)) &&
        ((
            unless(HmmDouble) &&
            never(HmmLastAny != 9) &&
            never(!ModuleActive(0x55))
        ) ||
        (
            unless(HmmSingle) &&
            never(HmmLastAny != 56)
        )) &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        once(ActivatedSong) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: The Legend Of Great Attack",
    points = 10,
    description = format(
        "Clear {0} Expert with at least half the steps being Great judgments. [Game]",
        SelectMusicLookup[20]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 20) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(PASongGreat + PASongGreat >= PASongAllStep) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Nurtured Flowers From Netherlands",
    points = 10,
    description = format(
        "Get an A rank or better on {0} Expert with Sudden Vivid and the Tulip arrow type. [Game]",
        SelectMusicLookup[21]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 21) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(byte(0x5186ed) != 4) &&
        never(!Sudden()) &&
        never(!Vivid()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Time For Danger",
    points = 10,
    description = format(
        "Clear {0} Expert while spending 45 seconds or more with low health. [Game]",
        SelectMusicLookup[22]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 22) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(repeated(
            60 * 45,
            prev(PASongAllStep) < dword(0x8dc5a4 + ActivePlayerPointer) &&
            byte(0x1fce65c) >= 4 && PALifeBar < 280
        )) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Looking For Love In The Wrong Places",
    points = 10,
    description = format(
        "Get an A rank or better on {0} Expert while using at least 1.5x Left/Right Reverse. [Game]",
        SelectMusicLookup[23]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 23) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(byte(0x8dc345 + ActivePlayerPointer) != 2 &&
            byte(0x8dc345 + ActivePlayerPointer) != 4) &&
        never(!Reverse()) &&
        never(SpeedMod() == 2) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        CommonAFinish &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Dreams Sometimes Leave Us Quickly",
    points = 5,
    description = format(
        "Clear {0} Expert while using 5x Shuffle Vivid. [Game]",
        SelectMusicLookup[24]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 24) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Vivid()) &&
        never(SpeedMod() != 10) &&
        never(!Shuffle()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: No Flatlining Here",
    points = 10,
    description = format(
        "Get an A rank or better on {0} Expert while using Boost Flat. [Game]",
        SelectMusicLookup[25]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 25) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Flat()) &&
        never(!Boost()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        CommonAFinish &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Losing Control",
    points = 10,
    description = format(
        "Clear {0} Expert while spending 45 seconds or more with low health: no mods allowed. [Game]",
        SelectMusicLookup[26]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 26) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(SpeedMod() != 2) &&
        never(byte(0x8dc345 + ActivePlayerPointer) != 1) &&
        never(Boost()) &&
        never(Hidden()) &&
        never(Sudden()) &&
        never(Dark()) &&
        never(Reverse()) &&
        never(!Vivid()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(repeated(
            60 * 45,
            prev(PASongAllStep) < dword(0x8dc5a4 + ActivePlayerPointer) &&
            byte(0x1fce65c) >= 4 && PALifeBar < 280
        )) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Shades Of Pump It Up",
    points = 10,
    description = format(
        "Get an A rank ONLY on {0} Expert while using 3x Shuffle Dark. [Game]",
        SelectMusicLookup[27]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 27) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(SpeedMod() != 6) &&
        never(!Dark()) &&
        never(!Shuffle()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) && 
        ((
            P1First &&
            trigger_when(P1ActiveStageGrade == 3)
        ) || (
            P2First &&
            trigger_when(P2ActiveStageGrade == 3)
        )) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Forever Burning",
    points = 5,
    description = format(
        "Clear {0} Expert using the 2x Reverse Note. [Game]",
        SelectMusicLookup[28]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 28) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(SpeedMod() != 4) &&
        never(!Reverse()) &&
        never(!Note()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Like A Rainbow",
    points = 10,
    description = format(
        "Get an A rank or better on {0} Expert using 3x Dark Reverse Rainbow. [Game]",
        SelectMusicLookup[29]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 29) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(SpeedMod() != 6) &&
        never(!Dark()) &&
        never(!Reverse()) &&
        never(!Rainbow()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Janet Perlstein's Favorite",
    points = 10,
    description = format(
        "Clear {0} Expert after dipping into danger health 10 times. Flat is required. [Game]",
        SelectMusicLookup[30]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 30) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Flat()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(repeated(10, 
            byte(0x1fce65c) >= 4 && PALifeBar < 280 && prev(PALifeBar) >= 280
        )) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: What Rhythm?",
    points = 10,
    description = format(
        "Keep the health bar alive on {0} Expert while using the Lag module. [HMM]",
        SelectMusicLookup[31]
    ),
    trigger = ValidMachineDiff &&
        never(ActiveMode != 1) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 31) &&
        NoEasyModules &&
        never(!ModuleActive(0x2d)) &&
        never(!ModuleActive(0x55)) &&
        ((
            unless(HmmDouble) &&
            never(HmmLastAny != 55)
        ) ||
        (
            unless(HmmSingle) &&
            never(HmmLastAny != 46)
        )) &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        once(ActivatedSong) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Jumping Jehosaphish",
    points = 10,
    description = format(
        "Get an A rank or better on {0} Expert while using Boost Vivid and the Angelfish arrow type. [Game]",
        SelectMusicLookup[32]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 32) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Boost()) &&
        never(!Vivid()) &&
        never(byte(0x5186ed) != 1) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        CommonAFinish &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Chaotic Composition",
    points = 10,
    description = format(
        "Get an A rank or better on {0} Expert while using Shuffle Dark Vivid. [Game]",
        SelectMusicLookup[33]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 33) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Dark()) &&
        never(!Vivid()) &&
        never(!Shuffle()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        CommonAFinish &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Dark And Overcast",
    points = 5,
    description = format(
        "Clear {0} Expert while using Dark Reverse Flat. [Game]",
        SelectMusicLookup[34]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 34) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Dark()) &&
        never(!Flat()) &&
        never(!Reverse()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: There's Always Two Sides To A Story",
    points = 10,
    description = format(
        "Get an A rank or better on the ~jun side~ of {0} Expert. [Game]",
        SelectMusicLookup[35]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 35) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        ((
            P1First &&
            trigger_when(MinARank(P1ActiveStageGrade)) &&
            trigger_when(P1ActiveStageSong == 37)
        ) || (
            P2First &&
            trigger_when(MinARank(P2ActiveStageGrade)) &&
            trigger_when(P2ActiveStageSong == 37)
        )) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: A Different Type Of Drill",
    points = 10,
    description = format(
        "Get a full combo on {0} Expert while using 1x Mirror Rainbow. [Game]",
        SelectMusicLookup[38]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 38) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(SpeedMod() != 2) &&
        never(!Rainbow()) &&
        never(!Mirror()) &&
        never(prev(PASongGood) + 1 == PASongGood) &&
        never(prev(PASongAlmost) + 1 == PASongAlmost) &&
        never(prev(PASongBoo) + 1 == PASongBoo) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: A Different Kind Of Heaven",
    points = 10,
    description = format(
        "Get 850K points or more on {0} Challenge while using the View 3, View 4, and Stairs modules. [HMM]",
        SelectMusicLookup[39]
    ),
    trigger = ValidMachineDiff &&
        never(ActiveMode != 1) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 39) &&
        NoEasyModules &&
        never(!ModuleActive(0x26)) &&
        never(!ModuleActive(0x27)) &&
        never(!ModuleActive(0x54)) &&
        never(HmmDouble) &&
        never(HmmLastAny != 92) &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        once(ActivatedSong) &&
        trigger_when(PAGameplaySongScore >= 850000) &&
        trigger_when(EvaluationNowActive)
)
achievement(
    title = "Wolf Waltz: Quick On Your Feet",
    points = 5,
    description = format(
        "Clear {0} Expert while using 1x Sudden Shuffle Vivid and the Foot arrow type. [Game]",
        SelectMusicLookup[40]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 40) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(SpeedMod() != 2) &&
        never(!Vivid()) &&
        never(!Shuffle()) &&
        never(!Sudden()) &&
        never(byte(0x5186ed) != 3) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)


achievement(
    title = "Wolf Waltz: The Danger Can Hide From You",
    points = 5,
    description = format(
        "Clear {0} Expert while using Boost Hidden Note. [Game]",
        SelectMusicLookup[41]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 41) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Note()) &&
        never(!Boost()) &&
        never(!Hidden()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Because I Felt Like It",
    points = 5,
    description = format(
        "Clear {0} Expert while using Hidden and the S-core arrow type. [Game]",
        SelectMusicLookup[42]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 42) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Hidden()) &&
        never(byte(0x5186ed) != 2) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Boss Song In Disguise?",
    points = 10,
    description = format(
        "Clear {0} Expert after spending 50 seconds in low health. Note is forbidden. [Game]",
        SelectMusicLookup[43]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 43) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(Note()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(repeated(
            60 * 50,
            prev(PASongAllStep) < dword(0x8dc5a4 + ActivePlayerPointer) &&
            byte(0x1fce65c) >= 4 && PALifeBar < 280
        )) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Technically More Accurate",
    points = 10,
    description = format(
        "Have 90% or more health at the end of {0} Expert while using the Expert and View 3 modules. [HMM]",
        SelectMusicLookup[44]
    ),
    trigger = ValidMachineDiff &&
        never(ActiveMode != 1) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 44) &&
        NoEasyModules &&
        never(!ModuleActive(0x26)) &&
        never(!ModuleActive(0x55)) &&
        ((
            unless(HmmDouble) &&
            never(HmmLastAny != 16)
        ) ||
        (
            unless(HmmSingle) &&
            never(HmmLastAny != 43)
        )) &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        once(ActivatedSong) &&
        trigger_when(PALifeBar >= 900) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Red Skeletons Not Included",
    points = 5,
    description = format(
        "Clear {0} Expert while using at least 1.5x Boost Reverse Note. [Game]",
        SelectMusicLookup[45]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 45) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Note()) &&
        never(SpeedMod() == 2) &&
        never(!Reverse()) &&
        never(!Boost()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Perfect Attack Practice",
    points = 10,
    description = format(
        "Get to the end of {0} Expert while using either Hard Judge module. [HMM]",
        SelectMusicLookup[46]
    ),
    trigger = ValidMachineDiff &&
        never(ActiveMode != 1) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 46) &&
        NoEasyModules &&
        never(!ModuleActive(0x45) && !ModuleActive(0x46)) &&
        never(!ModuleActive(0x55)) &&
        ((
            unless(HmmDouble) &&
            never(HmmLastAny != 17)
        ) ||
        (
            unless(HmmSingle) &&
            never(HmmLastAny != 49)
        )) &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        once(ActivatedSong) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Too Hot To Handle",
    points = 10,
    description = format(
        "Clear {0} Expert after getting 30 boos. [Game]",
        SelectMusicLookup[47]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 47) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(PASongBoo >= 30) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Reaching For More",
    points = 5,
    description = format(
        "Clear {0} Double Expert on 2x Rainbow. [Game]",
        SelectMusicLookup[48]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle != 2) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 48) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(SpeedMod() != 4) &&
        never(!Rainbow()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Love Is Not Easy",
    points = 10,
    description = format(
        "Clear {0} Expert after getting 15 almost judgments. [Game]",
        SelectMusicLookup[49]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 49) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(PASongAlmost >= 15) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Right, Let's Skip Along",
    points = 10,
    description = format(
        "Clear {0} on Difficult or Expert while never reaching 10 combo. [Game]",
        SelectMusicLookup[50]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 50) &&
        never(PASongDiff < 2) &&
        never(PASongDiff > 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(prev(PASongMaxCombo) < 10 && PASongMaxCombo >= 10) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Bringing The House Down",
    points = 10,
    description = format(
        "End {0} Expert with 100 max combo or more while using Boost Reverse. Rainbow and Note are forbidden. [Game]",
        SelectMusicLookup[51]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 51) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Boost()) &&
        never(!Reverse()) &&
        never(Rainbow()) &&
        never(Note()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(PASongMaxCombo >= 100) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Into The Dark Black Forest",
    points = 10,
    description = format(
        "Clear {0} Expert while reaching 25 max combo at least 5 times. Exceeding 25 max combo is forbidden. [Game]",
        SelectMusicLookup[52]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 52) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(prev(PASongMaxCombo) <= 25 && PASongMaxCombo > 25) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(repeated(
            5,
            prev(dword(0x8dc548 + ActivePlayerPointer)) == 24 && 
            dword(0x8dc548 + ActivePlayerPointer) == 25
        )) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Distracted By The Chanting",
    points = 10,
    description = format(
        "Finish {0} Expert with a full life bar. " + 
            "Get misses on the last three jumps of each mini-refrain (repeats 4 times). [Game]",
        SelectMusicLookup[53]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 53) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        ((
            unless(SelectedStyle == 2) &&
            MustMissStep(0x73) &&
            MustMissStep(0x74) &&
            MustMissStep(0x75) &&
            MustMissStep(0x7a) &&
            MustMissStep(0x7b) &&
            MustMissStep(0x7c) &&
            MustMissStep(0x81) &&
            MustMissStep(0x82) &&
            MustMissStep(0x83) &&
            MustMissStep(0x88) &&
            MustMissStep(0x89) &&
            MustMissStep(0x8a)
        ) || (
            unless(SelectedStyle == 1) &&
            MustMissStep(0x79) &&
            MustMissStep(0x7a) &&
            MustMissStep(0x7b) &&
            MustMissStep(0x81) &&
            MustMissStep(0x82) &&
            MustMissStep(0x83) &&
            MustMissStep(0x89) &&
            MustMissStep(0x7a) &&
            MustMissStep(0x7b) &&
            MustMissStep(0x91) &&
            MustMissStep(0x92) &&
            MustMissStep(0x93)
        )) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(PALifeBar == 1000) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Forcing Backronyms",
    points = 10,
    description = format(
        "Clear {0} Expert with any Appearance mod and Mirror. You must get exactly 3 Perfects. [Game]",
        SelectMusicLookup[54]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 54) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(prev(PASongPerfect) <= 3 && PASongPerfect > 3) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(PASongPerfect == 3) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Students Wrote Papers On This Song?",
    points = 10,
    description = format(
        "Clear {0} Expert with a C grade ONLY. [Game]",
        SelectMusicLookup[55]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 55) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        ((
            P1First &&
            trigger_when(P1ActiveStageGrade == 5)
        ) || (
            P2First &&
            trigger_when(P2ActiveStageGrade == 5)
        )) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: New Charts To Old Songs? BRILLIANT!",
    points = 10,
    description = format(
        "Clear {0} Challenge with at most 2x Flat. [Game]",
        SelectMusicLookup[56]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 56) &&
        never(PASongDiff == 7) &&
        never(PASongDiff <= 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(SpeedMod() > 6) &&
        never(!Flat()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Get My Feet On The Ground",
    points = 10,
    description = format(
        "Get an A rank or better on {0} Expert with at least 2x Reverse Rainbow. [Game]",
        SelectMusicLookup[57]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 57) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Min2x()) &&
        never(!Reverse()) &&
        never(!Rainbow()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        CommonAFinish &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Combining Extra Stage Concepts",
    points = 10,
    description = format(
        "Clear {0} Expert with 1.5x Reverse Rainbow. You are allowed three combo break steps or dropped holds. [Game]",
        SelectMusicLookup[58]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 58) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(SpeedMod() != 3) &&
        never(!Reverse()) &&
        never(!Rainbow()) &&
        never(
            prev(PASongGood) + prev(PASongAlmost) + prev(PASongBoo) + prev(PASongNG) < 4 &&
            PASongGood + PASongAlmost + PASongBoo + PASongNG >= 4
        ) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Is This Song Ever On-Sync?",
    points = 10,
    description = format(
        "Get 900000 points or more on D2R while using the Expert and Lag modules. [HMM]",
        SelectMusicLookup[59]
    ),
    trigger = ValidMachineDiff &&
        never(ActiveMode != 1) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 59) &&
        NoEasyModules &&
        never(!ModuleActive(0x2d)) &&
        never(!ModuleActive(0x55)) &&
        ((
            unless(HmmDouble) &&
            never(HmmLastAny != 8)
        ) || 
        (
            unless(HmmSingle) &&
            never(HmmLastAny != 39)
        )) &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        once(ActivatedSong) &&
        trigger_when(PAGameplaySongScore >= 900000) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: For Once, This Status Is Good",
    points = 10,
    description = format(
        "End {0} Expert with a 404 combo. [Game]",
        SelectMusicLookup[60]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 60) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(prev(PASongMaxCombo) <= 404 && PASongMaxCombo > 404) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(dword(0x8dc548 + ActivePlayerPointer) == 404) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Respect Towards 3rd Mix",
    points = 5,
    description = format(
        "Clear {0} Expert with 1x Sudden Shuffle Flat. [Game]",
        SelectMusicLookup[61]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 61) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(SpeedMod() > 2) &&
        never(!Sudden()) &&
        never(!Shuffle()) &&
        never(!Flat()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: The Last Time The Lyrics Were Decent",
    points = 5,
    description = format(
        "Clear {0} Expert with Hidden Shuffle Flat. [Game]",
        SelectMusicLookup[62]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 62) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Hidden()) &&
        never(!Shuffle()) &&
        never(!Flat()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Two Left Feet",
    points = 10,
    description = format(
        "Clear {0} Expert while using Left. Miss all notes tied to the lyrics \"Groove\" and \"Move\". [Game]",
        SelectMusicLookup[63]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle != 1) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 63) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(byte(0x8dc345 + ActivePlayerPointer) != 2) &&
        (
            MustMissStep(0x66) &&
            MustMissStep(0x9e) &&
            MustMissStep(0xa1) &&
            MustMissStep(0xab) &&
            MustMissStep(0xae) &&
            MustMissStep(0xc6) &&
            MustMissStep(0xc9) &&
            MustMissStep(0xd2) &&
            MustMissStep(0xd5) &&
            MustMissStep(0xdf) &&
            MustMissStep(0xe2) &&
            MustMissStep(0xf9) &&
            MustMissStep(0xfc) &&
            MustMissStep(0x108)
        ) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: This Heart Beats Quickly",
    points = 5,
    description = format(
        "Clear {0} Expert while using 5x Flat. [Game]",
        SelectMusicLookup[64]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 64) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(SpeedMod() != 10) &&
        never(!Flat()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Kindess And Strictness Can Go Hand In Hand",
    points = 10,
    description = format(
        "Get to the end of {0} Expert using either Hard Judge module. [HMM]",
        SelectMusicLookup[65]
    ),
    trigger = ValidMachineDiff &&
        never(ActiveMode != 1) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 65) &&
        NoEasyModules &&
        never(!ModuleActive(0x45) && !ModuleActive(0x46)) &&
        never(!ModuleActive(0x55)) &&
        ((
            unless(HmmDouble) &&
            never(HmmLastAny != 7)
        ) || (
            unless(HmmSingle) &&
            never(HmmLastAny != 14 && HmmLastAny != 59)
        )) &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        once(ActivatedSong) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Saying I'm Sorry",
    points = 10,
    description = format(
        "Get an A rank or better on {0} Expert using Boost Rainbow. [Game]",
        SelectMusicLookup[66]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 66) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Boost()) &&
        never(!Rainbow()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Old School SOUND",
    points = 5,
    description = format(
        "Clear {0} Expert using 1x Flat. If on Double, Difficult is allowed. [Game]",
        SelectMusicLookup[67]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 67) &&
        never(SelectedStyle == 1 && PASongDiff != 3) &&
        never(SelectedStyle == 2 && PASongDiff < 2) &&
        never(SelectedStyle == 2 && PASongDiff > 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(SpeedMod() > 2) &&
        never(!Flat()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: The Heart Is Not Easy To Please",
    points = 10,
    description = format(
        "Clear {0} Expert using 1x Vivid and spending 40 seconds or more with low health. [Game]",
        SelectMusicLookup[68]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 68) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(SpeedMod() > 2) &&
        never(Flat()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(repeated(
            60 * 40,
            prev(PASongAllStep) < dword(0x8dc5a4 + ActivePlayerPointer) &&
            byte(0x1fce65c) >= 4 && PALifeBar < 280
        )) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Flipping Inside Out With Love",
    points = 10,
    description = format(
        "Get to the end of {0} Expert using the Stepzone module. [HMM]",
        SelectMusicLookup[69]
    ),
    trigger = ValidMachineDiff &&
        never(ActiveMode != 1) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 69) &&
        NoEasyModules &&
        never(!ModuleActive(0x53)) &&
        never(!ModuleActive(0x55)) &&
        ((
            unless(HmmDouble) &&
            never(HmmLastAny != 11)
        ) || (
            unless(HmmSingle) &&
            never(HmmLastAny != 42)
        )) &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        once(ActivatedSong) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: The Future Can Change Suddenly",
    points = 5,
    description = format(
        "Clear {0} Expert while using at least 1.5x Sudden Shuffle. [Game]",
        SelectMusicLookup[70]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 70) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(SpeedMod() == 2) &&
        never(!Sudden()) &&
        never(!Shuffle()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: It's Great If You Can Maintain It",
    points = 10,
    description = format(
        "Clear {0} Expert while getting exactly 43 greats. [Game]",
        SelectMusicLookup[71]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 71) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(prev(PASongGreat) <= 43 && PASongGreat > 43) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(PASongGreat == 43) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Improving On Each Number: French Edition",
    points = 10,
    description = format(
        "Clear {0} Expert. Each \"un\" step must be at least a Great. " +
            "Each \"duex\" step must be at least a Perfect. " +
            "Each \"trois\" step must be a Marvelous. [Game]",
        SelectMusicLookup[72]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 72) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        ((
            unless(SelectedStyle == 2) &&
            AtLeastGreatStep(0x79) &&
            AtLeastPerfectStep(0x7a) &&
            AtLeastMarvelousStep(0x7b) &&
            AtLeastGreatStep(0xc0) &&
            AtLeastPerfectStep(0xc6) &&
            AtLeastMarvelousStep(0xcc)
        ) || (
            unless(SelectedStyle == 1) &&
            AtLeastGreatStep(0x6c) &&
            AtLeastPerfectStep(0x6d) &&
            AtLeastMarvelousStep(0x6e) &&
            AtLeastGreatStep(0xa0) &&
            AtLeastPerfectStep(0xa6) &&
            AtLeastMarvelousStep(0xac)
        )) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Incomprehensible Chaos",
    points = 5,
    description = format(
        "Clear {0} while using 1x Flat. [Game]",
        SelectMusicLookup[73]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 73) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(SpeedMod() > 2) &&
        never(!Flat()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: A Spike In Difficulty",
    points = 5,
    description = format(
        "Clear {0} while using Boost Hidden Vivid. [Game]",
        SelectMusicLookup[74]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 74) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Boost()) &&
        never(!Hidden()) &&
        never(!Vivid()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Stream Of Conciousness",
    points = 5,
    description = format(
        "Clear {0} while using Sudden Vivid. [Game]",
        SelectMusicLookup[75]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 75) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Sudden()) &&
        never(!Vivid()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

function NoHold(addr) => never(addr >= 45)

achievement(
    title = "Wolf Waltz: Rolling With The Holds",
    points = 10,
    description = format(
        "Clear {0} with all OK Judgments. All button holds must be strictly less than 0.75 seconds. [Game]",
        SelectMusicLookup[76]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 76) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(PASongNG > prev(PASongNG)) &&
        never(PASongNoHold > prev(PASongNoHold)) &&
        NoHold(P1UpHeld) &&
        NoHold(P1RightHeld) &&
        NoHold(P1DownHeld) &&
        NoHold(P1LeftHeld) &&
        NoHold(P1TriangleHeld) &&
        NoHold(P1CircleHeld) &&
        NoHold(P1XHeld) &&
        NoHold(P1SquareHeld) &&
        NoHold(P1R1Held) &&
        NoHold(P1R2Held) &&
        NoHold(P1L1Held) &&
        NoHold(P1L2Held) &&
        NoHold(P1UpHeld) &&
        NoHold(P2RightHeld) &&
        NoHold(P2DownHeld) &&
        NoHold(P2LeftHeld) &&
        NoHold(P2TriangleHeld) &&
        NoHold(P2CircleHeld) &&
        NoHold(P2XHeld) &&
        NoHold(P2SquareHeld) &&
        NoHold(P2R1Held) &&
        NoHold(P2R2Held) &&
        NoHold(P2L1Held) &&
        NoHold(P2L2Held) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Yellow Arrow Syndrome Is Not Groovy",
    points = 10,
    description = format(
        "Clear {0} while using Shuffle Note. It's still very hard. [Game]",
        SelectMusicLookup[77]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 77) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Shuffle()) &&
        never(!Note()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Jumping For Joy With Classics",
    points = 5,
    description = format(
        "Clear {0} while using 1x Sudden Flat. If on Single, add Shuffle. [Game]",
        SelectMusicLookup[78]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 78) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(SelectedStyle == 1 && !Shuffle()) &&
        never(!Flat()) &&
        never(SpeedMod() > 2) &&
        never(!Sudden()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: You Can Feel It's An Extra Stage",
    points = 10,
    description = format(
        "Clear {0} Expert while using 1.5x Reverse Vivid. [Game]",
        SelectMusicLookup[79]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 79) &&
        never(PASongDiff != 3) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(SpeedMod() != 3) &&
        never(!Vivid()) &&
        never(!Reverse()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Disorganized Mess",
    points = 10,
    description = format(
        "Clear {0} Expert or Challenge while using 1.5x. If on Single, add Shuffle. [Game]",
        SelectMusicLookup[80]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 80) &&
        never(PASongDiff < 3) &&
        never(PASongDiff == 7) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(SpeedMod() != 3) &&
        never(SelectedStyle == 1 && !Shuffle()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Rising From The Ashes",
    points = 10,
    description = format(
        "Clear {0} Expert or Challenge while using 2x Boost. [Game]",
        SelectMusicLookup[81]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 81) &&
        never(PASongDiff < 3) &&
        never(PASongDiff == 7) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Boost()) &&
        never(SpeedMod() != 4) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: How Could You?",
    points = 10,
    description = format(
        "Clear {0} Expert or Challenge while using 1x Flat. [Game]",
        SelectMusicLookup[82]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 82) &&
        never(PASongDiff < 3) &&
        never(PASongDiff == 7) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Flat()) &&
        never(SpeedMod() != 2) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Some Color Before Demotion",
    points = 10,
    description = format(
        "Clear {0} Expert or Challenge while using 2x Reverse Dark Note. [Game]",
        SelectMusicLookup[83]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 83) &&
        never(PASongDiff < 3) &&
        never(PASongDiff == 7) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(SpeedMod() != 4) &&
        never(!Reverse()) &&
        never(!Dark()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "Wolf Waltz: Giving Up Titles Is Never Fun",
    points = 10,
    description = format(
        "Clear {0} Expert or Challenge while using Boost Dark. [Game]",
        SelectMusicLookup[84]
    ),
    trigger = ValidMachineDiff &&
        never(SelectedStyle == 5) &&
        never(ActiveMode != 0) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 84) &&
        never(PASongDiff < 3) &&
        never(PASongDiff == 7) &&
        ModProtection &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(!Boost()) &&
        never(!Dark()) &&
        once(GsGameGameplay && prev(GameState) == 0x1dba70) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "The Secret Drop",
    points = 5,
    description = format(
        "Get 900000 points or more on {0} Challenge.",
        SelectMusicLookup[0x23]
    ),
    trigger = ValidMachineDiff &&
        never(ActiveMode != 1) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId < 0x23) &&
        never(LoadedSongId > 0x25) &&
        NoEasyModules &&
        never(!ModuleActive(0x3c)) &&
        never(!ModuleActive(0x55)) &&
        ((
            unless(HmmDouble) &&
            never(HmmLastAny != 4)
        ) || (
            unless(HmmSingle) &&
            never(HmmLastAny != 4 && HmmLastAny != 95)
        )) &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        once(ActivatedSong) &&
        trigger_when(PAGameplaySongScore >= 900000) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "The Secret Freeway",
    points = 5,
    description = format(
        "Get 900000 points or more on {0} Challenge.",
        SelectMusicLookup[0x1b]
    ),
    trigger = ValidMachineDiff &&
        never(ActiveMode != 1) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 0x1b) &&
        NoEasyModules &&
        never(!ModuleActive(0x3c)) &&
        never(!ModuleActive(0x55)) &&
        ((
            unless(HmmDouble) &&
            never(HmmLastAny != 34 && HmmLastAny != 67)
        ) || (
            unless(HmmSingle) &&
            never(HmmLastAny != 34 && HmmLastAny != 58)
        )) &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        once(ActivatedSong) &&
        trigger_when(PAGameplaySongScore >= 900000) &&
        trigger_when(EvaluationNowActive)
)

achievement(
    title = "The Secret Raspberry",
    points = 5,
    description = format(
        "Get 900000 points or more on {0} Challenge.",
        SelectMusicLookup[0x31]
    ),
    trigger = ValidMachineDiff &&
        never(ActiveMode != 1) &&
        never(repeated(5, EvaluationActive)) &&
        never(LoadedSongId != 0x31) &&
        NoEasyModules &&
        never(!ModuleActive(0x3c)) &&
        never(!ModuleActive(0x55)) &&
        ((
            unless(HmmDouble) &&
            never(HmmLastAny != 81)
        ) || (
            unless(HmmSingle) &&
            never(HmmLastAny != 70)
        )) &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        once(ActivatedSong) &&
        trigger_when(PAGameplaySongScore >= 900000) &&
        trigger_when(EvaluationNowActive)
)

// Leaderboards

function HmmHyperBoard(style, id) {
    compositeId = style * 100 + id
    title = AllMissionLookup[compositeId]
    base = 0x5163fc
    if (style == 1) {
        base = 0x516d5c
    }
    hyperScore = dword(base + (24 * id))
    leaderboard(
        title = title + " " + HmmStyleLookup[style] + " Best Hyper Score",
        description = "Get the biggest Hyper Score you can. Failing the mission is allowed.",
        start = GsHyperMasterMode && HmmStyle == style && HmmLastAny == id &&
            hyperScore > prev(hyperScore),
        cancel = always_false(),
        submit = always_true(),
        value = hyperScore
    )
}

for i in SingleMissionLookup {
    HmmHyperBoard(0, i)
}
for i in DoubleMissionLookup {
    HmmHyperBoard(1, i)
}

function GameCommonStart(song, diff, style) {
    return never(!GsGameEvaluation && !GsGameSelectMusic && !GsGameGameplay) &&
        never(prev(PAFail) == 0 && PAFail == 1) &&
        never(ActiveMode != 0) &&
        never(SelectedStyle != style) &&
        ValidMachineDiff &&
        PASongDiff == diff &&
        LoadedSongId == song &&
        once(ActivatedSong) &&
        once(LoadedSongId == byte(0x9d81bc)) &&
        EvaluationNowActive
}

function NormalMachineScoreBoard(song, diff, style) {
    leaderboard(
        title = format(
            "{0} {1} Machine Score",
            SelectMusicLookup[song],
            GameplayDiffLookup[style * 10 + diff]
        ),
        description = "Get the highest Machine score you can!",
        start = GameCommonStart(song, diff, style),
        cancel = always_false(),
        submit = always_true(),
        value = PAGameplaySongScore
    )
}

function NormalExScoreBoard(song, diff, style) {
    leaderboard(
        title = format(
            "{0} {1} EX Score",
            SelectMusicLookup[song],
            GameplayDiffLookup[style * 10 + diff]
        ),
        description = "Get the highest EX score you can!",
        start = GameCommonStart(song, diff, style),
        cancel = always_false(),
        submit = always_true(),
        value = PASongMarvelous * 3 + PASongOK * 3 + PASongPerfect * 2 + PASongGreat
    )
}

for i in AllSongIds {
    for s in range(1, 2) {
        if none_of(ChallengeOnlyIds, e => e == i) {
            NormalMachineScoreBoard(i, 1, s)
            NormalExScoreBoard(i, 1, s)
            NormalMachineScoreBoard(i, 2, s)
            NormalExScoreBoard(i, 2, s)
            NormalMachineScoreBoard(i, 3, s)
            NormalExScoreBoard(i, 3, s)
        }
        if (any_of(ChallengeOnlyIds, e => e == i) || any_of(ChallengePlusIds, e => e == i)) {
            NormalMachineScoreBoard(i, 6, s)
            NormalExScoreBoard(i, 6, s)
        }
    }
}

// GsSelectCourse = GameState == 0x31bad0
function CourseCommonStart(course, style, line) {
    target = 0x5135f0
    if (line == 1) {
        target = 0x514298
    }
    if style == 2 {
        target = target + 2
    }
    target = target + (60 * course)
    return never(!GsGameEvaluation && !GsSelectCourse && !GsGameGameplay) &&
        never(ActiveMode != 3) &&
        ValidMachineDiff &&
        never(SelectedStyle != style) &&
        once(prev(GameState) == 0x31bad0 && GsGameGameplay) &&
        once(LoadedSongId == prev(LoadedSongId)) &&
        prev(word(target)) + 1 == word(target)
}

function CourseMachineBoard(course, style, life) {
    type = "Life Bar"
    if life == 1 {
        type = "Battery"
    }
    leaderboard(
        title = format(
            "{0} {1} {2} Machine Score",
            CourseLookup[course],
            SelectedStyleLookup[style],
            type
        ),
        description = "Get the highest machine score you can!",
        start = CourseCommonStart(course, style, life),
        cancel = always_false(),
        submit = always_true(),
        value = PAEvaluationCourseScore
    )
}

function CourseExBoard(course, style, life) {
    type = "Life Bar"
    if life == 1 {
        type = "Battery"
    }
    leaderboard(
        title = format(
            "{0} {1} {2} EX Score",
            CourseLookup[course],
            SelectedStyleLookup[style],
            type
        ),
        description = "Get the highest EX score you can!",
        start = CourseCommonStart(course, style, life),
        cancel = always_false(),
        submit = always_true(),
        value = PACourseMarvelous * 3 + PACourseOK * 3 + PACoursePerfect * 2 + PACourseGreat
    )
}

for l in range(0, 1) {
    for i in range(0, 0x27) {
        for s in range(1, 2) {
            CourseMachineBoard(i, s, l)
            CourseExBoard(i, s, l)
        }
    }
}

// RP

ModuleLookup = {
    0x01: "Assist Perfect 1",
    0x02: "Assist Perfect 2",
    0x03: "Assist Perfect 3",
    0x04: "Assist Perfect 4",
    0x05: "Assist Perfect 5",
    0x06: "Assist Judge 1",
    0x07: "Assist Judge 2",
    0x08: "Assist Judge 3",
    0x09: "Assist Judge 4",
    0x0a: "Assist Judge 5",
    0x0b: "Assist Judge 6",
    0x0c: "Assist Combo 1",
    0x0d: "Assist Combo 2",
    0x0e: "Assist Combo 3",
    0x0f: "Assist Damage 1",
    0x10: "Assist Damage 2",
    0x11: "Assist Damage 3",
    0x12: "Assist Health 1",
    0x13: "Assist Health 2",
    0x14: "Assist Health 3",
    0x15: "High Start 1",
    0x16: "High Start 2",
    0x17: "High Start 3",
    0x18: "Max Up",
    0x19: "Star Rhythm 1",
    0x1a: "Star Rhythm 2",
    0x1b: "Star Rhythm 3",
    0x1c: "Remove Up",
    0x1d: "Remove Down",
    0x1e: "Remove Left",
    0x1f: "Remove Right",
    0x20: "Arrow Reduction",
    0x21: "Cut",
    0x22: "Jump Off 1",
    0x23: "Jump Off 2",
    0x24: "View 1",
    0x25: "View 2",
    0x26: "View 3",
    0x27: "View 4",
    0x28: "Arrow Skin",
    0x29: "Center",
    0x2a: "Reverse",
    0x2b: "Shuffle",
    0x2c: "Super Shuffle",
    0x2d: "Lag",
    0x2e: "Chara Afro",
    0x2f: "Chara Emi",
    0x30: "Chara Baby-Lon",
    0x31: "Chara Robo-Zukin",
    0x32: "Chara Rage",
    0x33: "Chara Jenny",
    0x34: "Chara Gus",
    0x35: "Chara Ruby",
    0x36: "Chara Concent",
    0x37: "Chara Yuni",
    0x38: "Chara Alice",
    0x39: "Chara Julio",
    0x3a: "Chara Random",
    0x3b: "End of Music",
    0x3c: "Prize",
    0x3d: "Fast Down 1",
    0x3e: "Fast Down 2",
    0x3f: "Slow Up 1",
    0x40: "Slow Up 2",
    0x41: "Low Start 1",
    0x42: "Low Start 2",
    0x43: "Challenge 1",
    0x44: "Challenge 2",
    0x45: "Hard Judge 1",
    0x46: "Hard Judge 2",
    0x47: "Speed 1",
    0x48: "Speed 2",
    0x49: "Speed 3",
    0x4a: "Speed 4",
    0x4b: "Boost 1",
    0x4c: "Boost 2",
    0x4d: "Boost 3",
    0x4e: "Boost 4",
    0x4f: "Appearance 1",
    0x50: "Appearance 2",
    0x51: "Appearance 3",
    0x52: "Appearance 4",
    0x53: "Stepzone",
    0x54: "Stairs",
    0x55: "Expert",
}

RpSlot1 = rich_presence_lookup("Slot", byte(0x5163c4), ModuleLookup, "X")
RpSlot2 = rich_presence_lookup("Slot", byte(0x5163c8), ModuleLookup, "X")
RpSlot3 = rich_presence_lookup("Slot", byte(0x5163cc), ModuleLookup, "X")
RpSlot4 = rich_presence_lookup("Slot", byte(0x5163d0), ModuleLookup, "X")
RpSlot5 = rich_presence_lookup("Slot", byte(0x5163d4), ModuleLookup, "X")
RpSlot6 = rich_presence_lookup("Slot", byte(0x5163d8), ModuleLookup, "X")

OptionsOpen = byte(0x9d730c) == 1

P1SelectMusicDiff = byte(0x68 + dword(0x8dc0c8))
P2SelectMusicDiff = byte(0x69 + dword(0x8dc0c8))

SelectMusicOptions = byte(0x68 + dword(0x8dc0c8)) == 6
P1SelectMusicOptions = P1SelectMusicDiff == 6
P2SelectMusicOptions = P2SelectMusicDiff == 6

SelectMusicSongId = byte(0x1a + dword(0x8dc0c8))
PASelectMusicDiff = byte(0x995254) * 10 + byte(0x68 + dword(0x8dc0c8))

RpPASongMarvelous = rich_presence_macro("Number", PASongMarvelous)
RpPASongPerfect = rich_presence_macro("Number", PASongPerfect)
RpPASongGreat = rich_presence_macro("Number", PASongGreat)
RpPASongGood = rich_presence_macro("Number", PASongGood)
RpPASongAlmost = rich_presence_macro("Number", PASongAlmost)
RpPASongBoo = rich_presence_macro("Number", PASongBoo)

RpPASongOK = rich_presence_macro("Number", PASongOK)
RpPASongNG = rich_presence_macro("Number", PASongNG)
RpPASongNoHold = rich_presence_macro("Number", PASongNoHold)

RpPASongScore = rich_presence_macro("Number", PAGameplaySongScore)

RpPACourseSongMarvelous = rich_presence_macro("Number", PASongMarvelous + PACourseMarvelous)
RpPACourseSongPerfect = rich_presence_macro("Number", PASongPerfect + PACoursePerfect)
RpPACourseSongGreat = rich_presence_macro("Number", PASongGreat + PACourseGreat)
RpPACourseSongGood = rich_presence_macro("Number", PASongGood + PACourseGood)
RpPACourseSongAlmost = rich_presence_macro("Number", PASongAlmost + PACourseAlmost)
RpPACourseSongBoo = rich_presence_macro("Number", PASongBoo + PACourseBoo)

RpPACourseSongOK = rich_presence_macro("Number", PASongOK + PACourseOK)
RpPACourseSongNG = rich_presence_macro("Number", PASongNG + PACourseNG)
RpPACourseSongNoHold = rich_presence_macro("Number", PASongNoHold + PACourseNoHold)

RpPACourseScore = rich_presence_macro("Number", PAEvaluationCourseScore)

RpSelectMusicDiff = rich_presence_lookup(
    "PASelectMusicDiff",
    PASelectMusicDiff,
    SelectMusicDiffLookup,
    "???"
)

RpGameDiff = rich_presence_lookup(
    "PAGameDiff",
    PAGameDiff,
    GameplayDiffLookup,
    "???"
)

RpGameSongThink = rich_presence_lookup(
    "SelectMusicSong",
    SelectMusicSongId,
    SelectMusicLookup,
    "UNKNOWN"
)

RpGameSongActive = rich_presence_lookup(
    "SelectMusicSong",
    LoadedSongId,
    SelectMusicLookup,
    "UNKNOWN"
)

RpSelectStyleActive = rich_presence_lookup(
    "SelectStyle",
    byte(0x19119a0),
    SelectingStyleLookup
)

RpCourseGameplay = rich_presence_lookup(
    "Course",
    byte(0x8dc2a4),
    CourseLookup
)

RpEvaluationSong = "Under Review"
//rich_presence_lookup(
//    "SelectMusicSong",
//    byte(0x8dc350 + ActivePlayerPointer) - 1,
//    SelectMusicLookup
//)

//rich_presence_conditional_display(
//    GsSelectStyle && byte(0x19119a0) > 2,
//    "Loading the styles for selection."
//)

rich_presence_conditional_display(
    GsSelectStyle,
    "Figuring out what style to use.",
    RpSelectStyleActive
)

rich_presence_conditional_display(
    GameState == 0x33b690,
    "Selecting a representative dancer."
)

rich_presence_conditional_display(
    GameState == 0x21c900,
    "Thinking of selecting the {0}.",
    rich_presence_lookup("Mode", byte(0 + dword(0x1fff030)), ModeLookup)
)

rich_presence_conditional_display(
    GsTutorial,
    "Going through the hands on tutorial."
)

rich_presence_conditional_display(
    GsGameSelectMusic && Versus,
    "The player and a friend are thinking of playing [{0}].",
    RpGameSongThink
)

rich_presence_conditional_display(
    GsGameSelectMusic && OptionsOpen,
    "Adjusting the {1} mod before playing [{0}].",
    RpGameSongThink,
    rich_presence_lookup(
        "ModCat",
        byte(0x9d7313 + EnteredFirst),
        ModCategoryLookup
    )
)

rich_presence_conditional_display(
    GsGameSelectMusic &&
        ((P1First && P1SelectMusicOptions) || (P2First && P2SelectMusicOptions)),
    "Adjusting some options before playing [{0}].",
    RpGameSongThink
)

rich_presence_conditional_display(
    GsGameSelectMusic && P2First,
    "Thinking of playing [{0}] {1}.",
    RpGameSongThink,
    rich_presence_lookup(
        "PASelectMusicDiff",
        byte(0x995254) * 10 + P2SelectMusicDiff,
        SelectMusicDiffLookup,
        "???"
    )
)

rich_presence_conditional_display(
    GsGameSelectMusic,
    "Thinking of playing [{0}] {1}.",
    RpGameSongThink,
    RpSelectMusicDiff
)

rich_presence_conditional_display(
    GsGameGameplay && prior(GameState) == 0x31bad0,
    "Playing [{0}] {1} {2}/{3}/{4}/{5}/{6}/{7} {8} OK",
    RpCourseGameplay,
    rich_presence_lookup("CourseStyle", SelectedStyle, SelectedStyleLookup),
    RpPACourseSongMarvelous,
    RpPACourseSongPerfect,
    RpPACourseSongGreat,
    RpPACourseSongGood,
    RpPACourseSongAlmost,
    RpPACourseSongBoo,
    RpPACourseSongOK
)

rich_presence_conditional_display(
    GsGameGameplay && dword(0x1fce65c) >= 4,
    "Playing [{0}] {1} {2}/{3}/{4}/{5}/{6}/{7} {8} OK",
    RpGameSongActive,
    RpGameDiff,
    RpPASongMarvelous,
    RpPASongPerfect,
    RpPASongGreat,
    RpPASongGood,
    RpPASongAlmost,
    RpPASongBoo,
    RpPASongOK
)

rich_presence_conditional_display(
    GsGameGameplay,
    "Loading the chart now: [{0}] {1}",
    RpGameSongActive,
    RpGameDiff
)

// course evaluation should come first.

rich_presence_conditional_display(
    Versus && ActiveMode == 0 && GsGameEvaluation,
    "Wrapped up playing {0} with a friend.",
    RpGameSongActive
)

rich_presence_conditional_display(
    Versus && ActiveMode == 3 && byte(0x99521d) >= 1 && byte(0x99521d) <= 3,
    "Pushing themselves and a friend through one of the final modes."
)

rich_presence_conditional_display(
    Versus && ActiveMode == 3 && byte(0x99521d) == 4,
    "Shouldn't you two take this to one of the Disney DDR games?"
)

rich_presence_conditional_display(
    Versus && ActiveMode == 3 && byte(0x99521d) == 0,
    "Two folks pushing their endurance with a course."
)

rich_presence_conditional_display(
    GameState == 0x223e30,
    "You're a fantastic dancer! You should dance one more time!"
)

rich_presence_conditional_display(
    ActiveMode == 3 && byte(0x99521d) == 0 && GsGameEvaluation,
    "End Result of {0} {1}: {2}/{3}/{4}/{5}/{6}/{7} {8} OK",
    RpCourseGameplay,
    rich_presence_lookup("CourseStyle", SelectedStyle, SelectedStyleLookup),
    RpPACourseSongMarvelous,
    RpPACourseSongPerfect,
    RpPACourseSongGreat,
    RpPACourseSongGood,
    RpPACourseSongAlmost,
    RpPACourseSongBoo,
    RpPACourseSongOK
)

rich_presence_conditional_display(
    ActiveMode == 0 && GsGameEvaluation,
    "End Result of {0} {1}: {2}/{3}/{4}/{5}/{6}/{7} {8} OK",
    RpGameSongActive,
    RpGameDiff,
    RpPASongMarvelous,
    RpPASongPerfect,
    RpPASongGreat,
    RpPASongGood,
    RpPASongAlmost,
    RpPASongBoo,
    RpPASongOK
)

rich_presence_conditional_display(
    GsHyperMasterMode && EvaluationActive,
    "End Result of {0} Mission {1}: {2}/{3}/{4}/{5}/{6}/{7} {8} OK {9}/{10}/{11}/{12}/{13}/{14}",
    rich_presence_lookup("HmmStyle", HmmStyle, HmmStyleLookup),
    rich_presence_lookup("HmmMission", HmmStyle * 100 + HmmLastAny, AllMissionLookup),
    RpPASongMarvelous,
    RpPASongPerfect,
    RpPASongGreat,
    RpPASongGood,
    RpPASongAlmost,
    RpPASongBoo,
    RpPASongOK,
    RpSlot1,
    RpSlot2,
    RpSlot3,
    RpSlot4,
    RpSlot5,
    RpSlot6
)

rich_presence_conditional_display(
    GsHyperMasterMode && InSong,
    "In Hyper Master Mode playing {0} Mission {1}. {2}/{3}/{4}/{5}/{6}/{7} {8} OK {9}/{10}/{11}/{12}/{13}/{14}",
    rich_presence_lookup("HmmStyle", HmmStyle, HmmStyleLookup),
    rich_presence_lookup("HmmMission", HmmStyle * 100 + HmmLastAny, AllMissionLookup),
    RpPASongMarvelous,
    RpPASongPerfect,
    RpPASongGreat,
    RpPASongGood,
    RpPASongAlmost,
    RpPASongBoo,
    RpPASongOK,
    RpSlot1,
    RpSlot2,
    RpSlot3,
    RpSlot4,
    RpSlot5,
    RpSlot6
)

rich_presence_conditional_display(
    GsHyperMasterMode,
    "In Hyper Master Mode looking at {0} Mission {1}.",
    rich_presence_lookup("HmmStyle", HmmStyle, HmmStyleLookup),
    rich_presence_lookup("HmmMission", HmmStyle * 100 + HmmLastAny, AllMissionLookup)
)

rich_presence_conditional_display(
    GameState == 0x2d07f0,
    "Going on your own fitness journey."
)

rich_presence_conditional_display(
    GameState == 0x311ca0,
    "The Advanced Modes await. How will we dance this time?"
)

rich_presence_conditional_display(
    GameState == 0x317c30,
    "Selecting a Style in Course Mode"
)

rich_presence_conditional_display(
    GameState == 0x310400,
    "Selecting the Health Bar Type in Course Mode"
)

rich_presence_conditional_display(
    GsSelectCourse,
    "Course Mode - Thinking of Playing {0}",
    rich_presence_lookup(
        "Course",
        byte(0x1b2bee4 + (4 * byte(0x1b2bfbc))),
        CourseLookup
    )
)

rich_presence_conditional_display(
    GameState == 0x291750,
    "Getting practice on [{0}].",
    RpGameSongThink
)

rich_presence_conditional_display(
    GameState == 0x2b8a60,
    "Letting your creative side wild."
)

rich_presence_conditional_display(
    GameState == 0x281300,
    "Reviewing the various records earned."
)

rich_presence_conditional_display(
    GameState == 0x275800,
    "Adjusting the options before getting on the dance floor."
)

rich_presence_conditional_display(
    GameState == 0x33a030,
    "Going shopping with {0} points.",
    rich_presence_macro("Number", dword(0x53020c))
)

rich_presence_conditional_display(
    GameState == 0x342730,
    "Reviewing all of the info panels...in Japanese!"
)

rich_presence_conditional_display(
    GameState == 0x2015b0,
    "Experiencing the music without the pressure."
)

rich_presence_conditional_display(
    GameState == 0x177c80,
    "Getting the hands off lessons on how to play."
)

rich_presence_conditional_display(
    GameState == 0x23e960,
    "Dance Dance Revolution! SuperNova! TWO!!!"
)

rich_presence_conditional_display(
    GameState == 0x17cd80 || GameState == 0x268500,
    "This is a part of the (in)famous BEMANI series!"
)

rich_presence_conditional_display(
    GameState == 0x243330,
    "Caution! Extreme motions are dangerous!"
)

rich_presence_conditional_display(
    GameState == 0x06ffa009 || GameState == 0x23f8f0,
    "Turning on the dance studio."
)

rich_presence_display(
    "Starting a second SuperNova in Japan."
)

