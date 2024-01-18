// Dance Dance Revolution 4th Mix
// #ID = 19153

// Variables Below

// What is our general game state?
// Sometimes multiple screens share the same state.
GameState = byte(0x0c30a8)

Initializing = GameState == 0x00

// This batch is shared between Main, Solo, and Diet
LoadingSong = GameState == 0x01
AreYouReady = GameState == 0x02
HereWeGo = GameState == 0x04
EndOfSong = GameState == 0x05
EvaluationScreen = GameState == 0x06
GameModeSettings = GameState == 0x09
GroupSelection = GameState == 0x0b
SongSelection = GameState == 0x0c
DifficultySelection = GameState == 0x0d

// The rest of the batch is mostly solitary items.
CautionScreen = GameState == 0x1a
MainMenu = GameState == 0x1c
KonamiJingle = GameState == 0x1e
IntroScreens = GameState == 0x1f
DancemaniaAd = GameState == 0x20
ShowMeYourMoves = GameState == 0x21
TitleScreen = GameState == 0x22
DemoPlay = GameState == 0x23
HowToPlay = GameState == 0x24
LessonMode = GameState == 0x2e
TrainingMode = GameState == 0x2f
EditMode = GameState == 0x30
NonstopOrderMode = GameState == 0x32
ViewingRecords = GameState == 0x33
OptionsMenu = GameState == 0x34
InfoMenu = GameState == 0x35
ChallengeMode = GameState == 0x38
ArcadeLink = GameState == 0x39

// What style is active on gameplay?
// This is not used for Challenge Mode, but that's irrelevant there.
Style = low4(0x0c30c0)
Single = Style == 1
Double = Style == 2
Versus = Style == 5
Solo = Style == 10

// Which style are we on (influenced via lead player)?
PlayerStyle = low4(0x0c4382)
SinglePlayOnly = PlayerStyle <= 1

// What is the internal game difficulty?
// Disable most cheevos when this is less than the default.
InternalGameDifficulty = low4(0x0e4e38)
InternalDifficultyEasy = InternalGameDifficulty < 3

// How many songs were cleared in total? This could be a word.
// This assumes the regular mode for unlocking purposes. Mods can be used.
TotalSongsCleared = byte(0x0e4e18)

// What stage number are we on?
// This is set to 0xffff if not in a proper game mode.
ActiveStageNumber = word(0x0c30b4)
// Are we actually in a game mode?
InGameMode = ActiveStageNumber != 0xffff

// Is someone in training mode? Mainly for RP purposes.
InTrainingMode = byte(0x0e3f3e) == 0x04

// Which piece of music is loaded?
SongId = byte(0x0be866)

SongP59 = 0x27
Song1234 = 0x1c
SongB4U = 0x10
SongBaby = 0x37
SongBoys = 0x0f
SongBumble = 0x21
SongBurn = 0x11
SongDam = 0x09
SongDance = 0x1f
SongDont = 0x2d
SongDream = 0x1b
SongEat = 0x2c
SongEra = 0x05
SongFollow = 0x08
SongFuru = 0x0d
SongGetMe = 0x30
SongGimme = 0x17
SongGotcha = 0x28
SongGroove = 0x2e
SongHaveMellow = 0x0c
SongHeroHappy = 0x0a
SongHeroKcp = 0x2f
SongHigher = 0x29
SongHolic = 0x12
SongHypno = 0x26
SongIfYou = 0x0b
SongInHeat = 0x23
SongItOnly = 0x19
SongKick = 0x1a
SongLead = 0x13
SongLets = 0x35
SongLove = 0x14
SongMake = 0x33
SongMidnite = 0x15
SongMusic = 0x1d
SongMy = 0x36
SongNeverGonna = 0x24
SongNeverLet = 0x31
SongNight = 0x2a
SongOneTwo = 0x18
SongOnly = 0x04
SongOrionAM = 0x02
SongOrionCiv = 0x03
SongPink = 0x25
SongSaint = 0x07
SongShake = 0x34
SongShare = 0x32
SongShooting = 0x0e
SongSynchro = 0x16
SongThe7 = 0x22
SongTrip = 0x06
SongWalk = 0x20
SongXana = 0x2b
SongYoung = 0x1e

SongOrderLookup = {
    SongP59: 0,
    Song1234: 1,
    SongB4U: 2,
    SongBaby: 3,
    SongBoys: 4,
    SongBumble: 5,
    SongBurn: 6,
    SongDam: 7,
    SongDance: 8,
    SongDont: 9,
    SongDream: 10,
    SongEat: 11,
    SongEra: 12,
    SongFollow: 13,
    SongFuru: 14,
    SongGetMe: 15,
    SongGimme: 16,
    SongGotcha: 17,
    SongGroove: 18,
    SongHaveMellow: 19,
    SongHeroHappy: 20,
    SongHeroKcp: 21,
    SongHigher: 22,
    SongHolic: 23,
    SongHypno: 24,
    SongIfYou: 25,
    SongInHeat: 26,
    SongItOnly: 27,
    SongKick: 28,
    SongLead: 29,
    SongLets: 30,
    SongLove: 31,
    SongMake: 32,
    SongMidnite: 33,
    SongMusic: 34,
    SongMy: 35,
    SongNeverGonna: 36,
    SongNeverLet: 37,
    SongNight: 38,
    SongOneTwo: 39,
    SongOnly: 40,
    SongOrionAM: 41,
    SongOrionCiv: 42,
    SongPink: 43,
    SongSaint: 44,
    SongShake: 45,
    SongShare: 46,
    SongShooting: 47,
    SongSynchro: 48,
    SongThe7: 49,
    SongTrip: 50,
    SongWalk: 51,
    SongXana: 52,
    SongYoung: 53
}

DemoP59 = 0x40
Demo1234 = 0x68
DemoB4U = 0x63
DemoBaby = 0x5f
DemoBoys = 0x65
DemoBumble = 0x61
DemoBurn = 0x3b
DemoDam = 0x66
DemoDance = 0x46
DemoDont = 0x75
DemoDream = 0x5b
DemoEat = 0x69
DemoEra = 0x56
DemoFollow = 0x4f
DemoFuru = 0x59
DemoGetMe = 0x5e
DemoGimme = 0x42
DemoGotcha = 0x44
DemoGroove = 0x6b
DemoHaveMellow = 0x6c
DemoHeroHappy = 0x50
DemoHeroKcp = 0x3f
DemoHigher = 0x4b
DemoHolic = 0x54
DemoHypno = 0x74
DemoIfYou = 0x5a
DemoInHeat = 0x70
DemoItOnly = 0x3c
DemoKick = 0x55
DemoLead = 0x72
DemoLets = 0x45
DemoLove = 0x5c
DemoMake = 0x52
DemoMidnite = 0x6a
DemoMusic = 0x49
DemoMy = 0x53
DemoNeverGonna = 0x4c
DemoNeverLet = 0x67
DemoNight = 0x51
DemoOneTwo = 0x62
DemoOnly = 0x58
DemoOrionAM = 0x64
DemoOrionCiv = 0x4d
DemoPink = 0x43
DemoSaint = 0x48
DemoShake = 0x71
DemoShare = 0x6d
DemoShooting = 0x5d
DemoSynchro = 0x60
DemoThe7 = 0x4a
DemoTrip = 0x73
DemoWalk = 0x6f
DemoXana = 0x6e
DemoYoung = 0x3e

MiscSelectStyle = 0x41
MiscChallengeMode = 0x47
MiscChallengeSetCompleted = 0x38

// Which mode are we in?
TraditionalGame = low4(0x0e3f3e) == 0
SoloGame = low4(0x0e3f3e) == 1

// Which players are active?
// This does NOT work for Challenge Mode...which sucks.
Player1Active = bit0(0x0c30a0) == 1
Player2Active = bit1(0x0c30a0) == 1
BothPlayersActive = Player1Active && Player2Active
PlayerOffset = bit1(0x0c30a0) * 0x1264

// Which field is active during gameplay?
// This matters more for Challenge Mode
Player1FieldActive = byte(0x0c30c8) > 0
Player2FieldActive = byte(0x0c432c) > 0
PlayerAFieldActive = byte(0x0c30c8 + PlayerOffset) > 0

// Which player will have calculations used on?
// This value is ONLY useful if two players aren't active at once!
ActiveFieldOffset = byte(0x0c30c8) * 0x499

// Is the Little Mod turned on?
Player1LittleOn = bit2(0x0c3124) == 1
Player2LittleOn = bit2(0x0c4388) == 1
PlayerALittleOn = bit2(0x0c3124 + ActiveFieldOffset) == 1

// How much life bar do we have?
// The legitimate max is 0x03e8.
Player1GrooveGauge = word(0x0c30d2)
Player2GrooveGauge = word(0x0c4336)
PlayerAGrooveGauge = word(0x0c30d2 + ActiveFieldOffset)

// Which difficulty are we on?
Player1Difficulty = low4(0x0c311c)
Player2Difficulty = low4(0x0c4380)
PlayerADifficulty = low4(0x0c311c + ActiveFieldOffset)
Player1DiffBasic = Player1Difficulty == 1
Player2DiffBasic = Player2Difficulty == 1
PlayerADiffBasic = PlayerADifficulty == 1
Player1DiffTrick = Player1Difficulty == 2
Player2DiffTrick = Player2Difficulty == 2
PlayerADiffTrick = PlayerADifficulty == 2
Player1DiffManiac = Player1Difficulty == 3
Player2DiffManiac = Player2Difficulty == 3
PlayerADiffManiac = PlayerADifficulty == 3

// Was a song failed in Game Mode?
Player1FailedChart = bit0(0x0c42fe) == 1
Player2FailedChart = bit0(0x0c5562) == 1
PlayerAFailedChart = bit0(0x0c42fe + ActiveFieldOffset) == 1
// This is only active if both players are in a failure state at once.
AllPlayersFailed = bit0(0x0c30b8) == 1

// What is the score?
Player1Score = dword(0x0c30dc)
Player2Score = dword(0x0c4340)
PlayerAScore = dword(0x0c30dc + ActiveFieldOffset)

Player1StageScore = dword(0x0c30dc) - dword(0x0c30d8)
Player2StageScore = dword(0x0c4340) - dword(0x0c433c)
PlayerAStageScore = dword(0x0c30dc + PlayerOffset) - dword(0x0c30d8 + PlayerOffset)

// How many Perfects?
Player1Perfects = word(0x0c3128)
Player2Perfects = word(0x0c438c)
PlayerAPerfects = word(0x0c3128 + ActiveFieldOffset)

// How many Greats?
Player1Greats = word(0x0c312c)
Player2Greats = word(0x0c4390)
PlayerAGreats = word(0x0c312c + ActiveFieldOffset)

// How many Goods?
Player1Goods = word(0x0c3130)
Player2Goods = word(0x0c4394)
PlayerAGoods = word(0x0c3130 + ActiveFieldOffset)

// How many Boos?
Player1Boos = word(0x0c3134)
Player2Boos = word(0x0c4398)
PlayerABoos = word(0x0c3134 + ActiveFieldOffset)

// How many Misses?
Player1Misses = word(0x0c3138)
Player2Misses = word(0x0c439c)
PlayerAMisses = word(0x0c3138 + ActiveFieldOffset)

// What judgments were earned during the song for Player 1?
Player1NotesScored = word(0x0c3140)
Player1CurrentCombo = word(0x0c42e8)
Player1MaxCombo = word(0x0c3144)
Player1Grade = low4(0x0c3148)

// What judgments were earned during the song for Player 2?
Player2NotesScored = word(0x0c43a4)
Player2CurrentCombo = word(0x0c554c)
Player2MaxCombo = word(0x0c43a8)
Player2Grade = low4(0x0c43ac)

PlayerANotesScored = word(0x0c3140 + ActiveFieldOffset)
PlayerACurrentCombo = word(0x0c42e8 + ActiveFieldOffset)
PlayerAMaxCombo = word(0x0c3144 + ActiveFieldOffset)
PlayerAGrade = low4(0x0c3148 + ActiveFieldOffset)

// What is the status of the current Challenge in Challenge Mode?

ChallengeSet = low4(0x0f6180)
ChallengeNumberInSet = low4(0x0f6181)
ChallengeMarker = byte(0x0f6210)
ChallengeMarkerStart = 0x78
ChallengeMarkerFailed = 0x48
ChallengeMarkerPassed = 0x58

// Did the player pass the challenge?
// This byte only flips if the situation changes between challenges.
// Be careful when utilizing this one.
ChallengeModePassed = byte(0x0f6182)

StartedChallenge = repeated(20, ChallengeNumberInSet == ChallengeMarkerStart)
FailedChallenge = repeated(10, ChallengeNumberInSet == ChallengeMarkerFailed)
PassedChallenge = repeated(10, ChallengeNumberInSet == ChallengeMarkerPassed)

// Only use this when on the evaluation screen.
PlayerEvalScore = dword(0x1ffe90)

AllSongIdLookup = {
    0x01: "Konami Jingle",
    SongOrionAM: "ORION.78 (AMeuro-MIX)",
    SongOrionCiv: "ORION.78 ～civilization mix～",
    SongOnly: "ONLY YOU",
    SongEra: "era (nostalmix)",
    SongTrip: "TRIP MACHINE CLIMAX",
    SongSaint: "SAINT GOES MARCHING (REMIX)",
    SongFollow: "FOLLOW THE SUN (90 IN THE SHADE MIX)",
    SongDam: "DAM DARIRAM (KCP MIX)",
    SongHeroHappy: "HERO (HAPPY GRANDALE MIX)",
    SongIfYou: "IF YOU WERE HERE (B4 ZA BEAT MIX)",
    SongHaveMellow: "HAVE YOU NEVER BEEN MELLOW (MM GROOVIN MIX)",
    SongFuru: "FURUHATA'S THEME",
    SongShooting: "SHOOTING STAR",
    SongBoys: "BOYS (EURO MIX)",
    SongB4U: "B4U",
    SongBurn: "BURNIN' THE FLOOR",
    SongHolic: "Holic",
    SongLead: "LEADING CYBER",
    SongLove: "LOVE AGAIN TONIGHT (For Melissa MIX)",
    SongMidnite: "Midnite Blaze",
    SongSynchro: "SYNCHRONIZED LOVE (Red Monster Hyper Mix)",
    SongGimme: "GIMME GIMME GIMME",
    SongOneTwo: "ONE TWO (LITTLE BITCH)",
    SongItOnly: "IT ONLY TAKES A MINUTE (Extended Remix)",
    SongKick: "KICK THE CAN",
    SongDream: "DREAM A DREAM",
    Song1234: "1,2,3,4,007",
    SongMusic: "MUSIC",
    SongYoung: "Young Forever",
    SongDance: "DANCING ALL ALONE",
    SongWalk: "WALKIE TALKIE",
    SongBumble: "BUMBLE BEE",
    SongThe7: "THE 7 JUMP",
    SongInHeat: "IN THE HEAT OF THE NIGHT",
    SongNeverGonna: "NEVER GONNA MAKE (FACTORY DANCE TEAM MIX)",
    SongPink: "PINK DINOSAUR",
    SongHypno: "HYPNØTIC CRISIS",
    SongP59: ".59",
    SongGotcha: "GOTCHA (The Theme from STARSKY & HUTCH)",
    SongHigher: "HIGHER",
    SongNight: "NIGHT IN MOTION",
    SongXana: "XANADU",
    SongEat: "EAT YOU UP",
    SongDont: "Don't Stop! (AMD 2nd MIX)",
    SongGroove: "GROOVE",
    SongHeroKcp: "HERO (KCP DISCOTIQUE MIX)",
    SongGetMe: "Get me in your sight (AMD CANCUN MIX)",
    SongNeverLet: "never let you down",
    SongShare: "Share My Love",
    SongMake: "Make Your Move",
    SongShake: "SHAKE YOUR BOOTY",
    SongLets: "Let's talk it over",
    SongMy: "MY SUMMER LOVE",
    SongBaby: "BABY BABY GIMME YOUR LOVE",
    MiscChallengeSetCompleted: "Can't Stop Fallin' In Love",
    0x3a: "After The Game",
    DemoBurn: "BURNIN' THE FLOOR",
    DemoItOnly: "IT ONLY TAKES A MINUTE (Extended Remix)",
    DemoYoung: "Young Forever",
    DemoHeroKcp: "HERO (KCP DISCOTIQUE MIX)",
    DemoP59: ".59",
    MiscSelectStyle: "Select Your Style",
    DemoGimme: "GIMME GIMME GIMME",
    DemoPink: "PINK DINOSAUR",
    DemoGotcha: "GOTCHA (The Theme from STARSKY & HUTCH)",
    DemoLets: "Let's talk it over",
    DemoDance: "DANCING ALL ALONE",
    MiscChallengeMode: "Welcome to Challenge Mode",
    DemoSaint: "SAINT GOES MARCHING (REMIX)",
    DemoMusic: "MUSIC",
    DemoThe7: "THE 7 JUMP",
    DemoHigher: "HIGHER",
    DemoNeverGonna: "NEVER GONNA MAKE (FACTORY DANCE TEAM MIX)",
    DemoOrionCiv: "ORION.78 ～civilization mix～",
    DemoFollow: "FOLLOW THE SUN (90 IN THE SHADE MIX)",
    DemoHeroHappy: "HERO (HAPPY GRANDALE MIX)",
    DemoNight: "NIGHT IN MOTION",
    DemoMake: "Make Your Move",
    DemoMy: "MY SUMMER LOVE",
    DemoHolic: "Holic",
    DemoKick: "KICK THE CAN",
    DemoEra: "era (nostalmix)",
    DemoOnly: "ONLY YOU",
    DemoFuru: "FURUHATA'S THEME",
    DemoIfYou: "IF YOU WERE HERE (B4 ZA BEAT MIX)",
    DemoDream: "DREAM A DREAM",
    DemoLove: "LOVE AGAIN TONIGHT (For Melissa MIX)",
    DemoShooting: "SHOOTING STAR",
    DemoGetMe: "Get me in your sight (AMD CANCUN MIX)",
    DemoBaby: "BABY BABY GIMME YOUR LOVE",
    DemoSynchro: "SYNCHRONIZED LOVE (Red Monster Hyper Mix)",
    DemoBumble: "BUMBLE BEE",
    DemoOneTwo: "ONE TWO (LITTLE BITCH)",
    DemoB4U: "B4U",
    DemoOrionAM: "ORION.78 (AMeuro-MIX)",
    DemoBoys: "BOYS (EURO MIX)",
    DemoDam: "DAM DARIRAM (KCP MIX)",
    DemoNeverLet: "never let you down",
    Demo1234: "1,2,3,4,007",
    DemoEat: "EAT YOU UP",
    DemoMidnite: "Midnite Blaze",
    DemoGroove: "GROOVE",
    DemoHaveMellow: "HAVE YOU NEVER BEEN MELLOW (MM GROOVIN MIX)",
    DemoShare: "Share My Love",
    DemoXana: "XANADU",
    DemoWalk: "WALKIE TALKIE",
    DemoInHeat: "IN THE HEAT OF THE NIGHT",
    DemoShake: "SHAKE YOUR BOOTY",
    DemoLead: "LEADING CYBER",
    DemoTrip: "TRIP MACHINE CLIMAX",
    DemoHypno: "HYPNØTIC CRISIS",
    DemoDont: "Don't Stop! (AMD 2nd MIX)"
}

SongUnlockLookup = {
    5: AllSongIdLookup[SongSynchro],
    10: "Challenge Mode",
    15: AllSongIdLookup[SongDance],
    20: AllSongIdLookup[SongHeroHappy],
    25: AllSongIdLookup[SongDam],
    30: AllSongIdLookup[SongIfYou],
    35: AllSongIdLookup[SongNeverLet],
    40: AllSongIdLookup[SongShare],
    45: AllSongIdLookup[SongP59],
    50: AllSongIdLookup[SongEra],
    55: AllSongIdLookup[SongLets],
    60: AllSongIdLookup[SongMake],
    65: AllSongIdLookup[SongGroove],
    70: AllSongIdLookup[SongDont],
    75: AllSongIdLookup[SongGetMe],
    80: AllSongIdLookup[SongHolic],
    85: AllSongIdLookup[SongLead],
    90: AllSongIdLookup[SongMidnite],
    95: AllSongIdLookup[SongOrionCiv],
    100: "Endless Mode"
}

SongUnlockCheevoTitleLookup = {
    5: "Unlocks So Quickly? Lovely.",
    10: "Let The Challenge Commence",
    15: "Being Alone Is Fine",
    20: "What Is A Grandale Anyway?",
    25: "No Cursing This Time",
    30: "But I Am Here",
    35: "Never Give You Up",
    40: "Which Type Of Love?",
    45: "Is This Song Folder Hidden?",
    50: "The End Or The Beginning?",
    55: "Isn't Texting More Efficient?",
    60: "I'm Not Good At Pricing Games",
    65: "For You",
    70: "Keep On Movin'",
    75: "What About The Bahamas?",
    80: "Time Signature Chaos AHOY!",
    85: "The Digital Revolution",
    90: "Because Noon Is Too Hot",
    95: "The Collection Is Complete",
    100: "It Never Ends"
}

ActualSongIds = [
    SongP59,
    Song1234,
    SongB4U,
    SongBaby,
    SongBoys,
    SongBumble,
    SongBurn,
    SongDam,
    SongDance,
    SongDont,
    SongDream,
    SongEat,
    SongEra,
    SongFollow,
    SongFuru,
    SongGetMe,
    SongGimme,
    SongGotcha,
    SongGroove,
    SongHaveMellow,
    SongHeroHappy,
    SongHeroKcp,
    SongHigher,
    SongHolic,
    SongHypno,
    SongIfYou,
    SongInHeat,
    SongItOnly,
    SongKick,
    SongLead,
    SongLets,
    SongLove,
    SongMake,
    SongMidnite,
    SongMusic,
    SongMy,
    SongNeverGonna,
    SongNeverLet,
    SongNight,
    SongOneTwo,
    SongOnly,
    SongOrionAM,
    SongOrionCiv,
    SongPink,
    SongSaint,
    SongShake,
    SongShare,
    SongShooting,
    SongSynchro,
    SongThe7,
    SongTrip,
    SongWalk,
    SongXana,
    SongYoung,
]

DemoSongIds = [
    DemoP59,
    Demo1234,
    DemoB4U,
    DemoBaby,
    DemoBoys,
    DemoBumble,
    DemoBurn,
    DemoDam,
    DemoDance,
    DemoDont,
    DemoDream,
    DemoEat,
    DemoEra,
    DemoFollow,
    DemoFuru,
    DemoGetMe,
    DemoGimme,
    DemoGotcha,
    DemoGroove,
    DemoHaveMellow,
    DemoHeroHappy,
    DemoHeroKcp,
    DemoHigher,
    DemoHolic,
    DemoHypno,
    DemoIfYou,
    DemoInHeat,
    DemoItOnly,
    DemoKick,
    DemoLead,
    DemoLets,
    DemoLove,
    DemoMake,
    DemoMidnite,
    DemoMusic,
    DemoMy,
    DemoNeverGonna,
    DemoNeverLet,
    DemoNight,
    DemoOneTwo,
    DemoOnly,
    DemoOrionAM,
    DemoOrionCiv,
    DemoPink,
    DemoSaint,
    DemoShake,
    DemoShare,
    DemoShooting,
    DemoSynchro,
    DemoThe7,
    DemoTrip,
    DemoWalk,
    DemoXana,
    DemoYoung,
]

DemoToSongLookup = {
    DemoP59: SongP59,
    Demo1234: Song1234,
    DemoB4U: SongB4U,
    DemoBaby: SongBaby,
    DemoBoys: SongBoys,
    DemoBumble: SongBumble,
    DemoBurn: SongBurn,
    DemoDam: SongDam,
    DemoDance: SongDance,
    DemoDont: SongDont,
    DemoDream: SongDream,
    DemoEat: SongEat,
    DemoEra: SongEra,
    DemoFollow: SongFollow,
    DemoFuru: SongFuru,
    DemoGetMe: SongGetMe,
    DemoGimme: SongGimme,
    DemoGotcha: SongGotcha,
    DemoGroove: SongGroove,
    DemoHaveMellow: SongHaveMellow,
    DemoHeroHappy: SongHeroHappy,
    DemoHeroKcp: SongHeroKcp,
    DemoHigher: SongHigher,
    DemoHolic: SongHolic,
    DemoHypno: SongHypno,
    DemoIfYou: SongIfYou,
    DemoInHeat: SongInHeat,
    DemoItOnly: SongItOnly,
    DemoKick: SongKick,
    DemoLead: SongLead,
    DemoLets: SongLets,
    DemoLove: SongLove,
    DemoMake: SongMake,
    DemoMidnite: SongMidnite,
    DemoMusic: SongMusic,
    DemoMy: SongMy,
    DemoNeverGonna: SongNeverGonna,
    DemoNeverLet: SongNeverLet,
    DemoNight: SongNight,
    DemoOneTwo: SongOneTwo,
    DemoOnly: SongOnly,
    DemoOrionAM: SongOrionAM,
    DemoOrionCiv: SongOrionCiv,
    DemoPink: SongPink,
    DemoSaint: SongSaint,
    DemoShake: SongShake,
    DemoShare: SongShare,
    DemoShooting: SongShooting,
    DemoSynchro: SongSynchro,
    DemoThe7: SongThe7,
    DemoTrip: SongTrip,
    DemoWalk: SongWalk,
    DemoXana: SongXana,
    DemoYoung: SongYoung,
}

SongToDemoLookup = {
    SongP59: DemoP59,
    Song1234: Demo1234,
    SongB4U: DemoB4U,
    SongBaby: DemoBaby,
    SongBoys: DemoBoys,
    SongBumble: DemoBumble,
    SongBurn: DemoBurn,
    SongDam: DemoDam,
    SongDance: DemoDance,
    SongDont: DemoDont,
    SongDream: DemoDream,
    SongEat: DemoEat,
    SongEra: DemoEra,
    SongFollow: DemoFollow,
    SongFuru: DemoFuru,
    SongGetMe: DemoGetMe,
    SongGimme: DemoGimme,
    SongGotcha: DemoGotcha,
    SongGroove: DemoGroove,
    SongHaveMellow: DemoHaveMellow,
    SongHeroHappy: DemoHeroHappy,
    SongHeroKcp: DemoHeroKcp,
    SongHigher: DemoHigher,
    SongHolic: DemoHolic,
    SongHypno: DemoHypno,
    SongIfYou: DemoIfYou,
    SongInHeat: DemoInHeat,
    SongItOnly: DemoItOnly,
    SongKick: DemoKick,
    SongLead: DemoLead,
    SongLets: DemoLets,
    SongLove: DemoLove,
    SongMake: DemoMake,
    SongMidnite: DemoMidnite,
    SongMusic: DemoMusic,
    SongMy: DemoMy,
    SongNeverGonna: DemoNeverGonna,
    SongNeverLet: DemoNeverLet,
    SongNight: DemoNight,
    SongOneTwo: DemoOneTwo,
    SongOnly: DemoOnly,
    SongOrionAM: DemoOrionAM,
    SongOrionCiv: DemoOrionCiv,
    SongPink: DemoPink,
    SongSaint: DemoSaint,
    SongShake: DemoShake,
    SongShare: DemoShare,
    SongShooting: DemoShooting,
    SongSynchro: DemoSynchro,
    SongThe7: DemoThe7,
    SongTrip: DemoTrip,
    SongWalk: DemoWalk,
    SongXana: DemoXana,
    SongYoung: DemoYoung,
}

DifficultyLookup = {
    1: "Basic",
    2: "Trick",
    3: "Maniac"
}

StyleLookup = {
    1: "Single",
    2: "Double",
    5: "Versus",
    10: "Solo"
}

ChallengeSetLookup = {
    0: "Practice",
    1: "Basic",
    2: "Trick",
    3: "Maniac",
    4: "Extra"
}

ChallengeSongLookup = {
    0: "HIGHER",
    1: "ONLY YOU",
    2: "THE 7 JUMP",
    3: "NEVER GONNA MAKE (FACTORY DANCE TEAM MIX)",
    4: "IN THE HEAT OF THE NIGHT",
    5: "Let's talk it over",
    6: "DREAM A DREAM",
    7: "GIMME GIMME GIMME",
    8: "GOTCHA (The Theme from STARSKY & HUTCH)",
    9: "Don't Stop! (AMD 2nd MIX)",
    10: "HERO (KCP DISCOTIQUE MIX)",
    11: "ONE TWO (LITTLE BITCH)",
    12: "ORION.78 (AMeuro-MIX)",
    13: "IT ONLY TAKES A MINUTE (Extended Remix)",
    14: "never let you down",
    15: "BABY BABY GIMME YOUR LOVE",
    16: "KICK THE CAN",
    17: "BABY BABY GIMME YOUR LOVE",
    18: "EAT YOU UP",
    19: "DAM DARIRAM (KCP MIX)",
    20: "HERO (HAPPY GRANDALE MIX)",
    21: "HERO (HAPPY GRANDALE MIX)",
    22: "Young Forever",
    23: "PINK DINOSAUR",
    24: "Make Your Move",
    25: "WALKIE TALKIE",
    26: "MUSIC",
    27: "SAINT GOES MARCHING (REMIX)",
    28: "SAINT GOES MARCHING (REMIX)",
    29: "BUMBLE BEE",
    30: "era (nostalmix)",
    31: "FURUHATA'S THEME",
    32: "SAINT GOES MARCHING (REMIX)",
    33: "IF YOU WERE HERE (B4 ZA BEAT MIX)",
    34: "FOLLOW THE SUN (90 IN THE SHADE MIX)",
    35: "LEADING CYBER",
    36: "TRIP MACHINE CLIMAX",
    37: "1,2,3,4,007",
    38: "HIGHER",
    39: "era (nostalmix)",
    40: ".59",
    41: "HAVE YOU NEVER BEEN MELLOW (MM GROOVIN MIX)",
    42: "FURUHATA'S THEME",
    43: "BABY BABY GIMME YOUR LOVE",
    44: "Get me in your sight (AMD CANCUN MIX)",
    45: "LEADING CYBER",
    46: "TRIP MACHINE CLIMAX",
    47: "SHOOTING STAR",
    48: "MY SUMMER LOVE",
    49: "LOVE AGAIN TONIGHT (For Melissa MIX)"
}

ChallengeRpMissionLookup = {
    0: "No Misses Allowed",
    1: "Clear With Full Combo",
    2: "Clear With Full Combo & Sudden Mod",
    3: "Fill The Dance Meter",
    4: "Clear With 1.5 Million Points",
    5: "Clear With More Perfects Than Non Misses",
    6: "Clear With Full Combo",
    7: "Clear With Full Combo & Sudden Mod",
    8: "Clear The Original Chart With Full Combo",
    9: "Clear With Under 1 Million Points & 50 Max Combo",
    10: "Clear With Full Combo & Dark Mod",
    11: "Don't Hit Jumps: Clear With Goods Or Better",
    12: "Clear With Full Combo & Hidden Mod",
    13: "Clear With 10 Max Combo Tops & Pressure Gauge",
    14: "Don't Hit Up Or Down: Clear With Goods Or Better",
    15: "Clear With Full Combo (1 Mistake Allowed) & Wrong BGM",
    16: "Keep Dance Meter Below 50%",
    17: "Clear With 50 Perfects",
    18: "Clear With Score Between 3 Million & 3.1 Million",
    19: "Clear With Dance Meter Below 5%",
    20: "Don't Hit Jumps: Clear With Goods Or Better & Dark Mod",
    21: "Only Hit Jumps With Good Or Better & Hidden Mod",
    22: "Clear With Full Combo",
    23: "Clear With 70% Perfects, Dark Mod, & Sudden Mod",
    24: "Clear With Full Combo (1 Mistake Allowed) & Wrong BGM",
    25: "Keep Dance Meter Below 50%. Clear With 30 Max Combo",
    26: "Clear With Full Combo",
    27: "Clear With All Perfects",
    28: "Clear With Full Combo & Stealth Mod",
    29: "Don't Hit Up: Clear With Goods Or Better",
    30: "Clear With Full Combo",
    31: "Clear With Pressure Gauge",
    32: "Clear With Full Combo",
    33: "Only Hit Up, Up-Right, & Right: Clear With Goods Or Better",
    34: "Clear With 10 Max Combo Tops & Pressure Gauge",
    35: "Clear With Full Combo & Slower Song Speed",
    36: "Don't Hit Up Or Down: Clear With Goods Or Better",
    37: "Don't Hit Down Or Right In isolation: Clear With Goods Or Better",
    38: "Don't Hit Consecutive Steps",
    39: "Clear The Original Chart WIth Full Combo",
    40: "Don't Hit Consecutive Steps",
    41: "Hit 350 Perfects On Original Chart",
    42: "Clear With Full Combo & Hidden Mod",
    43: "Clear With 0 Points",
    44: "Clear With 60 Perfects, Greats, & Goods",
    45: "Clear With Full Combo & Sudden Mod",
    46: "Clear With 0 Points",
    47: "Clear With Full Combo & 90% Perfects",
    48: "Clear With All Perfects",
    49: "Clear With 220 Combo & Limited Left/Right Steps"
}

ChallengeTitleLookup = {
    0: "Starting Higher",
    1: "Only Combos",
    2: "The Sudden Jump",
    3: "Never Grooving Empty",
    4: "Scoring At Night",
    5: "Perfection's Over",
    6: "Dream Of Combos",
    7: "Gimme Sudden Combos",
    8: "Gotcha! Solo Jump Training!",
    9: "Don't Go Over A Million",
    10: "Hero In Darkness",
    11: "One Two! No Jump!",
    12: "Hidden Orion",
    13: "It Only Takes 10",
    14: "Never Let You Up Or Down",
    15: "Baby Baby Gimme Your Wrong Song",
    16: "Kick The Groove Meter",
    17: "Baby Baby Gimme Your Accuracy",
    18: "Eat Your Score",
    19: "Danger Dariram",
    20: "Grounded Hero",
    21: "Jumping Hero",
    22: "Combos Forever",
    23: "Suddenly Accurate Dinosaur",
    24: "Move To The Wrong Song",
    25: "Walkie Talkie Interference",
    26: "COMBO",
    27: "Perfect Saints",
    28: "Stealthy Saints",
    29: "Bee Careful Going Up",
    30: "Nostalgic Combo",
    31: "Furuhata's Pressure",
    32: "Galloping Saints",
    33: "If You Were Up Right",
    34: "Follow The Pressure",
    35: "Leading Slowly",
    36: "Tripping Up And Down",
    37: "Good Spies",
    38: "Not Too High",
    39: "Nostalgic Candles",
    40: "/60 Forbidden",
    41: "This Is Not Mellow",
    42: "Furuhata's Hiding Place",
    43: "Baby Baby Gimme...Nothing?!?",
    44: "Get Me 3 Packs of 60 Judgments",
    45: "Leading Suddenly",
    46: "Tripping Over Nothing",
    47: "The Accurate Star",
    48: "My Perfect Love",
    49: "Combo Again Tonight"
}

// Cheevos Below

Only1Active = (Player1Active && !Player2Active) || (!Player1Active && Player2Active)

// Unlock songs via clearing them.
// Based on in-game rules, any modifiers are allowed, so don't be too restrictive.
function CreateSongUnlockCheevo(songCount) {
    songTitle = SongUnlockLookup[songCount]
    cheevoTitle = SongUnlockCheevoTitleLookup[songCount]
    achievement(
        title = cheevoTitle,
        points = 2,
        description = "Unlock " + songTitle + " by clearing " + songCount + " songs.",
        trigger = InGameMode &&
            prev(TotalSongsCleared) == songCount - 1 &&
            measured(TotalSongsCleared == songCount)
    )
}

for songIndex in range(5, 100, 5) {
    CreateSongUnlockCheevo(songIndex)
}

function CreateSongPercentageCheevo(title, points, target) {
    playTargets = []
    for i in range(0, 53) {
        array_push(playTargets, 0xe4e8c + (i * 0x58))
    }
    allHits = tally_of(playTargets, target, s => once(word(s) != 0))
    deltaProtection = tally_of(playTargets, target - 1, s => once(prev(word(s)) != 0))
    achievement(
        title = title,
        points = points,
        description = format("Clear {0} unique songs.", target),
        trigger = InGameMode &&
            never(GameState <= 1) &&
            never(GameState == 3) &&
            never(GameState > 6 && GameState < 0x0c) &&
            never(GameState > 0x0d) &&
            deltaProtection && measured(allHits, when=always_true(), format="percent")
    )
}

CreateSongPercentageCheevo("A Quarter Of A Fourth", 2, 14)
CreateSongPercentageCheevo("A Half Of A Fourth", 3, 27)
CreateSongPercentageCheevo("Three Quarters Of A Fourth", 5, 41)
CreateSongPercentageCheevo("A Whole Of A Fourth", 10, 54)

function CreateManiacClearCheevo(songId) {
    songTitle = AllSongIdLookup[songId]
    demoId = SongToDemoLookup[songId]
    achievement(
        title = songTitle + " Maniac",
        points = 3,
        description = "Clear " + songTitle + " on Single Maniac difficulty. No Double Play. No Little Mod allowed.",
        trigger = InGameMode && !InternalDifficultyEasy &&
            prior(SongId) == demoId && SongId == songId &&
            prev(TotalSongsCleared) == TotalSongsCleared - 1 &&
            (PlayerStyle < 2) &&
            ((Player1Active && never(Player1LittleOn) && 
                Player1DiffManiac && never(Player1FailedChart)) || 
            (Player2Active && never(Player2LittleOn) &&
                Player2DiffManiac && never(Player2FailedChart))) 
    )
}

function CreatePerfectClearCheevo(songId) {
    songTitle = AllSongIdLookup[songId]
    demoId = SongToDemoLookup[songId]
    achievement(
        title = "[VOID] " + songTitle + " Perfect",
        points = 25,
        description = "Get a Full Perfect Combo on " + songTitle +
            " without the Little Mod. No Double Play.",
        trigger = InGameMode && prior(SongId) == demoId && SongId == songId &&
            prev(TotalSongsCleared) == TotalSongsCleared - 1 &&
            ((Player1Active && never(Player1LittleOn) && never(Player1FailedChart) &&
                Player1Greats == 0 && Player1Goods == 0 &&
                Player1Boos == 0 && Player1Misses == 0
            ) ||
            (Player2Active && never(Player2LittleOn) && never(Player2FailedChart) &&
                Player2Greats == 0 && Player2Goods == 0 &&
                Player2Boos == 0 && Player2Misses == 0
            ))
    )
}

function CreateFullComboCheevo(songId) {
    songTitle = AllSongIdLookup[songId]
    demoId = SongToDemoLookup[songId]
    points = 5
    if (songId == SongDance) {
        points = 3
    }
    achievement(
        title = songTitle + " Full Combo",
        points = points,
        description = "Get a Full Combo on " + songTitle +
            " without the Little Mod. No Double Play.",
        trigger = InGameMode && prior(SongId) == demoId && SongId == songId &&
            prev(TotalSongsCleared) == TotalSongsCleared - 1 &&
            (!Double) &&
            ((Player1Active && never(Player1LittleOn) && never(Player1FailedChart) &&
                Player1Goods == 0 &&
                Player1Boos == 0 && Player1Misses == 0
            ) ||
            (Player2Active && never(Player2LittleOn) && never(Player2FailedChart) &&
                Player2Goods == 0 &&
                Player2Boos == 0 && Player2Misses == 0
            ))
    )
}

function CreateSoloFullComboCheevo(songId) {
    songTitle = AllSongIdLookup[songId]
    demoId = SongToDemoLookup[songId]
    if (songId != SongDance) {
        achievement(
            title = format("{0} Solo Maniac FC", songTitle),
            points = 4,
            description = "Get the Full Combo without using Little.",
            trigger = InGameMode && prior(SongId) == demoId && SongId == songId &&
            prev(TotalSongsCleared) == TotalSongsCleared - 1 &&
            SoloGame && PlayerStyle > 1 &&
            ((Player1Active && never(Player1LittleOn) && never(Player1FailedChart) &&
                Player1DiffManiac &&
                Player1Goods == 0 &&
                Player1Boos == 0 && Player1Misses == 0
            ) ||
            (Player2Active && never(Player2LittleOn) && never(Player2FailedChart) &&
                Player2DiffManiac &&
                Player2Goods == 0 &&
                Player2Boos == 0 && Player2Misses == 0
            ))
        )
    }
}

function CreateDoubleFullComboCheevo(songId) {
    songTitle = AllSongIdLookup[songId]
    demoId = SongToDemoLookup[songId]
    if (songId != SongDance) {
        achievement(
            title = format("{0} Double Maniac FC", songTitle),
            points = 5,
            description = "Get the Full Combo without using Little.",
            trigger = InGameMode && prior(SongId) == demoId && SongId == songId &&
            prev(TotalSongsCleared) == TotalSongsCleared - 1 &&
            Double &&
            ((Player1Active && never(Player1LittleOn) && never(Player1FailedChart) &&
                Player1DiffManiac &&
                Player1Goods == 0 &&
                Player1Boos == 0 && Player1Misses == 0
            ) ||
            (Player2Active && never(Player2LittleOn) && never(Player2FailedChart) &&
                Player2DiffManiac &&
                Player2Goods == 0 &&
                Player2Boos == 0 && Player2Misses == 0
            ))
        )
    }
}

for actualSongIndex in ActualSongIds {
    // Create cheevo for first pass on Maniac.
    if (actualSongIndex != SongDance) {
        CreateManiacClearCheevo(actualSongIndex)
    }
    // Create cheevos for Full Combos
    CreateFullComboCheevo(actualSongIndex)
    // Create cheevos for PFC
    CreatePerfectClearCheevo(actualSongIndex)
    
    CreateSoloFullComboCheevo(actualSongIndex)
    CreateDoubleFullComboCheevo(actualSongIndex)
}

function CreateMissionModeCheevo(setCount, numberCount) {
    setName = ChallengeSetLookup[setCount]
    comboIndex = setCount * 10 + numberCount
    songName = ChallengeSongLookup[comboIndex]
    
    resetCond = never(SongId == MiscChallengeMode ||
        ChallengeMarker < ChallengeMarkerPassed)
    passCCond = repeated(90, ChallengeMarker == ChallengeMarkerPassed)
    pass1Cond = repeated(90, ChallengeModePassed > 0)
    pass2Cond = once(prev(ChallengeModePassed) == 0 && ChallengeModePassed > 0)
    
    achievement(
        title = "Challenge: " + ChallengeTitleLookup[comboIndex],
        points = setCount + 1,
        description = "Beat " + setName + "-" + (numberCount + 1) +
            " in Challenge Mode. " + ChallengeRpMissionLookup[comboIndex],
        trigger = ChallengeMode && ChallengeSet == setCount &&
            ChallengeNumberInSet == numberCount && resetCond &&
            passCCond && (pass1Cond || pass2Cond)
    )
}

for setIndex in range(0, 4, 1) {
    for missionIndex in range(0, 9, 1) {
        CreateMissionModeCheevo(setIndex, missionIndex)
    }
}

// Leaderboards Below

function CreateScoreLeaderboard(songId, styleId, diffId) {
    songTitle = AllSongIdLookup[songId]
    demoId = SongToDemoLookup[songId]
    diffWord = DifficultyLookup[diffId]
    styleWord = StyleLookup[styleId]
    leaderboard(
        title = songTitle + " " + styleWord + " " + diffWord + " Score Attack",
        description = "Get the highest score you can on " +
            songTitle + " " + styleWord + " " + diffWord + ". No 2nd player.",
        start = InGameMode && Style == styleId &&
            SongId == songId && Only1Active &&
            !PlayerALittleOn && PlayerADifficulty == diffId &&
            !PlayerAFailedChart &&
            once(GameState == 5) && repeated(100, EvaluationScreen) &&
            prior(TotalSongsCleared) == TotalSongsCleared - 1 &&
            never(GameState < 5) && never(GameState > 6),
        cancel = always_false(),
        submit = always_true(),
        value = PlayerAStageScore,
        format = "SCORE"
    )
}

leaderboardStyles = [
    1,
    10
]

for styleIndex in leaderboardStyles {
    for actualSongIndex in ActualSongIds {
        for diffIndex in range(1, 3, 1) {
            if (actualSongIndex != SongDance || (styleIndex == 1 && diffIndex == 1))
            CreateScoreLeaderboard(actualSongIndex, styleIndex, diffIndex)
        }
    }
}

for i in ActualSongIds {
    achievement(
        title = "[VOID] Clear - " + AllSongIdLookup[i],
        id = 352422 + SongOrderLookup[i],
        points = 2,
        description = "Pass the song on any chart, any mode except versus.",
        trigger = InGameMode && !InternalDifficultyEasy &&
            prior(SongId) == SongToDemoLookup[i] && SongId == i &&
            prev(TotalSongsCleared) == TotalSongsCleared - 1 &&
            (SoloGame || !Versus) &&
            ((Player1Active && never(Player1FailedChart)) || 
            (Player2Active && never(Player2FailedChart))) 
    )
}

// Rich Presence Below

RpStyleLookup = {
    0x00: "Single",
    0x01: "Single",
    0x02: "Double",
    0x05: "Versus",
    0x07: "Double",
    0x10: "Single",
    0x11: "Single",
    0x12: "Solo",
    0x15: "Solo",
    0x17: "Solo",
}

RpStyle = rich_presence_lookup("Style", low4(0x0e3f3e) * 0x10 + PlayerStyle, RpStyleLookup)

RpChallengeSong = rich_presence_lookup(
    "ChallengeSong",
    ChallengeSet * 10 + ChallengeNumberInSet,
    ChallengeSongLookup,
    "Mu"
)
RpChallengeMission = rich_presence_lookup(
    "ChallengeMission",
    ChallengeSet * 10 + ChallengeNumberInSet,
    ChallengeRpMissionLookup,
    "Don't Fail"
)

RpSongTitle = rich_presence_lookup("Song", SongId, AllSongIdLookup)

RpP1Difficulty = rich_presence_lookup("Difficulty", Player1Difficulty, DifficultyLookup)
RpP2Difficulty = rich_presence_lookup("Difficulty", Player2Difficulty, DifficultyLookup)

RpP1Score = rich_presence_macro("Number", Player1Score)
RpP2Score = rich_presence_macro("Number", Player2Score)

RpP1Perfect = rich_presence_macro("Number", Player1Perfects)
RpP2Perfect = rich_presence_macro("Number", Player2Perfects)

RpP1Great = rich_presence_macro("Number", Player1Greats)
RpP2Great = rich_presence_macro("Number", Player2Greats)

RpP1Good = rich_presence_macro("Number", Player1Goods)
RpP2Good = rich_presence_macro("Number", Player2Goods)

RpP1Boo = rich_presence_macro("Number", Player1Boos)
RpP2Boo = rich_presence_macro("Number", Player2Boos)

RpP1Miss = rich_presence_macro("Number", Player1Misses)
RpP2Miss = rich_presence_macro("Number", Player2Misses)

RpP1Combo = rich_presence_macro("Number", Player1CurrentCombo)
RpP2Combo = rich_presence_macro("Number", Player2CurrentCombo)

RpChallengeSet = rich_presence_lookup("ChallengeSet", ChallengeSet, ChallengeSetLookup)
RpChallengeNumber = rich_presence_value("Number", ChallengeNumberInSet + 1)

rich_presence_conditional_display(
    DifficultySelection && BothPlayersActive,
    "Deciding Difficulty on {0}: {1} vs {2}",
    RpSongTitle,
    RpP1Difficulty,
    RpP2Difficulty
)

rich_presence_conditional_display(
    DifficultySelection && Player1Active,
    "Deciding Difficulty on {0} {2}: Maybe {1}?",
    RpSongTitle,
    RpP1Difficulty,
    RpStyle
)

rich_presence_conditional_display(
    DifficultySelection && Player2Active,
    "Deciding Difficulty on {0} {2}: Maybe {1}?",
    RpSongTitle,
    RpP2Difficulty,
    RpStyle
)

rich_presence_conditional_display(
    DifficultySelection,
    "Thinking About Which Difficulty To Play"
)

rich_presence_conditional_display(
    GroupSelection || (SongSelection && SongId == MiscSelectStyle),
    "Selecting The Group/Character For Today"
)

rich_presence_conditional_display(
    SongSelection,
    "Thinking About Playing {0} {1}",
    RpSongTitle,
    RpStyle
)

rich_presence_conditional_display(
    GameModeSettings,
    "Setting Up The Mode"
)

// End of Song: check with failure byte.
rich_presence_conditional_display(
    (EndOfSong || EvaluationScreen) && BothPlayersActive && AllPlayersFailed && Player1Difficulty == Player2Difficulty,
    "Failed On {0} {1} {2}",
    RpSongTitle,
    RpP1Difficulty,
    RpStyle
)

rich_presence_conditional_display(
    (EndOfSong || EvaluationScreen) && BothPlayersActive && AllPlayersFailed,
    "Failed On {0} {1} & {2}",
    RpSongTitle,
    RpP1Difficulty,
    RpP2Difficulty
)

rich_presence_conditional_display(
    (EndOfSong || EvaluationScreen) && BothPlayersActive && !AllPlayersFailed && Player1FailedChart && Player2FailedChart,
    "Failed On {0} {1} & {2}, But Gets Song Credit Anyway",
    RpSongTitle,
    RpP1Difficulty,
    RpP2Difficulty
)

rich_presence_conditional_display(
    (EndOfSong || EvaluationScreen) && BothPlayersActive && !AllPlayersFailed && !Player1FailedChart && Player2FailedChart,
    "Results On {0}: {1} {2}/{3}/{4}/{5}/{6} {7} {8} - Failed",
    RpSongTitle,
    RpP1Difficulty,
    RpP1Perfect,
    RpP1Great,
    RpP1Good,
    RpP1Boo,
    RpP1Miss,
    RpP1Score,
    RpP1Combo
)

rich_presence_conditional_display(
    (EndOfSong || EvaluationScreen) && BothPlayersActive && !AllPlayersFailed && Player1FailedChart && !Player2FailedChart,
    "Results On {0}: Failed - {1} {2}/{3}/{4}/{5}/{6} {7} {8}",
    RpSongTitle,
    RpP2Difficulty,
    RpP2Perfect,
    RpP2Great,
    RpP2Good,
    RpP2Boo,
    RpP2Miss,
    RpP2Score,
    RpP2Combo
)

rich_presence_conditional_display(
    (EndOfSong || EvaluationScreen) && BothPlayersActive && !AllPlayersFailed && Player1Difficulty == Player2Difficulty,
    "Results On {0} {1}: {2}/{3}/{4}/{5}/{6} {7} {8} vs {9}/{10}/{11}/{12}/{13} {14} {15}",
    RpSongTitle,
    RpP1Difficulty,
    RpP1Perfect,
    RpP1Great,
    RpP1Good,
    RpP1Boo,
    RpP1Miss,
    RpP1Score,
    RpP1Combo,
    RpP2Perfect,
    RpP2Great,
    RpP2Good,
    RpP2Boo,
    RpP2Miss,
    RpP2Score,
    RpP2Combo
)

rich_presence_conditional_display(
    (EndOfSong || EvaluationScreen) && BothPlayersActive && !AllPlayersFailed,
    "Results On {0}: {1} {2}/{3}/{4}/{5}/{6} {7} {8} vs {16} {9}/{10}/{11}/{12}/{13} {14} {15}",
    RpSongTitle,
    RpP1Difficulty,
    RpP1Perfect,
    RpP1Great,
    RpP1Good,
    RpP1Boo,
    RpP1Miss,
    RpP1Score,
    RpP1Combo,
    RpP2Perfect,
    RpP2Great,
    RpP2Good,
    RpP2Boo,
    RpP2Miss,
    RpP2Score,
    RpP2Combo,
    RpP2Difficulty
)

rich_presence_conditional_display(
    (EndOfSong || EvaluationScreen) && Player1Active,
    "Results On {0}: {1} {9} {2}/{3}/{4}/{5}/{6} {7} {8}",
    RpSongTitle,
    RpP1Difficulty,
    RpP1Perfect,
    RpP1Great,
    RpP1Good,
    RpP1Boo,
    RpP1Miss,
    RpP1Score,
    RpP1Combo,
    RpStyle
)

rich_presence_conditional_display(
    (EndOfSong || EvaluationScreen) && Player2Active,
    "Results On {0}: {1} {9} {2}/{3}/{4}/{5}/{6} {7} {8}",
    RpSongTitle,
    RpP2Difficulty,
    RpP2Perfect,
    RpP2Great,
    RpP2Good,
    RpP2Boo,
    RpP2Miss,
    RpP2Score,
    RpP2Combo,
    RpStyle
)

rich_presence_conditional_display(
    (EndOfSong || EvaluationScreen) && Player1Active && Player1FailedChart,
    "Failed On {0} {1} {2}",
    RpSongTitle,
    RpP1Difficulty,
    RpStyle
)

rich_presence_conditional_display(
    (EndOfSong || EvaluationScreen) && Player2Active && Player2FailedChart,
    "Failed On {0} {1} {2}",
    RpSongTitle,
    RpP2Difficulty,
    RpStyle
)

rich_presence_conditional_display(
    (EndOfSong || EvaluationScreen),
    "Passed The Song {0} {1}",
    RpSongTitle,
    RpStyle
)

rich_presence_conditional_display(
    HereWeGo && BothPlayersActive && Player1Difficulty == Player2Difficulty,
    "{0} {1}: {2}/{3}/{4}/{5}/{6} {7} {8} vs {9}/{10}/{11}/{12}/{13} {14} {15}",
    RpSongTitle,
    RpP1Difficulty,
    RpP1Perfect,
    RpP1Great,
    RpP1Good,
    RpP1Boo,
    RpP1Miss,
    RpP1Score,
    RpP1Combo,
    RpP2Perfect,
    RpP2Great,
    RpP2Good,
    RpP2Boo,
    RpP2Miss,
    RpP2Score,
    RpP2Combo
)

rich_presence_conditional_display(
    HereWeGo && BothPlayersActive,
    "{0}: {1} {2}/{3}/{4}/{5}/{6} {7} {8} vs {16} {9}/{10}/{11}/{12}/{13} {14} {15}",
    RpSongTitle,
    RpP1Difficulty,
    RpP1Perfect,
    RpP1Great,
    RpP1Good,
    RpP1Boo,
    RpP1Miss,
    RpP1Score,
    RpP1Combo,
    RpP2Perfect,
    RpP2Great,
    RpP2Good,
    RpP2Boo,
    RpP2Miss,
    RpP2Score,
    RpP2Combo,
    RpP2Difficulty
)

rich_presence_conditional_display(
    HereWeGo && Player1Active,
    "{0} {1} {9}: {2}/{3}/{4}/{5}/{6} {7} {8}",
    RpSongTitle,
    RpP1Difficulty,
    RpP1Perfect,
    RpP1Great,
    RpP1Good,
    RpP1Boo,
    RpP1Miss,
    RpP1Score,
    RpP1Combo,
    RpStyle
)

rich_presence_conditional_display(
    HereWeGo && Player2Active,
    "{0} {1} {9}: {2}/{3}/{4}/{5}/{6} {7} {8}",
    RpSongTitle,
    RpP2Difficulty,
    RpP2Perfect,
    RpP2Great,
    RpP2Good,
    RpP2Boo,
    RpP2Miss,
    RpP2Score,
    RpP2Combo,
    RpStyle
)

rich_presence_conditional_display(
    AreYouReady && BothPlayersActive && Player1Difficulty == Player2Difficulty,
    "About To Dance To {0} on {1}",
    RpSongTitle,
    RpP1Difficulty
)

rich_presence_conditional_display(
    AreYouReady && BothPlayersActive,
    "About To Dance To {0}: {1} vs {2}",
    RpSongTitle,
    RpP1Difficulty,
    RpP2Difficulty
)

rich_presence_conditional_display(
    AreYouReady && Player1Active,
    "About To Dance To {0} on {1} {2}",
    RpSongTitle,
    RpP1Difficulty,
    RpStyle
)

rich_presence_conditional_display(
    AreYouReady && Player2Active,
    "About To Dance To {0} on {1} {2}",
    RpSongTitle,
    RpP2Difficulty,
    RpStyle
)

rich_presence_conditional_display(
    AreYouReady,
    "About To Dance To {0} {1}",
    RpSongTitle,
    RpStyle
)

// Loading the Song: the Demo Song ID should be loaded still.
rich_presence_conditional_display(
    LoadingSong && BothPlayersActive && Player1Difficulty == Player2Difficulty,
    "Loading The {1} Chart For {0}",
    RpSongTitle,
    RpP1Difficulty
)

rich_presence_conditional_display(
    LoadingSong && BothPlayersActive,
    "Loading The {1} & {2} Charts For {0}",
    RpSongTitle,
    RpP1Difficulty,
    RpP2Difficulty
)

rich_presence_conditional_display(
    LoadingSong && Player1Active,
    "Loading The {1} {2} Chart For {0}",
    RpSongTitle,
    RpP1Difficulty,
    RpStyle
)

rich_presence_conditional_display(
    LoadingSong && Player2Active,
    "Loading The {1} {2} Chart For {0}",
    RpSongTitle,
    RpP2Difficulty,
    RpStyle
)

rich_presence_conditional_display(
    LoadingSong,
    "Loading The Charts for {0} {1}",
    RpSongTitle,
    RpStyle
)

rich_presence_conditional_display(
    CautionScreen,
    "Bypassing The Health And Safety Warnings"
)

rich_presence_conditional_display(
    MainMenu,
    "Welcome To DDR 4th Mix"
)

// Unsure if these are worth splitting up.
rich_presence_conditional_display(
    Initializing || KonamiJingle || IntroScreens || DancemaniaAd || ShowMeYourMoves || TitleScreen || DemoPlay || HowToPlay,
    "Watching The Intro Cycle"
)

// Lesson Mode: ...guess this has to be done eventually.
rich_presence_conditional_display(
    LessonMode,
    "Learning The Ropes"
)

// Training Mode: Plenty to do here.
rich_presence_conditional_display(
    TrainingMode && SongId > 0,
    "Practicing {0}",
    RpSongTitle
)
rich_presence_conditional_display(
    TrainingMode,
    "Practicing Hard Charts"
)

// Edit Mode: Loads of potential here.
rich_presence_conditional_display(
    EditMode,
    "Creating A New Step Chart"
)

rich_presence_conditional_display(
    NonstopOrderMode,
    "Adjusting Custom Courses"
)

// Viewing Records: Need this fleshed out to show all stuff.
rich_presence_conditional_display(
    ViewingRecords,
    "Viewing Score Records"
)

rich_presence_conditional_display(
    OptionsMenu,
    "Configuring DDR For Optimal Play"
)

rich_presence_conditional_display(
    InfoMenu,
    "Reviewing What Was Unlocked"
)

// Challenge Mode: many states.
rich_presence_conditional_display(
    ChallengeMode && SongId == MiscChallengeSetCompleted,
    "Completed All Missions In The {0} Set",
    RpChallengeSet
)

rich_presence_conditional_display(
    ChallengeMode && (SongId == MiscSelectStyle || SongId == 0),
    "Setting Up Challenge Mode"
)
rich_presence_conditional_display(
    ChallengeMode && SongId == MiscChallengeMode,
    "Thinking About Challenge {0}-{1} {2}: {3}",
    RpChallengeSet,
    RpChallengeNumber,
    RpChallengeSong,
    RpChallengeMission
)
rich_presence_conditional_display(
    ChallengeMode,
    "Playing Challenge {0}-{1} {2}: {3}",
    RpChallengeSet,
    RpChallengeNumber,
    RpChallengeSong,
    RpChallengeMission
)

rich_presence_display("Playing DDR")
