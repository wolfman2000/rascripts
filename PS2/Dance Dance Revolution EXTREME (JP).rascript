// Dance Dance Revolution EXTREME [Japan]
// #ID = 20547

MinGameLevel = low4(0x2c58c0) >= 3

GameState = byte(0x5aac20)

GsEval = GameState == 6
GsLesson = GameState == 0x36

CourseId = byte(0x5a68e4)
NotCourse = CourseId == 0

CourseTitles = {
    0x00: "No Course",
    // Below here are the oni courses
    0x01: "MORE LIGHT EX",
    0x02: "NAOKI NEO-STANDARD",
    0x03: "CLASSIC",
    0x04: "PARANOiA BROTHERS GREEN",
    0x05: "TRIP FIVE",
    0x06: "2MB道",
    0x07: "WORLD TOUR",
    0x08: "TRICK",
    0x09: "DARKNESS",
    0x0a: "REVERSE",
    0x0b: "SORROW",
    0x0c: "RevenG & TaQ",
    0x0d: "FROM GF & DM",
    0x0e: "NAOKI PREMIUM",
    0x0f: "PARANOiA BROTHERS BLUE",
    0x10: "RAP 5",
    0x11: "SOUL 6",
    0x12: "HAPPY HARDCORE",
    0x13: "FROM SOLO",
    0x14: "MIDNIGHT BLUE",
    0x15: "Brand-New Songs (Oni)",
    0x16: "NORI NORI MIX",
    0x17: "ANGEL'S",
    0x18: "FROM IIDX",
    0x19: "IIDX BOSS",
    0x1a: "鬼の遅道",
    0x1b: "鬼の乱",
    0x1c: "真鬼道",
    0x1d: "伝説道",
    0x1e: "ULTRA 16",
    0x1f: "Order 1 (Oni)",
    0x20: "Order 2 (Oni)",
    0x21: "Order 3 (Oni)",
    // Below here are the nonstop courses
    0x22: "POP 4",
    0x23: "MACHO",
    0x24: "HOUSE",
    0x25: "LOVE HEART",
    0x26: "Player's Best 1-4",
    0x27: "Player's Best 5-8",
    0x28: "Player's Best 9-12",
    0x29: "Player's Best 13-16",
    0x2a: "Player's Best 17-20",
    0x2b: "Player's Worst",
    0x2c: "Random All",
    0x2d: "Random Caprice",
    0x2e: "STANDARD",
    0x2f: "REMIX",
    0x30: "FINE CHOICE",
    0x31: "HOP STEP",
    0x32: "MIDDLE TEMPO",
    0x33: "FROM Dance Maniax",
    0x34: "春夏秋冬",
    0x35: "FROM beatmania",
    0x36: "EURO BEAT",
    0x37: "FROM pop'n music",
    0x38: "FUNKY GROOVE",
    0x39: "Brand-New Songs (Nonstop)",
    0x3a: "MAX QUARTET",
    0x3b: "Order 1 (Nonstop)",
    0x3c: "Order 2 (Nonstop)",
    0x3d: "Order 3 (Nonstop)",
    // Below here are the diet courses.
    0x3e: "BEGINNER AERO",
    0x3f: "LOW IMPACT",
    0x40: "HAPPYBICS",
    0x41: "DANCECISE",
    0x42: "WORLD STEP",
    0x43: "SUPER MODEL",
    0x44: "CALORIE BURNER",
    0x45: "Neo Slimer",
    0x46: "WITH PUNCH",
    0x47: "HIGH IMPACT",
    0x48: "Order 1 (Diet)",
    0x49: "Order 2 (Diet)",
    0x4a: "Order 3 (Diet)"
}

OniId = CourseId != 0 && CourseId <= 0x21
NonstopId = CourseId >= 0x22 && CourseId <= 0x3d
DietId = CourseId >= 0x3e
AllowedNonstop = [0x22, 0x23, 0x24, 0x25, 0x2c, 0x2e, 0x2f, 0x30, 0x31, 0x32, 0x33, 0x34,
    0x35, 0x36, 0x37, 0x38, 0x39, 0x3a
]

RankableNonstop = []
for i in AllowedNonstop {
    if i != 0x2d {
        array_push(RankableNonstop, i)
    }
}

IsNonstopDifficult = bit0(0x5a68f7) == 1

SongId = byte(0x5aac44)

SongTitles = {
    0x01: "A",
    0x02: "Across the nightmare",
    0x03: "AFRONOVA",
    0x04: "AFTER THE GAME OF LOVE",
    0x05: "air",
    0x06: "蒼い衝動 (for EXTREME)",
    0x07: "BABY BABY GIMME YOUR LOVE",
    0x08: "bag",
    0x09: "BE LOVIN",
    0x0a: "BRILLIANT 2U",
    0x0b: "BRILLIANT 2U (Orchestra-Groove)",
    0x0c: "CARTOON HEROES (Speedy Mix)",
    0x0d: "PARANOiA KCET (clean mix)",
    0x0e: "TRIP MACHINE CLIMAX",
    0x0f: "Colors (for EXTREME)",
    0x10: "CRASH!",
    0x11: "大見解",
    0x12: "Dance Dance Revolution",
    0x13: "DYNAMITE RAVE",
    0x14: "ECSTASY",
    0x15: "Healing Vision",
    0x16: "feeling of love",
    0x17: "Frozen Ray (for EXTREME)",
    0x18: "Gamelan de Couple",
    0x19: "TwinBee (Generation X)",
    0x1a: "HIGHER",
    0x1b: "Healing Vision (Angelic Mix)",
    0x1c: "Heaven is a '57 metallic gray (gimmix)",
    0x1d: "HOLD ON ME",
    0x1e: "HYPER EUROBEAT",
    0x1f: "1998",
    0x20: "I DO I DO I DO",
    0x21: "I'm gonna get you!",
    0x22: "IRRESISTIBLEMENT",
    0x23: "KISS KISS KISS",
    0x24: "JANEJANA",
    0x25: "JET WORLD",
    0x26: "革命",
    0x27: "KEEP ON MOVIN'",
    0x28: "LA BAMBA",
    0x29: "LA COPA DE LA VIDA",
    0x2a: "L'amour et la liberte (DDR Ver.)",
    0x2b: "La Senorita",
    0x2c: "CAN'T STOP FALLIN' IN LOVE (SPEED MIX)",
    0x2d: "Miracle Moon (L.E.D.LIGHT STYLE MIX)",
    0x2e: "The legend of MAX",
    0x2f: "TRIP MACHINE (luv mix)",
    0x30: "LUV TO ME (disco mix)",
    0x31: "魔法の扉 (スペース@マコのテーマ)",
    0x32: "MAKE IT BETTER",
    0x33: "MAX 300",
    0x34: "KISS ME ALL NIGHT LONG",
    0x35: "MEMORIES",
    0x36: "Last Message",
    0x37: "三毛猫ロック",
    0x38: "MOBO★MOGA",
    0x39: "ORION.78 (civilization mix)",
    0x3a: "PARANOiA",
    0x3b: "PARANOiA MAX (DIRTY MIX)",
    0x3c: "PARANOiA ETERNAL",
    0x3d: "PARANOiA EVOLUTION",
    0x3e: "PUT YOUR FAITH IN ME",
    0x3f: "GRADUATION",
    0x40: "PARANOiA Rebirth",
    0x41: "TRIP MACHINE survivor",
    0x42: "Pink Rose",
    0x43: "R3",
    0x44: "桜",
    0x45: "SEXY PLANET",
    0x46: "Silent Hill",
    0x47: "SPEED OVER BEETHOVEN",
    0x48: "SUPER STAR",
    0x49: "SP-TRIP MACHINE (JUNGLE MIX)",
    0x4a: "Destiny Lovers",
    0x4b: "stoic (EXTREME version)",
    0x4c: "♥LOVE² シュガ→♥",
    0x4d: "MY SUMMER LOVE",
    0x4e: "LOVE♥SHINE",
    0x4f: "PARANOIA survivor",
    0x50: "PARANOIA survivor MAX",
    0x51: "321STARS",
    0x52: "STAY (Organic House Version)",
    0x53: "TEARS",
    0x54: "DROP THE BOMB",
    0x55: "BURNIN' THE FLOOR (MOMO MIX)",
    0x56: "The Least 100sec",
    0x57: "think ya better D",
    0x58: "LOVE THIS FEELIN'",
    0x59: "TRIP MACHINE",
    0x5a: "MAXX UNLIMITED",
    0x5b: "VANITY ANGEL",
    0x5c: "La Senorita Virtual",
    0x5d: "V (for EXTREME)",
    0x5e: "WE ARE THE CHAMPIONS (Factory Team Remix)",
    0x5f: "Happy Wedding",
    0x60: "WE WILL ROCK YOU",
    0x61: "WILD RUSH",
    0x62: "White Lovers",
    0x63: "xenon",
    0x64: "sync (EXTREME version)",
    0x65: "A Stupid Barber",
    0x66: "Tomorrow Perfume",
    0x67: "more deep (ver.2.1)",
    0x68: "Keep On Liftin'",
    0x69: "Bad Routine",
    0x6a: "Try 2 Luv. U",
    0x6b: "I Need You",
    0x6c: "Forever Sunshine",
    0x6d: "Scorching Moon",
    0x6e: "un deux trois",
    0x6f: "MAX. (period)"
}

Need8x = [0x4d, 0x68, 0x04, 0x6b, 0x6a, 0x32, 0x3e, 0x24, 0x3f, 0x46, 0x52, 0x62,
    0x6d, 0x5f, 0x48, 0x6c, 0x05, 0x69, 0x1a, 0x27, 0x65, 0x67, 0x20, 0x29, 0x16,
    0x57, 0x5e, 0x25, 0x2d, 0x5b, 0x6e, 0x53, 0x66, 0x06, 0x14, 0x2a, 0x35, 0x42,
    0x26, 0x0a, 0x0b, 0x0f, 0x12, 0x13, 0x18, 0x1f, 0x23, 0x54, 0x5d, 0x1d, 0x1e,
    0x34, 0x36, 0x4b, 0x4c, 0x17, 0x43, 0x63, 0x63
]

Need5x = [0x21, 0x2f, 0x30, 0x49, 0x59, 0x22, 0x64, 0x19, 0x47, 0x0c, 0x2c, 0x41,
    0x4a, 0x55, 0x11, 0x38, 0x4e, 0x28, 0x0d, 0x0e, 0x3a, 0x45, 0x61, 0x2b, 0x5c,
    0x31, 0x09, 0x1c, 0x41, 0x3b, 0x40, 0x58, 0x01, 0x51, 0x15, 0x1b, 0x03, 0x10,
    0x39, 0x3c, 0x3d, 0x37, 0x56
]

Need3x = [0x4f, 0x50, 0x02, 0x33, 0x44, 0x5a, 0x2e]

Need15x = [0x6f]

OniSongs = [0x0f, 0x11, 0x5d, 0x26, 0x01, 0x0a, 0x0b, 0x13, 0x44, 0x64, 0x02,
    0x12, 0x50, 0x6f]

FlashingSongs = [0x4f, 0x50, 0x6f, 0x2e]

MainMenu = byte(0x656150)
GameMode = MainMenu == 0

Style = low4(0x5aac39)
Single = Style == 1
Versus = Style == 5
Double = Style == 2

OffsetBase = 0x542b0

FirstPlayer = low4(0x65622d)
InGame = FirstPlayer < 3 && bitcount(0x65622d) == 1
PlayerOffset = bit1(0x65622d) * OffsetBase

PlayerDiff = low4(0x5a68f4 + bit1(0x65622d))
PALoadedDiff = low4(0x5aacd8 + PlayerOffset)
Light = PALoadedDiff == 1
Standard = PALoadedDiff == 2
Heavy = PALoadedDiff == 3
Oni = PALoadedDiff == 6
Beginner = PALoadedDiff == 7

PAInitialDiff = low4(0x5a2bf0 + (FirstPlayer * 4))

IsNonstopDifficult = bit0(0x5a68f8) == 1

AliveGeneral = bit0(0x5aac30) == 0
AliveNoMore = bit0(0x5aac30) > prev(bit0(0x5aac30))
AliveNormal = AliveGeneral && word(0x5aac6a + PlayerOffset) != 0
AliveOni = AliveGeneral && byte(0x5aac6c + PlayerOffset) <= 3

PAGrade = low4(0x5aad88 + PlayerOffset)
EarnedAA = PAGrade != 0 && PAGrade <= 2

PAMarvelous = word(0x5aad1c + PlayerOffset)
PAPerfect = word(0x5aad20 + PlayerOffset)
PAGreat = word(0x5aad24 + PlayerOffset)
PAGood = word(0x5aad28 + PlayerOffset)
PABoo = word(0x5aad2c + PlayerOffset)
PAMiss = word(0x5aad30 + PlayerOffset)
PAOK = word(0x5aad3c + PlayerOffset)
PAMaxCombo = word(0x5aad80 + PlayerOffset)

PAMoneyScore = dword(0x5aac70 + PlayerOffset) - dword(0x5aac74 + PlayerOffset)
PACourseMoneyScore = dword(0x5aac70 + PlayerOffset)

PACourseEvalMarvelous = word(0x5aad8c + PlayerOffset)
PACourseEvalPerfect = word(0x5aad90 + PlayerOffset)
PACourseEvalGreat = word(0x5aad94 + PlayerOffset)
PACourseEvalGood = word(0x5aad98 + PlayerOffset)
PACourseEvalBoo = word(0x5aad9c + PlayerOffset)
PACourseEvalMiss = word(0x5aada0 + PlayerOffset)
PACourseEvalOK = word(0x5aadac + PlayerOffset)
PACourseMaxCombo = word(0x5aaec4 + PlayerOffset)


PAFinalScore = dword(0x5aadec + PlayerOffset)

HasHolds = word(0x5ff1a8) != 0

PAHidden = bit0(0x5aace0 + PlayerOffset) == 1 &&
    bit1(0x5aace0 + PlayerOffset) == 0
PASudden = bit0(0x5aace0 + PlayerOffset) == 0 &&
    bit1(0x5aace0 + PlayerOffset) == 1
PAAnyAppearance = bit0(0x5aace0 + PlayerOffset) == 1 ||
    bit1(0x5aace0 + PlayerOffset) == 1
PATurnMod = low4(0x5aacd9 + PlayerOffset)
PAFlatOn = bit7(0x5aace1 + PlayerOffset) == 0
PADarkOn = bit3(0x5aace2 + PlayerOffset) == 1
PASoloOn = bit1(0x5aace2 + PlayerOffset) == 1
PALittleOn = bit2(0x5aace0 + PlayerOffset) == 1
PAFreezeOff = bit6(0x5aace1 + PlayerOffset) == 0
PABoost = bit5(0x5aace0 + PlayerOffset) == 1
PAReverse = bit4(0x5aace1 + PlayerOffset) == 1
PASpeed1x = bit7(0x5aace0 + PlayerOffset) == 0 &&
    bit0(0x5aace1 + PlayerOffset) == 1 &&
    bit1(0x5aace1 + PlayerOffset) == 0 &&
    bit2(0x5aace1 + PlayerOffset) == 0
PASpeed15x = bit7(0x5aace1 + PlayerOffset) + bit0(0x5aace1 + PlayerOffset) == 2
PASpeed3x = bit0(0x5aace1 + PlayerOffset) + bit1(0x5aace1 + PlayerOffset) == 2
PASpeed5x = bit0(0x5aace1 + PlayerOffset) + bit2(0x5aace1 + PlayerOffset) == 2
PASpeed8x = bit3(0x5aace1 + PlayerOffset) == 1

// cheevos

// lesson mode cheevos

LessonByteBase = 0x2c9bc4
LessonTitle = {
    1: "Back To Basics",
    2: "Figuring Things Out",
    3: "Ready For The Arcade"
}

function LessonCheevo(num) {
    initial = LessonByteBase + (8 * (num - 1))
    calcPrev = 0
    calcCurr = 0
    for i in range(0, 7) {
        calcPrev = calcPrev + prev(byte(initial + i))
        calcCurr = calcCurr + byte(initial + i)
    }
    achievement(
        title = LessonTitle[num],
        points = num,
        description = format("Complete Lesson {0}.", num),
        trigger = GameState >= 4 && GameState <= 5 &&
            calcPrev >= 14 && calcPrev <= 15 && calcCurr == 16
    )
}

for i in range(1, 3) {
    LessonCheevo(i)
}

// unlock cheevos

UnlockByteBase = 0x2cb450

UnlockTitle = {
    1: "A Groupie",
    2: "A Deep Song",
    3: "A Course With A Twist",
    4: "A BEE?!?!?",
    5: "Sadness",
    6: "Haircuts",
    7: "An Oxymoron",
    8: "Keyboard Lessons",
    9: "Nothing Good",
    10: "A Backed Up Situation",
    11: "Sunscreen",
    12: "Shades",
    13: "Jazz",
    14: "Fresh Beats?",
    15: "Spicy Beats?",
    16: "Comfort",
    17: "Lava",
    18: "Valentine's Day",
    19: "Artists",
    20: "Cherry Blossoms",
    21: "Good Music",
    22: "Street Vocalists",
    23: "Additional Groupies",
    24: "A Not-Final Unlock",
    25: "Rock",
    26: "Darkrai",
    27: "A Timer",
    28: "A Piano Recital",
    29: "A Futuristic Smell",
    30: "French Lessons",
    31: "Kid Icarus's Guardians",
    32: "A Patient Path",
    33: "Tricky Patterns",
    34: "Chaos",
    35: "Speed",
    36: "A Hard Road",
    37: "Even More Speed",
    38: "A Legendary Road",
    39: "A Maximum Legend",
    40: "Pain And Suffering",
    41: "A CinemaSins Bell Ding",
    42: "Actual Rolling Credits",
    43: "Endless Entertainment",
    44: "Original Songs"
}

UnlockContent = {
    1: "Dancer Options",
    2: "the song more deep (ver.2.1)",
    3: "the REMiX course",
    4: "the song TwinBee ~Generation X~",
    5: "the SORROW course",
    6: "the song A Stupid Barber",
    7: "the song Scorching Moon",
    8: "the From IIDX course",
    9: "the song Bad Routine",
    10: "the REVERSE course",
    11: "the song Forever Sunshine",
    12: "the DARKNESS course",
    13: "the song Heaven is a '57 metallic gray (gimmix)",
    14: "the BRAND-NEW SONGS (Nonstop) course",
    15: "the BRAND-NEW SONGS (Oni) course",
    16: "the song I Need You",
    17: "both the NAOKI PREMIUM course & BURNIN' THE FLOOR (MOMO MIX)",
    18: "the song Try 2 Luv. U",
    19: "the RevenG & TaQ course",
    20: "the song 桜",
    21: "the song sync (EXTREME version)",
    22: "the RAP 5 course",
    23: "the song Keep On Liftin' (and additional dancers)",
    24: "the song Last Message",
    25: "the FROM GF & DM course",
    26: "the song Across the nightmare",
    27: "the song The Least 100sec",
    28: "the IIDX BOSS course & xenon",
    29: "the song Tomorrow Perfume",
    30: "the song un deux trois",
    31: "the ANGEL'S course",
    32: "the Road of Slow course (鬼の遅道)",
    33: "the song TRIP MACHINE survivor",
    34: "the Road of Random course (鬼の乱)",
    35: "the song PARANOIA survivor",
    36: "the Road of Truth course (真・鬼道)",
    37: "the song PARANOIA survivor MAX",
    38: "the Legendary Road course (伝説道)",
    39: "the song The legend of MAX",
    40: "the ULTRA 16 course",
    41: "the song Dance Dance Revolution",
    42: "the CREDITS",
    43: "ENDLESS MODE",
    44: "everything tied to MAX. (period)"
}

function UnlockCheevo(num) {
    byteOffset = (num - 1) / 8
    bitOffset = (num - 1) % 8
    targetBit = bit(bitOffset, UnlockByteBase + byteOffset)
    unlockBit = targetBit > prev(targetBit)
    achievement(
        points = 2,
        title = "Revealing " + UnlockTitle[num],
        description = "Unlock " + UnlockContent[num] + " for future plays.",
        trigger = (GameState >= 4 && GameState <= 6) && unlockBit
    )
}

for i in range(1, 44) {
    UnlockCheevo(i)
}

// Dancer cheevos

DancerUnlockByte = {
    0: 0x2c9b10,
    1: 0x2c9b0f,
    2: 0x2c9b20,
    3: 0x2c9b21
}

DancerUnlockTitle = {
    0: "Low Memory",
    1: "Puma's Best Friend",
    2: "A New Look",
    3: "An Unfinished Look"
}

DancerName = {
    0: "2MB",
    1: "U1",
    2: "EMI (4th) (2)",
    3: "EMI (unpublished)"
}

function SecretDancerCheevo(i) {
    dByte = DancerUnlockByte[i]
    unlocked = bit0(dByte) > prev(bit0(dByte))
    achievement(
        title = "Revealing " + DancerUnlockTitle[i],
        points = 5,
        description = format("Unlock the dancer {0} for future plays.", DancerName[i]),
        trigger = unlocked && GameState >= 0x01 && GameState <= 0x1b
    )
}

for i in DancerUnlockByte {
    SecretDancerCheevo(i)
}

function ChartPass(addr) => bitcount(addr) == 1 || bitcount(addr) == 2
function PrevChartPass(addr) => prev(bitcount(addr)) == 1 || prev(bitcount(addr)) == 2

function CollectionPass(songId) {
    base = 0x2c58e2 + (songId * 140) // Initial grade
    localTargets = []
    array_push(localTargets, base + 0) // LSP
    array_push(localTargets, base + 1) // SSP
    array_push(localTargets, base + 2) // HSP
    // array_push(localTargets, base + 4) // BEG
    array_push(localTargets, base + 5) // LDP
    array_push(localTargets, base + 6) // SDP
    array_push(localTargets, base + 7) // HDP
    if (any_of(OniSongs, o => o == songId)) {
        array_push(localTargets, base + 3) // CSP
        array_push(localTargets, base + 8) // CDP
    }
    
    // transform
    localCurr = array_map(localTargets, s => ChartPass(s))
    localPrev = array_map(localTargets, s => PrevChartPass(s))
    
    return [localCurr, localPrev]
}

function CreateSongPercentageCheevo(title, points, target) {
    playCurr = []
    playPrev = []
    for i in SongTitles {
        currPrev = CollectionPass(i)
        array_push(playCurr, currPrev[0])
        array_push(playPrev, currPrev[1])
    }
    allHits = tally_of(playCurr, target, s => once(any_of(s, t => t)))
    deltaProtection = tally_of(playPrev, target - 1, s => once(any_of(s, t => t)))
    lock = tally_of(playPrev, target, s => once(any_of(s, t => t)))
    achievement(
        title = title,
        points = points,
        description = format("Clear {0} unique songs. Beginner difficulty is ignored.", target),
        trigger = GameMode && never(GameState > 0x13) &&
            deltaProtection && measured(allHits) && unless(lock)
    )
}

CreateSongPercentageCheevo("A First Step", 2, 14)
CreateSongPercentageCheevo("A Second Coming", 2, 28)
CreateSongPercentageCheevo("A Third Time For The Charm", 3, 42)
CreateSongPercentageCheevo("A Fourth Corner", 3, 56)
CreateSongPercentageCheevo("A Fifth Element", 5, 70)
CreateSongPercentageCheevo("A Maximum Potential", 5, 84)
CreateSongPercentageCheevo("An Achievement To The Max. TWO!", 10, 98)
CreateSongPercentageCheevo("An Extreme Accomplishment", 25, 111)

// Mod cheevos

function Speed800Cheevo() {
    validCombos = []
    for i in Need8x {
        array_push(validCombos, SongId == i && PASpeed8x)
    }
    for i in Need5x {
        array_push(validCombos, SongId == i && PASpeed5x)
        array_push(validCombos, SongId == i && PASpeed8x)
    }
    for i in Need3x {
        array_push(validCombos, SongId == i && PASpeed3x)
        array_push(validCombos, SongId == i && PASpeed5x)
        array_push(validCombos, SongId == i && PASpeed8x)
    }
    for i in Need15x {
        array_push(validCombos, SongId == i && PASpeed15x)
        array_push(validCombos, SongId == i && PASpeed3x)
        array_push(validCombos, SongId == i && PASpeed5x)
        array_push(validCombos, SongId == i && PASpeed8x)
    }

    achievement(
        title = "Practicing for Original Songs",
        description = "Pass any chart on Standard or Higher with a sustained calculated BPM of 800 or higher.",
        points = 5,
        trigger = MinGameLevel && InGame && NotCourse && !Versus &&
            PlayerDiff >= 2 && PlayerDiff <= 6 &&
            !PALittleOn && !PAFreezeOff &&
            GsEval && AliveNormal && any_of(validCombos, e => e)
    )
}

Speed800Cheevo()

function BagS4RCheevo() {
    achievement(
        title = "With Love From 3rd Mix",
        description = "Pass bag Heavy Single under S4R Conditions (1x, Flat, Shuffle).",
        points = 5,
        trigger = MinGameLevel && InGame && NotCourse && Single &&
            Heavy && SongId == 0x08 &&
            !PALittleOn && PATurnMod > 4 && PAFlatOn && PASpeed1x &&
            GsEval && AliveNormal
            
    )
}

BagS4RCheevo()

function TMSModCheevo() {
    achievement(
        title = "Living In America",
        description = "Pass TRIP MACHINE survivor Heavy with 1.5x Sudden.",
        points = 5,
        trigger = MinGameLevel && InGame && NotCourse && !Versus &&
            Heavy && SongId == 0x41 && !PALittleOn && !PAFreezeOff &&
            PASpeed15x && PASudden &&
            GsEval && AliveNormal
    )
}

TMSModCheevo()

function EvolutionCheevo() {
    achievement(
        title = "Better Than America?",
        description = "Pass PARANOiA EVOLUTION Heavy with Hidden.",
        points = 5,
        trigger = MinGameLevel && InGame && NotCourse && !Versus &&
            Heavy && SongId == 0x3d && !PALittleOn &&
            PAHidden &&
            GsEval && AliveNormal
    )
}

EvolutionCheevo()

function SixRowModCheevo() {
    achievement(
        title = "Tubthumping",
        points = 5,
        description = "Pass any chart on Standard or higher using one of each non-default mod for the first six rows.",
        trigger = MinGameLevel && InGame && NotCourse && !Versus &&
            PlayerDiff >= 2 && PlayerDiff <= 6 &&
            !PALittleOn && !PAFreezeOff &&
            !PASpeed1x && PABoost && PAAnyAppearance &&
            PATurnMod > 1 &&
            PAReverse &&
            (PAFlatOn || PASoloOn || PADarkOn) &&
            GsEval && AliveNormal
    )
}

SixRowModCheevo()

// Extra Stage cheevos
NormalMaxStage = low4(0x2c58c2)
EarnedEncore = NormalMaxStage + 2 == low4(0x5aac2e)

DifferentWays = {
    0x08: "Slow",
    0x12: "Repeating",
    0x2e: "Classic",
    0x33: "Max",
    0x41: "American",
    0x44: "Cherry",
    0x4f: "Paranoid",
    0x50: "Mirrored",
    0x5a: "Unlimited",
    0x6f: "Original",
}

function Flashing10EncoreCheevo(song) {
    achievement(
        title = format("The {0} Way", DifferentWays[song]),
        points = 10,
        description = format("Earn One More Extra Stage with {0}.", SongTitles[song]),
        trigger = MinGameLevel && InGame && NotCourse && !Versus && Heavy &&
            EarnedEncore && GsEval && AliveNormal && SongId == song
    )
}

for i in DifferentWays {
    Flashing10EncoreCheevo(i)
}

function EncoreEarnedCheevo() {
    achievement(
        title = "The Revolutionary Way",
        points = 10,
        description = "Clear One More Extra Stage.",
        trigger = MinGameLevel && InGame && NotCourse && !Versus && Oni &&
            NormalMaxStage + 2 == low4(0x5aac2c) &&
            GsEval && AliveNormal && SongId == 0x12
    )
}

EncoreEarnedCheevo()

function ChartAaCheevo(song, style, diff, points, abbr) {
    achievement(
        title = SongTitles[song] + " " + abbr + " AA",
        points = points,
        description = format("Get an AA rank on {0} {1}.", SongTitles[song], abbr),
        trigger = MinGameLevel && InGame && 
            NotCourse && SongId == song && style && diff &&
            GsEval && EarnedAA && AliveNormal
    )
}

function PointBump(song, points) {
    isFlashing10 = any_of(FlashingSongs, o => o == song)
    if (isFlashing10 == false) {
        return points
    }
    if points == 2 {
        return 3
    }
    if points == 3 {
        return 5
    }
    if points == 5 {
        return 10
    }
    if points == 10 {
        return 25
    }
    return 0
}

for i in SongTitles {
    hasOni = any_of(OniSongs, o => o == i)
    ChartAaCheevo(i, Single, Standard, PointBump(i, 2), "SSP")
    ChartAaCheevo(i, Single, Heavy, PointBump(i, 3), "HSP")
    if hasOni == true {
        ChartAaCheevo(i, Single, Oni, PointBump(i, 3), "CSP")
    }
    ChartAaCheevo(i, Double, Standard, PointBump(i, 3), "SDP")
    ChartAaCheevo(i, Double, Heavy, PointBump(i, 5), "HDP")
    if hasOni == true {
        ChartAaCheevo(i, Double, Oni, PointBump(i, 5), "CDP")
    }
}

function NonstopPointBump(course, points) {
    isMax = course == 0x3a
    if isMax == false {
        return points
    }
    if points == 3 {
        return 5
    }
    if points == 5 {
        return 10
    }
    if points == 10 {
        return 25
    }
    return 0
}

// Extra Stage Cheevos

// Stupid AAA cheevo

achievement(
    title = "Always Aim Accurately",
    points = 25,
    description = "Earn an AAA rank on any chart. No Beginner or Edit.",
    trigger = MinGameLevel && InGame && NotCourse && !Versus && !Beginner &&
        // PAMarvelous + PAPerfect == word(0x5ff1a0) && PAOK == word(0x556c48) &&
        // PAMarvelous + PAPerfect == word(0x5ff1a0) && PAOK == word(0x5ff1a8) &&
        GsEval && AliveNormal && PAGrade == 1
)

// Course Cheevos

function NonstopCheevo(course, style, points, abbr) {
    achievement(
        title = CourseTitles[course] + " " + abbr,
        points = points,
        description = format("Clear the {0} course on {1} Difficult.", CourseTitles[course], abbr),
        trigger = MinGameLevel && InGame && 
            CourseId == course && style && IsNonstopDifficult &&
            !PALittleOn && !PAFreezeOff &&
            GsEval && AliveNormal &&
            disable_when(AliveNoMore, until=GameState == 0x0c)
    )
}

for i in AllowedNonstop {
    NonstopCheevo(i, Single, NonstopPointBump(i, 3), "Single")
    NonstopCheevo(i, Double, NonstopPointBump(i, 5), "Double")
}

function OniCheevo(course, style, points, abbr) {
    achievement(
        title = CourseTitles[course] + " " + abbr,
        points = points,
        description = format("Clear the {0} course on {1}.", CourseTitles[course], abbr),
        trigger = MinGameLevel && InGame && 
            CourseId == course && style && GsEval && AliveOni &&
            disable_when(AliveNoMore, until=GameState == 0x0c)
    )
}

OniPoints = {
    0x01: [3, 5],
    0x02: [5, 10],
    0x03: [3, 5],
    0x04: [10, 25],
    0x05: [5, 10],
    0x06: [10, 25],
    0x07: [5, 10],
    0x08: [10, 25],
    0x09: [5, 10],
    0x0a: [5, 10],
    0x0b: [5, 10],
    0x0c: [5, 10],
    0x0d: [5, 10],
    0x0e: [5, 10],
    0x0f: [5, 10],
    0x10: [5, 10],
    0x11: [5, 10],
    0x12: [5, 10],
    0x13: [5, 10],
    0x14: [5, 10],
    0x15: [5, 10],
    0x16: [5, 10],
    0x17: [10, 25],
    0x18: [5, 10],
    0x19: [5, 10],
    0x1a: [10, 25],
    0x1b: [10, 25],
    0x1c: [10, 25],
    0x1d: [25, 50],
    0x1e: [50, 100]
}

for i in range(1, 0x1e) {
    OniCheevo(i, Single, OniPoints[i][0], "Single")
    OniCheevo(i, Double, OniPoints[i][1], "Double")
}

// Leaderboards

function SongPassLeader(song, style, diff) {
    return MinGameLevel && InGame && NotCourse && SongId == song &&
        style && diff && PAGrade <= 5 && AliveNormal &&
        prev(GameState) == 5 && GsEval
}

function NormalDpCalc() {
    return PAMarvelous * 2 + PAPerfect * 2 + PAGreat + PAOK * 6 + PABoo * -4 + PAMiss * -8
}

function SongExLeaderboard(song, style, diff, abbr) {
    leaderboard(
        title = SongTitles[song] + " " + abbr + " EX Score",
        description = "Get the best EX score you can!",
        start = SongPassLeader(song, style, diff),
        cancel = always_false(),
        submit = always_true(),
        value = NormalDpCalc()
    )
}

function SongMoneyLeaderboard(song, style, diff, abbr) {
    leaderboard(
        title = SongTitles[song] + " " + abbr + " Money Score",
        description = "Get the best Money score you can!",
        start = SongPassLeader(song, style, diff),
        cancel = always_false(),
        submit = always_true(),
        value = PAMoneyScore
    )
}

for i in SongTitles {
    hasOni = any_of(OniSongs, o => o == i)
    SongMoneyLeaderboard(i, Single, Standard, "SSP")
    SongExLeaderboard(i, Single, Standard, "SSP")
    SongMoneyLeaderboard(i, Single, Heavy, "HSP")
    SongExLeaderboard(i, Single, Heavy, "HSP")
    if hasOni == true {
        SongMoneyLeaderboard(i, Single, Oni, "CSP")
        SongExLeaderboard(i, Single, Oni, "CSP")
    }
    SongMoneyLeaderboard(i, Double, Standard, "SDP")
    SongExLeaderboard(i, Double, Standard, "SDP")
    SongMoneyLeaderboard(i, Double, Heavy, "HDP")
    SongExLeaderboard(i, Double, Heavy, "HDP")
    if hasOni == true {
        SongMoneyLeaderboard(i, Double, Oni, "CDP")
        SongExLeaderboard(i, Double, Oni, "CDP")
    }
}

function NonstopExLeaderboard(course, style, abbr) {
    leaderboard(
        title = CourseTitles[course] + " " + abbr + " Difficult EX Score",
        description = "Get the best EX score you can!",
        start = MinGameLevel && InGame && CourseId == course &&
            style && IsNonstopDifficult && PAGrade <= 5 && AliveNormal &&
            prev(GameState) == 5 && GsEval,
        cancel = always_false(),
        submit = always_true(),
        value = PACourseEvalMarvelous * 2 +
            PACourseEvalPerfect * 2 +
            PACourseEvalGreat * 1 +
            PACourseEvalOK * 6 -
            (PACourseEvalBoo * 4) -
            (PACourseEvalMiss * 8)
    )
}

function NonstopMoneyLeaderboard(course, style, abbr) {
    leaderboard(
        title = CourseTitles[course] + " " + abbr + " Difficult Money Score",
        description = "Get the best Money score you can!",
        start = MinGameLevel && InGame && CourseId == course &&
            style && IsNonstopDifficult && PAGrade <= 5 && AliveNormal &&
            prev(GameState) == 5 && GsEval,
        cancel = always_false(),
        submit = always_true(),
        value = PACourseMoneyScore
    )
}

for i in RankableNonstop {
    NonstopMoneyLeaderboard(i, Single, "Single")
    NonstopExLeaderboard(i, Single, "Single")
    NonstopMoneyLeaderboard(i, Double, "Double")
    NonstopExLeaderboard(i, Double, "Double")
}

function OniExLeaderboard(course, style, abbr) {
    leaderboard(
        title = CourseTitles[course] + " " + abbr + " EX Score",
        description = "Get the best EX score you can!",
        start = MinGameLevel && InGame && CourseId == course &&
            style && prev(GameState) == 5 && GsEval,
        cancel = always_false(),
        submit = always_true(),
        value = PACourseEvalMarvelous * 3 +
            PACourseEvalPerfect * 2 +
            PACourseEvalGreat * 1 +
            PACourseEvalOK * 3
    )
}

for i in range(1, 0x1e) {
    if i != 0x1b {
        OniExLeaderboard(i, Single, "Single")
        OniExLeaderboard(i, Double, "Double")
    }
}

// RP

MainMenuChoices = {
    0: "Game Mode",
    1: "Diet Mode",
    2: "Lesson Mode",
    3: "Training Mode",
    4: "Edit Mode",
    5: "Options",
    6: "Records",
    7: "Information",
    8: "Endless Mode",
    9: "Credits"
}

MainMenuAction = {
    0: "Entering",
    1: "Entering",
    2: "Entering",
    3: "Entering",
    4: "Entering",
    8: "Entering"
}

SpecificOptionScreen = {
    0x03: "Sound ",
    0x04: "Controller ",
    0x05: "Double Play ",
    0x06: "Dance Play ",
    0x07: "Game ",
    0x08: "Graphic ",
    0x09: "Diet ",
    0x0a: "Memory ",
    0x0b: "Screen ",
    0x0d: "Dancer ",
}

PlayerStyleCombo = {
    0x00: "Single",
    0x01: "Single",
    0x02: "Double",
    0x05: "Versus",
    0x07: "Double"
}

ShortChartAbbr = {
    10: "LSP",
    11: "LSP",
    12: "LDP",
    15: "LSP",
    17: "LDP",
    20: "SSP",
    21: "SSP",
    22: "SDP",
    25: "SSP",
    27: "SDP",
    30: "HSP",
    31: "HSP",
    32: "HDP",
    35: "HSP",
    37: "HDP",
    60: "CSP",
    61: "CSP",
    62: "CDP",
    65: "CSP",
    67: "CDP",
    70: "BEG",
    71: "BEG",
    72: "BEG",
    75: "BEG",
    77: "BEG"
}

InitialStyle = {
    1: "Single",
    2: "Versus",
    3: "Double"
}

InitialDifficulty = {
    0: "Beginner",
    1: "Light",
    2: "Standard",
    3: "Heavy",
    4: "Nonstop (Course)",
    5: "Challenge (Course)"
}

RpSelectStyle = rich_presence_lookup("Style", byte(0x5a2bf4), InitialStyle, "Single") 
RpSelectDifficulty = rich_presence_lookup(
    "InitialDifficulty",
    PAInitialDiff,
    InitialDifficulty
)
RpPlayerStyle = rich_presence_lookup("Style", byte(0x5aac39), InitialStyle, "Single")
RpSong = rich_presence_lookup("Song", SongId, SongTitles, "Something")
RpCourse = rich_presence_lookup("Course", CourseId, CourseTitles)
RpMainAction = rich_presence_lookup("MainAction", byte(0x656150), MainMenuAction, "Viewing")
RpMainMenu = rich_presence_lookup("MainItem", byte(0x656150), MainMenuChoices)
RpGameOptions = rich_presence_lookup("GameOption", byte(0x6575f0), SpecificOptionScreen)
RpChartAbbrTraining = rich_presence_lookup(
    "ChartAbbr",
    low4(0x5aacd8) * 10 + low4(0x5fef8a),
    ShortChartAbbr
)
RpChartAbbr = rich_presence_lookup(
    "ChartAbbr",
    PlayerDiff * 10 + low4(0x5fef8a),
    ShortChartAbbr
)
RpChartAbbrGame = rich_presence_lookup(
    "ChartAbbr",
    PALoadedDiff * 10 + low4(0x5fef8a),
    ShortChartAbbr
)

RpLessonNum = rich_presence_macro("Number", low4(0x6c7660) + 1)
RpLessonSec = rich_presence_macro("Number", low4(0x6c7664) + 1)

RpRoundNum = rich_presence_macro("Number", byte(0x5aac2c) + 1)

RpMarvelous = rich_presence_macro("Number", PAMarvelous)
RpPerfect = rich_presence_macro("Number", PAPerfect)
RpSongPerfect = rich_presence_macro("Number", PAMarvelous + PAPerfect)
RpGreat = rich_presence_macro("Number", PAGreat)
RpGood = rich_presence_macro("Number", PAGood)
RpBoo = rich_presence_macro("Number", PABoo)
RpMiss = rich_presence_macro("Number", PAMiss)
RpOK = rich_presence_macro("Number", PAOK)
RpMaxCombo = rich_presence_macro("Number", PAMaxCombo)
RpScoreEmoji = "💯"
RpMoneyScore = rich_presence_macro("Number", PAMoneyScore)

RpCourseEvalMarvelous = rich_presence_macro("Number", PACourseEvalMarvelous)
RpCourseEvalPerfect = rich_presence_macro("Number", PACourseEvalPerfect)
RpCourseEvalGreat = rich_presence_macro("Number", PACourseEvalGreat)
RpCourseEvalGood = rich_presence_macro("Number", PACourseEvalGood)
RpCourseEvalBoo = rich_presence_macro("Number", PACourseEvalBoo)
RpCourseEvalMiss = rich_presence_macro("Number", PACourseEvalMiss)
RpCourseEvalOK = rich_presence_macro("Number", PACourseEvalOK)

RpCourseGameMarvelous = rich_presence_macro("Number", PACourseEvalMarvelous + PAMarvelous)
RpCourseGamePerfect = rich_presence_macro("Number", PACourseEvalPerfect + PAPerfect)
RpCourseGameGreat = rich_presence_macro("Number", PACourseEvalGreat + PAGreat)
RpCourseGameGood = rich_presence_macro("Number", PACourseEvalGood + PAGood)
RpCourseGameBoo = rich_presence_macro("Number", PACourseEvalBoo + PABoo)
RpCourseGameMiss = rich_presence_macro("Number", PACourseEvalMiss + PAMiss)
RpCourseGameOK = rich_presence_macro("Number", PACourseEvalOK + PAOK)
RpCourseMoneyScore = rich_presence_macro("Number", PACourseMoneyScore)
RpCourseMaxCombo = rich_presence_macro("Number", PACourseMaxCombo)

RpCourseEvalMoneyScore = rich_presence_macro(
    "Number",
    PAFinalScore
)

NonstopDiffs = {
    0: "Normal",
    1: "Difficult"
}
RpNonstopDiff = rich_presence_lookup("NonstopDiff", bit0(0x5a68f8), NonstopDiffs)

rich_presence_conditional_display(
    once(GameState == 0x36) && never(GameState == 0x1e),
    "Practicing Lesson {0} Section {1} of Lesson Mode",
    RpLessonNum,
    RpLessonSec
)

rich_presence_conditional_display(
    GameState == 0x17,
    "Thank you for playing."
)

rich_presence_conditional_display(
    GameState == 0x1b,
    "There's always...A TOMORROW!"
)

rich_presence_conditional_display(
    GameState >= 4 && GameState <= 6 && NotCourse && Versus,
    "Playing {0} with a friend",
    RpSong
)

rich_presence_conditional_display(
    GameState >= 1 && GameState <= 6 && DietId,
    "Working out to {0}",
    RpCourse
)

rich_presence_conditional_display(
    GameState >= 0x05 && GameState <= 0x06 && NotCourse && HasHolds,
    "Results of {0} {1}: {2}/{3}/{4}/{5}/{6} {7} OK {8} Max Combo {9}{10}",
    RpSong,
    RpChartAbbrGame,
    RpSongPerfect,
    RpGreat,
    RpGood,
    RpBoo,
    RpMiss,
    RpOK,
    RpMaxCombo,
    RpScoreEmoji,
    RpMoneyScore
)

rich_presence_conditional_display(
    GameState == 0x04 && NotCourse && HasHolds,
    "Playing {0} {1}: {2}/{3}/{4}/{5}/{6} {7} OK {8} Max Combo {9}{10}",
    RpSong,
    RpChartAbbrGame,
    RpSongPerfect,
    RpGreat,
    RpGood,
    RpBoo,
    RpMiss,
    RpOK,
    RpMaxCombo,
    RpScoreEmoji,
    RpMoneyScore
)

rich_presence_conditional_display(
    GameState >= 0x05 && GameState <= 0x06 && NotCourse,
    "Results of {0} {1}: {2}/{3}/{4}/{5}/{6} {8} Max Combo {9}{10}",
    RpSong,
    RpChartAbbrGame,
    RpSongPerfect,
    RpGreat,
    RpGood,
    RpBoo,
    RpMiss,
    RpOK,
    RpMaxCombo,
    RpScoreEmoji,
    RpMoneyScore
)

rich_presence_conditional_display(
    GameState == 0x04 && NotCourse,
    "Playing {0} {1}: {2}/{3}/{4}/{5}/{6} {7} Max Combo {9}{10}",
    RpSong,
    RpChartAbbrGame,
    RpSongPerfect,
    RpGreat,
    RpGood,
    RpBoo,
    RpMiss,
    RpOK,
    RpMaxCombo,
    RpScoreEmoji,
    RpMoneyScore
)

rich_presence_conditional_display(
    GameState >= 0x01 && GameState <= 0x06 && NonstopId && Versus,
    "Playing {0} {1} with a friend",
    RpCourse,
    RpNonstopDiff
)

rich_presence_conditional_display(
    once(GameState >= 0x04 && GameState <= 0x05 && NonstopId) &&
    never(word(0x5aac2e) == 0xffff) &&
    never(GameState == 0x0c) &&
    never(GameState >= 0x1b),
    "Playing {0} {1} {2} Song {3}: {4}/{5}/{6}/{7}/{8}/{9} {10} OK {11} Max Combo {12}{13}",
    RpCourse,
    RpNonstopDiff,
    RpPlayerStyle,
    RpRoundNum,
    RpCourseGameMarvelous,
    RpCourseGamePerfect,
    RpCourseGameGreat,
    RpCourseGameGood,
    RpCourseGameBoo,
    RpCourseGameMiss,
    RpCourseGameOK,
    RpCourseMaxCombo,
    RpScoreEmoji,
    RpCourseMoneyScore
)

rich_presence_conditional_display(
    GameState >= 0x05 && GameState <= 0x06 && NonstopId,
    "Results of {0} {1} {2}: {3}/{4}/{5}/{6}/{7}/{8} {9} OK {10} Max Combo {11}{12}",
    RpCourse,
    RpNonstopDiff,
    RpPlayerStyle,
    RpCourseEvalMarvelous,
    RpCourseEvalPerfect,
    RpCourseEvalGreat,
    RpCourseEvalGood,
    RpCourseEvalBoo,
    RpCourseEvalMiss,
    RpCourseEvalOK,
    RpCourseMaxCombo,
    RpScoreEmoji,
    RpCourseEvalMoneyScore
)

rich_presence_conditional_display(
    GameState >= 0x01 && GameState <= 0x06 && OniId && Versus,
    "Playing {0} with a friend",
    RpCourse
)

rich_presence_conditional_display(
    once(GameState >= 0x04 && GameState <= 0x05 && OniId) &&
    never(word(0x5aac2e) == 0xffff) &&
    never(GameState == 0x0c) &&
    never(GameState >= 0x1b),
    "Playing {0} {2} Song {3}: {4}/{5}/{6}/{7}/{8}/{9} {10} OK {11} Max Combo {12}{13}",
    RpCourse,
    RpNonstopDiff,
    RpPlayerStyle,
    RpRoundNum,
    RpCourseGameMarvelous,
    RpCourseGamePerfect,
    RpCourseGameGreat,
    RpCourseGameGood,
    RpCourseGameBoo,
    RpCourseGameMiss,
    RpCourseGameOK,
    RpCourseMaxCombo,
    RpScoreEmoji,
    RpCourseMoneyScore
)

rich_presence_conditional_display(
    GameState >= 0x05 && GameState <= 0x06 && OniId,
    "Results of {0} {2}: {3}/{4}/{5}/{6}/{7}/{8} {9} OK {10} Max Combo {11}{12}",
    RpCourse,
    RpNonstopDiff,
    RpPlayerStyle,
    RpCourseEvalMarvelous,
    RpCourseEvalPerfect,
    RpCourseEvalGreat,
    RpCourseEvalGood,
    RpCourseEvalBoo,
    RpCourseEvalMiss,
    RpCourseEvalOK,
    RpCourseMaxCombo,
    RpScoreEmoji,
    RpCourseMoneyScore
)

rich_presence_conditional_display(
    GameState == 0x03,
    "Loading Data for {0} while learning how to play",
    RpSong
)

InitialLoading = (GameState == 0x01 || GameState == 0x02 || GameState == 0x13)

rich_presence_conditional_display(
    InitialLoading && OniId && Versus,
    "Loading Charts for {0} with a friend",
    RpCourse
)

rich_presence_conditional_display(
    InitialLoading && OniId,
    "Loading Charts for {0} {1}",
    RpCourse,
    RpPlayerStyle
)

rich_presence_conditional_display(
    InitialLoading && NonstopId && Versus,
    "Loading Charts for {0} {1} with a friend",
    RpCourse,
    RpNonstopDiff
)

rich_presence_conditional_display(
    InitialLoading && NonstopId,
    "Loading Charts for {0} {1} {2}",
    RpCourse,
    RpNonstopDiff,
    RpPlayerStyle
)

rich_presence_conditional_display(
    InitialLoading && NotCourse && Versus,
    "Loadings Chart for {0}",
    RpSong
)

rich_presence_conditional_display(
    InitialLoading && NotCourse,
    "Loading Chart for {0} {1}",
    RpSong,
    RpChartAbbrGame
)

rich_presence_conditional_display(
    GameState == 0x12 && NonstopId && Versus,
    "Setting Options for {0} with a friend",
    RpCourse
)

rich_presence_conditional_display(
    GameState == 0x12 && NonstopId,
    "Setting Options for {0} {1}",
    RpCourse,
    RpChartAbbr
)

rich_presence_conditional_display(
    GameState == 0x12 && NotCourse && Versus,
    "Setting Options for {0} with a friend",
    RpSong
)

rich_presence_conditional_display(
    GameState == 0x12 && NotCourse,
    "Setting Options for {0} {1}",
    RpSong,
    RpChartAbbr
)

rich_presence_conditional_display(
    GameState == 0x0c && OniId && Versus,
    "Thinking of Playing {0} with a friend",
    RpCourse
)

rich_presence_conditional_display(
    GameState == 0x0c && OniId,
    "Thinking of Playing {0} {1}",
    RpCourse,
    RpPlayerStyle
)

rich_presence_conditional_display(
    GameState == 0x0c && NonstopId && Versus,
    "Thinking of Playing {0} {1} with a friend",
    RpCourse,
    RpNonstopDiff
)

rich_presence_conditional_display(
    GameState == 0x0c && NonstopId,
    "Thinking of Playing {0} {1} {2}",
    RpCourse,
    RpNonstopDiff,
    RpPlayerStyle
)

rich_presence_conditional_display(
    GameState == 0x0c && NotCourse && Versus,
    "Thinking of Playing {0} with a friend",
    RpSong
)

rich_presence_conditional_display(
    GameState == 0x0c && NotCourse,
    "Thinking of Playing {0} {1}",
    RpSong,
    RpChartAbbr
)

rich_presence_conditional_display(
    GameState == 0x0c && DietId,
    "Thinking of Working Out to {0}",
    RpCourse
)

rich_presence_conditional_display(
    GameState == 0x0d && Versus,
    "Select Difficulty with a friend"
)

rich_presence_conditional_display(
    GameState == 0x0d && PAInitialDiff <= 5,
    "Select Difficulty: Thinking {0}",
    RpSelectDifficulty
)

rich_presence_conditional_display(
    GameState == 0x0d,
    "Loading the Wheel"
)

rich_presence_conditional_display(
    GameState == 0x09,
    "Selecting a Style: Thinking {0}",
    RpSelectStyle
)

rich_presence_conditional_display(
    GameState == 0x1c,
    "CAUTION! Extreme Motions are DANGEROUS!"
)

rich_presence_conditional_display(
    GameState == 0x2c,
    "Setting up for a workout"
)

rich_presence_conditional_display(
    GameState == 0x30,
    "Training on {0} {1}",
    RpSong,
    RpChartAbbrTraining
)

rich_presence_conditional_display(
    GameState == 0x1e,
    "Thinking of {0} {1}",
    RpMainAction,
    RpMainMenu
)

rich_presence_conditional_display(
    GameState == 0x27,
    "Viewing Alleged Top Scores of Courses"
)

rich_presence_conditional_display(
    GameState == 0x25,
    "Watching a Short Demo of {0}",
    RpSong
)

rich_presence_conditional_display(
    GameState == 0x26,
    "How To Play (as if in the arcade)"
)

rich_presence_conditional_display(
    GameState == 0x24,
    "DANCE DANCE REVOLUTION! [EXTREME]"
)

rich_presence_conditional_display(
    GameState == 0x21,
    "This is a part of the famous BEMANI series!"
)

rich_presence_conditional_display(
    GameState == 0x1f,
    "WARNING! No one ever reads or cares about this screen!"
)

rich_presence_conditional_display(
    GameState == 0x33,
    "Setting Up {0}Options",
    RpGameOptions
)

rich_presence_conditional_display(
    GameState == 0x32,
    "Viewing Various High Scores"
)

rich_presence_conditional_display(
    GameState == 0x34,
    "Viewing Various Information"
)

rich_presence_conditional_display(
    GameState == 0x35,
    "Congrats on five years of DDR."
)

rich_presence_conditional_display(
    GameState == 0 || GameState == 0x2a || GameState == 0x29,
    "Preparing The Machine"
)

rich_presence_display("Let's DDR!")

