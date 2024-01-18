// ~Hack~ Wario Land 3: The Master Quest
// #ID = 14226

GameState = byte(0xc09b)
GsTitle = GameState == 0
GsOverworld = GameState == 1
GsInLevel = GameState == 2
GsTreasureFound = GameState == 3
GsSaving = GameState == 4
GsGolf = GameState == 5
GsTutorial = GameState == 7
GsLanguage = GameState == 0x0e

CurrCoins = low4(0xca04) * 100 + bcd(byte(0xca05))
PrevCoins = prev(low4(0xca04)) * 100 +
    prev(high4(0xca05)) * 10 + prev(low4(0xca05))

Time = byte(0xca3b)

TimeAttackEnabled = bit1(0xca3d) == 1

RunningTime = bcd(byte(0xc0e2)) * 3600 + bcd(byte(0xc0e3)) * 60 + bcd(byte(0xc0e4))

InLevelMusicCoins = byte(0xca5c)

CurrTreasures = low4(0xca39) * 100 + bcd(byte(0xca3a))
PrevTreasures = prev(low4(0xca39)) * 100 +
    prev(high4(0xca3a)) * 10 + prev(low4(0xca3a))
    
StageBase = 0xca06
function CurrStage() => bit7(StageBase) * 16 + bit6(StageBase) * 8 +
    bit5(StageBase) * 4 + bit4(StageBase) * 2 + bit3(StageBase)

MusicId = byte(0x1101b)

MusicOverworld = MusicId >= 0x21 && MusicId <= 0x22

EarnedTreasure = GsTreasureFound && MusicId == 0x28
ClearedStage = GsTreasureFound && (MusicId == 0x28 || MusicId == 0x23)

AllTreasuresFound = high4(0xca5b) == 0xf
AllKeysFound = low4(0xca5b) == 0xf

StoredMusicCoinClears = bitcount(0xca3e) + bitcount(0xca3f) +
    bitcount(0xca40) + bitcount(0xca41)

PrevStoredMusicCoinClears = prev(bitcount(0xca3e)) + prev(bitcount(0xca3f)) +
    prev(bitcount(0xca40)) + prev(bitcount(0xca41))

// cheevos

achievement(
    title = "Caution: English Required!",
    points = 0,
    description = "Selecting Japanese will risk you being locked out later on.",
    trigger = MusicId == 0x33 && GsLanguage && prev(GameState) == 0
)

achievement(
    title = "So THAT'S The Gimmick...",
    points = 1,
    description = "Hit a Skull Tile! Hope you saved before doing so...",
    trigger = MusicId == 0x33 && GsTitle && prior(GameState) == 2
)

function TotalTreasuresCheevo(title, points, desc, target) {
    measuring = CurrTreasures == target
    if (target > 1) {
        measuring = measured(measuring)
    }
    achievement(
        title = title,
        points = points,
        description = desc,
        trigger = EarnedTreasure && measuring
    )
}

TotalTreasuresCheevo(
    "First Treasure!",
    5,
    "Open your first treasure chest! Only 99 more to go!",
    1
)
TotalTreasuresCheevo(
    "[VOID] 25 Treasures!",
    10,
    "You are 25% towards all treasures! Do you want to keep going?",
    25
)
TotalTreasuresCheevo(
    "[VOID] 50 Treasures!",
    25,
    "You are halfway to all treasures! Don't give up now!",
    50
)
TotalTreasuresCheevo(
    "[VOID] 75 Treasures!",
    50,
    "Only 25 more treasures to go! Please remember to take breaks!",
    75
)
TotalTreasuresCheevo(
    "[VOID] Supreme Treasure Master!",
    100,
    "You collected all of the treasures! You are amazing!!!",
    100
)

StageLookup = {
    0: "Out of the Woods",
    1: "The Peaceful Village",
    2: "The Vast Plain",
    3: "Bank of Wild River",
    4: "The Tidal Coast",
    5: "Sea Turtle Rocks",
    6: "Desert Ruins",
    7: "The Volcano's Base",
    8: "The Pool of Rain",
    9: "A Town in Chaos",
    10: "Beneath the Waves",
    11: "The West Crater",
    12: "The Grasslands",
    13: "The Big Bridge",
    14: "Tower of Revival",
    15: "The Steep Canyon",
    16: "Cave of Flames",
    17: "Above the Clouds",
    18: "Stagnant Swamp",
    19: "The Frigid Sea",
    20: "Castle of Illusions",
    21: "The Colossal Hole",
    22: "The Warped Void",
    23: "The East Crater",
    24: "Forest of Fear"
}

BossData = [
    [7, 0, "The Power Of Bonking"],
    [12, 0, "No Worming Out Of This One"],
    [8, 2, "Not A Howling Good Time"],
    [9, 1, "What's Next: American Football?"],
    [18, 1, "Getting A Hold Of The Difficulty"],
    [5, 0, "Where's My Inkbrush?"],
    [6, 3, "[VOID] That's Gotta Sting"],
    [18, 2, "Spooky Scary Singular Skeleton"],
    [3, 2, "Boss Bass's Brother?"]
]

ColorLookup = {
    0: "Gray",
    1: "Red",
    2: "Green",
    3: "Blue"
}

function BossCheevo(data) {
    stageId = data[0]
    keyBit = data[1]
    achievement(
        title = data[2],
        points = 10,
        description = format(
            "Defeat the boss and claim the {0} treasure of {1}.",
            ColorLookup[keyBit],
            StageLookup[stageId]
        ),
        trigger = CurrStage() == stageId && EarnedTreasure &&
            bit(keyBit, 0xca5b) == 1 && bit(keyBit + 4, 0xca5b) == 1
    )
}

for i in BossData {
    BossCheevo(i)
}

MusicCoinLookup = {
    0: 10,
    1: 5,
    2: 10,
    3: 10,
    4: 10,
    5: 10,
    6: 10,
    7: 10,
    8: 10,
    9: 10,
    10: 10,
    11: 25,
    12: 10,
    13: 25,
    14: 25,
    15: 25,
    16: 25,
    17: 50,
    18: 10,
    19: 5,
    20: 25,
    21: 25,
    22: 5,
    23: 25,
    24: 25
}

function MusicCoinCheevo(stageId) {
    name = StageLookup[stageId]
    achievement(
        title = format("Music Coin Master: {0}", name),
        points = MusicCoinLookup[stageId],
        description = format("Clear {0} with all 8 music coins.", name),
        trigger = CurrStage() == stageId && ClearedStage && InLevelMusicCoins == 8
    )
}

for i in StageLookup {
    MusicCoinCheevo(i)
}

achievement(
    title = "[VOID] Supreme Music Coin Master",
    points = 100,
    description = "Bank every music coin and enjoy your golf game. You've earned it!",
    trigger = ClearedStage && PrevStoredMusicCoinClears == 24 &&
        measured(StoredMusicCoinClears == 25)
)

TreasurePointsLookup = {
    0: 10,
    1: 5,
    2: 10,
    3: 25,
    4: 10,
    5: 10,
    6: 10,
    7: 10,
    8: 25,
    9: 10,
    10: 10,
    11: 25,
    12: 10,
    13: 10,
    14: 25,
    15: 25,
    16: 25,
    17: 50,
    18: 10,
    19: 10,
    20: 25,
    21: 10,
    22: 10,
    23: 25,
    24: 25
}

function StageTreasuresCheevo(stageId) {
    name = StageLookup[stageId]
    achievement(
        title = format("Treasure Master: {0}", name),
        points = TreasurePointsLookup[stageId],
        description = format("Collect all 4 treasures in {0}.", name),
        trigger = CurrStage() == stageId && EarnedTreasure && AllTreasuresFound
    )
}

for i in StageLookup {
    StageTreasuresCheevo(i)
}

function CommonTimeTrialLogic(stageId) {
    return never(GameState <= 1) && never(CurrStage() != stageId) &&
        never(!TimeAttackEnabled) && never(!AllKeysFound) &&
        once(prev(GameState) != 3 && GsTreasureFound) &&
        once(prev(MusicId) != 0x28 && MusicId == 0x28)
}

function TimeTrialCheevo(stageId) {
    name = StageLookup[stageId]
    achievement(
        title = format("Time Trial: {0}", name),
        points = TreasurePointsLookup[stageId],
        description = format("Complete the time trial at {0}.", name),
        trigger = CommonTimeTrialLogic(stageId)
    )
}

for i in StageLookup {
    TimeTrialCheevo(i)
}

achievement(
    title = "I Mean, This IS Wario In The End",
    points = 10,
    description = "Max your wallet: 999 coins!",
    trigger = GsInLevel && PrevCoins >= 950 && PrevCoins <= 998 && CurrCoins == 999
)

achievement(
    title = "Oh Right: The Plot Of The Game",
    points = 25,
    description = "Defeat Rudy and rescue Tiger!",
    trigger = MusicId == 0x3a && byte(0xced4) == 7 && prev(byte(0xced4)) == 0
)

// Leaderboards

function TimeTrialLeaderboard(stageId) {
    name = StageLookup[stageId]
    leaderboard(
        title = format("{0} TT", name),
        description = format("Complete the time trial at {0}.", name),
        start = CommonTimeTrialLogic(stageId),
        cancel = always_false(),
        submit = always_true(),
        value = RunningTime,
        lower_is_better = true,
        format = "frames"
    )
}

for i in StageLookup {
    TimeTrialLeaderboard(i)
}

// RP

EmojiSun = "☀️"
EmojiMoon = "🌙"
EmojiMoney = "💰"
EmojiTreasure = "🏴‍☠️"
EmojiTimer = "⏲️"

OverworldLookup = {
    0: "The Temple",
    1: "Out of the Woods",
    2: "The Peaceful Village",
    3: "The Vast Plain",
    4: "Bank of the Wild River",
    5: "The Tidal Coast",
    6: "Sea Turtle Rocks",
    7: "A Fork in the Road",
    10: "Desert Ruins",
    11: "The Volcano's Base",
    12: "The Pool of Rain",
    13: "A Town in Chaos",
    14: "Beneath the Waves",
    15: "The West Crater",
    20: "The Grasslands",
    21: "The Big Bridge",
    22: "Tower of Revival",
    23: "The Steep Canyon",
    24: "Cave of Flames",
    25: "Above the Clouds",
    30: "The Stagnant Swamp",
    31: "The Frigid Sea",
    32: "Castle of Illusions",
    33: "The Colossal Hole",
    34: "The Warped Void",
    35: "The East Crater",
    36: "Forest of Fear",
}

TimeLookup = {
    0: EmojiSun,
    1: EmojiMoon
}

LevelTreasureLookup = {
    1: "The Gray",
    2: "The Red",
    3: "The Green",
    4: "The Blue",
    5: "No"
}

TrialResultLookup = {
    0x23: "Failed"
}

OverworldPosition = byte(0x10012) * 10 + byte(0x10066)

RpLevel = rich_presence_lookup("Stage", CurrStage(), StageLookup, "Lost in the Music Box")
RpTime = rich_presence_lookup("Time", Time, TimeLookup, EmojiMoon)
RpOverworld = rich_presence_lookup("Overworld", OverworldPosition, OverworldLookup, "Somewhere")
RpCoins = rich_presence_macro("Number", CurrCoins)
RpTreasure = rich_presence_macro("Number", CurrTreasures)
RpTrial = rich_presence_value("Frames", RunningTime, "Frames")

rich_presence_conditional_display(
    GsTutorial && prior(GameState) == 0,
    "Wario is learning basic moves before starting the Master Quest"
)

rich_presence_conditional_display(
    GameState == 6 || GameState == 0x0c || byte(0xced4) == 6,
    "Wario is trapped by Rudy...FOREVER!!"
)

rich_presence_conditional_display(
    byte(0xced4) == 7,
    "Wario and Tiger are freed."
)

rich_presence_conditional_display(
    MusicId == 0x35 || MusicId == 0x3a,
    "Wario is fighting Rudy. Yeah, he's in the game too. {2}{3} {4}{5}/100",
    RpOverworld,
    RpTime,
    EmojiMoney,
    RpCoins,
    EmojiTreasure,
    RpTreasure
)

rich_presence_conditional_display(
    MusicId == 0x2c || MusicId == 0x39,
    "Wario is breaking Tiger's seal. {2}{3} {4}{5}/100",
    RpOverworld,
    RpTime,
    EmojiMoney,
    RpCoins,
    EmojiTreasure,
    RpTreasure
)

rich_presence_conditional_display(
    MusicOverworld,
    "Wario is thinking of entering {0} {1} {2}{3} {4}{5}/100",
    RpOverworld,
    RpTime,
    EmojiMoney,
    RpCoins,
    EmojiTreasure,
    RpTreasure
)

rich_presence_conditional_display(
    GameState == 0x0a,
    "Wario is wasting time with golf. {2}{3} {4}{5}/100",
    RpLevel,
    RpTime,
    EmojiMoney,
    RpCoins,
    EmojiTreasure,
    RpTreasure
)

rich_presence_conditional_display(
    GsTutorial,
    "Wario is learning of his new ability in {0} {1} {2}{3} {4}{5}/100",
    RpLevel,
    RpTime,
    EmojiMoney,
    RpCoins,
    EmojiTreasure,
    RpTreasure
)

rich_presence_conditional_display(
    GsGolf && prior(GameState) == 2,
    "Wario is golfing in {0} {1} {2}{3} {4}{5}/100",
    RpLevel,
    RpTime,
    EmojiMoney,
    RpCoins,
    EmojiTreasure,
    RpTreasure
)

rich_presence_conditional_display(
    (GsInLevel || MusicId == 0x25) && TimeAttackEnabled,
    "Wario racing in {0} {1} Time Trial {2}{3} {4}{5}",
    RpLevel,
    RpTime,
    EmojiMoney,
    RpCoins,
    EmojiTimer,
    RpTrial
)

rich_presence_conditional_display(
    GsInLevel || MusicId == 0x25,
    "Wario in {0} {1} {2}{3} {4}{5}/100",
    RpLevel,
    RpTime,
    EmojiMoney,
    RpCoins,
    EmojiTreasure,
    RpTreasure
)

rich_presence_conditional_display(
    GsSaving || (GsOverworld && prior(GameState) <= 4 && prior(GameState) >= 3),
    "Wario is leaving {0} {1} {2}{3} {4}{5}/100",
    RpLevel,
    RpTime,
    EmojiMoney,
    RpCoins,
    EmojiTreasure,
    RpTreasure
)

rich_presence_conditional_display(
    TimeAttackEnabled && GsTreasureFound,
    "Wario has {6} the Time Trial in {0} {1} {2}{3} {4}{5}",
    RpOverworld,
    RpTime,
    EmojiMoney,
    RpCoins,
    EmojiTimer,
    RpTrial,
    rich_presence_lookup("TT", MusicId, TrialResultLookup, "Passed")
)

rich_presence_conditional_display(
    GsTreasureFound,
    "Wario has collected {6} Treasure in {0} {1} {2}{3} {4}{5}/100",
    RpOverworld,
    RpTime,
    EmojiMoney,
    RpCoins,
    EmojiTreasure,
    RpTreasure,
    rich_presence_lookup("Result", byte(0xced4), LevelTreasureLookup)
)

rich_presence_conditional_display(
    MusicId == 0x37 && TimeAttackEnabled,
    "Wario is looking over his best times."
)

rich_presence_conditional_display(
    MusicId == 0x37,
    "Wario is looking over his collected treasures. {0}{1}/100",
    EmojiTreasure,
    RpTreasure
)

rich_presence_conditional_display(
    GsOverworld,
    "Wario is influenced by cutscenes. {2}{3} {4}{5}/100",
    RpLevel,
    RpTime,
    EmojiMoney,
    RpCoins,
    EmojiTreasure,
    RpTreasure
)

rich_presence_conditional_display(
    GsTitle,
    "Welcome to the world of Tiger's Wario Land 3: Master Quest"
)

rich_presence_display("Exploring Tiger's Master Quest of Wario Land 3")
