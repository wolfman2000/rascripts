// Dance Dance Revolution EXTREME
// #ID = 19027

// Variables

// How many stages are normally allowed in a game?
// This does not take into account extra stages or alternate modes.
MaxStages = byte(0x2ac43b)

// What game mode are we in?
MainMenuOption = low4(0x639c18)
GameMode = MainMenuOption == 0
MenuMission = MainMenuOption == 2

// Two different stage checks. Useful for detecting extra stage.
CurrentStageA = word(0x58e6bc)
CurrentStageAB = byte(0x58e6bc)
CurrentStageB = word(0x58e6be)
CurrentStageBB = byte(0x58e6be)

NotDoneWithStages = CurrentStageAB != 0xff && CurrentStageBB != 0xff

// OnExtraStage = CurrentStageA > MaxStages

// Strange Game State, but it can work for my purposes.
GameState = byte(0x2985f4)
OnMenus = GameState == 0x01
InDemo = prior(GameState) == 0x24 && GameState == 0x25 && CurrentStageA == 0xffff
IntroShoutout = GameState == 0x05
IntroHowToPlay = prior(GameState) == 0x24 && GameState == 0x27
IntroWarning = GameState == 0x02
IntroSellout = GameState == 0x04
OnIntroLoop = IntroWarning || IntroSellout || IntroHowToPlay || IntroShoutout || InDemo
SelectingStyle = GameState == 0x26
// In gameplay? ...this is about to become reset heavy, isn't it?
InGameplay = prior(GameState) == 0x24 && GameState == 0x25
EnteredNonstop = once(prev(GameState) == 0x9e && GameState == 0xb2)
EnteredChallenge = once(prev(GameState) == 0x9e && GameState == 0xb3)
EnteredSelectMusicAtStart = CurrentStageA == 0 && GameState == 0xb4

SongEvaluationScreen = GameState >= 0xbf && GameState <= 0xc0 

// In-Game Game State
InGameState = byte(0x2985ec)
LoadingWheel = InGameState == 0x04
SelectingMusic = InGameState == 0x05
EnteringMissionMode = InGameState == 0x07
SelectingMission = InGameState == 0x0a
SelectingOptions = (prior(InGameState) == 0x02 && InGameState == 0x09) ||
    (prior(InGameState) == 0x05 && InGameState == 0x02)
Failed = prior(InGameState) == 0 && InGameState == 0x0b
Passed = prior(InGameState) == 0x0c && InGameState == 0x0b
InGameplayRedux = InGameState == 0x0c
EvaluationScreen = InGameState == 3 || InGameState == 9

// What song are we thinking about playing?
DemoSong = byte(0x298600)

// What song are we playing?
SongId = byte(0x2986d4)

// What is the internal difficulty level?
// Stop most cheevos if less than the default.
InternalLevel = word(0x2ac439)
InternalLevelEasy = InternalLevel < 3

TotalSongsAndCoursesCleared = dword(0x2af134)
PassedSongOrCourse = prev(TotalSongsAndCoursesCleared) + 1 == TotalSongsAndCoursesCleared

TimesPassedEverybodysFavorite = word(0x2af4c0)
TimesPassedEverybodysFavoriteDifficult = word(0x2af7b8)

TotalSongsCleared = TotalSongsAndCoursesCleared -
    TimesPassedEverybodysFavorite - TimesPassedEverybodysFavoriteDifficult

// The initial unlocking area.
UnlockedThingBase = 0x2b0518
UnlockedNonstopBase = 0x2b051d

UnlockedScorchingMoon = prev(bit0(0x2b0518)) == 0 && bit0(0x2b0518) == 1

UnlockedMemories = prior(bit2(0x2b0520)) == 0 && bit2(0x2b0520) == 1

// Mission Mode Data Here.
MissionModeBase = 0x2b0814
MissionLengthPer = 12

TotalMissionScore = 0
for index in range(0, 99, 1) {
    TotalMissionScore = TotalMissionScore +
        low4(MissionModeBase + (index * MissionLengthPer))
}
AllMissionsBeaten = TotalMissionScore == 300

// Companion to Game State: Last Major Item?
PlayingSongs = dword(0x2b6df0) == 0x0107661a ||
    dword(0x2b6df0) == 0x0129437a || dword(0x2b6df0) == 0x0117120a
PlayingCourses = dword(0x2b6df0) == 0x00f0289a
PlayingAnything = PlayingSongs || PlayingCourses
PlayingNonstop = dword(0x2b6df0) == 0x00ffd48a
AnyCourse = (PlayingCourses || PlayingNonstop)

// Sanity check to be sure we're in the right song at the right time.
VerifySongId = byte(0x58e6d4)

// The player pointer to get to the active player (non versus mode)
PlayerOffset = 0x542cc

// Which menu option was chosen?
MenuOption = low4(0x639c18)
MenuMission = MenuOption == 0x02
MenuLesson = MenuOption == 0x04

// Which player ENTERED Game Mode?
EnteredPlayer = low4(0x63b7cd)
PlayerEntered = EnteredPlayer < 3 && bitcount(0x63b7cd) == 1

// Which style will be rendered in-game?
PlayerStyleCombo = low4(0x5e2a36)

Single = PlayerEntered && PlayerStyleCombo <= 1
Versus = PlayerEntered && PlayerStyleCombo == 5
Double = PlayerEntered && bit1(0x5e2a36) == 1

SingleOffset = bit0(0x5e2a36) * PlayerOffset
DoubleOffset = bit0(0x5e2a36) * 0xfffabd34
ActiveOffset = EnteredPlayer * PlayerOffset

// Do we only have one player on Single right now?
SinglePlayerOnly = EnteredPlayer - PlayerStyleCombo == 1

// This assumes SinglePlayerOnly is true.
ActivePlayerOffset = PlayerStyleCombo * PlayerOffset

ActiveModOffset = PlayerStyleCombo * 4
DoubleModOffset = bit0(0x5e2a36) * 0xfffffffc

// Is Little On for the workout?



// Is Little On for the player?
P1Little = byte(0x269ff4) == 1
P2Little = byte(0x269ff4 + 4) == 1
PALittle = byte(0x269ff4 + ActiveModOffset) == 1

// Is Freeze Off for the player?
P1Freeze = byte(0x26a0f4) == 0
P2Freeze = byte(0x26a0f4 + 4) == 0
PAFreeze = byte(0x26a0f4 + ActiveModOffset) == 0

RemovedSteps = PALittle || PAFreeze

// What difficulty on the music wheel?
PASelectMusicDiff = low4(0x58a390 + PlayerStyleCombo)


// What Nonstop difficulty are we using?
// Both players share this, so no need for an offset.
NonstopDifficulty = low4(0x58a394)

// Mini player state during gameplay.
// Surprisingly holds regardless of player?
PAState = byte(0x58e6b0)

// Dance Gauge (Health)
PADanceGauge = word(0x53a42e + ActiveOffset)

// Marvelous Counts (If not in a course mode, treat as a Perfect)
PAMarvelous = word(0x53a4e4 + ActiveOffset)

// Perfect Count (If not in a course mode, add Marvelous to this secretly)
PAPerfect = word(0x53a4e8 + ActiveOffset)

// Great Count
PAGreat = word(0x53a4ec + ActiveOffset)

// Good Count
PAGood = word(0x53a4f0 + ActiveOffset)

// Almost Count
PAAlmost = word(0x53a4f4 + ActiveOffset)

// Boo Count
PABoo = word(0x53a4f8 + ActiveOffset)

// All Step Judgments (should equal the sum of the above six)
PATotalSteps = word(0x53a500 + ActiveOffset)
PATotalCourseSteps = word(0x53a574 + ActiveOffset)

// Freeze OK Count
PAOK = word(0x53a504 + ActiveOffset)

// Freeze NG (No Good) Count
PANG = word(0x53a508 + ActiveOffset)

// Freezes just...skipped entirely. Usually never displayed.
PANF = word(0x53a50c + ActiveOffset)

// All Freeze Judgments (should equal to the sum of the above three)
PATotalHolds = word(0x53a510 + ActiveOffset)
PATotalCourseHolds = word(0x53a584 + ActiveOffset)

// Scores
PAScoreEvaluation = dword(0x53a544 + ActiveOffset)

// Max Combo Earned
PAMaxCombo = word(0x53a54c + ActiveOffset)

// Difficulty of the chart (once finally in-game)
PAGameDiff = low4(0x53a49c + ActiveOffset)

// Difficulty of the course
PACourseDiff = low4(0x53a40c + ActiveOffset)

// How many lives left when using the battery gauge?
PABattery = byte(0x53a430 + ActiveOffset)
OniAlive = PABattery <= 3
OniStart = once(
    prev(PABattery) == 0 && PABattery == 3 &&
    prev(SongId) == SongId
)

// Did the player fail?
PAFailed = low4(0x53a3f4 + ActiveOffset)

// What Mission ID are we thinking about?
// This value goes from 0-49 internally.
MissionId = byte(0xdbb624)

// What set of missions are we on?
// Multiply by 50 to get the actual mission number.
MissionDifficulty = low4(0xdbb628)

GameDiffLookup = {
    1: "Light",
    2: "Standard",
    3: "Heavy",
    6: "Challenge",
    7: "Beginner",
}

NonstopDiffLookup = {
    0: "Normal",
    1: "Difficult"
}

SongTitleLookup = {
    1: ".59",
    2: "321STARS",
    3: "A",
    4: "A Stupid Barber",
    5: "ABSOLUTE",
    6: "B4U",
    7: "B4U (B4 ZA BEAT MIX)",
    8: "Bad Routine",
    9: "Believe",
    10: "BIZARRE LOVE TRIANGLE",
    11: "CAN'T STOP FALLIN' IN LOVE (SPEED MIX)",
    12: "Diving",
    13: "DO ME (H.I.G.E.O Mix)",
    14: "DON'T CLOCK ME",
    15: "DROP OUT",
    16: "DROP OUT (FROM NONSTOP MEGAMIX)",
    17: "DROP THE BOMB",
    18: "ECSTASY",
    19: "ECSTASY (midnight blue mix)",
    20: "Firefly",
    21: "Frozen Ray (for EXTREME)",
    22: "Funk Boogie",
    23: "Go West",
    24: "HIGHER",
    25: "HIGHER (next morning mix)",
    26: "HIGHS OFF U (Scorccio XY Mix)",
    27: "i feel ...",
    28: "I'M FOR REAL",
    29: "JANEJANA",
    30: "JET WORLD",
    31: "KEEP ON MOVIN'",
    32: "KICK THE CAN",
    33: "Kids In America",
    34: "La Senorita",
    35: "LADIES' NIGHT",
    36: "Like A Virgin",
    37: "LOVE LOVE SUGAR",
    38: "MAKE IT BETTER",
    39: "MAXIMIZER",
    40: "MEMORIES",
    41: "MIRACLE",
    42: "MOBO★MOGA",
    43: "Move Your Feet",
    44: "Music (Bostik Radio Edit)",
    45: "NEVER ENDING STORY (Power Club Vocal Mix)",
    46: "ON THE JAZZ",
    47: "ONLY YOU",
    48: "PARANOiA ETERNAL",
    49: "PARANOiA MAX (DIRTY MIX)",
    50: "PEACE-OUT",
    51: "Pink Rose",
    52: "Planet Rock (Swordfish Radio Edit)",
    53: "Scorching Moon",
    54: "Simply Being Loved \"Somnambulist\"",
    55: "SO IN LOVE",
    56: "The legend of MAX",
    57: "THE REFLEX",
    58: "THEME FROM ENTER THE DRAGON (notorious mix)",
    59: "THERE YOU'LL BE",
    60: "TRIP MACHINE",
    61: "TRIP MACHINE survivor",
    62: "TSUGARU",
    63: "TSUGARU (APPLE MIX)",
    64: "V (for EXTREME)",
    65: "WAITING FOR TONIGHT",
    66: "WILD RUSH",
    67: "WILD RUSH (FROM NONSTOP MEGAMIX)",
    68: "WONDERLAND (UKS MIX)",
    69: "Y.M.C.A.",
    70: "You're Not Here",
    71: "Your Rain (RAGE MIX)",
    72: "Completely Random",
    195: "Some Edit Data",
    196: "A Challenge Course",
    197: "A Nonstop Course",
    199: "Completely Random (via Roulette)"
}

ChallengeOnlySongs = [7, 16, 19, 25, 63, 67]
ChallengePlusSongs = [3, 7, 16, 19, 25, 63, 64, 67]


// Song data: required for mod verification.
// Capture beginner chart data just in case.
ChartData = {
    1: [90, 0, 157, 0, 234, 0, 275, 0, 0, 0, 173, 0, 226, 0, 281, 0, 0, 0],
    2: [95, 0, 146, 5, 239, 15, 308, 7, 0, 0, 147, 5, 241, 7, 307, 7, 0, 0],
    3: [104, 0, 147, 7, 241, 2, 329, 3, 326, 3, 146, 2, 214, 2, 318, 3, 324, 3],
    4: [108, 0, 152, 16, 215, 14, 271, 25, 0, 0, 126, 3, 225, 9, 271, 6, 0, 0],
    5: [123, 0, 142, 0, 252, 0, 311, 0, 0, 0, 135, 0, 215, 0, 303, 0, 0, 0],
    6: [104, 0, 188, 0, 238, 0, 325, 0, 0, 0, 191, 0, 225, 0, 301, 0, 0, 0],
    7: [0, 0, 0, 0, 0, 0, 0, 0, 243, 8, 0, 0, 0, 0, 0, 0, 226, 8],
    8: [103, 0, 127, 4, 189, 7, 207, 30, 0, 0, 117, 7, 187, 4, 226, 12, 0, 0],
    9: [104, 0, 128, 20, 214, 11, 277, 20, 0, 0, 157, 12, 237, 6, 270, 9, 0, 0],
    10: [98, 0, 130, 12, 198, 10, 263, 17, 0, 0, 121, 8, 211, 25, 258, 17, 0, 0],
    11: [133, 0, 238, 0, 321, 0, 443, 0, 0, 0, 241, 0, 323, 0, 432, 0, 0, 0],
    12: [92, 0, 113, 13, 168, 34, 204, 43, 0, 0, 89, 11, 137, 29, 169, 20, 0, 0],
    13: [90, 0, 164, 0, 244, 0, 346, 0, 0, 0, 165, 0, 225, 0, 314, 0, 0, 0],
    14: [96, 0, 110, 0, 149, 0, 206, 0, 0, 0, 87, 0, 160, 0, 219, 1, 0, 0],
    15: [110, 0, 200, 0, 296, 0, 397, 0, 0, 0, 175, 0, 296, 0, 378, 0, 0, 0],
    16: [0, 0, 0, 0, 0, 0, 0, 0, 281, 4, 0, 0, 0, 0, 0, 0, 277, 4],
    17: [122, 0, 199, 0, 238, 0, 304, 0, 0, 0, 199, 0, 237, 0, 299, 0, 0, 0],
    18: [119, 0, 169, 0, 235, 0, 276, 0, 0, 0, 183, 0, 235, 0, 296, 0, 0, 0],
    19: [0, 0, 0, 0, 0, 0, 0, 0, 262, 6, 0, 0, 0, 0, 0, 0, 229, 16],
    20: [102, 0, 98, 9, 227, 43, 301, 38, 0, 0, 75, 12, 197, 33, 359, 25, 0, 0],
    21: [124, 0, 171, 8, 277, 5, 395, 3, 0, 0, 140, 8, 264, 4, 356, 1, 0, 0],
    22: [94, 0, 126, 25, 123, 16, 219, 26, 0, 0, 108, 5, 185, 6, 215, 9, 0, 0],
    23: [82, 0, 129, 8, 177, 6, 211, 13, 0, 0, 102, 16, 162, 14, 207, 36, 0, 0],
    24: [106, 0, 140, 0, 214, 0, 246, 0, 0, 0, 159, 0, 230, 0, 279, 0, 0, 0],
    25: [0, 0, 0, 0, 0, 0, 0, 0, 284, 3, 0, 0, 0, 0, 0, 0, 270, 6],
    26: [49, 0, 74, 2, 169, 26, 316, 2, 0, 0, 108, 1, 189, 25, 323, 0, 0, 0],
    27: [92, 0, 132, 4, 202, 30, 331, 2, 0, 0, 84, 20, 196, 6, 329, 3, 0, 0],
    28: [91, 0, 153, 0, 202, 47, 238, 40, 0, 0, 121, 0, 183, 11, 204, 16, 0, 0],
    29: [77, 0, 157, 0, 178, 0, 303, 0, 0, 0, 161, 0, 173, 0, 305, 0, 0, 0],
    30: [119, 0, 164, 10, 229, 4, 325, 11, 0, 0, 153, 10, 226, 5, 287, 9, 0, 0],
    31: [51, 0, 110, 0, 140, 0, 183, 0, 0, 0, 113, 0, 162, 0, 164, 0, 0, 0],
    32: [130, 0, 115, 0, 246, 0, 313, 0, 0, 0, 128, 0, 189, 0, 313, 0, 0, 0],
    33: [104, 0, 168, 13, 246, 33, 325, 22, 0, 0, 145, 2, 249, 17, 300, 11, 0, 0],
    34: [125, 0, 241, 0, 255, 0, 294, 0, 0, 0, 181, 0, 293, 0, 420, 0, 0, 0],
    35: [94, 0, 141, 1, 186, 15, 292, 15, 0, 0, 118, 5, 203, 21, 280, 9, 0, 0],
    36: [102, 0, 123, 2, 190, 14, 326, 3, 0, 0, 123, 8, 169, 9, 270, 13, 0, 0],
    37: [100, 0, 131, 0, 184, 9, 249, 1, 0, 0, 134, 0, 186, 3, 232, 1, 0, 0],
    38: [67, 0, 143, 0, 168, 0, 212, 0, 0, 0, 130, 0, 180, 0, 220, 0, 0, 0],
    39: [148, 0, 201, 29, 264, 16, 360, 9, 0, 0, 192, 4, 279, 0, 331, 14, 0, 0],
    40: [93, 0, 126, 0, 232, 0, 308, 0, 0, 0, 119, 0, 211, 0, 288, 0, 0, 0],
    41: [62, 0, 74, 2, 154, 6, 212, 12, 0, 0, 90, 1, 167, 9, 276, 5, 0, 0],
    42: [75, 0, 107, 3, 190, 9, 233, 16, 0, 0, 107, 3, 190, 9, 233, 16, 0, 0],
    43: [68, 0, 120, 8, 155, 4, 231, 12, 0, 0, 114, 0, 156, 0, 210, 0, 0, 0],
    44: [99, 0, 160, 28, 227, 29, 331, 19, 0, 0, 106, 5, 188, 10, 278, 4, 0, 0],
    45: [101, 0, 173, 0, 222, 0, 304, 0, 0, 0, 149, 0, 224, 0, 293, 0, 0, 0],
    46: [57, 0, 108, 0, 220, 0, 331, 0, 0, 0, 121, 0, 220, 0, 329, 0, 0, 0],
    47: [66, 0, 94, 0, 110, 0, 207, 0, 0, 0, 100, 0, 150, 0, 210, 0, 0, 0],
    48: [115, 0, 237, 0, 300, 2, 381, 5, 0, 0, 261, 0, 309, 8, 373, 8, 0, 0],
    49: [142, 0, 268, 0, 288, 0, 340, 0, 0, 0, 274, 0, 311, 0, 363, 0, 0, 0],
    50: [57, 0, 57, 4, 115, 8, 170, 27, 0, 0, 79, 17, 107, 7, 164, 11, 0, 0],
    51: [84, 0, 123, 5, 194, 8, 243, 25, 0, 0, 123, 2, 185, 13, 233, 15, 0, 0],
    52: [94, 0, 125, 15, 191, 29, 247, 30, 0, 0, 98, 16, 162, 22, 222, 29, 0, 0],
    53: [93, 0, 163, 8, 202, 8, 239, 12, 0, 0, 154, 8, 204, 8, 282, 14, 0, 0],
    54: [97, 0, 126, 25, 212, 39, 270, 59, 0, 0, 107, 17, 188, 63, 220, 57, 0, 0],
    55: [66, 0, 102, 27, 147, 33, 191, 26, 0, 0, 86, 7, 139, 14, 186, 24, 0, 0],
    56: [174, 0, 255, 3, 357, 29, 500, 3, 0, 0, 242, 3, 366, 3, 484, 3, 0, 0],
    57: [97, 0, 92, 9, 196, 2, 292, 12, 0, 0, 112, 3, 176, 12, 267, 8, 0, 0],
    58: [71, 0, 122, 0, 249, 0, 332, 0, 0, 0, 140, 0, 237, 0, 324, 0, 0, 0],
    59: [93, 0, 146, 10, 227, 14, 327, 15, 0, 0, 104, 0, 187, 15, 294, 8, 0, 0],
    60: [106, 0, 191, 0, 211, 0, 230, 0, 0, 0, 201, 0, 215, 0, 264, 0, 0, 0],
    61: [121, 0, 184, 2, 289, 2, 347, 2, 0, 0, 174, 2, 296, 2, 347, 1, 0, 0],
    62: [92, 0, 107, 18, 232, 8, 366, 8, 0, 0, 158, 4, 236, 5, 360, 3, 0, 0],
    63: [0, 0, 0, 0, 0, 0, 0, 0, 353, 6, 0, 0, 0, 0, 286, 6],
    64: [123, 0, 153, 12, 265, 16, 365, 12, 448, 4, 156, 10, 237, 14, 331, 4, 425, 4],
    65: [83, 0, 131, 8, 185, 10, 294, 17, 0, 0, 134, 1, 210, 6, 274, 27, 0, 0],
    66: [112, 0, 153, 0, 192, 0, 247, 0, 0, 0, 184, 0, 240, 0, 242, 0, 0, 0],
    67: [0, 0, 0, 0, 0, 0, 0, 0, 207, 15, 0, 0, 0, 0, 0, 0, 229, 18],
    68: [88, 0, 168, 0, 184, 0, 267, 0, 0, 0, 180, 0, 203, 0, 231, 0, 0, 0],
    69: [89, 0, 149, 0, 222, 0, 260, 8, 108, 2, 188, 8, 252, 22, 0, 0],
    70: [119, 0, 169, 9, 246, 16, 331, 28, 0, 0, 163, 7, 213, 4, 329, 11, 0, 0],
    71: [50, 0, 85, 8, 140, 8, 202, 8, 0, 0, 84, 1, 147, 7, 204, 0, 0, 0],
}



// Cheevos

MemoriesUnlockByte = low4(0x298710)

// Stupid Memories Unlock Cheevo
achievement(
    title = "Having Memories My Way, Burger King",
    points = 3,
    description = "On the Main Menu, enter the P2 cheat code (see the comment).",
    trigger = OnMenus && UnlockedMemories &&
        prev(MemoriesUnlockByte) == 0x0f && MemoriesUnlockByte == 0x00
)

SongUnlockCheevoTitle = {
    5: "Another Scorcher! Cool.",
    10: "Wish This Involved Vacations",
    20: "But The Combo Doesn't Match Anymore",
    25: "No Stopping Here",
    35: "Then Am I Here?",
    40: "How Exactly?",
    45: "Should You Choose To Accept It",
    50: "How Does One Start To Begin With?",
    55: "After Me",
    65: "After Me Except Faster",
    70: "Give That Saxaphone Player A Raise",
    80: "Break It Down",
    85: "Great Song, Confusing Lyrics",
    95: "I'm A Survivor",
    100: "Not Relative",
    110: "Aren't Most Of Us Night People?",
    115: "Ole!",
    125: "Doctors Are Kept Away",
    130: "Not Exactly Good Clean Fun",
    140: "The Overly Long Cheevo Inscription For The Song Titled With Just",
    145: "Ironically, This Version Is Calmer",
    155: "Dancing Involves Moving",
    160: "That Is Some Word Choice",
    170: "A Classic In Multiple Senses",
    175: "Stay In School",
    185: "Is This A Max Song?",
    190: "Now HERE Is A Max Song",
    200: "This Is The Game That Never Ends..."
}

SongUnlockCheevoReward = {
    5: "Scorching Moon",
    10: "TRIP MACHINE",
    20: "321STARS",
    25: "KEEP ON MOVIN'",
    35: "You're Not Here",
    40: "MAKE IT BETTER",
    45: "The Mission Mode",
    50: "CAN'T STOP FALLIN' IN LOVE (SPEED MIX)",
    55: "B4U",
    65: "B4U (B4 ZA BEAT MIX)",
    70: "ON THE JAZZ",
    80: "Funk Boogie",
    85: "DROP THE BOMB",
    95: "TRIP MACHINE survivor",
    100: "ABSOLUTE",
    110: "HIGHER (next morning mix)",
    115: "La Senorita",
    125: "TSUGARU (APPLE MIX)",
    130: "PARANOiA MAX (DIRTY MIX)",
    140: "A",
    145: "WILD RUSH (FROM NONSTOP MEGAMIX)",
    155: "Frozen Ray (for EXTREME)",
    160: "ECSTASY (midnight blue mix)",
    170: "V (for EXTREME)",
    175: "DROP OUT (FROM NONSTOP MEGAMIX)",
    185: "MAXMIZER",
    190: "The legend of MAX",
    200: "The Endless Mode"
}

PostMissionUnlockSwitch = false

PostMissionEasyUnlockCheck = MenuMission &&
    dword(UnlockedThingBase) == 0xffffffff &&
    prev(dword(UnlockedThingBase + 4)) != 0xffffffff &&
    dword(UnlockedThingBase + 4) == 0xffffffff

EasyMissionSongUnlock = {
    5: false,
    10: false,
    20: false,
    25: false,
    35: false,
    40: false,
    45: false,
    50: PostMissionEasyUnlockCheck,
    55: PostMissionEasyUnlockCheck,
    65: PostMissionEasyUnlockCheck,
    70: PostMissionEasyUnlockCheck,
    80: PostMissionEasyUnlockCheck,
    85: PostMissionEasyUnlockCheck,
    95: PostMissionEasyUnlockCheck,
    100: PostMissionEasyUnlockCheck,
    110: PostMissionEasyUnlockCheck,
    115: PostMissionEasyUnlockCheck,
    125: PostMissionEasyUnlockCheck,
    130: PostMissionEasyUnlockCheck,
    140: PostMissionEasyUnlockCheck,
    145: PostMissionEasyUnlockCheck,
    155: PostMissionEasyUnlockCheck,
    160: PostMissionEasyUnlockCheck,
    170: PostMissionEasyUnlockCheck,
    175: PostMissionEasyUnlockCheck,
    185: PostMissionEasyUnlockCheck,
    190: PostMissionEasyUnlockCheck,
    200: PostMissionEasyUnlockCheck
}

function ValidStepData(songId, singleLight, singleStandard, singleHeavy, singleOni) {
    stepData = ChartData[songId]
    verify = false
    lightStepTotal = stepData[2]
    lightHoldTotal = stepData[3]
    standardStepTotal = stepData[4]
    standardHoldTotal = stepData[5]
    heavyStepTotal = stepData[6]
    heavyHoldTotal = stepData[7]
    oniStepTotal = stepData[8]
    oniHoldTotal = stepData[9]
    
    if (singleLight == true && lightStepTotal > 0) {
        light = PAGameDiff == 1 && PATotalSteps == lightStepTotal
        if (lightHoldTotal > 0) {
            light = light && PATotalHolds == lightHoldTotal
        }
        verify = verify || light
    }
    if (singleStandard == true && standardStepTotal > 0) {
        standard = PAGameDiff == 2 && PATotalSteps == standardStepTotal
        if (standardHoldTotal > 0) {
            standard = standard && PATotalHolds == standardHoldTotal
        }
        verify = verify || standard
    }
    if (singleHeavy == true && heavyStepTotal > 0) {
        heavy = PAGameDiff == 3 && PATotalSteps == heavyStepTotal
        if (heavyHoldTotal > 0) {
            heavy = heavy && PATotalHolds == heavyHoldTotal
        }
        verify = verify || heavy
    }
    
    if (singleOni == true && oniStepTotal > 0) {
        oni = PAGameDiff == 6 && PATotalSteps == oniStepTotal
        if (oniHoldTotal > 0) {
            oni = oni && PATotalHolds == oniHoldTotal
        }
        verify = (verify || oni)
    }
    return verify
}

function SingleHeavySongCheevoTrigger(songId) {
    always = GameMode && Single && !AnyCourse &&
        VerifySongId == songId && SongId == songId &&
        PADanceGauge > 0 && PAState == 6
    
    return always && ValidStepData(songId, false, false, true, true)
}

function HeavySongCheevoTrigger(songId) {
    return SingleHeavySongCheevoTrigger(songId)
}

HardMissionSongUnlock = {
    5: false,
    10: false,
    20: false,
    25: false,
    35: false,
    40: false,
    45: false,
    50: HeavySongCheevoTrigger(11),
    55: HeavySongCheevoTrigger(6),
    65: HeavySongCheevoTrigger(7),
    70: HeavySongCheevoTrigger(46),
    80: HeavySongCheevoTrigger(22),
    85: HeavySongCheevoTrigger(17),
    95: HeavySongCheevoTrigger(61),
    100: HeavySongCheevoTrigger(5),
    110: HeavySongCheevoTrigger(25),
    115: HeavySongCheevoTrigger(34),
    125: HeavySongCheevoTrigger(63),
    130: HeavySongCheevoTrigger(49),
    140: HeavySongCheevoTrigger(3),
    145: HeavySongCheevoTrigger(67),
    155: HeavySongCheevoTrigger(21),
    160: HeavySongCheevoTrigger(19),
    170: HeavySongCheevoTrigger(64),
    175: HeavySongCheevoTrigger(16),
    185: HeavySongCheevoTrigger(39),
    190: HeavySongCheevoTrigger(56),
    200: PostMissionEasyUnlockCheck // Endless is a strange case.
}

for lockCount in range(5, 200, 5) {
    if (lockCount == 45 || lockCount % 15 != 0) {
        byteOffset = (lockCount - 5) / 40
        bitOffset = (lockCount - 5) % 40
        playingStuff = PlayingSongs
        if (lockCount == 35 || lockCount == 145) {
            playingStuff = PlayingAnything
        }
        unlockBit = false
        tBit = bit7
        if (bitOffset == 0) {
            tBit = bit0
        }
        else if (bitOffset == 5) {
            tBit = bit1
        }
        else if (bitOffset == 10) {
            tBit = bit2
        }
        else if (bitOffset == 15) {
            tBit = bit3
        }
        else if (bitOffset == 20) {
            tBit = bit4
        }
        else if (bitOffset == 25) {
            tBit = bit5
        }
        else if (bitOffset == 30) {
            tBit = bit6
        }
        unlockBit = prev(tBit(UnlockedThingBase + byteOffset)) == 0 &&
            tBit(UnlockedThingBase + byteOffset) == 1
        
        backupPlan = HardMissionSongUnlock[lockCount]
        if (PostMissionUnlockSwitch == true) {
            backupPlan = EasyMissionSongUnlock[lockCount]
        }
        
        achievement(
            points = 4,
            title = SongUnlockCheevoTitle[lockCount],
            description = format(
                "Unlock [{0}] for future plays.",
                SongUnlockCheevoReward[lockCount]
            ),
            trigger = (GameMode && unlockBit && playingStuff) ||
                (AllMissionsBeaten && backupPlan)
        )
    }
}

CourseTitleLookup = {
    0x01: "Light & Beginners",
    0x02: "Everybody's Favorites",
    0x03: "AKIRA premium",
    0x04: "NEW ARRIVAL",
    0x05: "Slow-Mix",
    0x06: "ANGEL's",
    0x07: "FINE CHOICE",
    0x08: "THE FREEZER",
    0x09: "REVERSE",
    0x0a: "COOL 7",
    0x0b: "7 feet",
    0x0c: "Speed Star",
    0x0d: "DARKNESS",
    0x0e: "TRICK",
    0x0f: "RANDOM",
    0x10: "ONI DO",
    0x11: "The Way of LEGEND",
    0x12: "Order 1",
    0x13: "Order 2",
    0x14: "Order 3",
    // Nonstop is here.
    0x15: "Everybody's Favorites",
    0x16: "New Arrival",
    0x17: "Pop'n Pops",
    0x18: "In the HOUSE",
    0x19: "Trance Formation",
    0x1a: "SOUL BOOGIE",
    0x1b: "HAPPY HARDCORE",
    0x1c: "GLOBETROTTING",
    0x1d: "Original Tracks",
    0x1e: "DJ Battle",
    0x1f: "TEMPO CHANGER",
    0x20: "Japanese pops",
    0x21: "Very COMPETITIVE",
    0x22: "Player's Best",
    0x23: "Player's Worst",
    0x24: "Random",
    0x25: "Order 1",
    0x26: "Order 2",
    0x27: "Order 3"
}

NonstopCheevoNumbers = [0x15, 0x16, 0x17, 0x18, 0x19, 0x1a,
    0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 0x20, 0x21]

CourseKindLookup = {
    0x01: "Challenge",
    0x02: "Challenge",
    0x03: "Challenge",
    0x04: "Challenge",
    0x05: "Challenge",
    0x06: "Challenge",
    0x07: "Challenge",
    0x08: "Challenge",
    0x09: "Challenge",
    0x0a: "Challenge",
    0x0b: "Challenge",
    0x0c: "Challenge",
    0x0d: "Challenge",
    0x0e: "Challenge",
    0x0f: "Challenge",
    0x10: "Challenge",
    0x11: "Challenge",
    0x12: "Challenge",
    0x13: "Challenge",
    0x14: "Challenge",
    // Nonstop is here.
    0x15: "Nonstop",
    0x16: "Nonstop",
    0x17: "Nonstop",
    0x18: "Nonstop",
    0x19: "Nonstop",
    0x1a: "Nonstop",
    0x1b: "Nonstop",
    0x1c: "Nonstop",
    0x1d: "Nonstop",
    0x1e: "Nonstop",
    0x1f: "Nonstop",
    0x20: "Nonstop",
    0x21: "Nonstop",
    0x22: "Nonstop",
    0x23: "Nonstop",
    0x24: "Nonstop",
    0x25: "Nonstop",
    0x26: "Nonstop",
    0x27: "Nonstop"
}

NonstopTitleUnlock = {
    0: "No Need To Be Outside",
    1: "So Deep",
    2: "Funky Fresh Beats",
    3: "...For Some Definition",
    4: "Around The World In 80 Arrows",
    5: "Creativity Is Hard",
    6: "Not Included: One Turntable",
    7: "Consistency? Not Here!",
    8: "Hiragana, Katakana, or Kanji?",
    9: "Serious Mode Engage!"
}

ChallengeSongsLength = {
    1: 3,
    2: 4,
    3: 3,
    4: 4,
    5: 6,
    6: 5,
    7: 7,
    8: 6,
    9: 3,
    10: 7,
    11: 7,
    12: 7,
    13: 5,
    14: 4,
    15: 5,
    16: 12,
    17: 6
}

ChallengeSongsFirstThree = {
    0x01: [31, 24, 4],
    0x02: [68, 35, 54],
    0x03: [27, 71, 70],
    0x04: [53, 20, 30],
    0x05: [55, 69, 47],
    0x06: [36, 37, 33],
    0x07: [41, 57, 13],
    0x08: [26, 28, 20],
    0x09: [14, 64, 30],
    0x0a: [1, 50, 8],
    0x0b: [18, 29, 37],
    0x0c: [15, 48, 2],
    0x0d: [66, 62, 5],
    0x0e: [26, 60, 38],
    0x0f: [],
    0x10: [18, 19, 66],
    0x11: [49, 61, 48],
}

// This assumes Single.
NonstopSongs = {
    0x15: [[0x17, 2], [47, 2], [33, 2], [43, 2]],
    0x16: [[0x0a, 2], [65, 2], [32, 2], [13, 2]],
    0x17: [[0x45, 2], [9, 2], [36, 2], [57, 4]],
    0x18: [[0x1a, 2], [24, 2], [4, 2], [41, 4]],
    0x19: [[0x2c, 2], [59, 2], [52, 4], [12, 4]],
    0x1a: [[0x37, 2], [28, 2], [22, 4], [46, 4]],
    0x1b: [[0x30, 2], [66, 4], [60, 4], [15, 4]],
    0x1c: [[0x3a, 2], [29, 4], [42, 4], [34, 4]],
    0x1d: [[0x11, 4], [6, 4], [70, 4], [5, 4]],
    0x1e: [[0x02, 4], [50, 4], [8, 4], [21, 4]],
    0x1f: [[0x42, 4], [18, 4], [8, 4], [3, 6]],
    0x20: [[0x14, 4], [37, 4], [51, 4], [62, 4]],
    0x21: [[0x31, 4], [61, 4], [39, 4], [56, 4]],
}

function NonstopClearTrigger(courseId, diffId) {
    always = Single && GameMode && AnyCourse &&
        PACourseDiff == diffId &&
        PAFailed == 0 && PADanceGauge > 0 && PAState == 6 &&
        never(OnMenus) && never(SelectingMusic)

    courseData = NonstopSongs[courseId]
    stepCount = 0
    holdCount = 0
    for song in courseData {
        songId = song[0]
        index = song[1]
        if (diffId > 0) {
            index = index + 2
        }
        stepCount = stepCount + ChartData[songId][index]
        holdCount = holdCount + ChartData[songId][index + 1]
    }
    
    always = always &&
        once(prior(VerifySongId) == courseId && VerifySongId == courseData[0][0]) &&
        once(prev(VerifySongId) == courseData[0][0] && VerifySongId == courseData[1][0]) &&
        once(prev(VerifySongId) == courseData[1][0] && VerifySongId == courseData[2][0]) &&
        once(prev(VerifySongId) == courseData[2][0] && VerifySongId == courseData[3][0])

    return always && PATotalCourseSteps == stepCount && PATotalCourseHolds == holdCount
}

for ns in NonstopTitleUnlock {
    byteOffset = ns % 8
    tBit = bit0
    bitOffset = ns / 8
    if (bitOffset == 1) {
        tBit = bit1
    }
    else if (bitOffset == 2) {
        tBit = bit2
    }
    else if (bitOffset == 3) {
        tBit = bit3
    }
    else if (bitOffset == 4) {
        tBit = bit4
    }
    else if (bitOffset == 5) {
        tBit = bit5
    }
    else if (bitOffset == 6) {
        tBit = bit6
    }
    else if (bitOffset == 7) {
        tBit = bit7
    }
    
    coreUnlock = GameMode && PlayingCourses &&
        prev(tBit(UnlockedNonstopBase + byteOffset)) == 0 &&
        tBit(UnlockedNonstopBase + byteOffset) == 1 &&
        never(OnMenus)
        
    backupUnlock = PostMissionEasyUnlockCheck
    if (PostMissionUnlockSwitch == false) {
        backupUnlock = AllMissionsBeaten && NonstopClearTrigger(ns + 0x18, 1)
    }
    
    achievement(
        points = 10,
        title = NonstopTitleUnlock[ns],
        description = format(
            "Unlock the Nonstop course [{0}].",
            CourseTitleLookup[ns + 0x18]
        ),
        trigger = coreUnlock || backupUnlock
    )
}

// Challenge Mode Unlocking Cheevos

ChallengeTitleCheevo = {
    0x01: "This Isn't So Bad",
    0x02: "But Is It Mine?",
    0x03: "No Unleaded Options",
    0x04: "Maybe New In 2004",
    0x05: "Missing Bag",
    0x06: "No Devils Here",
    0x07: "Yeah, The Challenge Title Is Right",
    0x08: "No Fridges Necessary",
    0x09: "Looking Down",
    0x0a: "Cool Is Relative",
    0x0b: "Studiously Starting Seven Swell Songs So Sweet",
    0x0c: "Speed Mods? In MY Challenge Courses?",
    0x0d: "Where Is The Light Switch?",
    0x0e: "Mind Boggling",
    0x0f: "Do You Feel Lucky?",
    0x10: "Original Vs. Remix: Which Reigns Supreme?",
    0x11: "Legend! You Are A LEGEND!"
}

ChallengeTitleUnlock = {
    0: "The Newest Angels Are Not Slow",
    1: "Entering The Freezer In Reverse Is Fine",
    2: "Triple Sevens",
    3: "Silly Random Darkness Tricks",
    4: "How Do The Remixes Stack Up?",
    5: "This Mode Is DIFFICULT!"
}

ChallengeTitleNumber = {
    0: 1,
    1: 2,
    2: 3,
    3: 6,
    4: 10,
    5: 14
}

ChallengeTitleRewards = {
    0: "NEW ARRIVAL, Slow-Mix, & ANGEL's",
    1: "FINE CHOICE, THE FREEZER, & REVERSE",
    2: "COOL 7, 7 feet, & Speed Star",
    3: "DARKNESS, TRICK, RANDOM",
    4: "ONI DO",
    5: "The Way of LEGEND"
}

ChallengeTitleBits = {
    0: [0x2b051e, 28],
    1: [0x2b051e, 224],
    2: [0x2b051f, 7],
    3: [0x2b051f, 56],
    4: [0x2b051f, 64],
    5: [0x2b051f, 128]
}

ChallengeTitleIds = {
    0: [4, 5, 6],
    1: [7, 8, 9],
    2: [10, 11, 12],
    3: [13, 14, 15],
    4: [16],
    5: [17]
}

function ChallengeCourseTrigger(courseId) {
    target = word(0x2af180 + 32 + (40 * (courseId - 1)))
    return GameMode && SinglePlayerOnly &&
        once(OniStart && SongId == courseId) &&
        OniAlive && PAState == 6 && never(GameState == 0x01)
        && prev(target) + 1 == target
}

for index in ChallengeTitleUnlock {
    points = 10
    if (index >= 4) {
        points = 25
    }
    targetNumber = ChallengeTitleNumber[index]
    bits = ChallengeTitleBits[index]
    bitFlips = byte(bits[0]) -
        prev(byte(bits[0])) == bits[1]
    conditions = []
    priorConditions = []
    
    for num in range(0, 19, 1) {
        commonWord = word(0x2af180 + (num * 40) + 32)
        array_push(conditions, commonWord > 0)
        array_push(priorConditions, prev(commonWord) > 0)
    }
    
    plural = "courses"
    if (targetNumber == 1) {
        plural = "course"
    }
    
    coreUnlock = PlayingCourses && bitFlips && never(OnMenus)
    backupUnlock = PostMissionEasyUnlockCheck
    if (PostMissionUnlockSwitch == false) {
        backupUnlock = AllMissionsBeaten &&
            any_of(ChallengeTitleIds[index], i => ChallengeCourseTrigger(i))
    }
    
    achievement(
        points = points,
        title = ChallengeTitleUnlock[index],
        description = format(
            "Complete {0} unique Challenge {1} & thus unlock {2}.",
            targetNumber,
            plural,
            ChallengeTitleRewards[index]
        ),
        trigger = coreUnlock || backupUnlock
    )
}

// Extra Stage Cheevos

achievement(
    points = 10,
    title = "Sound The Alarm! Why Is There An Alarm?",
    description = "Unlock the opportunity to try an Extra Stage.",
    trigger = GameMode && (Single || Double) && !AnyCourse &&
        NotDoneWithStages && SongEvaluationScreen &&
        CurrentStageBB == MaxStages + 1
)

achievement(
    points = 25,
    title = "Survivor of Extra Stage [m]",
    description = "Pass TRIP MACHINE survivor under Extra Stage conditions.",
    trigger = GameMode && (Single || Double) && !AnyCourse && 
        CurrentStageAB > MaxStages &&
                VerifySongId == 61 && SongId == 61 && PAGameDiff == 3 &&
                PADanceGauge > 0 && PassedSongOrCourse
)

achievement(
    points = 50,
    title = "Legend of Extra Stage",
    description = "Pass The legend of MAX under Extra Stage conditions.",
    trigger = GameMode && (Single || Double) && !AnyCourse &&
        CurrentStageAB > MaxStages &&
                VerifySongId == 56 && SongId == 56 && PAGameDiff == 3 &&
                PADanceGauge > 0 && PassedSongOrCourse
)

// Song Scoring Cheevos

function SingleSongClearCheevo(songId, songName) {
    points = 5
    if (songId == 56) {
        points = 10
    }
    
    achievement(
        points = points,
        title = songName + " Clear",
        description = format(
            "Pass {0} on any non-beginner difficulty.",
            songName
        ),
        trigger = GameMode && Single && !AnyCourse &&
            VerifySongId == songId && SongId == songId &&
            PADanceGauge > 0 && PAState == 6 &&
            ValidStepData(songId, true, true, true, true)
    )    
}

function SingleHeavySongCheevo(songId, songName) {
    targetDiff = "Heavy"
    if (any_of(ChallengeOnlySongs, s => s == songId)) {
        targetDiff = "Challenge"
    } else if (any_of(ChallengePlusSongs, s => s == songId)) {
        targetDiff = "Heavy/Challenge"
    }
    
    points = 10
    if (songId == 56) {
        points = 25
    }
    
    achievement(
        points = points,
        title = format(
            "{0} {1} Clear",
            songName,
            targetDiff
        ),
        description = format(
            "Pass {0} on {1} difficulty.",
            songName,
            targetDiff
        ),
        trigger = HeavySongCheevoTrigger(songId)
    )
}

function SingleFullComboCheevo(songId, songName) {
    points = 10
    if (songId == 56) {
        points = 25
    }
    achievement(
        points = points,
        title = songName + " Full Combo",
        description = "Get a Full Combo on " + songName + " on Standard or higher.",
        trigger = GameMode && Single && !AnyCourse &&
        VerifySongId == songId && SongId == songId &&
        once(PAState == 4 && prev(PAState) < 4) &&
        disable_when(PAGood > 0 || PAAlmost > 0 || PABoo > 0 || PANG > 0,
            until=SelectingMusic || OnMenus) &&
        trigger_when(ValidStepData(songId, false, true, true, true)) &&
        trigger_when(PAState == 6) &&
        never(SelectingMusic) &&
        never(OnMenus)
    )
}

for songId in range(1, 71) {
    songName = SongTitleLookup[songId]
    
    points = 5
    if (songId == 56) {
        points = 10
    }
    if (!any_of(ChallengeOnlySongs, s => s == songId)) {
        SingleSongClearCheevo(songId, songName)
    }
    
    SingleHeavySongCheevo(songId, songName)
    SingleFullComboCheevo(songId, songName)
}

// Nonstop Mode Courses

function NonstopClearCheevo(courseId, diffId) {
    points = 10
    if (courseId == 0x21 && diffId == 1) {
        points = 50
    } else if (courseId == 0x021) {
        points = 25
    } else if (diffId == 1) {
        points = 25
    }
    courseName = CourseTitleLookup[courseId]
    courseDiff = NonstopDiffLookup[diffId]
    achievement(
        title = format("{0} {1}", courseName, courseDiff),
        points = points,
        description = format("Clear the Nonstop Course {0} on {1}.", courseName, courseDiff),
        trigger = NonstopClearTrigger(courseId, diffId)
    )
}

for courseIndex in NonstopCheevoNumbers {
    NonstopClearCheevo(courseIndex, 0)
    NonstopClearCheevo(courseIndex, 1)
}

// Challenge Mode Courses

for index in ChallengeTitleCheevo {
    points = 10
    if (index >= 0x10) {
        points = 50
    }
    else if (index >= 7) {
        points = 25
    }
    target = word(0x2af180 + 32 + (40 * (index - 1)))
    achievement(
        title = ChallengeTitleCheevo[index],
        points = points,
        description = format("Complete the {0} challenge course.", CourseTitleLookup[index]),
        trigger = ChallengeCourseTrigger(index)
    )
}

// Mission Mode

MissionTitle = ["Tango", "Can-Can", "Capoeira", "Ballet"]
MissionPoints = [10, 25, 50, 100]
MissionSet = ["1st", "2nd", "3rd", "4th"]

for index in range(0, 3, 1) {
    sum = 0
    priorSum = 0
    
    for num in range(0, 24, 1) {
        commonByte = byte(MissionModeBase + (index * 12 * 25) + (num * MissionLengthPer))
        sum = sum + commonByte
        priorSum = priorSum + prev(commonByte)
    }

    id = (MissionDifficulty * 50) + MissionId
    
    boundary = always_true()
    low = index * 25
    if low > 0 {
        boundary = boundary && id >= low
    }
    high = (index + 1) * 25
    boundary = boundary && id < high

    achievement(
        title = MissionTitle[index],
        points = MissionPoints[index],
        description = format("Complete the {0} set of 25 missions.", MissionSet[index]),
        trigger = MenuMission &&
            priorSum < 75 && sum == 75 && measured(
            sum == 75,
            when = MenuMission && boundary//,
            //format = "percent"
        )
    )
}

// Leaderboards

// Song Leaderboards

function ScoreSongLeaderboard(songId, diffId) {
    songName = SongTitleLookup[songId]
    diffName = GameDiffLookup[diffId]
    reuseCondition = GameMode && SinglePlayerOnly && !AnyCourse &&
        PADanceGauge > 0 && PAGameDiff == diffId &&
        VerifySongId == songId && SongId == songId && PassedSongOrCourse && never(RemovedSteps)
    leaderboard(
        title = format("{0} {1} Machine Score", songName, diffName),
        description = format(
            "Get the highest machine score you can on {0} {1}.", songName, diffName
            ),
        start = reuseCondition,
        cancel = always_false(),
        submit = always_true(),
        value = PAScoreEvaluation,
        format = "SCORE"
    )
}

function ExSongLeaderboard(songId, diffId) {
    songName = SongTitleLookup[songId]
    diffName = GameDiffLookup[diffId]
    leaderboard(
        title = format("{0} {1} EX Score", songName, diffName),
        description = format("Get the highest EX score you can on {0} {1}.", songName, diffName),
        start = GameMode && SinglePlayerOnly && !AnyCourse &&
            VerifySongId == songId && SongId == songId &&
            PADanceGauge == 500 && PAGameDiff == diffId && InGameplayRedux && never(RemovedSteps),
        cancel = PADanceGauge == 0 ||
            (CurrentStageA == 0xffff && CurrentStageB == 0xffff),
        submit = PassedSongOrCourse,
        value = PAMarvelous * 2 + PAPerfect * 2 + PAOK * 2 + PAGreat,
        format = "VALUE"
    )
}

for songId in range(1, 71) {
    songName = SongTitleLookup[songId]
    if (any_of(ChallengeOnlySongs, s => s == songId)) {
        ScoreSongLeaderboard(songId, 6)
        ExSongLeaderboard(songId, 6)
    }
    else {
        for diffId in range(1, 3) {
            ScoreSongLeaderboard(songId, diffId)
            ExSongLeaderboard(songId, diffId)
        }
        if (any_of(ChallengePlusSongs, s => s == songId)) {
            ScoreSongLeaderboard(songId, 6)
            ExSongLeaderboard(songId, 6)
        }
    }
}

// Nonstop Leaderboards

function ScoreNonstopLeaderboard(courseId, diffId) {
    courseName = CourseTitleLookup[courseId]
    diffName = NonstopDiffLookup[diffId]
    cond = GameMode && SinglePlayerOnly && PlayingCourses &&
        SongId == courseId && PACourseDiff == diffId && InGameState == 9 && never(RemovedSteps)
    leaderboard(
        title = format("{0} {1} EX Score", courseName, diffName),
        description = format(
            "Get the highest machine score you can on the {0} {1} Nonstop Course.",
            courseName,
            diffName
        ),
        start = cond,
        cancel = PADanceGauge == 0 || PAFailed == 1 || OnMenus,
        submit = always_true(),
        value = PAScoreEvaluation,
        format = "SCORE"
    )
}

function ExNonstopLeaderboard(courseId, diffId) {
    courseName = CourseTitleLookup[courseId]
    diffName = NonstopDiffLookup[diffId]
    cond = GameMode && SinglePlayerOnly && PlayingCourses &&
        SongId == courseId && PACourseDiff == diffId && InGameState == 9 && never(RemovedSteps)
    leaderboard(
        title = format(
            "{0} {1} Nonstop Course EX Score",
            courseName,
            diffName
        ),
        description = format(
            "Get the highest EX score you can on the {0} {1} Nonstop Course.",
            courseName,
            diffName
        ),
        start = cond,
        cancel = PADanceGauge == 0 || PAFailed == 1 || OnMenus,
        submit = always_true(),
        value = PAMarvelous * 2 + PAPerfect * 2 + PAOK * 2 + PAGreat,
        format = "VALUE"
    )
}

for index in NonstopCheevoNumbers {
    ScoreNonstopLeaderboard(index, 0)
    ExNonstopLeaderboard(index, 0)
    ScoreNonstopLeaderboard(index, 1)
    ExNonstopLeaderboard(index, 1)
}

// Challenge Mode EX Score

function ExChallengeLeaderboard(courseId) {
    courseName = CourseTitleLookup[courseId]
    cond = GameMode && SinglePlayerOnly && PlayingCourses &&
        once(SongId == courseId && OniStart) && InGameState == 9 &&
        GameState == 6 &&
        never(GameState == 1)
    leaderboard(
        title = format("{0} Challenge Course EX Score", courseName),
        description = format("Get the highest EX score you can on the {0} Challenge Course.", courseName),
        start = cond,
        cancel = always_false(),
        submit = always_true(),
        value = PAScoreEvaluation,
        format = "VALUE"
    )
}

for index in ChallengeTitleCheevo {
    if index != 0x0f {
        ExChallengeLeaderboard(index)
    }
}

// Rich Presence

RpSongTraining = rich_presence_lookup("SongTraining", byte(0x58e6d4), SongTitleLookup, "Something")
RpSong = rich_presence_lookup("Song", SongId, SongTitleLookup, "Something")
RpCourse = rich_presence_lookup("Course", SongId, CourseTitleLookup, "Something")
RpCourseKind = rich_presence_lookup("Kind", SongId, CourseKindLookup)
RpCourseDiff = rich_presence_lookup("CourseDiff", PACourseDiff, NonstopDiffLookup)
RpSelectDiff = rich_presence_lookup("Difficulty", PASelectMusicDiff, GameDiffLookup)
RpGameDiff = rich_presence_lookup("Difficulty", PAGameDiff, GameDiffLookup)
RpMarvelous = rich_presence_macro("Number", PAMarvelous)
RpPerfect = rich_presence_macro("Number", PAPerfect)
RpSongPerfect = rich_presence_macro("Number", PAMarvelous + PAPerfect)
RpGreat = rich_presence_macro("Number", PAGreat)
RpGood = rich_presence_macro("Number", PAGood)
RpAlmost = rich_presence_macro("Number", PAAlmost)
RpBoo = rich_presence_macro("Number", PABoo)
RpOK = rich_presence_macro("Number", PAOK)
RpMaxCombo = rich_presence_macro("Number", PAMaxCombo)
RpScore = rich_presence_macro("Number", PAScoreEvaluation)
RpMissionId = rich_presence_macro("Number", (MissionDifficulty * 50) + MissionId + 1)
RpBattery = rich_presence_macro("Number", PABattery + 1)

rich_presence_conditional_display(
    PAState == 0x25,
    "Watching a demonstration of the game"
)

rich_presence_conditional_display(
    PAState == 0x24,
    "DANCE DANCE REVOLUTION! -- Extreme!"
)

rich_presence_conditional_display(
    PAState == 0x21,
    "Learning of other games that should have cheevos"
)

rich_presence_conditional_display(
    PAState == 0x26,
    "Learning how to play...without actually playing"
)

rich_presence_conditional_display(
    PAState == 0x33,
    "Setting up the dance session"
)

rich_presence_conditional_display(
    PAState == 0x32,
    "Viewing past records"
)

rich_presence_conditional_display(
    PAState == 0x31,
    "Creating the ideal step chart"
)

rich_presence_conditional_display(
    PAState == 0x3a,
    "Preparing for the dedicated workout"
)

rich_presence_conditional_display(
    PAState == 0x30,
    "Getting dedicated training on {0}",
    RpSongTraining
)

rich_presence_conditional_display(
    OnIntroLoop || OnMenus || GameState == 0x22,
    "Preparing to Dance"
)

rich_presence_conditional_display(
    PAState == 0x36 || MenuLesson,
    "Getting some lessons"
)

rich_presence_conditional_display(
    !OnMenus && MainMenuOption == 1,
    "Having a party?"
)

rich_presence_conditional_display(
    Versus,
    "Playing DDR with a friend"
)

rich_presence_conditional_display(
    Double,
    "Playing Doubles"
)

rich_presence_conditional_display(
    MenuMission && LoadingWheel,
    "About to Enter Mission Mode"
)

rich_presence_conditional_display(
    MenuMission && InGameState == 7 && MissionDifficulty == 0,
    "Reflecting On The 50 Normal Missions"
)

rich_presence_conditional_display(
    MenuMission && InGameState == 7 && MissionDifficulty == 1,
    "Reflecting On The 50 Hard Missions"
)

rich_presence_conditional_display(
    MenuMission && InGameState == 1 || InGameState == 0x0f,
    "Results Of Mission {0} - {2}/{3}/{4}/{5}/{6}/{7} Max Combo {1}",
    RpMissionId,
    RpMaxCombo,
    RpSongPerfect,
    RpGreat,
    RpGood,
    RpAlmost,
    RpBoo,
    RpOK
)

rich_presence_conditional_display(
    MenuMission && SelectingMission,
    "Thinking About Playing Mission {0} - {2}/{3}/{4}/{5}/{6}/{7} Max Combo {1}",
    RpMissionId,
    RpMaxCombo,
    RpSongPerfect,
    RpGreat,
    RpGood,
    RpAlmost,
    RpBoo,
    RpOK
)

rich_presence_conditional_display(
    MenuMission && InGameplayRedux,
    "Playing Mission {0} - {2}/{3}/{4}/{5}/{6}/{7} Max Combo {1}",
    RpMissionId,
    RpMaxCombo,
    RpSongPerfect,
    RpGreat,
    RpGood,
    RpAlmost,
    RpBoo,
    RpOK
)

rich_presence_conditional_display(
    SelectingStyle,
    "Select Your Style. And/or Your Character."
)

rich_presence_conditional_display(
    PlayingSongs && SinglePlayerOnly && SelectingOptions,
    "Customizing The Experience For {0}",
    RpSong
)

rich_presence_conditional_display(
    AnyCourse && SinglePlayerOnly && SelectingOptions && SongId >= 0x15,
    "Customizing The Experience For {0} ({1})",
    RpCourse,
    RpCourseKind
)

rich_presence_conditional_display(
    PlayingSongs && SinglePlayerOnly && EvaluationScreen,
    "Results Of {0} {1} - {2}/{3}/{4}/{5}/{6}/{7} Max Combo {8} Score {9}",
    RpSong,
    RpGameDiff,
    RpSongPerfect,
    RpGreat,
    RpGood,
    RpAlmost,
    RpBoo,
    RpOK,
    RpMaxCombo,
    RpScore
)

rich_presence_conditional_display(
    AnyCourse && SinglePlayerOnly && EvaluationScreen && SongId >= 0x15,
    "Results Of {0} {1} - {8}/{2}/{3}/{4}/{5}/{6}/{7} Max Combo {9} Score {10}",
    RpCourse,
    RpCourseDiff,
    RpPerfect,
    RpGreat,
    RpGood,
    RpAlmost,
    RpBoo,
    RpOK,
    RpMarvelous,
    RpMaxCombo,
    RpScore
)

rich_presence_conditional_display(
    AnyCourse && SinglePlayerOnly && EvaluationScreen,
    "Results Of {0} ({1}) - {8}/{2}/{3}/{4}/{5}/{6}/{7} Max Combo {9} Score {10}",
    RpCourse,
    RpCourseKind,
    RpPerfect,
    RpGreat,
    RpGood,
    RpAlmost,
    RpBoo,
    RpOK,
    RpMarvelous,
    RpMaxCombo,
    RpScore
)

rich_presence_conditional_display(
    PlayingSongs && SinglePlayerOnly && Passed && SongId == VerifySongId,
    "Playing {0} {1} - {2}/{3}/{4}/{5}/{6}/{7}",
    RpSong,
    RpGameDiff,
    RpSongPerfect,
    RpGreat,
    RpGood,
    RpAlmost,
    RpBoo,
    RpOK
)

rich_presence_conditional_display(
    PlayingSongs && SinglePlayerOnly && InGameplayRedux && SongId == VerifySongId,
    "Playing {0} {1} - {2}/{3}/{4}/{5}/{6}/{7}",
    RpSong,
    RpGameDiff,
    RpSongPerfect,
    RpGreat,
    RpGood,
    RpAlmost,
    RpBoo,
    RpOK
)

rich_presence_conditional_display(
    AnyCourse && SinglePlayerOnly && PAFailed == 1 && SongId >= 0x15,
    "Failed on {0} {1} - {8}/{2}/{3}/{4}/{5}/{6}/{7}",
    RpCourse,
    RpCourseDiff,
    RpPerfect,
    RpGreat,
    RpGood,
    RpAlmost,
    RpBoo,
    RpOK,
    RpMarvelous
)

rich_presence_conditional_display(
    AnyCourse && SinglePlayerOnly && PAFailed == 1 && SongId < 0x15,
    "Failed on {0} ({1}) - {8}/{2}/{3}/{4}/{5}/{6}/{7}",
    RpCourse,
    RpCourseKind,
    RpPerfect,
    RpGreat,
    RpGood,
    RpAlmost,
    RpBoo,
    RpOK,
    RpMarvelous
)

rich_presence_conditional_display(
    AnyCourse && SinglePlayerOnly && InGameplayRedux && SongId >= 0x15,
    "Playing {0} {1} - {8}/{2}/{3}/{4}/{5}/{6}/{7}",
    RpCourse,
    RpCourseDiff,
    RpPerfect,
    RpGreat,
    RpGood,
    RpAlmost,
    RpBoo,
    RpOK,
    RpMarvelous
)

rich_presence_conditional_display(
    AnyCourse && SinglePlayerOnly && InGameplayRedux && SongId < 0x15,
    "Playing {0} ({1}) 🔋x{9} - {8}/{2}/{3}/{4}/{5}/{6}/{7}",
    RpCourse,
    RpCourseKind,
    RpPerfect,
    RpGreat,
    RpGood,
    RpAlmost,
    RpBoo,
    RpOK,
    RpMarvelous,
    RpBattery
)

rich_presence_conditional_display(
    AnyCourse && SinglePlayerOnly && SelectingMusic && SongId >= 0x15,
    "Thinking About Playing {0} {2} ({1})",
    RpCourse,
    RpCourseKind,
    RpCourseDiff
)

rich_presence_conditional_display(
    AnyCourse && SinglePlayerOnly && SelectingMusic && SongId < 0x15,
    "Thinking About Playing {0} ({1})",
    RpCourse,
    RpCourseKind
)

rich_presence_conditional_display(
    PlayingSongs && SinglePlayerOnly && SelectingMusic,
    "Thinking About Playing {0}",
    RpSong
)

rich_presence_conditional_display(
    PlayingSongs && LoadingWheel,
    "Select Your Music."
)

rich_presence_display("Let's DDR!")
