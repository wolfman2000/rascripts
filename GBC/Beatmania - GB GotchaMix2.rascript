// Beatmania GB - GotchaMix 2
// #ID = 4526

function Score(oneByte) {
    return low4(oneByte + 5) * 100000 +
        low4(oneByte + 4) * 10000 +
        low4(oneByte + 3) * 1000 +
        low4(oneByte + 2) * 100 +
        low4(oneByte + 1) * 10 +
        low4(oneByte)
}

OverallGamestate = word_be(0xc102)
GameplayGamestate = word_be(0xc116)

BootingUp = OverallGamestate < 0x0400
TitleScreens = OverallGamestate >= 0x0400 && OverallGamestate < 0x0500
Demo = OverallGamestate >= 0x0500 && OverallGamestate < 0x0600
NoGameplay = OverallGamestate < 0x0600

Credits = OverallGamestate == 0x0600

CourseMode = OverallGamestate == 0x0601
FreeMode = OverallGamestate == 0x0602
Mode1P = OverallGamestate >= 0x0601 && OverallGamestate <= 0x0602
Mode2P = OverallGamestate == 0x0603
Options = OverallGamestate == 0x0604
Password = OverallGamestate == 0x0605
// For pointer/add address shenanigans, bit0 works well.
CourseIndex = bit0(0xc103) == 1
CourseDiff = byte(0xd961)

CourseDjGrade = Credits && GameplayGamestate < 0x0100
CourseDjLevel = Credits &&
    GameplayGamestate >= 0x0100 && GameplayGamestate < 0x0200
CourseFinishTransition = Credits &&
    prev(GameplayGamestate) < 0x0200 && GameplayGamestate >= 0x0200
CourseFinish = Credits &&
    GameplayGamestate >= 0x0200 && GameplayGamestate < 0x0300
CoursePassword = Credits && GameplayGamestate >= 0x0300
CourseSelectHealth = CourseMode &&
    GameplayGamestate >= 0x0100 && GameplayGamestate < 0x0200
CourseSelectMods = CourseMode &&
    GameplayGamestate >= 0x0200 && GameplayGamestate < 0x0300
CourseSelectMusic = CourseMode &&
    GameplayGamestate >= 0x0300 && GameplayGamestate < 0x0400
CourseLoadingTransition = CourseMode && 
    prev(GameplayGamestate) < 0x0400 && GameplayGamestate >= 0x0400
CourseLoadingMusic = CourseMode && CourseDiff == 0 &&
    GameplayGamestate >= 0x0400 && GameplayGamestate < 0x0500
CoursePlayingMusic = CourseMode &&
    GameplayGamestate >= 0x0500 && GameplayGamestate < 0x0600
CourseEvalGeneral = CourseMode &&
    GameplayGamestate >= 0x0600 && GameplayGamestate < 0x0700
CourseExpertLoadingTransition = CourseMode && CourseDiff == 1 &&
    prev(GameplayGamestate) < 0x0900 && GameplayGamestate >= 0x0900 
CourseExpertLoadingMusic = CourseMode && CourseDiff == 1 &&
    GameplayGamestate >= 0x0900 && GameplayGamestate < 0x0a00
CourseExpertGeneral = CourseMode &&
    GameplayGamestate >= 0x0a00 && GameplayGamestate < 0x0b00
CourseEvalMessage = CourseMode && CourseDiff == 0 &&
    GameplayGamestate >= 0x060f && prev(GameplayGamestate) < 0x060f
CourseExpertMessage = CourseMode && CourseDiff == 1 &&
    GameplayGamestate >= 0x0b0f && prev(GameplayGamestate) < 0x0b0f
CourseContinue = CourseMode &&
    GameplayGamestate >= 0x0700 && GameplayGamestate < 0x0800
FreeSelectMusic = FreeMode && GameplayGamestate < 0x0100
FreeLoadingTransition = FreeMode &&
    prev(GameplayGamestate) < 0x0100 && GameplayGamestate >= 0x0100
FreeLoadingMusic = FreeMode &&
    GameplayGamestate >= 0x0100 && GameplayGamestate < 0x0200
FreePlayingMusic = FreeMode &&
    GameplayGamestate >= 0x0200 && GameplayGamestate < 0x0300
FreeEvalGeneral = FreeMode &&
    GameplayGamestate >= 0x0300 && GameplayGamestate < 0x0400
FreeEvalMessage = FreeMode &&
    GameplayGamestate >= 0x030f && prev(GameplayGamestate) < 0x030f
FreeContinue = FreeMode &&
    GameplayGamestate >= 0x0400 && GameplayGamestate < 0x0500

PersistentControlType = low4(0xc469)
TypeA = PersistentControlType == 0
TypeB = PersistentControlType == 1
TypeC = PersistentControlType == 2

ControlTypeLookup = {
    0: "A",
    1: "B",
    2: "C"
}

PersistentDifficulty = low4(0xc46a)
DiffEasy = PersistentDifficulty == 1
DiffNormal = PersistentDifficulty == 2
DiffHard = PersistentDifficulty == 3

DiffLookup = {
    1: "Easy",
    2: "Normal",
    3: "Hard"
}

LastJudgment = low4(0xc476)

PersistentConfig = low4(0xc575)
ConfigFull = PersistentConfig == 0
Config5 = PersistentConfig == 1
Config3 = PersistentConfig == 2
Config2 = PersistentConfig == 4

CurrentScoreOne = 0xd19c
TotalScoreOne = 0xd995

CourseMods = low4(0xc156)
HiddenModsOn = bit3(0xc156) == 1
Modifier = byte(0xd962)
NotAuto = bit2(0xd962) == 0
SongId = byte(0xd964)

SongTitleEnglishLookup = {
    0: "BAD COMMUNICATION",
    1: "BE TOGETHER",
    2: "DESIRE",
    3: "The Song of Ultra Seven",
    4: "Fire of Love, Three, Orange",
    5: "Cutie Honey",
    6: "Theme of Lupin III '78",
    7: "DREAMS",
    8: "LOVE machine",
    9: "Why...",
    10: "Like Being Wrapped Up...",
    11: "A Cruel Angel's Thesis",
    12: "TRUTH",
    13: "everybody goes",
    14: "Get Wild",
    15: "HOT LIMIT",
    16: "The Oath of the Galaxy",
    17: "Furuhata's Theme",
    18: "Lum's Love Song",
    19: "Romantic Flight",
    20: "Santa Claus Is My Lover",
    21: "Sazae Family",
    22: "Fly",
    23: "DEPARTURES",
    24: "Sunny Day Sunday",
}

SongDiffLookup = {
    0: 3,
    1: 2,
    2: 4,
    3: 3,
    4: 2,
    5: 3,
    6: 2,
    7: 3,
    8: 1,
    9: 5,
    10: 4,
    11: 2,
    12: 4,
    13: 1,
    14: 4,
    15: 1,
    16: 3,
    17: 5,
    18: 3,
    19: 1,
    20: 4,
    21: 3,
    22: 3,
    23: 2,
    24: 5
}

SongTitleLookup = {
    0: "BAD COMMUNICATION",
    1: "BE TOGETHER",
    2: "DESIRE",
    3: "ウルトラセブンの歌",
    4: "愛の火 3つ オレンジ",
    5: "キューティーハニー",
    6: "ルパン三世のテーマ'78",
    7: "DREAMS",
    8: "LOVE マシーン",
    9: "なぜ…",
    10: "つつみ込むように…",
    11: "残酷な天使のテーゼ",
    12: "TRUTH",
    13: "everybody goes",
    14: "Get Wild",
    15: "HOT LIMIT",
    16: "銀河の誓い",
    17: "警部補古畑任三郎のテーマ",
    18: "ラムのラブソング",
    19: "浪漫飛行",
    20: "恋人がサンタクロース",
    21: "サザエさん一家",
    22: "Fly",
    23: "DEPARTURES",
    24: "Sunny Day Sunday",
}


LifeBar = word(0xd1d0)
MaxLife = LifeBar == 0x24ff

PassedSongCourseNormal = CourseMode && CourseEvalMessage && CourseDiff == 0 && 
LifeBar >= 0x1900
PassedSongCourseExpert = CourseMode && CourseExpertMessage && CourseDiff == 1 && 
LifeBar != 0
FailedSongCourseNormal = CourseMode && CourseEvalMessage && CourseDiff == 0 && 
LifeBar < 0x1900
FailedSongCourseExpert = CourseMode && CourseExpertMessage && CourseDiff == 1 &&
LifeBar == 0
PassedSongCourse = PassedSongCourseExpert || PassedSongCourseNormal
PassedSongFree = (FreeMode && FreeEvalMessage && LifeBar >= 0x1900)
PassedSong = PassedSongCourse || PassedSongFree
MaxLifedSong = (CourseMode && CourseEvalMessage && MaxLife) ||
    (CourseMode && CourseExpertMessage && MaxLife) ||
    (FreeMode && FreeEvalMessage && MaxLife)

CourseModeHealth = byte(0xd961)

CourseNumber = low4(0xd965)

// A way to verify that the song is unlocked for scoring purposes.
UnlockedSongs = bitcount(0xd9f8)

GreatCount = word(0xe46e)
GoodCount = word(0xe470)
BadCount = word(0xe472)
PoorCount = word(0xe474)

// Dependent Functions

function GetNames(songId) {
    englishName = SongTitleEnglishLookup[songId]
    naturalName = SongTitleLookup[songId]
    unifiedName = englishName
    if (naturalName != englishName) {
        unifiedName = format("{0} [{1}]", naturalName, englishName)
    }
    return [englishName, naturalName, unifiedName]
}

AllowedButtons = {
    0x00: (PersistentConfig <= 1),
    0x01: (PersistentConfig <= 1),
    0x02: (PersistentConfig <= 1),
    0x03: (PersistentConfig == 0),
    0x04: (PersistentConfig <= 1),
    0x05: (PersistentConfig == 0),
    0x06: (PersistentConfig == 0),
    0x07: (PersistentConfig == 0),
    0x08: (PersistentConfig == 0),
    0x09: (PersistentConfig <= 1),
    0x0a: (PersistentConfig == 0),
    0x0b: (PersistentConfig == 0),
    0x0e: (PersistentConfig == 0),
    0x0c: (PersistentConfig <= 1),
    0x0d: (PersistentConfig <= 1),
    0x0f: (PersistentConfig <= 1),
    0x10: (PersistentConfig <= 1),
    0x11: (PersistentConfig == 0),
    0x12: (PersistentConfig == 0),
    0x13: (PersistentConfig == 0),
    0x14: (PersistentConfig == 0),
    0x15: (PersistentConfig == 0),
    0x16: (PersistentConfig == 0),
    0x17: (PersistentConfig <= 1),
    0x18: (PersistentConfig == 0),
}

AllowedButtonsOr = []
ForbiddenButtons = []
for i in AllowedButtons {
    array_push(AllowedButtonsOr, (SongId == i && AllowedButtons[i]))
    array_push(ForbiddenButtons,
        disable_when(
            once(SongId == i && !AllowedButtons[i] && CourseLoadingTransition),
            until=NoGameplay
        )
    )
    array_push(ForbiddenButtons,
        disable_when(
            once(SongId == i && !AllowedButtons[i] && FreeLoadingTransition),
            until=NoGameplay
        )
    )
}

// Achievements

function UnlockCheevo() {
    achievement(
        title = "All The Songs? Why Not?",
        points = 1,
        description = "Want 'maximum' fun? Enter the correct password.",
        trigger = Password && UnlockedSongs == 5
    )
}
UnlockCheevo()

// Get the control type ones out of the way.

ControlTitleLookup = {
    0: "Average Acceptance",
    1: "Button Bouncing",
    2: "Confusing Controller"
}

function ControlTypeCheevo(type) {
    typeLetter = ControlTypeLookup[type]
    achievement(
        title = ControlTitleLookup[type],
        points = 1,
        description = "Clear any song using control type " + typeLetter + ".",
        trigger = !DiffEasy && any_of(AllowedButtonsOr, e => e) && PersistentControlType == type && PassedSong
    )
}

for i in ControlTypeLookup {
    ControlTypeCheevo(i)
}

SmallButtonLookup = {
    1: "5",
    2: "3",
    4: "2",
}

function ControlConfigCheevo(type) {
    typeNum = SmallButtonLookup[type]
    achievement(
        title = format("{0}-Button Tryout", typeNum),
        points = 1,
        description = format("Clear any song using the {0}-Button configuration.", typeNum),
        trigger = !DiffEasy && PersistentConfig == type && PassedSong
    )
}

for i in SmallButtonLookup {
    ControlConfigCheevo(i)
}

GreatComboPointsLookup = {
    25: 5,
    50: 10,
    100: 25,
}

function GreatComboCheevo(target) {
    lastJudgeIndex = LastJudgment
    factor = lastJudgeIndex * 2
    achievement(
        title = format("{0} Great Combo", target),
        points = GreatComboPointsLookup[target],
        description = format("Get {0} greats in a row in one song. No extra poors allowed.", target),
        trigger = !DiffEasy && any_of(AllowedButtonsOr, e => e) && !NoGameplay &&
            measured(
                repeated(target, GreatCount > prev(GreatCount)),
                when=!NoGameplay
            ) &&
            never(GreatCount == 0) &&
            never(
                LastJudgment != 0 &&
                word(0xe46e + factor) != prev(word(0xe46e + factor))
            ) &&
            NotAuto
    )
}

for i in GreatComboPointsLookup {
    GreatComboCheevo(i)
}


function GreatSessionCheevo(target) {
    achievement(
        title = format("{0} Great Session", target),
        points = target / 100,
        description = format("Get {0} during your play session.", target),
        trigger = !DiffEasy && any_of(AllowedButtonsOr, e => e) && !NoGameplay &&
            measured(
                repeated(target, GreatCount > prev(GreatCount)),
                when=!NoGameplay
            ) && NotAuto
    )
}

GreatSessionCheevo(500)
GreatSessionCheevo(1000)

ModLookup = {
    0: (Modifier == 1 && !HiddenModsOn),
    1: (Modifier == 2 && !HiddenModsOn),
    2: (Modifier == 3 && !HiddenModsOn),
    3: (Modifier == 0 && HiddenModsOn),
    4: (Modifier == 1 && HiddenModsOn),
    5: (Modifier == 2 && HiddenModsOn),
    6: (Modifier == 3 && HiddenModsOn),
}

ModPointLookup = {
    0: 10,
    1: 10,
    2: 25,
    3: 25,
    4: 10,
    5: 25,
    6: 25
}

ModTitleLookup = {
    0: "Hide & Seek",
    1: "Juggling Act",
    2: "No Second Guessing",
    3: "Notes Begone!",
    4: "Peek-a-boo!",
    5: "Whack-a-mole",
    6: "Cross-Eyed"
}

ModNameLookup = {
    0: "Hidden",
    1: "Random",
    2: "Hidden + Random",
    3: "Stealth",
    4: "Sudden",
    5: "Sudden + Random",
    6: "Hidden + Sudden"
}

function ModsCheevo(index) {
    achievement(
        title = ModTitleLookup[index],
        points = ModPointLookup[index],
        description = format(
            "Clear any song using the {0} mod on Free mode. Easy is allowed.",
            ModNameLookup[index]
        ),
        trigger = any_of(AllowedButtonsOr, e => e) && PassedSong && ModLookup[index]
    )
}

for i in ModLookup {
    ModsCheevo(i)
}

GameClearTitleLookup = {
    6: "Hard Normal Game Start",
    7: "Hard Expert Game Start",
    4: "Normal Game Start",
    5: "Expert Game Start",
}

GameStartHealth = {
    0: "Normal",
    1: "Expert",
}

GameClearPointsLookup = {
    6: 10,
    7: 25,
    4: 5,
    5: 10,
}

function GameStartClearCheevo(health, diff) {
    desc = format("Clear Game Start using the {0} gauge", GameStartHealth[health])
    if (diff == 3) {
        desc = desc + " on Hard difficulty"
    }
    passedCourse = PassedSongCourseNormal
    if (health == 1) {
        passedCourse = PassedSongCourseExpert
    }
    desc = desc + "."
    achievement(
        title = GameClearTitleLookup[diff * 2 + health],
        points = GameClearPointsLookup[diff * 2 + health],
        description = desc,
        trigger = 
            PersistentDifficulty >= diff && CourseModeHealth == health &&
            CourseNumber == 4 && passedCourse &&
            all_of(ForbiddenButtons, f => f)
    )
}

GameStartClearCheevo(0, 2)
GameStartClearCheevo(1, 2)
GameStartClearCheevo(0, 3)
GameStartClearCheevo(1, 3)

ScoreToGradeLookup = {
    250000: "D",
    312500: "C",
    375000: "B",
    437500: "A",
}

ScoreToPointsLookup = {
    250000: 5,
    312500: 10,
    375000: 25,
    437500: 50,
}

function GameStartScoreCheevo(health, target) {
    passedCourse = PassedSongCourseNormal
    if (health == 1) {
        passedCourse = PassedSongCourseExpert
    }
    achievement(
        title = format("{0}-Rank {1}", ScoreToGradeLookup[target], GameStartHealth[health]),
        points = ScoreToPointsLookup[target],
        description = format(
            "Get {0} points or more in Game Start mode using the {1} gauge.",
            target,
            GameStartHealth[health]
        ),
        trigger = 
            !DiffEasy && CourseModeHealth == health && CourseNumber == 4 &&
            measured(Score(TotalScoreOne) >= target, when=CourseMode) && passedCourse &&
            all_of(ForbiddenButtons, f => f)
    )
}

for i in ScoreToGradeLookup {
    GameStartScoreCheevo(0, i)
    GameStartScoreCheevo(1, i)
}

function ArcadeCheevo() {
    target = []
    for i in SongDiffLookup {
        array_push(target, SongId == i && AllowedButtons[i] &&
            CourseNumber == SongDiffLookup[i] - 1 && PassedSongCourseExpert)
        array_push(target, SongId == i && AllowedButtons[i] &&
            CourseNumber == SongDiffLookup[i] - 1 && PassedSongCourseNormal)
    }
    achievement(
        title = "Just Like The Arcade",
        points = 25,
        description = "In Game Start mode, pass a 1, 2, 3, 4, and 5 ranked chart in " +
        "succession. Continues are banned.",
        trigger = !DiffEasy && CourseMode && never(NoGameplay) &&
            never(Score(TotalScoreOne) == 0) && tally(5, target)
    )
}

ArcadeCheevo()

function ClearSongCheevo(songId) {
    names = GetNames(songId)
    achievement(
        title = format("[{0}]", names[0]),
        points = SongDiffLookup[songId],
        description = format("Clear {0}. Easy can be used here.", names[2]),
        trigger = AllowedButtons[songId] && SongId == songId && PassedSong && NotAuto
    )
}

function ClearFullMeterCheevo(songId) {
    names = GetNames(songId)
    points = 5
    if SongDiffLookup[songId] == 5 {
        points = 10
    }
    achievement(
        title = format("[{0}] - Full Meter", names[0]),
        points = points,
        description = format("Clear {0} with a full meter.", names[2]),
        trigger = !DiffEasy && AllowedButtons[songId] && SongId == songId && MaxLifedSong
            && NotAuto
    )
}

function NoBadCheevo(songId) {
    names = GetNames(songId)
    points = 10
    if SongDiffLookup[songId] == 5 {
        points = 25
    }
    factor = LastJudgment * 2
    achievement(
        title = format("[{0}] - No Bads/Poors", names[0]),
        points = points,
        description = format("Clear {0} with no bads or poors.", names[2]),
        trigger = !DiffEasy && AllowedButtons[songId] && SongId == songId &&
            NotAuto &&
            ((
                once(byte(0xc116) == 5 && prev(byte(0xc116)) == 4) &&
                never(CoursePlayingMusic && BadCount > prev(BadCount)) &&
                never(CoursePlayingMusic && PoorCount > prev(PoorCount)) &&
                CourseEvalMessage
            ) || (
                once(byte(0xc116) == 5 && prev(byte(0xc116)) == 4) &&
                never(CourseExpertGeneral && BadCount > prev(BadCount)) &&
                never(CourseExpertGeneral && PoorCount > prev(PoorCount)) &&
                CourseExpertMessage
            ) || (
                once(byte(0xc116) == 2 && prev(byte(0xc116)) == 1) &&
                never(FreePlayingMusic && BadCount > prev(BadCount)) &&
                never(FreePlayingMusic && PoorCount > prev(PoorCount)) &&
                FreeEvalMessage
            ))
    )
}

function SongScoreCheevo(songId) {
    names = GetNames(songId)
    points = 10
    if SongDiffLookup[songId] == 5 {
        points = 25
    }
    achievement(
        title = format("[{0}] - B Rank", names[0]),
        points = points,
        description = format("Get 75000 points on {0} with Hard difficulty.", names[2]),
        trigger = DiffHard && AllowedButtons[songId] && SongId == songId &&
            NotAuto && Score(CurrentScoreOne) >= 75000 &&
        ((
            CourseMode && CourseEvalMessage
        ) || (
            CourseMode && CourseExpertMessage
        ) || (
            FreeMode && FreeEvalMessage
        ))
    )
}

for i in SongTitleLookup {
    ClearSongCheevo(i)
    ClearFullMeterCheevo(i)
    NoBadCheevo(i)
    SongScoreCheevo(i)
}

function FullGreatCombo() {
    lastJudgeIndex = LastJudgment
    factor = lastJudgeIndex * 2
    achievement(
    title = "Sorry Folks, It's Tradition",
    points = 50,
    description = "Get all greats on one song of your choice on Normal or Hard.",
    trigger = !DiffEasy && any_of(AllowedButtonsOr, a => a) && NotAuto &&
        ((
            once(byte(0xc116) == 5 && prev(byte(0xc116)) == 4) &&
            never(CoursePlayingMusic && GoodCount > prev(GoodCount)) &&
            never(CoursePlayingMusic && BadCount > prev(BadCount)) &&
            never(CoursePlayingMusic && PoorCount > prev(PoorCount)) &&
            CourseEvalMessage
        ) ||
        (
            once(byte(0xc116) == 5 && prev(byte(0xc116)) == 4) &&
            never(CourseExpertGeneral && GoodCount > prev(GoodCount)) &&
            never(CourseExpertGeneral && BadCount > prev(BadCount)) &&
            never(CourseExpertGeneral && PoorCount > prev(PoorCount)) &&
            CourseExpertMessage
        ) || (
            once(byte(0xc116) == 2 && prev(byte(0xc116)) == 1) &&
            never(FreePlayingMusic && GoodCount > prev(GoodCount)) &&
            never(FreePlayingMusic && BadCount > prev(BadCount)) &&
            never(FreePlayingMusic && PoorCount > prev(PoorCount))
            && FreeEvalMessage
        ))
    )
}

FullGreatCombo()

// Leaderboards

function GameStartMoneyScore(health, diff) {
    passedCourse = PassedSongCourseNormal
    if (health == 1) {
        passedCourse = PassedSongCourseExpert
    }
    lead = "Game Start"
    if (diff == 3) {
        lead = "Hard " + lead
    }
    leaderboard(
        title = format("{1} {0} Money Score", GameStartHealth[health], lead),
        description = "Get the highest money score you can over five songs.",
        start = PersistentDifficulty == diff && CourseModeHealth == health &&
            CourseNumber == 4 && passedCourse &&
            all_of(ForbiddenButtons, f => f),
        cancel = always_false(),
        submit = always_true(),
        value = Score(TotalScoreOne),
        format = "SCORE"
    )
}

function GameStartExScore(health, diff) {
    lead = "Game Start"
    if (diff == 3) {
        lead = "Hard " + lead
    }
    leaderboard(
        title = format("{1} {0} EX Score", GameStartHealth[health], lead),
        description = "Get the highest EX score you can over five songs.",
        start = PersistentDifficulty == diff && CourseModeHealth == health &&
            CourseNumber == 4 && CourseFinishTransition &&
            all_of(ForbiddenButtons, f => f),
        cancel = always_false(),
        submit = always_true(),
        value = word(0xd740) * 5 + word(0xd742) +
            word(0xd748) * 5 + word(0xd74a) +
            word(0xd750) * 5 + word(0xd752) +
            word(0xd758) * 5 + word(0xd75a) +
            word(0xd760) * 5 + word(0xd762),
        format = "VALUE"
    )
}

GameStartMoneyScore(0, 2)
GameStartExScore(0, 2)
GameStartMoneyScore(1, 2)
GameStartExScore(1, 2)
GameStartMoneyScore(0, 3)
GameStartExScore(0, 3)
GameStartMoneyScore(1, 3)
GameStartExScore(1, 3)

function SingleSongMoneyScore(songId, diff) {
    names = GetNames(songId)
    leaderboard(
        title = format("[{0}] Money Score {1}", names[0], DiffLookup[diff]),
        description = format(
            "Get the highest money score you can on {0}, {1} difficulty. Failing is allowed.",
            names[2],
            DiffLookup[diff]
        ),
        start = PersistentDifficulty == diff && SongId == songId &&
            AllowedButtons[songId] && (FreeEvalMessage || CourseEvalMessage || CourseExpertMessage),
        cancel = always_false(),
        submit = always_true(),
        value = Score(CurrentScoreOne),
        format = "SCORE"
    )
}

function SingleSongExScore(songId, diff) {
    names = GetNames(songId)
    leaderboard(
        title = format("[{0}] EX Score {1}", names[0], DiffLookup[diff]),
        description = format(
            "Get the highest EX score you can on {0}, {1} difficulty. Failing is allowed.",
            names[2],
            DiffLookup[diff]
        ),
        start = PersistentDifficulty == diff && SongId == songId &&
            AllowedButtons[songId] && (FreeEvalMessage || CourseEvalMessage || CourseExpertMessage),
        cancel = always_false(),
        submit = always_true(),
        value = GreatCount * 5 + GoodCount,
        format = "SCORE"
    )
}

for i in SongTitleLookup {
    SingleSongMoneyScore(i, 2)
    SingleSongExScore(i, 2)
    SingleSongMoneyScore(i, 3)
    SingleSongExScore(i, 3)
}

// Rich Presence

JapTitle = "ガッチャミックス2"

FinalGrade = {
    0: "H",
    1: "G",
    2: "F",
    3: "E",
    4: "D",
    5: "C",
    6: "B",
    7: "A"
}

CourseModLookup = {
    1: "on Hidden",
    2: "on Random",
    3: "on Hidden + Random",
    8: "on Stealth",
    9: "on Sudden",
    10: "on Sudden",
    11: "on Hidden + Sudden"
}
MoneyBag = "💰"

RpPassedSongCourseNormal = CourseEvalGeneral && CourseDiff == 0 && 
LifeBar >= 0x1900
RpPassedSongCourseExpert = CourseEvalGeneral && CourseDiff == 1 && 
LifeBar != 0
RpFailedSongCourseNormal = CourseEvalGeneral && CourseDiff == 0 && 
LifeBar < 0x1900
RpFailedSongCourseExpert = CourseEvalGeneral && CourseDiff == 1 &&
LifeBar == 0
RpPassedSongFree = (FreeEvalGeneral || FreeContinue) && LifeBar >= 0x1900
RpFailedSongFree = (FreeEvalGeneral || FreeContinue) && LifeBar < 0x1900

RpHealth = rich_presence_lookup("Health", CourseDiff, GameStartHealth)
RpSong = rich_presence_lookup("Song", SongId, SongTitleLookup, "Something Random")
RpCourseMod = rich_presence_lookup("Mod", CourseMods, CourseModLookup, "with no mod")
RpCourseMod2 = rich_presence_lookup("Mod2", CourseMods, CourseModLookup)
RpFreeMod = rich_presence_lookup("Mod", Modifier, CourseModLookup, "with no mod")
RpFreeMod2 = rich_presence_lookup("Mod2", Modifier, CourseModLookup)
RpCourseNumber = rich_presence_macro("Number", CourseNumber + 1)
RpSongScore = rich_presence_macro("Number", Score(CurrentScoreOne))
RpTotalScore = rich_presence_macro("Number", Score(TotalScoreOne))
RpGreat = rich_presence_macro("Number", GreatCount)
RpGood = rich_presence_macro("Number", GoodCount)
RpBad = rich_presence_macro("Number", BadCount)
RpPoor = rich_presence_macro("Number", PoorCount)

RpDjGrade = rich_presence_lookup("DjGrade", byte(0xc143), FinalGrade)

RpDjGreat1 = rich_presence_macro("Number", word(0xd740))
RpDjGood1 = rich_presence_macro("Number", word(0xd742))
RpDjBad1 = rich_presence_macro("Number", word(0xd744))
RpDjPoor1 = rich_presence_macro("Number", word(0xd746))
RpDjGreat2 = rich_presence_macro("Number", word(0xd748))
RpDjGood2 = rich_presence_macro("Number", word(0xd74a))
RpDjBad2 = rich_presence_macro("Number", word(0xd74c))
RpDjPoor2 = rich_presence_macro("Number", word(0xd74e))
RpDjGreat3 = rich_presence_macro("Number", word(0xd750))
RpDjGood3 = rich_presence_macro("Number", word(0xd752))
RpDjBad3 = rich_presence_macro("Number", word(0xd754))
RpDjPoor3 = rich_presence_macro("Number", word(0xd756))
RpDjGreat4 = rich_presence_macro("Number", word(0xd758))
RpDjGood4 = rich_presence_macro("Number", word(0xd75a))
RpDjBad4 = rich_presence_macro("Number", word(0xd75c))
RpDjPoor4 = rich_presence_macro("Number", word(0xd75e))
RpDjGreat5 = rich_presence_macro("Number", word(0xd760))
RpDjGood5 = rich_presence_macro("Number", word(0xd762))
RpDjBad5 = rich_presence_macro("Number", word(0xd764))
RpDjPoor5 = rich_presence_macro("Number", word(0xd766))

rich_presence_conditional_display(
    CoursePassword,
    "Picking up a (kind of pointless?) password in Beatmania GB - {0}",
    JapTitle
)

rich_presence_conditional_display(
    CourseFinish,
    "Congrats on finishing Beatmania GB - {0}",
    JapTitle
)

rich_presence_conditional_display(
    CourseDjLevel,
    "Step by step breakdown via stage: {0}/{1}/{2}/{3} {4}/{5}/{6}/{7} {8}/{9}/{10}/{11} " +
    "{12}/{13}/{14}/{15} {16}/{17}/{18}/{19}",
    RpDjGreat1,
    RpDjGood1,
    RpDjBad1,
    RpDjPoor1,
    RpDjGreat2,
    RpDjGood2,
    RpDjBad2,
    RpDjPoor2,
    RpDjGreat3,
    RpDjGood3,
    RpDjBad3,
    RpDjPoor3,
    RpDjGreat4,
    RpDjGood4,
    RpDjBad4,
    RpDjPoor4,
    RpDjGreat5,
    RpDjGood5,
    RpDjBad5,
    RpDjPoor5
)

rich_presence_conditional_display(
    CourseDjGrade,
    "Your DJ Level A~H is: {0} | {1}{2}",
    RpDjGrade,
    MoneyBag,
    RpTotalScore
)

rich_presence_conditional_display(
    RpPassedSongCourseNormal || RpPassedSongCourseExpert,
    "Passed {0} {1} for round {2} | {3}{4}/{9} | {5}/{6}/{7}/{8}",
    RpSong,
    RpCourseMod2,
    RpCourseNumber,
    MoneyBag,
    RpSongScore,
    RpGreat,
    RpGood,
    RpBad,
    RpPoor,
    RpTotalScore
)

rich_presence_conditional_display(
    RpFailedSongCourseNormal || RpFailedSongCourseExpert || CourseContinue,
    "Failed {0} {1} for round {2} | {3}{4} | {5}/{6}/{7}/{8}",
    RpSong,
    RpCourseMod2,
    RpCourseNumber,
    MoneyBag,
    RpSongScore,
    RpGreat,
    RpGood,
    RpBad,
    RpPoor
)

rich_presence_conditional_display(
    CourseEvalGeneral || CourseExpertGeneral,
    "Results of {0} {1} for round {2} being calculated | {3}{4} | {5}/{6}/{7}/{8}",
    RpSong,
    RpCourseMod2,
    RpCourseNumber,
    MoneyBag,
    RpSongScore,
    RpGreat,
    RpGood,
    RpBad,
    RpPoor
)

rich_presence_conditional_display(
    RpFailedSongFree && !HiddenModsOn,
    "Failed {0} {1} on free mode | {2}{3} | {4}/{5}/{6}/{7}",
    RpSong,
    RpFreeMod2,
    MoneyBag,
    RpSongScore,
    RpGreat,
    RpGood,
    RpBad,
    RpPoor
)

rich_presence_conditional_display(
    RpFailedSongFree && HiddenModsOn,
    "Failed {0} {1} on free mode | {2}{3} | {4}/{5}/{6}/{7}",
    RpSong,
    RpCourseMod2,
    MoneyBag,
    RpSongScore,
    RpGreat,
    RpGood,
    RpBad,
    RpPoor
)

rich_presence_conditional_display(
    RpPassedSongFree && HiddenModsOn,
    "Passed {0} {1} on free mode | {2}{3} | {4}/{5}/{6}/{7}",
    RpSong,
    RpCourseMod2,
    MoneyBag,
    RpSongScore,
    RpGreat,
    RpGood,
    RpBad,
    RpPoor
)

rich_presence_conditional_display(
    RpPassedSongFree && !HiddenModsOn,
    "Passed {0} {1} on free mode | {2}{3} | {4}/{5}/{6}/{7}",
    RpSong,
    RpFreeMod2,
    MoneyBag,
    RpSongScore,
    RpGreat,
    RpGood,
    RpBad,
    RpPoor
)

rich_presence_conditional_display(
    CoursePlayingMusic || CourseExpertGeneral,
    "Playing {0} {1} for round {2} | {3}{4} | {5}/{6}/{7}/{8}",
    RpSong,
    RpCourseMod2,
    RpCourseNumber,
    MoneyBag,
    RpSongScore,
    RpGreat,
    RpGood,
    RpBad,
    RpPoor
)

rich_presence_conditional_display(
    FreePlayingMusic && !HiddenModsOn,
    "Playing {0} {1} on free mode | {2}{3} | {4}/{5}/{6}/{7}",
    RpSong,
    RpFreeMod2,
    MoneyBag,
    RpSongScore,
    RpGreat,
    RpGood,
    RpBad,
    RpPoor
)

rich_presence_conditional_display(
    FreePlayingMusic && HiddenModsOn,
    "Playing {0} {1} on free mode | {2}{3} | {4}/{5}/{6}/{7}",
    RpSong,
    RpCourseMod2,
    MoneyBag,
    RpSongScore,
    RpGreat,
    RpGood,
    RpBad,
    RpPoor
)

rich_presence_conditional_display(
    CourseLoadingMusic,
    "Loading the chart of {0} {1} for round {2} | {3}{4}",
    RpSong,
    RpCourseMod2,
    RpCourseNumber,
    MoneyBag,
    RpTotalScore
)

rich_presence_conditional_display(
    FreeLoadingMusic && !HiddenModsOn,
    "Loading the chart of {0} {1} on free mode",
    RpSong,
    RpFreeMod2
)

rich_presence_conditional_display(
    FreeLoadingMusic && HiddenModsOn,
    "Loading the chart of {0} {1} on free mode",
    RpSong,
    RpCourseMod2
)

rich_presence_conditional_display(
    CourseSelectMusic,
    "Thinking of playing {0} {1} for round {2} | {3}{4}",
    RpSong,
    RpCourseMod2,
    RpCourseNumber,
    MoneyBag,
    RpTotalScore
)

rich_presence_conditional_display(
    FreeSelectMusic && !HiddenModsOn,
    "Thinking of playing {0} {1} on free mode",
    RpSong,
    RpFreeMod2
)

rich_presence_conditional_display(
    FreeSelectMusic && HiddenModsOn,
    "Thinking of playing {0} {1} on free mode",
    RpSong,
    RpCourseMod2
)

rich_presence_conditional_display(
    CourseSelectHealth,
    "Entering the game, selecting health meter style: thinking {0}",
    RpHealth
)

rich_presence_conditional_display(
    CourseSelectMods,
    "Selecting mods for course mode: thinking of playing {0}",
    RpCourseMod
)

rich_presence_conditional_display(
    NoGameplay || Options,
    "Setting up the turntables for Beatmania GB - {0}",
    JapTitle
)

rich_presence_conditional_display(
    Password,
    "Unlocking songs for Beatmania GB - {0}",
    JapTitle
)

rich_presence_display(
    "Playing Beatmania GB - {0}",
    JapTitle
)
