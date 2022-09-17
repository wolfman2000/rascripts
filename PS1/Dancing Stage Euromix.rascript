// Dancing Stage: Euromix
// #ID = 20300

// Independent Functions

// Variables

// Arcade, Training, Workout, Lesson
ModeSelection = byte(0x101a8)
ModeArcade = ModeSelection == 0
ModeWorkout = ModeSelection == 2
ModeLesson = ModeSelection == 3

ArcadeSelection = byte(0x0bd5db)
ArcadeNormal = ArcadeSelection != 8
ArcadeNonstop = ArcadeSelection == 8

GameState = byte(0xbd5c8)
GsLoadingGame = GameState == 0x00
GsLoadingChart = GameState == 0x01
GsGameplay = GameState == 0x03
GsLoadedChart = prev(GameState) != 0x03 && GsGameplay
GsEvaluation = GameState == 0x04
GsEnteredEvaluation = GsEvaluation && prev(GameState) != 0x04
GsLeftEvaluation = prev(GameState) == 0x04
GsFailed = GameState == 0x05
GsNonstopFadeIn = GameState == 0x06
GsNonstopFadeOut = GameState == 0x07
GsNonstopPriorDone = prev(GameState) == 0x03 && GsNonstopFadeOut
GsSelectGameMode = GameState == 0x08
GsSelectGameSettings = GameState == 0x09
GsSelectMusic = GameState == 0x0a
GsEnteringNonstop = GameState == 0x0b
GsSelectDifficulty = GameState == 0x0c
GsChosenChart = GameState == 0x0e
GsNameEntry = GameState == 0x0f
GsGameOver = GameState == 0x10 || GameState == 0x15
GsCredits = GameState == 0x11
GsCaution = GameState == 0x16
GsMainMenu = GameState == 0x18
GsKonami = GameState == 0x1a
GsIntroMovie = GameState == 0x1c
GsDemo = GameState == 0x1e
GsHowToPlay = GameState == 0x1f
GsHighScores = GameState == 0x20
GsLesson = GameState == 0x29
GsTraining = GameState == 0x2a
GsRecords = GameState == 0x2e
GsOptions = GameState == 0x2f

SongId = byte(0xbd5ca)
NoSong = SongId == 0xff

CheevoTitleLookup = {
    0x01: "Not Bad",
    0x02: "Num Down",
    0x03: "Less Than That",
    0x04: "No Phoenix Down",
    0x08: "Need Peanut Butter",
    0x09: "Not So Spooky",
    0x0b: "No Stopping",
    0x12: "Survived Y2K",
    0x13: "Redundancy",
    0x14: "Too Much?",
    0x15: "Calming",
    0x16: "Still Alive",
    0x17: "Passing On Faith",
    0x18: "Naoki Classic",
    0x19: "Never Worse",
    0x1a: "Panicing",
    0x1b: "Steady Feet",
    0x1c: "Bottom Rank",
    0x1d: "OG Lyrics Best",
    0x1e: "Underrated Hit",
    0x1f: "Ole!",
    0x20: "No Groove Radars Yet",
    0x21: "Panicing Again",
    0x22: "Crossovers & Spins"
}

SongTitleLookup = {
    0x01: "So Good",
    0x02: "Word Up",
    0x03: "More Than This '99",
    0x04: "Video Killed The Radio Star",
    0x08: "MAKE A JAM!",
    0x09: "Silent Hill",
    0x0b: "KEEP ON MOVIN'",
    0x12: "END OF THE CENTURY",
    0x13: "Magic Alec Presents Resonance",
    0x14: "(Mucho Mambo) Sway",
    0x15: "Rushing",
    0x16: "I Will Survive",
    0x17: "PUT YOUR FAITH IN ME",
    0x18: "BRILLIANT 2U",
    0x19: "MAKE IT BETTER",
    0x1a: "PARANOiA",
    0x1b: "TRIP MACHINE",
    0x1c: "LET THEM MOVE",
    0x1d: "DYNAMITE RAVE",
    0x1e: "LUV TO ME (AMD MIX)",
    0x1f: "La Senorita",
    0x20: "DEAD END",
    0x21: "PARANOiA Rebirth",
    0x22: "AFRONOVA"
}

// Round number: 0xff if not in a relevant mode.
RoundNumber = byte(0xbd5d0)
RoundScoreOffset = RoundNumber * 4

NonstopCourse = byte(0xca2f0)

// 0-2 focus here.
NonstopDifficulty = byte(0xca300)

GameLevel = low4(0xd7e78)
ValidGameLevel = GameLevel >= 3
InvalidGameLevel = GameLevel < 3

PlayerOffset = 0x619c
PlayerWorkoutCharOffset = 0x10
PlayerEvaluationOffset = 0x14

StyleBase = 0xbd64a
Single = byte(StyleBase) == 1 || byte(StyleBase + PlayerOffset) == 1
SingleOffset = bit0(StyleBase + PlayerOffset) * PlayerOffset
SingleWorkoutCharOffset = bit0(StyleBase + PlayerOffset) * PlayerWorkoutCharOffset
SingleEvaluationOffset = bit0(StyleBase + PlayerOffset) * PlayerEvaluationOffset
Versus = byte(StyleBase) == 5 && byte(StyleBase + PlayerOffset) == 5
Double = bit1(StyleBase) == 1 && bit1(StyleBase + PlayerOffset) == 1
DoubleOffset = bit0(StyleBase) * PlayerOffset
DoubleWorkoutCharOffset = bit0(StyleBase) * PlayerWorkoutCharOffset
DoubleEvaluationOffset = bit0(StyleBase) * PlayerEvaluationOffset

WorkoutCharBase = 0xd39ff
SingleWorkoutZukin = byte(WorkoutCharBase + SingleWorkoutCharOffset) == 2
DoubleWorkoutZukin = byte(WorkoutCharBase + DoubleWorkoutCharOffset) == 2

LifeBase = 0xbd602
SingleLife = word(LifeBase + SingleOffset)
DoubleLife = word(LifeBase + DoubleOffset)

TotalScoreBase = 0xbd60c
SingleTotalScore = dword(TotalScoreBase + SingleOffset)
DoubleTotalScore = dword(TotalScoreBase + DoubleOffset)

PriorScoreBase = 0xbd608
SinglePriorScore = dword(PriorScoreBase + SingleOffset)
DoublePriorScore = dword(PriorScoreBase + DoubleOffset)

SingleCurrentScore = SingleTotalScore - SinglePriorScore
DoubleCurrentScore = DoubleTotalScore - DoublePriorScore

DifficultyBase = 0xbd648
SingleDifficulty = byte(DifficultyBase + SingleOffset)
SingleBeginner = SingleDifficulty == 5
SingleNoBeginner = SingleDifficulty < 5
SingleStandard = SingleDifficulty == 1
SingleNoStandard = SingleDifficulty > 1
SingleDifficult = SingleDifficulty == 2
SingleExpert = SingleDifficulty == 3
DoubleDifficulty = byte(DifficultyBase + DoubleOffset)
DoubleStandard = DoubleDifficulty == 1
DoubleNoStandard = DoubleDifficulty > 1
DoubleDifficult = DoubleDifficulty == 2
DoubleExpert = DoubleDifficulty == 3

DifficultyLookup = {
    1: "Standard",
    2: "Difficult",
    3: "Expert",
    5: "Beginner"
}

TurnModBase = 0xbd649
SingleTurnMod = low4(TurnModBase + SingleOffset)
DoubleTurnMod = low4(TurnModBase + DoubleOffset)
SingleLeft = SingleTurnMod == 2
SingleMirror = SingleTurnMod == 3
DoubleMirror = DoubleTurnMod == 3
SingleRight = SingleTurnMod == 4
SingleShuffle = SingleTurnMod > 4

MostModBase = 0xbd650
SingleHidden = bit0(MostModBase + SingleOffset) == 1
DoubleHidden = bit0(MostModBase + DoubleOffset) == 1
SingleSudden = bit1(MostModBase + SingleOffset) == 1
DoubleSudden = bit1(MostModBase + DoubleOffset) == 1
SingleVisibleCheck = bit1(MostModBase + SingleOffset) * 2 + bit0(MostModBase + SingleOffset)
DoubleVisibleCheck = bit1(MostModBase + DoubleOffset) * 2 + bit0(MostModBase + DoubleOffset)
SingleLittle = bit2(MostModBase + SingleOffset) == 1
DoubleLittle = bit2(MostModBase + DoubleOffset) == 1
SingleFlat = bit4(MostModBase + SingleOffset) == 0
DoubleFlat = bit4(MostModBase + DoubleOffset) == 0

PerfectBase = 0xbd654
SinglePerfect = word(PerfectBase + SingleOffset)
DoublePerfect = word(PerfectBase + DoubleOffset)

GreatBase = 0xbd658
SingleGreat = word(GreatBase + SingleOffset)
DoubleGreat = word(GreatBase + DoubleOffset)

GoodBase = 0xbd65c
SingleGood = word(GoodBase + SingleOffset)
DoubleGood = word(GoodBase + DoubleOffset)

AlmostBase = 0xbd660
SingleAlmost = word(AlmostBase + SingleOffset)
DoubleAlmost = word(AlmostBase + DoubleOffset)

BooBase = 0xbd664
SingleBoo = word(BooBase + SingleOffset)
DoubleBoo = word(BooBase + DoubleOffset)

TotalJudgmentsBase = 0xbd66c
SingleTotalJudgments = word(TotalJudgmentsBase + SingleOffset)
DoubleTotalJudgments = word(TotalJudgmentsBase + DoubleOffset)

FailedBase = 0xbdfe6
SingleFailed = byte(FailedBase + SingleOffset) == 1
DoubleFailed = byte(FailedBase + DoubleOffset) == 1

EvaluationScoreBase = 0xd7c48

SongLittleBannedSingleLookup = {
    0x01: (SingleDifficulty > 1),
    0x02: (SingleDifficulty > 1),
    0x03: (SingleDifficulty > 1),
    0x04: (SingleDifficulty > 1),
    0x08: always_true(),
    0x09: (SingleDifficulty > 1),
    0x0b: always_true(),
    0x12: (SingleDifficulty > 1),
    0x13: (SingleDifficulty > 1),
    0x14: (SingleDifficulty > 1),
    0x15: (SingleDifficulty > 1),
    0x16: (SingleDifficulty > 1),
    0x17: always_true(),
    0x18: always_true(),
    0x19: always_true(),
    0x1a: always_true(),
    0x1b: always_true(),
    0x1c: (SingleDifficulty > 1),
    0x1d: (SingleDifficulty > 1),
    0x1e: (SingleDifficulty > 1),
    0x1f: (SingleDifficulty > 1),
    0x20: always_true(),
    0x21: always_true(),
    0x22: always_true()
}

SongLittleBannedDoubleLookup = {
    0x01: (DoubleDifficulty > 1),
    0x02: (DoubleDifficulty > 1),
    0x03: (DoubleDifficulty > 2),
    0x04: always_true(),
    0x08: always_true(),
    0x09: (DoubleDifficulty > 1),
    0x0b: always_true(),
    0x12: (DoubleDifficulty > 1),
    0x13: (DoubleDifficulty > 1),
    0x14: (DoubleDifficulty > 1),
    0x15: (DoubleDifficulty > 1),
    0x16: (DoubleDifficulty > 1),
    0x17: always_true(),
    0x18: always_true(),
    0x19: always_true(),
    0x1a: always_true(),
    0x1b: always_true(),
    0x1c: (DoubleDifficulty > 1),
    0x1d: (DoubleDifficulty > 1),
    0x1e: (DoubleDifficulty > 1),
    0x1f: (DoubleDifficulty > 1),
    0x20: always_true(),
    0x21: always_true(),
    0x22: always_true()
}

// We require the total number of judgments due to quirks with Nonstop Mode.
// Let folks get FC and PFC cheevos if they earn them in that mode.

StepCounts = {
    0x01: [130, 173, 199, 110, 170, 199],
    0x02: [124, 186, 273, 124, 170, 199],
    0x03: [146, 194, 201, 133, 163, 176],
    0x04: [130, 157, 200, 134, 176, 184],
    0x08: [155, 193, 240, 155, 200, 296],
    0x09: [117, 202, 265, 165, 206, 268],
    0x0b: [110, 140, 183, 113, 162, 164],
    0x12: [231, 307, 349, 231, 245, 390],
    0x13: [188, 230, 294, 208, 247, 285],
    0x14: [105, 170, 251, 111, 163, 239],
    0x15: [172, 200, 255, 148, 210, 247],
    0x16: [87, 137, 175, 82, 110, 149],
    0x17: [128, 145, 203, 135, 147, 170],
    0x18: [162, 176, 225, 165, 180, 227],
    0x19: [143, 188, 212, 130, 181, 220],
    0x1a: [264, 275, 319, 254, 309, 382],
    0x1b: [191, 211, 230, 201, 215, 264],
    0x1c: [107, 150, 198, 110, 126, 165],
    0x1d: [188, 269, 398, 217, 250, 331],
    0x1e: [203, 270, 353, 217, 228, 352],
    0x1f: [241, 255, 294, 181, 293, 420],
    0x20: [216, 337, 410, 274, 298, 455],
    0x21: [280, 322, 433, 281, 321, 423],
    0x22: [214, 244, 370, 233, 245, 357]
}

// Dependent Functions

// Achievements

achievement(
    title = "Caution: Extreme Motions Are Dangerous!",
    description = "Go to Options -> Game Options & set game difficulty to 4 or higher!",
    points = 0,
    trigger = NoSong && GsMainMenu
)

function LessonModeCheevo(num, title, address) {
    sum = 0
    for i in range(0, 7) {
        sum = sum + byte(address + i)
    }
    achievement(
        title = title,
        points = num,
        description = format("Complete lesson {0}.", num),
        trigger = ModeLesson && prev(sum) < 16 && sum == 16
    )
}

LessonModeCheevo(1, "Back To Basics", 0xd9274)
LessonModeCheevo(2, "Getting The Hang Of It", 0xd927c)
LessonModeCheevo(3, "Ready To Dance", 0xd9284)

function ArcadeTargetScoreCheevo() {
    singleScore = Single && SingleTotalScore >= 27000000 &&
        once(GsLoadedChart) &&
        all_of(
            SongLittleBannedSingleLookup,
            s => never(SingleLittle && SongId == s && SongLittleBannedSingleLookup[s])
        )
        && never(GsGameplay && SingleBeginner)
    doubleScore = Double && DoubleTotalScore >= 27000000 &&
        once(GsLoadedChart) &&
        all_of(
            SongLittleBannedDoubleLookup,
            s => never(DoubleLittle && SongId == s && SongLittleBannedDoubleLookup[s])
        )
    achievement(
        title = "It's Like Sunshine On A Cloudy Day",
        points = 25,
        description = "In Arcade Mode (no nonstop courses), get 27000000 points by the end of the third stage.",
        trigger = ModeArcade && ArcadeNormal && GsEvaluation && RoundNumber == 2 &&
            unless(InvalidGameLevel) && never(GsMainMenu) && (singleScore || doubleScore)
    )
}

ArcadeTargetScoreCheevo()

function ModFlatCheevo() {
    single = Single && !SingleFailed && !SingleLittle && SingleFlat && SingleExpert
    double = Double && !DoubleFailed && !DoubleLittle && DoubleFlat && DoubleExpert
    achievement(
        title = "Color Reduction",
        points = 10,
        description = "Clear any Expert chart in Arcade mode with the Flat mod on.",
        trigger = ModeArcade && ArcadeNormal && GsEvaluation &&
            (single || double) &&
            unless(InvalidGameLevel)
    )
}

function ModLeftCheevo() {
    achievement(
        title = "To Albuquerque!",
        points = 10,
        description = "Clear any Expert chart in Arcade mode with the Left mod on.",
        trigger = ModeArcade && ArcadeNormal && GsEvaluation &&
            Single && !SingleFailed && !SingleLittle && SingleLeft && SingleExpert &&
            unless(InvalidGameLevel)
    )
}

function ModRightCheevo() {
    achievement(
        title = "Go Right, Right?",
        points = 10,
        description = "Clear any Expert chart in Arcade mode with the Right mod on.",
        trigger = ModeArcade && ArcadeNormal && GsEvaluation &&
            Single && !SingleFailed && !SingleLittle && SingleRight && SingleExpert &&
            unless(InvalidGameLevel)
    )
}

function ModMirrorCheevo() {
    single = Single && !SingleFailed && !SingleLittle && SingleMirror && SingleExpert
    double = Double && !DoubleFailed && !DoubleLittle && DoubleMirror && DoubleExpert
    achievement(
        title = "Who's The Grooviest Of Them All?",
        points = 10,
        description = "Clear any Expert chart in Arcade mode with the Mirror mod on.",
        trigger = ModeArcade && ArcadeNormal && GsEvaluation &&
            (single || double) &&
            unless(InvalidGameLevel)
    )
}

function ModShuffleCheevo() {
    achievement(
        title = "Every Day...",
        points = 10,
        description = "Clear any Expert chart in Arcade mode with the Shuffle mod on.",
        trigger = ModeArcade && ArcadeNormal && GsEvaluation &&
            Single && !SingleFailed && !SingleLittle && SingleShuffle && SingleExpert &&
            unless(InvalidGameLevel)
    )
}

function ModHiddenCheevo() {
    single = Single && !SingleFailed && !SingleLittle &&
        SingleHidden && !SingleSudden && SingleExpert
    double = Double && !DoubleFailed && !DoubleLittle &&
        DoubleHidden && !DoubleSudden && DoubleExpert
    achievement(
        title = "Was It A Mirage?",
        points = 10,
        description = "Clear any Expert chart in Arcade mode with the Hidden mod on.",
        trigger = ModeArcade && ArcadeNormal && GsEvaluation &&
            (single || double) &&
            unless(InvalidGameLevel)
    )
}

function ModSuddenCheevo() {
    single = Single && !SingleFailed && !SingleLittle &&
        !SingleHidden && SingleSudden && SingleExpert
    double = Double && !DoubleFailed && !DoubleLittle &&
        !DoubleHidden && DoubleSudden && DoubleExpert
    achievement(
        title = "Where Did They Come From?",
        points = 10,
        description = "Clear any Expert chart in Arcade mode with the Sudden mod on.",
        trigger = ModeArcade && ArcadeNormal && GsEvaluation &&
            (single || double) &&
            unless(InvalidGameLevel)
    )
}

function ModStealthCheevo() {
    single = Single && !SingleFailed && !SingleLittle &&
        SingleHidden && SingleSudden && SingleNoBeginner && SingleNoStandard
    double = Double && !DoubleFailed && !DoubleLittle &&
        DoubleHidden && DoubleSudden && DoubleNoStandard
    achievement(
        title = "I Didn't Even See Them!",
        points = 25,
        description = "Clear any non-Standard chart in Arcade mode with the Stealth mod on.",
        trigger = ModeArcade && ArcadeNormal && GsEvaluation &&
            (single || double) &&
            unless(InvalidGameLevel)
    )
}

ModFlatCheevo()
ModLeftCheevo()
ModRightCheevo()
ModMirrorCheevo()
ModShuffleCheevo()
ModHiddenCheevo()
ModSuddenCheevo()
ModStealthCheevo()

function SingleClearSongCheevo(songId) {
    stepCounts = StepCounts[songId]
    validStepCounts = (SingleStandard && SingleTotalJudgments >= stepCounts[0]) ||
        (SingleDifficult && SingleTotalJudgments >= stepCounts[1]) ||
        (SingleExpert && SingleTotalJudgments >= stepCounts[2])
    achievement(
        title = CheevoTitleLookup[songId] + " Single",
        points = 5,
        description = format("Clear {0} on any Single chart.", SongTitleLookup[songId]),
        trigger = SongId == songId &&
            ((ModeArcade && ArcadeNormal) || (ModeWorkout && SingleWorkoutZukin) ) &&
            Single && SingleLife != 0 && !SingleFailed &&
            validStepCounts && GsEvaluation &&
            unless(SingleLittle && SongLittleBannedSingleLookup[songId]) &&
            unless(InvalidGameLevel) &&
            unless(SingleBeginner)
    )
}

function SingleFullComboCheevo(songId) {
    stepCounts = StepCounts[songId]
    validStepCounts = (
        SingleDifficult &&
        trigger_when(SingleTotalJudgments >= stepCounts[1])) ||
        (SingleExpert &&
        trigger_when(SingleTotalJudgments >= stepCounts[2]))
    achievement(
        title = CheevoTitleLookup[songId] + " Single FC",
        points = 10,
        description = format(
            "Clear {0} Single with a full combo on Difficult or Expert.",
            SongTitleLookup[songId]
        ),
        trigger = SongId == songId &&
            ((ModeArcade && ArcadeNormal) || (ModeWorkout && SingleWorkoutZukin) ) &&
            Single &&
            once(GsLoadedChart) &&
            SinglePerfect + SingleGreat == SingleTotalJudgments &&
            trigger_when(GsEvaluation) && validStepCounts &&
            unless(SingleLittle && SongLittleBannedSingleLookup[songId]) &&
            unless(InvalidGameLevel) &&
            unless(SingleBeginner) &&
            unless(SingleStandard) &&
            never(GsLeftEvaluation)
    )
}

function SingleExpertCheevo(songId) {
    stepCounts = StepCounts[songId]
    validStepCounts = (SingleExpert && SingleTotalJudgments >= stepCounts[2])
    achievement(
        title = CheevoTitleLookup[songId] + " Single Expert",
        points = 10,
        description = format("Clear {0} Single Expert.", SongTitleLookup[songId]),
        trigger = SongId == songId &&
            ((ModeArcade && ArcadeNormal) || (ModeWorkout && SingleWorkoutZukin) ) &&
            Single && SingleLife != 0 && !SingleFailed &&
            validStepCounts && GsEvaluation &&
            unless(SingleLittle && SongLittleBannedSingleLookup[songId]) &&
            unless(InvalidGameLevel)
    )
}

function DoubleClearSongCheevo(songId) {
    achievement(
        title = CheevoTitleLookup[songId] + " Double",
        points = 5,
        description = format("Clear {0} on any Double chart.", SongTitleLookup[songId]),
        trigger = SongId == songId &&
            ((ModeArcade && ArcadeNormal) || (ModeWorkout && DoubleWorkoutZukin) ) &&
            Double && DoubleLife != 0 && !DoubleFailed &&
            GsEvaluation &&
            unless(DoubleLittle && SongLittleBannedDoubleLookup[songId]) &&
            unless(InvalidGameLevel)
    )
}

function DoubleFullComboCheevo(songId) {
    stepCounts = StepCounts[songId]
    validStepCounts = (DoubleDifficult &&
        trigger_when(DoubleTotalJudgments >= stepCounts[4])) ||
        (DoubleExpert && trigger_when(DoubleTotalJudgments >= stepCounts[5]))
    achievement(
        title = CheevoTitleLookup[songId] + " Double FC",
        points = 10,
        description = format(
            "Clear {0} Double with a full combo on Difficult or Expert.",
            SongTitleLookup[songId]
        ),
        trigger = SongId == songId &&
            ((ModeArcade && ArcadeNormal) || (ModeWorkout && DoubleWorkoutZukin) ) &&
            Double &&
            once(GsLoadedChart) &&
            DoublePerfect + DoubleGreat == DoubleTotalJudgments &&
            trigger_when(GsEvaluation) && validStepCounts &&
            unless(DoubleLittle && SongLittleBannedDoubleLookup[songId]) &&
            unless(InvalidGameLevel) &&
            unless(DoubleStandard) &&
            unless(GsSelectMusic)
    )
}

function DoubleExpertCheevo(songId) {
    stepCounts = StepCounts[songId]
    validStepCounts = (DoubleExpert && DoubleTotalJudgments >= stepCounts[5])
    achievement(
        title = CheevoTitleLookup[songId] + " Double Expert",
        points = 10,
        description = format("Clear {0} Double Expert.", SongTitleLookup[songId]),
        trigger = SongId == songId &&
            ((ModeArcade && ArcadeNormal) || (ModeWorkout && DoubleWorkoutZukin) ) &&
            Double && DoubleLife != 0 && !DoubleFailed &&
            validStepCounts && GsEvaluation &&
            unless(DoubleLittle && SongLittleBannedDoubleLookup[songId]) &&
            unless(InvalidGameLevel)
    )
}

for i in SongTitleLookup {
    SingleClearSongCheevo(i)
    SingleFullComboCheevo(i)
    SingleExpertCheevo(i)
    DoubleClearSongCheevo(i)
    DoubleFullComboCheevo(i)
    DoubleExpertCheevo(i)
}

NonstopTitleLookup = {
    0: "For Beginner",
    1: "Favorite Song",
    2: "Universal",
    3: "High Speed",
    4: "Konami Original",
    5: "Special",
    6: "Caprice",
    7: "Roulette"
}

function NonstopClearCheevo(nonstopId) {
    single = Single && !SingleFailed && !SingleLittle
    double = Double && !DoubleFailed && !DoubleLittle
    desc = format("Clear the {0} Nonstop course.", NonstopTitleLookup[nonstopId])
    if nonstopId == 6 {
        desc = desc + " What songs did you get?"
    }
    achievement(
        title = format("{0} Clear", NonstopTitleLookup[nonstopId]),
        points = 10,
        description = desc,
        trigger = ModeArcade && ArcadeNonstop && GsEvaluation &&
            NonstopCourse == nonstopId &&
            unless(InvalidGameLevel) &&
            (single || double)
    )
}

function NonstopScoreCheevo(nonstopId) {
    single = Single && !SingleFailed && !SingleLittle && SingleTotalScore >= 90000000
    double = Double && !DoubleFailed && !DoubleLittle && DoubleTotalScore >= 90000000
    desc = "Clear the {0} Nonstop course with 90000000 points or more. No Standard, sorry."
    if nonstopId == 6 {
        desc = desc + " What songs did you get?"
    }
    achievement(
        title = format("{0} Score", NonstopTitleLookup[nonstopId]),
        points = 25,
        description = format(desc,
            NonstopTitleLookup[nonstopId]
        ),
        trigger = ModeArcade && ArcadeNonstop && GsEvaluation &&
            NonstopCourse == nonstopId &&
            unless(InvalidGameLevel) &&
            (single || double)
    )
}

for i in NonstopTitleLookup {
    if i != 6 {
        NonstopClearCheevo(i)
        NonstopScoreCheevo(i)
    }
}

PfcCheck = {
    0: (Single && SingleStandard),
    1: (Single && SingleDifficult),
    2: (Single && SingleExpert),
    3: (Double && DoubleStandard),
    4: (Double && DoubleDifficult),
    5: (Double && DoubleExpert)
}

function Pfc() {
    validCombos = []
    for songId in StepCounts {
        i = 0
        for j in StepCounts[songId] {
            setup = PfcCheck[i] && SongId == songId
            if (i < 3) {
                setup = setup &&
                    unless(SingleLittle && SongLittleBannedSingleLookup[songId]) &&
                    trigger_when(SingleTotalJudgments >= j) &&
                    never(SinglePerfect != SingleTotalJudgments)
            }
            else {
                setup = setup &&
                    unless(DoubleLittle && SongLittleBannedDoubleLookup[songId]) &&
                    trigger_when(DoubleTotalJudgments >= j) &&
                    never(DoublePerfect != DoubleTotalJudgments)
            }
            array_push(validCombos, setup)
            i = i + 1
        }
    }
    
    achievement(
        title = "Are You A Professional Dancer?",
        points = 50,
        description = "Get ALL Perfects on any one chart of your choice (except Beginner).",
        trigger = once(GsLoadedChart) && trigger_when(GsEvaluation) &&
            any_of(validCombos, s => s) &&
            unless(InvalidGameLevel)
    )
}

Pfc()

// Leaderboards

function SingleSongMoneyScoreLeaderboard(songId, difficulty) {
    songName = SongTitleLookup[songId]
    diffName = DifficultyLookup[difficulty]
    leaderboard(
        title = format("{0} Single {1} Money Score", songName, diffName),
        description = format(
            "Get the best money score you can on {0} Single {1}.",
            songName,
            diffName
        ),
        start = Single && ModeArcade && ArcadeNormal && SongId == songId &&
            SingleDifficulty == difficulty && !SingleFailed &&
            unless(SingleLittle && SongLittleBannedSingleLookup[songId]) &&
            GsEnteredEvaluation,
        cancel = always_false(),
        submit = always_true(),
        value = SingleCurrentScore
    )
}

function SingleSongExScoreLeaderboard(songId, difficulty) {
    songName = SongTitleLookup[songId]
    diffName = DifficultyLookup[difficulty]
    leaderboard(
        title = format("{0} Single {1} EX Score", songName, diffName),
        description = format(
            "Get the best EX score you can on {0} Single {1}.",
            songName,
            diffName
        ),
        start = Single && ModeArcade && ArcadeNormal && SongId == songId &&
            SingleDifficulty == difficulty && !SingleFailed &&
            unless(SingleLittle && SongLittleBannedSingleLookup[songId]) &&
            GsEnteredEvaluation,
        cancel = always_false(),
        submit = always_true(),
        value = SinglePerfect * 2 + SingleGreat
    )
}

function DoubleSongMoneyScoreLeaderboard(songId, difficulty) {
    songName = SongTitleLookup[songId]
    diffName = DifficultyLookup[difficulty]
    leaderboard(
        title = format("{0} Double {1} Money Score", songName, diffName),
        description = format(
            "Get the best money score you can on {0} Double {1}.",
            songName,
            diffName
        ),
        start = Double && ModeArcade && ArcadeNormal && SongId == songId &&
            DoubleDifficulty == difficulty && !DoubleFailed &&
            unless(DoubleLittle && SongLittleBannedDoubleLookup[songId]) &&
            GsEnteredEvaluation,
        cancel = always_false(),
        submit = always_true(),
        value = DoubleCurrentScore
    )
}

function DoubleSongExScoreLeaderboard(songId, difficulty) {
    songName = SongTitleLookup[songId]
    diffName = DifficultyLookup[difficulty]
    leaderboard(
        title = format("{0} Double {1} EX Score", songName, diffName),
        description = format(
            "Get the best EX score you can on {0} Double {1}.",
            songName,
            diffName
        ),
        start = Double && ModeArcade && ArcadeNormal && SongId == songId &&
            DoubleDifficulty == difficulty && !DoubleFailed &&
            unless(DoubleLittle && SongLittleBannedDoubleLookup[songId]) &&
            GsEnteredEvaluation,
        cancel = always_false(),
        submit = always_true(),
        value = DoublePerfect * 2 + DoubleGreat
    )
}

for i in SongTitleLookup {
    for j in range(1, 3) {
        SingleSongMoneyScoreLeaderboard(i, j)
        SingleSongExScoreLeaderboard(i, j)
        DoubleSongMoneyScoreLeaderboard(i, j)
        DoubleSongExScoreLeaderboard(i, j)
    }
}

function SingleCourseMoneyScoreLeaderboard(courseId, difficulty) {
    courseName = NonstopTitleLookup[courseId]
    diffName = DifficultyLookup[difficulty]
    leaderboard(
        title = format("{0} Single {1} Money Score", courseName, diffName),
        description = format(
            "Get the best money score you can get on {0} Single {1}.",
            courseName,
            diffName
        ),
        start = Single && ModeArcade && ArcadeNonstop && NonstopCourse == courseId &&
            SingleDifficulty == difficulty && !SingleFailed && !SingleLittle &&
            GsEnteredEvaluation,
        cancel = always_false(),
        submit = always_true(),
        value = SingleTotalScore
    )
}

function SingleCourseExScoreLeaderboard(courseId, difficulty) {
    courseName = NonstopTitleLookup[courseId]
    diffName = DifficultyLookup[difficulty]
    leaderboard(
        title = format("{0} Single {1} EX Score", courseName, diffName),
        description = format(
            "Get the best EX score you can get on {0} Single {1}.",
            courseName,
            diffName
        ),
        start = Single && ModeArcade && ArcadeNonstop && NonstopCourse == courseId &&
            SingleDifficulty == difficulty && !SingleFailed && !SingleLittle &&
            GsEnteredEvaluation,
        cancel = always_false(),
        submit = always_true(),
        value = SinglePerfect * 2 + SingleGreat
    )
}

function DoubleCourseMoneyScoreLeaderboard(courseId, difficulty) {
    courseName = NonstopTitleLookup[courseId]
    diffName = DifficultyLookup[difficulty]
    leaderboard(
        title = format("{0} Double {1} Money Score", courseName, diffName),
        description = format(
            "Get the best money score you can get on {0} Double {1}.",
            courseName,
            diffName
        ),
        start = Double && ModeArcade && ArcadeNonstop && NonstopCourse == courseId &&
            DoubleDifficulty == difficulty && !DoubleFailed && !DoubleLittle &&
            GsEnteredEvaluation,
        cancel = always_false(),
        submit = always_true(),
        value = DoubleTotalScore
    )
}

function DoubleCourseExScoreLeaderboard(courseId, difficulty) {
    courseName = NonstopTitleLookup[courseId]
    diffName = DifficultyLookup[difficulty]
    leaderboard(
        title = format("{0} Double {1} EX Score", courseName, diffName),
        description = format(
            "Get the best EX score you can get on {0} Double {1}.",
            courseName,
            diffName
        ),
        start = Double && ModeArcade && ArcadeNonstop && NonstopCourse == courseId &&
            DoubleDifficulty == difficulty && !DoubleFailed && !DoubleLittle &&
            GsEnteredEvaluation,
        cancel = always_false(),
        submit = always_true(),
        value = DoublePerfect * 2 + DoubleGreat
    )
}

for i in NonstopTitleLookup {
    if (i != 6) {
    for j in range(1, 3) {
        SingleCourseMoneyScoreLeaderboard(i, j)
        SingleCourseExScoreLeaderboard(i, j)
        DoubleCourseMoneyScoreLeaderboard(i, j)
        DoubleCourseExScoreLeaderboard(i, j)
    }
    }
}

// Rich Presence

LittleLookup = {
    0: "",
    1: "Little (cheater)"
}

VisibleLookup = {
    0: "",
    1: "Hidden",
    2: "Sudden",
    3: "Stealth"
}

FlatLookup = {
    0: "Flat",
    1: ""
}

TurnLookup = {
    1: "",
    2: "Left",
    3: "Mirror",
    4: "Right"
}

RpSongTitle = rich_presence_lookup("Song", SongId, SongTitleLookup, "Something On")
RpSingleDifficulty = rich_presence_lookup("Diff", SingleDifficulty, DifficultyLookup)
RpSingleTurn = rich_presence_lookup("Turn", SingleTurnMod, TurnLookup, "Shuffle")
RpSingleFlat = rich_presence_lookup(
    "Flat", 
    bit4(MostModBase + SingleOffset),
    FlatLookup
)
RpSingleLittle = rich_presence_lookup(
    "Little",
    bit2(MostModBase + SingleOffset),
    LittleLookup
)
RpSingleVisible = rich_presence_lookup("Visible", SingleVisibleCheck, VisibleLookup)
RpSinglePerfect = rich_presence_macro("Number", SinglePerfect)
RpSingleGreat = rich_presence_macro("Number", SingleGreat)
RpSingleGood = rich_presence_macro("Number", SingleGood)
RpSingleAlmost = rich_presence_macro("Number", SingleAlmost)
RpSingleBoo = rich_presence_macro("Number", SingleBoo)
RpSingleCurrentScore = rich_presence_macro("Number", SingleCurrentScore)

RpDoubleDifficulty = rich_presence_lookup("Diff", DoubleDifficulty, DifficultyLookup)
RpDoubleTurn = rich_presence_lookup("Turn", DoubleTurnMod, TurnLookup, "Shuffle")
RpDoubleFlat = rich_presence_lookup(
    "Flat",
    bit4(MostModBase + DoubleOffset),
    FlatLookup
)
RpDoubleLittle = rich_presence_lookup(
    "Little",
    bit2(MostModBase + DoubleOffset),
    LittleLookup
)
RpDoubleVisible = rich_presence_lookup("Visible", DoubleVisibleCheck, VisibleLookup)
RpDoublePerfect = rich_presence_macro("Number", DoublePerfect)
RpDoubleGreat = rich_presence_macro("Number", DoubleGreat)
RpDoubleGood = rich_presence_macro("Number", DoubleGood)
RpDoubleAlmost = rich_presence_macro("Number", DoubleAlmost)
RpDoubleBoo = rich_presence_macro("Number", DoubleBoo)
RpDoubleCurrentScore = rich_presence_macro("Number", DoubleCurrentScore)

RpLesson = rich_presence_macro("Number", byte(0x0ff9b5) + 1)
RpSection = rich_presence_macro("Number", byte(0x0ff9b6) + 1)
RpCourse = rich_presence_lookup("Course", NonstopCourse, NonstopTitleLookup, "A Course On")

rich_presence_conditional_display(
    ModeWorkout && ((Single && !SingleWorkoutZukin) || (Double && !DoubleWorkoutZukin)),
    "Working out casually to Dancing Stage Euromix"
)

rich_presence_conditional_display(
    GsCredits || GsNameEntry,
    "Congrats on your workout. See you next time."
)

rich_presence_conditional_display(
    ModeArcade && ArcadeNonstop && (GsEnteringNonstop || GsSelectDifficulty) && Single,
    "Thinking of playing the course {0} Single {1}",
    RpCourse,
    RpSingleDifficulty
)

rich_presence_conditional_display(
    ModeArcade && ArcadeNonstop && (GsEnteringNonstop || GsSelectDifficulty) && Double,
    "Thinking of playing the course {0} Double {1}",
    RpCourse,
    RpDoubleDifficulty
)

rich_presence_conditional_display(
    ModeArcade && ArcadeNonstop && GsFailed && Single,
    "Failed {12} - {0} Single {1} {2} {3} {4} {5}: {6} {7}/{8}/{9}/{10}/{11}",
    RpSongTitle,
    RpSingleDifficulty,
    RpSingleFlat,
    RpSingleLittle,
    RpSingleTurn,
    RpSingleVisible,
    RpSingleCurrentScore,
    RpSinglePerfect,
    RpSingleGreat,
    RpSingleGood,
    RpSingleAlmost,
    RpSingleBoo,
    RpCourse
)

rich_presence_conditional_display(
    ModeArcade && ArcadeNonstop && GsFailed && Double,
    "Failed {12} - {0} Double {1} {2} {3} {4} {5}: {6} {7}/{8}/{9}/{10}/{11}",
    RpSongTitle,
    RpDoubleDifficulty,
    RpDoubleFlat,
    RpDoubleLittle,
    RpDoubleTurn,
    RpDoubleVisible,
    RpDoubleCurrentScore,
    RpDoublePerfect,
    RpDoubleGreat,
    RpDoubleGood,
    RpDoubleAlmost,
    RpDoubleBoo,
    RpCourse
)

rich_presence_conditional_display(
    ModeArcade && !ArcadeNonstop && GsFailed && Single,
    "Failed {0} Single {1} {2} {3} {4} {5}: {6} {7}/{8}/{9}/{10}/{11}",
    RpSongTitle,
    RpSingleDifficulty,
    RpSingleFlat,
    RpSingleLittle,
    RpSingleTurn,
    RpSingleVisible,
    RpSingleCurrentScore,
    RpSinglePerfect,
    RpSingleGreat,
    RpSingleGood,
    RpSingleAlmost,
    RpSingleBoo
)

rich_presence_conditional_display(
    ModeArcade && !ArcadeNonstop && GsFailed && Double,
    "Failed {0} Double {1} {2} {3} {4} {5}: {6} {7}/{8}/{9}/{10}/{11}",
    RpSongTitle,
    RpDoubleDifficulty,
    RpDoubleFlat,
    RpDoubleLittle,
    RpDoubleTurn,
    RpDoubleVisible,
    RpDoubleCurrentScore,
    RpDoublePerfect,
    RpDoubleGreat,
    RpDoubleGood,
    RpDoubleAlmost,
    RpDoubleBoo
)

rich_presence_conditional_display(
    ModeArcade && ArcadeNonstop && GsNonstopFadeOut && Single,
    "Loading the next song in {12} - {0} Single {1} {2} {3} {4} {5}: {6} {7}/{8}/{9}/{10}/{11}",
    RpCourse,
    RpSingleDifficulty,
    RpSingleFlat,
    RpSingleLittle,
    RpSingleTurn,
    RpSingleVisible,
    RpSingleCurrentScore,
    RpSinglePerfect,
    RpSingleGreat,
    RpSingleGood,
    RpSingleAlmost,
    RpSingleBoo,
    RpCourse
)

rich_presence_conditional_display(
    ModeArcade && ArcadeNonstop && GsNonstopFadeOut && Double,
    "Loading the next song in {12} - {0} Double {1} {2} {3} {4} {5}: {6} {7}/{8}/{9}/{10}/{11}",
    RpCourse,
    RpDoubleDifficulty,
    RpDoubleFlat,
    RpDoubleLittle,
    RpDoubleTurn,
    RpDoubleVisible,
    RpDoubleCurrentScore,
    RpDoublePerfect,
    RpDoubleGreat,
    RpDoubleGood,
    RpDoubleAlmost,
    RpDoubleBoo,
    RpCourse
)

rich_presence_conditional_display(
    ModeArcade && ArcadeNonstop && GsNonstopFadeIn && Single,
    "About to play {12} - {0} Single {1} {2} {3} {4} {5}: {6} {7}/{8}/{9}/{10}/{11}",
    RpSongTitle,
    RpSingleDifficulty,
    RpSingleFlat,
    RpSingleLittle,
    RpSingleTurn,
    RpSingleVisible,
    RpSingleCurrentScore,
    RpSinglePerfect,
    RpSingleGreat,
    RpSingleGood,
    RpSingleAlmost,
    RpSingleBoo,
    RpCourse
)

rich_presence_conditional_display(
    ModeArcade && ArcadeNonstop && GsNonstopFadeIn && Double,
    "About to play {12} - {0} Double {1} {2} {3} {4} {5}: {6} {7}/{8}/{9}/{10}/{11}",
    RpSongTitle,
    RpDoubleDifficulty,
    RpDoubleFlat,
    RpDoubleLittle,
    RpDoubleTurn,
    RpDoubleVisible,
    RpDoubleCurrentScore,
    RpDoublePerfect,
    RpDoubleGreat,
    RpDoubleGood,
    RpDoubleAlmost,
    RpDoubleBoo,
    RpCourse
)

rich_presence_conditional_display(
    GsGameplay && ArcadeNonstop && Single,
    "Playing {12} - {0} Single {1} {2} {3} {4} {5}: {6} {7}/{8}/{9}/{10}/{11}",
    RpSongTitle,
    RpSingleDifficulty,
    RpSingleFlat,
    RpSingleLittle,
    RpSingleTurn,
    RpSingleVisible,
    RpSingleCurrentScore,
    RpSinglePerfect,
    RpSingleGreat,
    RpSingleGood,
    RpSingleAlmost,
    RpSingleBoo,
    RpCourse
)

rich_presence_conditional_display(
    GsGameplay && ArcadeNonstop && Double,
    "Playing {12} - {0} Double {1} {2} {3} {4} {5}: {6} {7}/{8}/{9}/{10}/{11}",
    RpSongTitle,
    RpDoubleDifficulty,
    RpDoubleFlat,
    RpDoubleLittle,
    RpDoubleTurn,
    RpDoubleVisible,
    RpDoubleCurrentScore,
    RpDoublePerfect,
    RpDoubleGreat,
    RpDoubleGood,
    RpDoubleAlmost,
    RpDoubleBoo,
    RpCourse
)

rich_presence_conditional_display(
    GsEvaluation && (ModeWorkout || ModeArcade) && Single,
    "Result of {0} Single {1} {2} {3} {4} {5}: {6} {7}/{8}/{9}/{10}/{11}",
    RpSongTitle,
    RpSingleDifficulty,
    RpSingleFlat,
    RpSingleLittle,
    RpSingleTurn,
    RpSingleVisible,
    RpSingleCurrentScore,
    RpSinglePerfect,
    RpSingleGreat,
    RpSingleGood,
    RpSingleAlmost,
    RpSingleBoo
)

rich_presence_conditional_display(
    GsEvaluation && (ModeWorkout || ModeArcade) && Double,
    "Result of {0} Double {1} {2} {3} {4} {5}: {6} {7}/{8}/{9}/{10}/{11}",
    RpSongTitle,
    RpDoubleDifficulty,
    RpDoubleFlat,
    RpDoubleLittle,
    RpDoubleTurn,
    RpDoubleVisible,
    RpDoubleCurrentScore,
    RpDoublePerfect,
    RpDoubleGreat,
    RpDoubleGood,
    RpDoubleAlmost,
    RpDoubleBoo
)

rich_presence_conditional_display(
    GsGameplay && (ModeWorkout || ModeArcade) && Single,
    "Playing {0} Single {1} {2} {3} {4} {5}: {6} {7}/{8}/{9}/{10}/{11}",
    RpSongTitle,
    RpSingleDifficulty,
    RpSingleFlat,
    RpSingleLittle,
    RpSingleTurn,
    RpSingleVisible,
    RpSingleCurrentScore,
    RpSinglePerfect,
    RpSingleGreat,
    RpSingleGood,
    RpSingleAlmost,
    RpSingleBoo
)

rich_presence_conditional_display(
    GsGameplay && (ModeWorkout || ModeArcade) && Double,
    "Playing {0} Double {1} {2} {3} {4} {5}: {6} {7}/{8}/{9}/{10}/{11}",
    RpSongTitle,
    RpDoubleDifficulty,
    RpDoubleFlat,
    RpDoubleLittle,
    RpDoubleTurn,
    RpDoubleVisible,
    RpDoubleCurrentScore,
    RpDoublePerfect,
    RpDoubleGreat,
    RpDoubleGood,
    RpDoubleAlmost,
    RpDoubleBoo
)

rich_presence_conditional_display(
    ArcadeNonstop && (GsChosenChart || GsLoadingChart) && Single,
    "About to play {6} - {0} Single {1} {2} {3} {4} {5}",
    RpSongTitle,
    RpSingleDifficulty,
    RpSingleFlat,
    RpSingleLittle,
    RpSingleTurn,
    RpSingleVisible,
    RpCourse
)

rich_presence_conditional_display(
    ArcadeNonstop && (GsChosenChart || GsLoadingChart) && Double,
    "About to play {6} - {0} Double {1} {2} {3} {4} {5}",
    RpSongTitle,
    RpDoubleDifficulty,
    RpDoubleFlat,
    RpDoubleLittle,
    RpDoubleTurn,
    RpDoubleVisible,
    RpCourse
)

rich_presence_conditional_display(
    (GsChosenChart || GsLoadingChart) && Single,
    "About to play {0} Single {1} {2} {3} {4} {5}",
    RpSongTitle,
    RpSingleDifficulty,
    RpSingleFlat,
    RpSingleLittle,
    RpSingleTurn,
    RpSingleVisible
)

rich_presence_conditional_display(
    (GsChosenChart || GsLoadingChart) && Double,
    "About to play {0} Double {1} {2} {3} {4} {5}",
    RpSongTitle,
    RpDoubleDifficulty,
    RpDoubleFlat,
    RpDoubleLittle,
    RpDoubleTurn,
    RpDoubleVisible
)

rich_presence_conditional_display(
    (GsSelectMusic || GsSelectDifficulty) && Single,
    "Thinking of playing {0} Single {1} {2} {3} {4} {5}",
    RpSongTitle,
    RpSingleDifficulty,
    RpSingleFlat,
    RpSingleLittle,
    RpSingleTurn,
    RpSingleVisible
)

rich_presence_conditional_display(
    (GsSelectMusic || GsSelectDifficulty) && Double,
    "Thinking of playing {0} Double {1} {2} {3} {4} {5}",
    RpSongTitle,
    RpDoubleDifficulty,
    RpDoubleFlat,
    RpDoubleLittle,
    RpDoubleTurn,
    RpDoubleVisible
)

rich_presence_conditional_display(
    GsTraining && Single,
    "Training on {0} Single {1}",
    RpSongTitle,
    RpSingleDifficulty
)

rich_presence_conditional_display(
    GsTraining && Double,
    "Training on {0} Double {1}",
    RpSongTitle,
    RpDoubleDifficulty
)

rich_presence_conditional_display(
    GsTraining,
    "Training on {0}",
    RpSongTitle
)

rich_presence_conditional_display(
    GsLesson,
    "Practicing Lesson {0} Section {1}",
    RpLesson,
    RpSection
)

rich_presence_conditional_display(
    GsRecords,
    "Looking at Their Accomplishments"
)

rich_presence_conditional_display(
    GsOptions,
    "Remembering to set Game Difficulty to 4 or higher"
)

rich_presence_conditional_display(
    GsCaution || GsSelectGameSettings || GsSelectGameMode,
    "Setting up their current game"
)

rich_presence_conditional_display(
    GsMainMenu,
    "Welcome to Dancing Stage Euromix"
)

rich_presence_conditional_display(
    GsLoadingGame || GsKonami || GsIntroMovie || GsDemo || GsHowToPlay || GsHighScores,
    "Preparing to Dance - Euromix Style"
)

rich_presence_display(
    "Preparing to Dance - Euromix Style"
)
