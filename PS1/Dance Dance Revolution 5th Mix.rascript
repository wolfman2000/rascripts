// Dance Dance Revolution 5th Mix
// #ID = 18212

// Original script by SoltyD, updated by wolfman2000

// $0F2924: [Game] Song currently selected [8-bit]
//          0x01=Dynamite Rave (long ver.)
//          0x02=Healing Vision
//          0x03=Still In My Heart
//          0x04=Ecstasy
//          0x05=Broken My Heart
//          0x06=Dancing All Alone
//          0x07=Swing It
//          0x08=Hot Limit
//          0x09=Paranoia Eternal
//          0x0a=God of Romance
//          0x0b=The Twist
//          0x0c=17 Sai
//          0x0d=B4U glorious style
//          0x0e=Be Together
//          0x0f=Odoru Ponpokorin
//          0x10=Matsuri Japan
//          0x11=Remember You
//          0x12=Test My Best
//          0x13=No Limit
//          0x14=My Generation
//          0x15=Moonlight Shadow
//          0x16=Never Ending Story
//          0x17=Movin On
//          0x18=Right Now
//          0x19=Tribal Dance
//          0x1a=Oops!...I Did It Again
//          0x1b=Dive
//          0x1c=Against All Odds
//          0x1d=Afronova Primeval
//          0x1e=INSERTiON
//          0x1f=Can't Stop Fallin' In Love (Speed Mix)
//          0x20=Absolute
//          0x21=DXY!
//          0x22=Mr T. (take me higher)
//          0x23=I Was The One
//          0x24=Electro Tuned (the SubS mix)
//          0x25=Abyss
//          0x26=The Cube
//          0x27=Radical Faith
//          0x28=Sana Morette Ne Ente
//          0x29=Healing Vision (Angelic Mix)
//          0x2a=Look To The Sky
//          0x2b=Do It Right
//          0x2c=On The Jazz
//          0x2d=Dive (more deep and deeper style)
//          0x2e=Nori Nori Nori
//          0x2f=The Centre Of The Heart
function currentSongId() => byte(0x0F2924)

songMemoryDict = {
    0x0c:"17才",
    0x20:"ABSOLUTE",
    0x25:"Abyss",
    0x1d:"AFRONOVA PRIMEVAL",
    0x1c:"AGAINST ALL ODDS (Definitive MIX)",
    0x0d:"B4U glorious style",
    0x0e:"BE TOGETHER",
    0x05:"BROKEN MY HEART",
    0x1f:"CAN'T STOP FALLIN' IN LOVE (SPEED MIX)",
    0x06:"DANCING ALL ALONE",
    0x1b:"DIVE",
    0x2d:"DIVE ～more deep & deeper style～",
    0x2b:"Do It Right",
    0x21:"DXY!",
    0x01:"DYNAMITE RAVE (Long ver.)",
    0x04:"ECSTASY",
    0x24:"Electro Tuned(the SubS mix)",
    0x02:"Healing Vision",
    0x29:"Healing Vision (Angelic mix)",
    0x08:"HOT LIMIT",
    0x1e:"INSERTION",
    0x23:"I Was The One",
    0x2a:"Look To The Sky",
    0x10:"祭 JAPAN",
    0x15:"MOONLIGHT SHADOW (New Vocal Version)",
    0x17:"MOVIN ON (Extended Moon Mix)",
    0x22:"Mr.T.(take me higher)",
    0x14:"MY GENERATION(Fat Beat Mix)",
    0x16:"NEVER ENDING STORY",
    0x13:"NO LIMIT (RM Remix)",
    0x2e:"NORI NORI NORI",
    0x0f: "おどるポンポコリン",
    0x2c:"ON THE JAZZ",
    0x1a:"OOPS!...I DID IT AGAIN (Fired Up MIX)",
    0x09:"PARANOiA ETERNAL",
    0x27:"Radical Faith",
    0x11:"Remember You",
    0x18:"RIGHT NOW",
    0x0a: "ロマンスの神様",
    0x28:"サナ・モレッテ・ネ・エンテ",
    0x03:"STILL IN MY HEART",
    0x07:"SWING IT",
    0x12:"TEST MY BEST",
    0x2f:"The Centre Of The Heart (STONEBRIDGE CLUBMIX)",
    0x26:"THE CUBE",
    0x0b:"THE TWIST (Double Pump MIX)",
    0x19:"TRIBAL DANCE (Almighty Mix)"
}

// Accurate chart data is required for the purpose of full combos.
ChartData = {
    0x01: [354, 476, 643, 369, 508, 668],
    0x02: [128, 272, 353, 136, 275, 358],
    0x03: [180, 255, 290, 169, 230, 286],
    0x04: [169, 235, 276, 183, 235, 296],
    0x05: [215, 267, 360, 217, 273, 353],
    0x06: [116, 170, 214, 89, 201, 241],
    0x07: [121, 168, 220, 128, 155, 211],
    0x08: [240, 532, 733, 255, 557, 716],
    0x09: [237, 298, 352, 256, 289, 367],
    0x0a: [140, 207, 325, 146, 223, 311],
    0x0b: [144, 211, 333, 125, 238, 299],
    0x0c: [105, 204, 269, 101, 196, 250],
    0x0d: [412, 528, 744, 417, 478, 666],
    0x0e: [103, 195, 233, 103, 195, 244],
    0x0f: [66, 190, 274, 67, 198, 341],
    0x10: [216, 277, 447, 207, 286, 349],
    0x11: [41, 130, 197, 47, 135, 198],
    0x12: [147, 189, 292, 140, 225, 285],
    0x13: [196, 273, 412, 190, 255, 349],
    0x14: [182, 233, 253, 175, 236, 275],
    0x15: [136, 196, 269, 139, 184, 296],
    0x16: [173, 222, 304, 149, 224, 293],
    0x17: [143, 220, 304, 132, 218, 282],
    0x18: [163, 210, 283, 143, 192, 259],
    0x19: [189, 256, 339, 169, 239, 328],
    0x1a: [249, 479, 569, 269, 441, 705],
    0x1b: [204, 272, 354, 191, 268, 322],
    0x1c: [119, 200, 310, 134, 213, 334],
    0x1d: [272, 322, 423, 287, 332, 437],
    0x1e: [187, 263, 374, 181, 256, 316],
    0x1f: [238, 321, 443, 241, 323, 432],
    0x20: [142, 252, 311, 135, 215, 303],
    0x21: [157, 269, 355, 205, 227, 334],
    0x22: [120, 209, 310, 121, 223, 292],
    0x23: [145, 217, 291, 141, 236, 277],
    0x24: [179, 268, 349, 168, 248, 305],
    0x25: [168, 234, 309, 171, 233, 309],
    0x26: [135, 215, 282, 152, 236, 323],
    0x27: [178, 263, 360, 173, 259, 396],
    0x28: [128, 190, 294, 128, 225, 269],
    0x29: [153, 195, 287, 136, 194, 278],
    0x2a: [273, 377, 479, 272, 377, 471],
    0x2b: [154, 200, 285, 159, 202, 284],
    0x2c: [108, 220, 331, 121, 220, 329],
    0x2d: [154, 230, 322, 137, 228, 293],
    0x2e: [133, 133, 133, 137, 137, 137],
    0x2f: [105, 105, 105, 89, 89, 89],
}

function isLongVersion(i) =>
    i == 0x01 ||
    i == 0x08 ||
    i == 0x0d ||
    i == 0x1a

// The Current Song Selected value in memory during gameplay is not sorted in any way,
// but the song records in memory are stored in alphabetical order.
// This dict translates the memory value into a list that reflects alphabetical ordering.
// Once translated, the value is fed into SongDict for the title.
songTranslateDict = {
    1:15,
    2:18,
    3:41,
    4:16,
    5:8,
    6:10,
    7:42,
    8:20,
    9:35,
    10:39,
    11:46,
    12:1,
    13:6,
    14:7,
    15:32,
    16:24,
    17:37,
    18:43,
    19:30,
    20:28,
    21:25,
    22:29,
    23:26,
    24:38,
    25:47,
    26:34,
    27:11,
    28:5,
    29:4,
    30:21,
    31:9,
    32:2,
    33:14,
    34:27,
    35:22,
    36:17,
    37:3,
    38:45,
    39:36,
    40:40,
    41:19,
    42:23,
    43:13,
    44:33,
    45:12,
    46:31,
    47:44
}

// (Mostly) Alphabetical ordering of song titles
// This ordering is how the songs appear in memory
songDict = {
    1:"17才",
    2:"ABSOLUTE",
    3:"Abyss",
    4:"AFRONOVA PRIMEVAL",
    5:"AGAINST ALL ODDS (Definitive MIX)",
    6:"B4U glorious style",
    7:"BE TOGETHER",
    8:"BROKEN MY HEART",
    9:"CAN'T STOP FALLIN' IN LOVE (SPEED MIX)",
    10:"DANCING ALL ALONE",
    11:"DIVE",
    12:"DIVE ～more deep & deeper style～",
    13:"Do It Right",
    14:"DXY!",
    15:"DYNAMITE RAVE (Long ver.)",
    16:"ECSTASY",
    17:"Electro Tuned(the SubS mix)",
    18:"Healing Vision",
    19:"Healing Vision (Angelic mix)",
    20:"HOT LIMIT",
    21:"INSERTION",
    22:"I Was The One",
    23:"Look To The Sky",
    24:"祭 JAPAN",
    //24:"Matsuri Japan",
    25:"MOONLIGHT SHADOW (New Vocal Version)",
    26:"MOVIN ON (Extended Moon Mix)",
    27:"Mr.T.(take me higher)",
    28:"MY GENERATION(Fat Beat Mix)",
    29:"NEVER ENDING STORY",
    30:"NO LIMIT (RM Remix)",
    31:"NORI NORI NORI",
    32: "おどるポンポコリン",
    //32:"Odoru Ponpokorin",
    33:"ON THE JAZZ",
    34:"OOPS!...I DID IT AGAIN (Fired Up MIX)",
    35:"PARANOiA ETERNAL",
    36:"Radical Faith",
    37:"Remember You",
    38:"RIGHT NOW",
    39: "ロマンスの神様",
    //39:"God of Romance",
    40:"サナ・モレッテ・ネ・エンテ",
    //40:"Sana Morette Ne Ente",
    41:"STILL IN MY HEART",
    42:"SWING IT",
    43:"TEST MY BEST",
    44:"The Centre Of The Heart (STONEBRIDGE CLUBMIX)",
    45:"THE CUBE",
    46:"THE TWIST (Double Pump MIX)",
    47:"TRIBAL DANCE (Almighty Mix)"
}

songEnglish = {
    1:"17 SAI",
    2:"ABSOLUTE",
    3:"Abyss",
    4:"AFRONOVA PRIMEVAL",
    5:"AGAINST ALL ODDS (Definitive MIX)",
    6:"B4U glorious style",
    7:"BE TOGETHER",
    8:"BROKEN MY HEART",
    9:"CAN'T STOP FALLIN' IN LOVE (SPEED MIX)",
    10:"DANCING ALL ALONE",
    11:"DIVE",
    12:"DIVE ～more deep & deeper style～",
    13:"Do It Right",
    14:"DXY!",
    15:"DYNAMITE RAVE (Long ver.)",
    16:"ECSTASY",
    17:"Electro Tuned(the SubS mix)",
    18:"Healing Vision",
    19:"Healing Vision (Angelic mix)",
    20:"HOT LIMIT",
    21:"INSERTION",
    22:"I Was The One",
    23:"Look To The Sky",
    24:"Matsuri Japan",
    25:"MOONLIGHT SHADOW (New Vocal Version)",
    26:"MOVIN ON (Extended Moon Mix)",
    27:"Mr.T.(take me higher)",
    28:"MY GENERATION(Fat Beat Mix)",
    29:"NEVER ENDING STORY",
    30:"NO LIMIT (RM Remix)",
    31:"Nori Nori Nori",
    32:"Odoru Ponpokorin",
    33:"ON THE JAZZ",
    34:"OOPS!...I DID IT AGAIN (Fired Up MIX)",
    35:"PARANOiA ETERNAL",
    36:"Radical Faith",
    37:"Remember You",
    38:"RIGHT NOW",
    39:"God of Romance",
    40:"Sana Morette Ne Ente",
    41:"STILL IN MY HEART",
    42:"SWING IT",
    43:"TEST MY BEST",
    44:"The Centre Of The Heart (STONEBRIDGE CLUBMIX)",
    45:"THE CUBE",
    46:"THE TWIST (Double Pump MIX)",
    47:"TRIBAL DANCE (Almighty Mix)"
}

difficultyDict = {
    1:"Basic",
    2:"Trick",
    3:"Maniac"
}

styleDict = {
    0:"Single",
    1:"Double"
}

// Point values assigned to achievements for full combos
// First value Basic, second Trick, third Maniac
pointValues = {
    1:3,
    2:5,
    3:10
}
pointValuesLong = {
    1:5,
    2:10,
    3:25
}

// Point values for gallery %age unlock achievements
galleryPointValues = {
    10:5,
    20:5,
    30:10,
    40:10,
    50:25,
    60:25,
    70:25,
    80:25,
    90:25,
    100:50
}

danceMasterPointValues = {
    0:10,
    1:25,
    2:50
}

// Prepare for Add Address shenanigans.
PlayerOffset = 0x9284

PlayerStyleBase = 0xfbc1e
Single = low4(PlayerStyleBase) <= 1
Versus = low4(PlayerStyleBase) == 5
Double = bit1(PlayerStyleBase) == 1

PlayerStartBase = low4(0xf2900)
// DO NOT RELY ON THIS FOR CHEEVOS!
StartOffset = PlayerStartBase * PlayerOffset

// Global game state
GlobalState = byte(0xf2908)
HereWeGo = prev(GlobalState) != 4 && GlobalState == 4
SelectMusic = GlobalState == 0x0c
EditMode = GlobalState == 0x2c
GalleryMode = GlobalState == 0x33
GlobalEvaluation = GlobalState == 0x06

// Active player for single: Player 1 Add Address is fine.
// Active player for double: Add Address, but use invert strats.

// $0F2940: [Game] Player 1 In-song current score [32-bit]
//          Does not include bonus
//          Score while playing double can appear here or on P2 side depending on which controller the game was started from
function currentScoreP1() => dword(0x0F2940)

// $0F2944: [Game] Player 1 Current Song Bonus Value [32-bit]
//          Too long to explain here, see http://aaronin.jp/ddrssystem.html for details on score calculation, courtesy of Taren Nauxen and published at Aaron In Japan
function currentBonusP1() => dword(0x0F2944)

SingleOffset = bit0(PlayerStyleBase) * PlayerOffset
DoubleOffset = ~bit2(PlayerStyleBase) * PlayerOffset
function currentDifficultySingle() => byte(0x0f2998 + SingleOffset)
function currentDifficultyDouble() => byte(0xf2998 + DoubleOffset)

// $0F2998: [Game] Difficulty selected for 1P for current song [8-bit]
//          0x01=Basic
//          0x02=Trick
//          0x03=Maniac
function currentDifficultyP1() => byte(0x0F2998)

// $0FBC1C: [Game] Difficulty selected for 2P for current song [8-bit]
//          0x01=Basic
//          0x02=Trick
//          0x03=Maniac
function currentDifficultyP2() => byte(0x0FBC1C)

function runningScoreSingle() => dword(0xe96bc + SingleOffset)
function runningScoreDouble() => dword(0xe96bc + DoubleOffset)

function priorScoreSingle() => dword(0xe96b8 + SingleOffset)
function priorScoreDouble() => dword(0xe96b8 + DoubleOffset)

function moneyScoreSingle() => dword(0xf2940 + SingleOffset) - dword(0xf293c + SingleOffset)
function moneyScoreDouble() => dword(0xf2940 + DoubleOffset) - dword(0xf293c + DoubleOffset)

// $0F29C4: [Game] Player 1 Grade of current song [8-bit]
//          Calculated in real time during the song using EX score
//          EX Score:
//          Perfects are +2
//          Greats are +1
//          Goods are 0
//          Boos are -4
//          Misses are -5
//          
//          Grade evaluation:
//          0x01=AAA (All Perfects)
//          0x02=AA (Full Combo)
//          0x03=A (80% of maximum EX score)
//          0x04=B (64% of maximum EX score)
//          0x05=C (50% of maximum EX score)
//          0x06=D (under 50% of maximum EX score)
//          0x07=E (Failed)
function currentGradeP1() => byte(0x0F29C4)

// $0F3B6C: [Game] Maximum combo for stage [16-bit]
//          Resets at beginning of next song
//          Mirrored at 0x0f29c0
function maxComboP1() => word(0x0F3B6C)
function maxComboP2() => word(0x0fbc44)
function maxComboSingle() => word(0xf3b6c + SingleOffset)
function maxComboDouble() => word(0xf3b6c + DoubleOffset)

// Is Little On?
function littleOffSingle() => bit2(0xf29a0 + SingleOffset) == 0
function littleOffDouble() => bit2(0xf29a0 + DoubleOffset) == 0

// How many perfects?
function judgePerfectSingle() => dword(0xf29a4 + SingleOffset)
function judgePerfectDouble() => dword(0xf29a4 + DoubleOffset)

// How many greats?
function judgeGreatSingle() => dword(0xf29a8 + SingleOffset)
function judgeGreatDouble() => dword(0xf29a8 + DoubleOffset)

// How many goods?
function judgeGoodSingle() => dword(0xf29ac + SingleOffset)
function judgeGoodDouble() => dword(0xf29ac + DoubleOffset)

// How many boos?
function judgeBooSingle() => dword(0xf29b0 + SingleOffset)
function judgeBooDouble() => dword(0xf29b0 + DoubleOffset)

// How many misses?
function judgeMissSingle() => dword(0xf29b4 + SingleOffset)
function judgeMissDouble() => dword(0xf29b4 + DoubleOffset)

// What was the last judgment?
function lastJudgeSingle() => byte(0xf3b8e + SingleOffset)
function lastJudgeDouble() => byte(0xf3b8e + DoubleOffset)

// How many notes in the chart?
function totalNotesSingle() => dword(0xf3ba0 + SingleOffset)
function totalNotesDouble() => dword(0xf3ba0 + DoubleOffset)

// $0FBBC4: [Game] Player 2 In-song current score [32-bit]
//          Does not include bonus
function currentScoreP2() => dword(0x0FBBC4)

// $0FBBC8: [Game] Player 2 In-song current song bonus [32-bit]
//          Added to score at end of song plus Dance Level Bonus for total final score
function currentBonusP2() => dword(0x0FBBC8)

// $0FBC48: [Game] Player 2 Grade of current song [8-bit]
//          Calculated in real time during the song using EX score (see 0x0f29c4)
function currentGradeP2() => byte(0x0FBC48)

function MenuSelection() => byte(0x10d812)

function GameLevel() => low4(0x116d00)

// $116D30: [Song Data] Record Scores: 17 Sai Single Basic [32-bit]
//          Includes bonus, calculated at song end
function songData() => dword(0x116D30)

// $117C30: [Lesson Mode] Lesson 1 Section 1 status [8-bit]
//          0x00=Not done
//          0x01=Done (Check mark)
//          0x02=Mastered (Crown)
function lessonData() => byte(0x117C30)

// $117C50: [Information] Info No 1 Unlock status [16-bit]
//          0x000=Hidden
//          0xffff=Unlocked
//          "Thanks for buying this game"
function informationData() => word(0x117C50)

// $117E50: [Gallery Mode] Gallery Picture No 1 [8-bit]
//          Bit 0: Unlocked when 0x01
//          Bit 1: Marked as New when 0x01
//          Bit 2: Selected as background when 0x01
function galleryData() => byte(0x117E50)

// $14A746: [Game] Counter for BeForU unlock code [8-bit]
//          Counts up for each correct input to 0x09 and resets to 0x00 on failure or successful unlock
//          Input Konami Code (UUDDLRLR Cross Circle) while Gallery Picture 224 is highlighted to unlock last five gallery pictures and Dive ~more deep & deeper style~ immediately
function konamiCode() => byte(0x14A746)

function songStatus() => byte(0x105128)

function getPlayStyle() => byte(0xf2920)

// $0f29bc: [Game] P1 Current number of steps that have played in song [16-bit]
function totalStepsPlayedP1() => word(0x0f29bc)

// $0fbc40: [Game] P2 Current number of steps that have played in song [16-bit]
function totalStepsPlayedP2() => word(0x0fbc40)

// [Gallery Mode] Counter towards new gallery picture [8-bit]
// Increments for each song passed
// At 0x03 resets to 0x00 and unlocks at least one new picture (can be more!)
function galleryPictureUnlockCounter() => byte(0x117f36)

// [Game] Program Status [8-bit]
// 0x00=Demo Mode
// 0x01=Main Menu
// 0x02=Game In Progress
// 0x03=Lesson Mode
// 0x04=Training Mode
// 0x05=Edit Mode
// 0x06=Arcade Link
// 0x07=Records
// 0x08=Options
// 0x09=Information
// 0x0a=Game Finished
// 0x0b=Memory Card check/save
// 0x0c=Data Bank
// 0x0d=Gallery Mode
function programStatus() => byte(0x105124)

// 0x117c30 Beginning of lesson data
// 24 bytes in a row, only first two bits of each used
// 0x00 = Not Done, 0x01 = Done (check mark), 0x02 = Crown

// Checks bit 0 of all Gallery unlocks and returns count of bits turned on
function countGalleryPictures() { 
    galleryPictureLocation=0x117e50
    galleryCount=0
    for i in range(0, 227) {
        galleryCount = galleryCount + bit0(galleryPictureLocation + i)
    }
    return galleryCount
}

// Checks bit 2 of all Gallery unlocks and returns count of bits turned on
// These pictures will replace the normal song backgrounds during play
function countGalleryBackgrounds() {
    galleryPictureLocation=0x117e50
    backgroundCount=0
    for i in range(0, 227) {
        backgroundCount = backgroundCount + bit2(galleryPictureLocation + i)
    }
    return backgroundCount
}

// Checks that P1 has moved from Song Over state to Results Screen
function atResultsScreen() => programStatus() == 0x02 && prev(songStatus()) == 0x07 && songStatus() == 0x08

// Steps >= 40 because the smallest number of steps is Remember You Basic with 41
function maxStageComboP1(songId, difficulty, style) => (
    maxComboP1() == totalStepsPlayedP1() && totalStepsPlayedP1() >= 40)

function maxStageComboP2(songId, difficulty, style) => (
    maxComboP2() == totalStepsPlayedP2() && totalStepsPlayedP2() >= 40)

function lessonSectionsMastered(lesson) {
    tally = 0
    lessonDataLocation = 0x117c30 + (lesson - 1) * 8
    for section in range(0,7) {
        tally = tally + bit1(lessonDataLocation + section)
    }
    return tally
}

// Lesson Mode achievements
for lesson in range(1, 3) {
    achievement(
        title = "Lesson " + lesson + " Mastered",
        description ="Get crowns in all 8 sections of Lesson " + lesson + " in Lesson Mode",
        points = lesson,
        trigger = programStatus() == 0x03 &&
            prev(lessonSectionsMastered(lesson)) == 7 &&
            lessonSectionsMastered(lesson) == 8
    )
}

// Combo cheevos

ComboPoints = {
    100: 5,
    250: 10,
    573: 25
}

function ComboCheevo(i) {
    singleCombo = Single && repeated(i, maxComboSingle() > prev(maxComboSingle())) &&
        never(Single && lastJudgeSingle() >= 3)
    doubleCombo = Double && repeated(i, maxComboDouble() > prev(maxComboDouble())) &&
        never(Double && lastJudgeDouble() >= 3)
    achievement(
        title = i + " Combo",
        points = ComboPoints[i],
        description = format("Obtain a {0} combo in a single song.", i),
        trigger = never(programStatus() != 2) &&
            never(currentSongId() != prev(currentSongId())) &&
            never(GlobalState != 4) &&
            (singleCombo || doubleCombo) &&
            GameLevel() >= 3
    )
}

for i in ComboPoints {
    ComboCheevo(i)
}

// Song unlock achievements
// Clear X songs to unlock a new song

function totalSongsCleared() => dword(0x116ca0)

unlockAddressDict = {
    1: [0x117c98],
    2: [0x117c9c],
    3: [0x117c74],
    4: [0x117c80],
    5: [0x117c68],
    6: [0x117c90],
    7: [0x117c6c],
    8: [0x117c60],
    9: [0x117c78],
    10: [0x117c88],
    11: [0x117c64],
    12: [0x117c7c],
    13: [0x117c70],
    14: [0x117cfc, 0x117d00],
    15: [0x117c8c],
    16: [0x117c94, 0x117cdc, 0x117ce4, 0x117cec, 0x117cf4],
    17: [0x117c84],
    18: [0x117d04, 0x117d08]
}

unlockCountDict = {
    1:5,
    2:10,
    3:15,
    4:20,
    5:25,
    6:30,
    7:35,
    8:40,
    9:45,
    10:50,
    11:55,
    12:60,
    13:65,
    14:70,
    15:75,
    16:80,
    17:90,
    18:100
}

unlockTitleDict = {
    1: "Preview Preview Preview",
    2: "The Corners Are Not As Good",
    3: "Hope It's Not Bottomless",
    4: "A Night On The Beach",
    5: "No Pitying Necessary",
    6: "Just Smooth",
    7: "How Egotistical",
    8: "Not Relative",
    9: "Hosted By Phillip Schofield",
    10: "Just Not The Sun",
    11: "But What Does It Mean?",
    12: "Anything Is Possible",
    13: "Underrated Hit",
    14: "The Arcade Pioneers",
    15: "Can You Go Wrong?",
    16: "Have Lifeguard Permission First",
    17: "Try To Stay Up Right",
    18: "The Home Version Pioneers"
}

unlockNameDict = {
    1:"NORI NORI NORI",
    2:"The Centre Of The Heart (STONEBRIDGE CLUBMIX)",
    3:"Abyss",
    4:"Sana Morette Ne Ente",
    5:"Mr.T.(take me higher)",
    6:"ON THE JAZZ",
    7:"I Was The One",
    8:"ABSOLUTE",
    9:"THE CUBE",
    10:"Look To The Sky",
    11:"DXY!",
    12:"Radical Faith",
    13:"Electro Tuned (the SubS mix)",
    14:"Dancers NAOKI and N.M.R.",
    15:"Do It Right",
    16:"DIVE (more deep and deeper style)",
    17:"Healing Vision (Angelic Mix)",
    18:"Dancers U1 and 2MB"
}

function UnlockTrigger(i) {
    return programStatus() == 0x02 &&
        all_of(unlockAddressDict[i], u => prev(word(u)) == 0 && word(u) == 0xffff)
}

function KonamiTrigger() {
    return prev(konamiCode()) == 9 && konamiCode() == 0 && GalleryMode &&
        all_of(unlockAddressDict[16], u => prev(word(u)) == 0 && word(u) == 0xffff)
}

function SongUnlockCheevo(i) {
    achievement(
        title = unlockTitleDict[i],
        description = format(
            "Unlock {0} by clearing {1} songs.",
            unlockNameDict[i],
            unlockCountDict[i]
        ),
        points = 5,
        trigger = UnlockTrigger(i)
    )
}

function DiveDeeperCheevo() {
    standardTrigger = UnlockTrigger(16)
    achievement(
        title = unlockTitleDict[16],
        description = format(
            "Unlock {0} either by clearing {1} songs or via Konami Code.",
            unlockNameDict[16],
            unlockCountDict[16]
        ),
        points = 5,
        trigger = standardTrigger || KonamiTrigger()
    )
}

//Song and dancer unlock achievements
for i in range(1, 18) {
    if (i != 16) {
        SongUnlockCheevo(i)
    }
    else {
        DiveDeeperCheevo()
    }
}

// Dance Master cheevos

function danceMasterGradeTrigger(style, difficulty) {
    gradeBase = 0x116d66
    targets = []
    for i in range(0, 46) {
        //if (difficulty == 1 || (i != 30 && i != 43)) {
            gradeTarget = gradeBase + (i * 0x40) + ((style - 1) * 3) + (difficulty - 1)
            array_push(targets, gradeTarget)
        //}
    }
    return all_of(targets, t => bitcount(t) != 0 && low4(t) <= 3) &&
        any_of(targets, t => prev(low4(t)) == 0 || prev(low4(t)) >= 4)
}

function DanceMasterCheevo(styleId, diffId) {
    fallback = ""
    if (diffId > 1) {
        fallback = " This includes the redundant preview song charts."
    }
    achievement(
        title = format(
            "Dance Master - {0} {1}",
            styleDict[styleId - 1],
            difficultyDict[diffId]
        ),
        points = danceMasterPointValues[diffId - 1],
        description = format(
            "Get all As on every song in {0} {1}.{2}",
            styleDict[styleId - 1],
            difficultyDict[diffId],
            fallback
        ),
        trigger = programStatus() == 2 && danceMasterGradeTrigger(styleId, diffId)
    )
}

for i in range(1, 2) {
    for j in range(1, 3) {
        DanceMasterCheevo(i, j)
    }
}

pfcOptions = []
// Handle the exclusives after.
for i in range(1,45) {
    array_push(pfcOptions, (
        currentSongId() == i && Single && currentDifficultySingle() == 1 &&
        trigger_when(judgePerfectSingle() == ChartData[i][0])
    ))
    array_push(pfcOptions, (
        currentSongId() == i && Single && currentDifficultySingle() == 2 &&
        trigger_when(judgePerfectSingle() == ChartData[i][1])
    ))
    array_push(pfcOptions, (
        currentSongId() == i && Single && currentDifficultySingle() == 3 &&
        trigger_when(judgePerfectSingle() == ChartData[i][2])
    ))
    array_push(pfcOptions, (
        currentSongId() == i && Double && currentDifficultyDouble() == 1 &&
        trigger_when(judgePerfectDouble() == ChartData[i][3])
    ))
    array_push(pfcOptions, (
        currentSongId() == i && Double && currentDifficultyDouble() == 2 &&
        trigger_when(judgePerfectDouble() == ChartData[i][4])
    ))
    array_push(pfcOptions, (
        currentSongId() == i && Double && currentDifficultyDouble() == 3 &&
        trigger_when(judgePerfectDouble() == ChartData[i][5])
    ))
}
// Ideally, be more exact and use the items above. Maybe another day.
achievement(
    title = "And Now To Anger Everyone",
    points = 25,
    description = "Get a Perfect Full Combo on any chart.",
    trigger = !Versus &&
        once(HereWeGo) &&
        trigger_when(atResultsScreen()) &&
        ((Single && littleOffSingle() &&
        trigger_when(judgePerfectSingle() == totalNotesSingle()) &&
        judgeGreatSingle() == 0 &&
        judgeGoodSingle() == 0 &&
        judgeBooSingle() == 0 &&
        judgeMissSingle() == 0
        ) || (Double && littleOffDouble() &&
        trigger_when(judgePerfectDouble() == totalNotesDouble()) &&
        judgeGreatDouble() == 0 &&
        judgeGoodDouble() == 0 &&
        judgeBooDouble() == 0 &&
        judgeMissDouble() == 0)) &&
        never(GlobalState == 0x0c) &&
        never(GlobalState == 0x1c) &&
        GameLevel() >= 3
)

function SingleFullComboCheevo(songId, diffId) {
    songTitle = songDict[songTranslateDict[songId]]
    songEng = songEnglish[songTranslateDict[songId]]
    diffTarget = always_true()
    if (songId < 0x2e) {
        diffTarget = currentDifficultySingle() == diffId
    }
    diff = difficultyDict[diffId]
    pointDict = pointValues
    if isLongVersion(songId) {
        pointDict = pointValuesLong
    }
    // Don't stress about diet mode this time around.
    common = currentSongId() == songId && Single && littleOffSingle() &&
        diffTarget && once(HereWeGo) &&
        never(runningScoreSingle() != priorScoreSingle() && lastJudgeSingle() > 2) &&
        judgeGoodSingle() == 0 &&
        judgeBooSingle() == 0 &&
        judgeMissSingle() == 0 &&
        never(SelectMusic) &&
        never(GlobalState == 0x1c) &&
        trigger_when(atResultsScreen()) &&
        trigger_when(judgePerfectSingle() + judgeGreatSingle() == totalNotesSingle()) &&
        GameLevel() >= 3
    achievement(
        title = format("{0} Single {1} FC", songEng, diff),
        points = pointDict[diffId],
        description = format("Get a full combo on {0} Single {1}.", songTitle, diff),
        trigger = common
    )
}

function DoubleFullComboCheevo(songId, diffId) {
    songTitle = songDict[songTranslateDict[songId]]
    songEng = songEnglish[songTranslateDict[songId]]
    diffTarget = always_true()
    if (songId < 0x2e) {
        diffTarget = currentDifficultyDouble() == diffId
    }
    diff = difficultyDict[diffId]
    pointDict = pointValues
    if isLongVersion(songId) {
        pointDict = pointValuesLong
    }
    // Don't stress about diet mode this time around.
    common = currentSongId() == songId && Double && littleOffDouble() &&
        diffTarget && once(HereWeGo) &&
        never(runningScoreDouble() != priorScoreDouble() && lastJudgeDouble() > 2) &&
        judgeGoodDouble() == 0 &&
        judgeBooDouble() == 0 &&
        judgeMissDouble() == 0 &&
        never(SelectMusic) &&
        never(GlobalState == 0x1c) &&
        trigger_when(atResultsScreen()) &&
        trigger_when(judgePerfectDouble() + judgeGreatDouble() == totalNotesDouble()) &&
        GameLevel() >= 3
    achievement(
        title = format("{0} Double {1} FC", songEng, diff),
        points = pointDict[diffId],
        description = format("Get a full combo on {0} Double {1}.", songTitle, diff),
        trigger = common
    )
}

// Gallery Mode achievements
achievement(
    title = "Unlock A Gallery Picture",
    description ="Unlock any picture in the gallery after clearing three songs",
    points = 1,
    trigger = countGalleryPictures() == prev(countGalleryPictures()) + 1 && prev(galleryPictureUnlockCounter()) == 2 && galleryPictureUnlockCounter() == 0
)

galleryTitles = {
    10: "Simple",
    20: "Moderate",
    30: "Ordinary",
    40: "Superior",
    50: "Marvelous",
    60: "Genuine",
    70: "Paramount",
    80: "Exorbitant",
    90: "Catastrophic",
    100: "Apocalyptic"
}

for i in range(10, 100, 10) {
    target = (228 * i / 100)
    achievement(
        title = galleryTitles[i] + " Gallery",
        description = "Unlock " + i + "% of the game's 228 gallery pictures",
        points = galleryPointValues[i],
        trigger =
            (programStatus() == 2 || GalleryMode) &&
            prev(countGalleryPictures()) < target &&
            measured(countGalleryPictures() >= target)
    )
}

achievement(
    title = "Background Freestyler",
    description ="Pick five of your favorite Gallery pictures to use as backgrounds with the Select button",
    points = 2,
    trigger = programStatus() == 0x0d && prev(countGalleryBackgrounds()) == 4 && countGalleryBackgrounds() == 5
)

achievement(
    title = "A Classic With Different Letters? [m]",
    description = "Unlock the remaining BeForU pictures via Konami Code. Hint: 224.",
    points = 2,
    trigger = KonamiTrigger()
)

// Data Bank Export
achievement(
    title = "So... Many... Edits!",
    description = "Export one edit from the Data Bank to your memory card.",
    points = 1,
    trigger = MenuSelection() == 5 && byte(0x192aa8) <= 8 &&
        byte(0x192abd) != 0 && prev(byte(0x192ab5)) == 3 && byte(0x192ab5) == 5
)

// Data Edit Creation
achievement(
    title = "Let Your Imagination Run Wild",
    points = 5,
    description = "Create and save one edit containing at least 50 arrows.",
    trigger = MenuSelection() == 4 && EditMode &&
        word(0x152dc8) >= 50 && byte(0x152e2f) != 0 &&
        byte(0x152e49) == 1 && prev(byte(0x152e5e)) == 0x24 &&
        byte(0x152e5e) == 0x19
)

// Full combo achievements
// Covers all difficulties on single and double
// If including workout mode, you don't get an evaluation: instead,
// the game state changes to 8 and the song ID changes to any other song.
for i in range(1, 47) {
    pointDict = pointValues
    if isLongVersion(i) {
        pointDict = pointValuesLong
    }
    songTitle = songDict[songTranslateDict[i]]
    if i >= 0x2e {
        SingleFullComboCheevo(i, 1)
        DoubleFullComboCheevo(i, 1)
    }
    else {
        SingleFullComboCheevo(i, 1)
        SingleFullComboCheevo(i, 2)
        SingleFullComboCheevo(i, 3)
        DoubleFullComboCheevo(i, 1)
        DoubleFullComboCheevo(i, 2)
        DoubleFullComboCheevo(i, 3)
    }
}

// Leaderboards

function SingleMoneyLeaderboard(songId, diffId) {
    diff = difficultyDict[diffId] + " "
    diffComp = currentDifficultySingle() == diffId
    if ((songId >= 46)) {
        diff = ""
        diffComp = always_true()
    }
    leaderboard(
        title = format(
            "{0} Single {1}Money Score",
            songMemoryDict[songId],
            diff
        ),
        description = format(
            "Get the highest money score you can! (Same as UI)"
        ),
        start = programStatus() == 2 && songStatus() == 8 && GlobalEvaluation &&
            Single && diffComp &&
            currentSongId() == songId && GameLevel() >= 3,
        cancel = always_false(),
        submit = always_true(),
        value = moneyScoreSingle()
    )
}

function SingleExLeaderboard(songId, diffId) {
    diff = difficultyDict[diffId] + " "
    diffComp = currentDifficultySingle() == diffId
    if ((songId >= 46)) {
        diff = ""
        diffComp = always_true()
    }
    leaderboard(
        title = format(
            "{0} Single {1}EX Score",
            songMemoryDict[songId],
            diff
        ),
        description = format(
            "Get the highest EX score you can! (2P + G)"
        ),
        start = programStatus() == 2 && songStatus() == 8 && GlobalEvaluation &&
            Single && diffComp &&
            currentSongId() == songId && GameLevel() >= 3,
        cancel = always_false(),
        submit = always_true(),
        value = judgePerfectSingle() * 2 + judgeGreatSingle()
    )
}

function DoubleMoneyLeaderboard(songId, diffId) {
    diff = difficultyDict[diffId] + " "
    diffComp = currentDifficultyDouble() == diffId
    if ((songId >= 46)) {
        diff = ""
        diffComp = always_true()
    }
    leaderboard(
        title = format(
            "{0} Double {1}Money Score",
            songMemoryDict[songId],
            diff
        ),
        description = format(
            "Get the highest money score you can! (Same as UI)"
        ),
        start = programStatus() == 2 && songStatus() == 8 && GlobalEvaluation &&
            Double && diffComp &&
            currentSongId() == songId && GameLevel() >= 3,
        cancel = always_false(),
        submit = always_true(),
        value = moneyScoreDouble()
    )
}

function DoubleExLeaderboard(songId, diffId) {
    diff = difficultyDict[diffId] + " "
    diffComp = currentDifficultyDouble() == diffId
    if ((songId >= 46)) {
        diff = ""
        diffComp = always_true()
    }
    leaderboard(
        title = format(
            "{0} Double {1}EX Score",
            songMemoryDict[songId],
            diff
        ),
        description = format(
            "Get the highest EX score you can! (2P + G)"
        ),
        start = programStatus() == 2 && songStatus() == 8 && GlobalEvaluation &&
            Double && diffComp &&
            currentSongId() == songId && GameLevel() >= 3,
        cancel = always_false(),
        submit = always_true(),
        value = judgePerfectDouble() * 2 + judgeGreatDouble()
    )
}

for i in range(1, 47) {
    SingleMoneyLeaderboard(i, 1)
    SingleExLeaderboard(i, 1)
    DoubleMoneyLeaderboard(i, 1)
    DoubleExLeaderboard(i, 1)
    if i < 46 {
        SingleMoneyLeaderboard(i, 2)
        SingleExLeaderboard(i, 2)
        DoubleMoneyLeaderboard(i, 2)
        DoubleExLeaderboard(i, 2)
        SingleMoneyLeaderboard(i, 3)
        SingleExLeaderboard(i, 3)
        DoubleMoneyLeaderboard(i, 3)
        DoubleExLeaderboard(i, 3)
    }
}

GsIntroLoop = GlobalState == 0x00 || GlobalState == 0x1d || (GlobalState >= 0x22 && GlobalState <= 0x24)

function RetroOlympicsLeaderboard(songId, diffId) {
    diff = difficultyDict[diffId] + " "
    diffComp = currentDifficultySingle() == diffId
    leaderboard(
        title = format(
            "RetroOlympics 2023 - {0} Single {1}EX Score",
            songMemoryDict[songId],
            diff
        ),
        description = format(
            "Get the highest EX score you can! (2P + G)"
        ),
        start = programStatus() == 2 && prev(songStatus()) == 5 && songStatus() == 4 &&
            Single && diffComp &&
            currentSongId() == songId && GameLevel() >= 3,
        cancel = GlobalState == 0x1c || GsIntroLoop,
        submit = prev(songStatus()) == 7 && __ornext(songStatus() == 8 || songStatus() == 0x0b),
        value = judgePerfectSingle() * 2 + judgeGreatSingle()
    )
}

for i in [0x05, 0x13, 0x1e] {
    RetroOlympicsLeaderboard(i, 1)
    RetroOlympicsLeaderboard(i, 2)
    RetroOlympicsLeaderboard(i, 3)
}

// Rich Presence

RpScoreIcon = "💯"

RpSongName = rich_presence_lookup("SongSelection", currentSongId(), songMemoryDict, "No Song")
RpPlayStyle = rich_presence_lookup("PlayStyle", getPlayStyle() - 1, styleDict)
RpP1Diff = rich_presence_lookup("PADifficulty", currentDifficultySingle(), difficultyDict)
RpP2Diff = rich_presence_lookup("PADifficulty", currentDifficultyDouble(), difficultyDict)
RpP1Perfect = rich_presence_macro("Number", judgePerfectSingle())
RpP2Perfect = rich_presence_macro("Number", judgePerfectDouble())
RpP1Great = rich_presence_macro("Number", judgeGreatSingle())
RpP2Great = rich_presence_macro("Number", judgeGreatDouble())
RpP1Good = rich_presence_macro("Number", judgeGoodSingle())
RpP2Good = rich_presence_macro("Number", judgeGoodDouble())
RpP1Boo = rich_presence_macro("Number", judgeBooSingle())
RpP2Boo = rich_presence_macro("Number", judgeBooDouble())
RpP1Miss = rich_presence_macro("Number", judgeMissSingle())
RpP2Miss = rich_presence_macro("Number", judgeMissDouble())
RpP1Score = rich_presence_macro("Number", moneyScoreSingle())
RpP2Score = rich_presence_macro("Number", moneyScoreDouble())

rich_presence_conditional_display(
    GlobalState == 0x1c,
    "Welcome to DDR 5th Mix"
)

rich_presence_conditional_display(
    Versus,
    "Playing DDR 5th Mix with a Friend"
)

rich_presence_conditional_display(
    MenuSelection() == 1,
    "Working Out to DDR 5th Mix Tunes"
)

rich_presence_conditional_display(
    GlobalState == 4 && Double,
    "Playing {0} Double {2}: {3}/{4}/{5}/{6}/{7} {8} {9}",
    RpSongName,
    RpPlayStyle,
    RpP2Diff,
    RpP2Perfect,
    RpP2Great,
    RpP2Good,
    RpP2Boo,
    RpP2Miss,
    RpScoreIcon,
    RpP2Score
)

rich_presence_conditional_display(
    GlobalState == 4,
    "Playing {0} Single {2}: {3}/{4}/{5}/{6}/{7} {8} {9}",
    RpSongName,
    RpPlayStyle,
    RpP1Diff,
    RpP1Perfect,
    RpP1Great,
    RpP1Good,
    RpP1Boo,
    RpP1Miss,
    RpScoreIcon,
    RpP1Score
)

rich_presence_conditional_display(
    GlobalState >= 1 && GlobalState < 4 && Double,
     "About to Play {0} Double {2}",
    RpSongName,
    RpPlayStyle,
    RpP2Diff
)

rich_presence_conditional_display(
    GlobalState >= 1 && GlobalState < 4,
    "About to Play {0} Single {2}",
    RpSongName,
    RpPlayStyle,
    RpP1Diff
)

rich_presence_conditional_display(
    GlobalState >= 5 && GlobalState <= 6 && Double,
    "Results of {0} Double {2}: {3}/{4}/{5}/{6}/{7} {8} {9}",
    RpSongName,
    RpPlayStyle,
    RpP2Diff,
    RpP2Perfect,
    RpP2Great,
    RpP2Good,
    RpP2Boo,
    RpP2Miss,
    RpScoreIcon,
    RpP2Score
)

rich_presence_conditional_display(
    GlobalState >= 5 && GlobalState <= 6,
    "Results of {0} Single {2}: {3}/{4}/{5}/{6}/{7} {8} {9}",
    RpSongName,
    RpPlayStyle,
    RpP1Diff,
    RpP1Perfect,
    RpP1Great,
    RpP1Good,
    RpP1Boo,
    RpP1Miss,
    RpScoreIcon,
    RpP1Score
)

rich_presence_conditional_display(
    GlobalState == 0x0c && Double,
    "Thinking of Playing {0} Double {2}",
    RpSongName,
    RpPlayStyle,
    RpP2Diff
)

rich_presence_conditional_display(
    GlobalState == 0x0c,
    "Thinking of Playing {0} Single {2}",
    RpSongName,
    RpPlayStyle,
    RpP1Diff
)

rich_presence_conditional_display(
    GlobalState == 0x1a,
    "Caution! Extreme Motions Are Dangerous!"
)

rich_presence_conditional_display(
    GlobalState >= 0x13 && GlobalState <= 0x18,
    "Congrats on Completing a Set"
)

rich_presence_conditional_display(
    GsIntroLoop,
    "Watching Intro Loop"
)

rich_presence_conditional_display(
    GlobalState == 0x25,
    "Viewing Set High Scores"
)

// TODO: Identify the Lesson
rich_presence_conditional_display(
    GlobalState == 0x2a,
    "Going Through Lesson Mode"
)

// TODO: Identify the song, style, and difficulty
rich_presence_conditional_display(
    GlobalState == 0x2b,
    "Training On A Song"
)

rich_presence_conditional_display(
    GlobalState == 0x2c,
    "Creating Custom Charts"
)

rich_presence_conditional_display(
    GlobalState == 0x2e,
    "Viewing Score Records"
)

rich_presence_conditional_display(
    GlobalState == 0x2f,
    "Setting Up Options"
)

rich_presence_conditional_display(
    GlobalState == 0x30,
    "Reviewing Information"
)

rich_presence_conditional_display(
    GlobalState == 0x31,
    "Preparing a Memory Card for a Nearby Arcade Apparently"
)

rich_presence_conditional_display(
    GlobalState == 0x32,
    "Looking at the MANY Edits within the Data Bank"
)

rich_presence_conditional_display(
    GlobalState == 0x33,
    "Viewing the DDR Gallery"
)

rich_presence_display("Playing Dance Dance Revolution 5th Mix")
