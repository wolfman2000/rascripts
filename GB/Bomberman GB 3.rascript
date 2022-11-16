// Bomberman GB 3
// #ID = 6440

// Bomberman State
BombState = byte(0xc000)
Dying = BombState == 0x01
Standing = BombState == 0x02
Walking = BombState == 0x03
ClearedSection = BombState == 0x0e
ClearedStage = BombState == 0x10
ClearedBoss = BombState == 0x0a

// Game State. Can be a word if required.
GameState = byte(0xc0fd)
GsBootup = GameState == 0x00 || GameState == 0x16 || GameState == 0x36 || GameState == 0x5c ||
    GameState == 0xbc
GsGamePlay = GameState == 0x1c
GsGameOver = GameState == 0x26
GsContinue = GameState == 0x2e
GsChallengeDecide = GameState == 0x63
GsIntro = GameState == 0x64
GsTitleScreen = GameState == 0x71
GsWorldSelection = GameState == 0x80
GsShop = word(0xc0fd) == 0x0370
GsInstructions = GameState == 0x70 && !GsShop
GsChallengeBegin = GameState == 0xa2
GsChallengeResult = GameState == 0xad
GsChallengeRank = GameState == 0xb5
GsPassword = GameState == 0xd4
GsEnding = GameState == 0xe1
GsCredits = GameState == 0xe9
GsBossRush = prev(GameState) == 0xd4 && GsGamePlay

ChallengeType = low4(0xc360)
ChallengeField = ChallengeType == 0
ChallengePanic = ChallengeType == 1
ChallengeTime = low4(0xc361)

WorldId = low4(0xc362)
WorldWood = WorldId == 0
WorldCity = WorldId == 1
WorldIce = WorldId == 2
WorldSand = WorldId == 3
WorldLava = WorldId == 4
WorldAqua = WorldId == 5
WorldEvil = WorldId == 6

WorldChallenge = WorldId == 7
WorldChallengePanic = WorldId == 8
// What stage are we in?
StageId = low4(0xc365)
// What section/part of the stage are we in?
SectionId = low4(0xc366)

WorldLookup = {
    0: "Wood",
    1: "City",
    2: "Ice",
    3: "Sand",
    4: "Lava",
    5: "Aqua",
    6: "Evil"
}

LifeCount = byte(0xc363)
LostLife = LifeCount < prev(LifeCount)

FireCount = low4(0xc368)
BombCount = low4(0xc369)

BomberKick = bit0(0xc36a) == 1
BomberDash = bit1(0xc36a) == 1
BomberLine = bit2(0xc36a) == 1
BomberFull = bit3(0xc38d) == 1

BomberMotoVehicle = low4(0xc367)
OnFoot = BomberMotoVehicle == 0

BomberMotoStatusBase = 0xc36b

BomberCurse = low4(0xc36c)

// How much time is left? Only use this during normal game state.
TimeMinutes = low4(0xc36f)
TimeSecondsTen = low4(0xc371)
TimeSecondsOne = low4(0xc370)
TimeDecimal = byte(0xc372)

ChallengeInitTime = 2 + ChallengeTime * 3
ChallengeStartTime = TimeMinutes == ChallengeInitTime

function Score(base) {
    return low4(base) * 10000 + low4(base + 1) * 1000 +
        low4(base + 2) * 100 + low4(base + 3) * 10 + low4(base + 4)
}

ChallengeScore = Score(0xc376)

// How many capsules are in posession?
CurrencyOwned = byte(0xc38c)


CurrencyTotal = byte(0xc4b7)

// How many crystals are owned in stage X-5?
// This one is used for Section 2.
CrystalsOwned = byte(0xc390 + SectionId)

// How much health does the Bomber Moto 4 have?
// Use this in conjunction with the bike status to see if damage was taken.
Moto4Health = low4(0xc395)

// How many targets must be destroyed to leave the current level?
TargetCounter = low4(0xc4b7)

// Was a clock power-up picked?
TimerPickedUp = byte(0xc4bb) > prev(byte(0xc4bb))

IsPaused = byte(0xde73)

LoadoutOne = BomberKick && BomberDash && BomberLine
LoadoutTwo = BomberMotoVehicle == 3 && BomberDash
LoadoutThree = BomberMotoVehicle == 4

ChallengeTimeLookup = {
    0: "2",
    1: "5"
}

StageLookup = {
    0: "Field",
    1: "Panic"
}

LoadoutLookup = {
    0: LoadoutOne,
    1: LoadoutTwo,
    2: LoadoutThree
}

WorldCheevoLookup = {
    0: "Traditional First World",
    1: "Non-Traditional Second World",
    2: "Slipping And Sliding Away",
    3: "Only Two Worlds Late",
    4: "This Is Not The End",
    5: "Late Appearance By Water",
    6: "Evil Or Misunderstood?"
}

WorldCrystalLookup = {
    0: 70,
    1: 90,
    2: 90,
    3: 70,
    4: 70,
    5: 90,
    6: 80
}

// Achievements

achievement(
    title = "Bomb Quantity",
    points = 2,
    description = "Have the capacity for dropping four bombs at once.",
    trigger = BombCount == 3 && prev(BombCount) == 2 && GsGamePlay
)

achievement(
    title = "Bomb Quality",
    points = 2,
    description = "Have the capability of dropping bombs with a range of 4 tiles.",
    trigger = FireCount == 3 && prev(FireCount) == 2 && GsGamePlay
)

achievement(
    title = "Mulligan Requested",
    points = 3,
    description = "Find and collect a 1-up panel in a non-crystal stage.",
    trigger = StageId != 4 && LifeCount > prev(LifeCount) && GsGamePlay &&
        (Standing || Walking)
)

achievement(
    title = "Insert Jojo Meme Here",
    points = 3,
    description = "Find and collect a clock panel.",
    trigger = TimerPickedUp && GsGamePlay && (Standing || Walking)
)

function WorldClearCheevo(index) {
    points = 5
    if (index >= 3) {
        points = 10
    }
    normalClear = never(WorldId != index) && once(StageId == 0 && ClearedStage) &&
            once(StageId == 1 && ClearedStage) && once(StageId == 2 && ClearedStage) &&
            once(StageId == 3 && ClearedStage) && once(StageId == 4 && ClearedStage)
    if (index < 6) {
        normalClear = normalClear && once(StageId == 5 && ClearedBoss)
    }
    else {
        normalClear = normalClear && once(StageId == 5 && SectionId == 1 && ClearedBoss)
    }
    
    achievement(
        title = WorldCheevoLookup[index],
        description = format("Clear all stages of {0} World in a row.", WorldLookup[index]),
        points = points,
        trigger = never(WorldId != index) && never(GsTitleScreen) && normalClear
    )
}

function CrystalClearCheevo(index) {
    points = 5
    if (index >= 3) {
        points = 10
    }
    achievement(
        title = format("Crystal Collector in {0} World", WorldLookup[index]),
        description = format(
            "Collect every crystal in the {0} World before beating the 5th stage.",
            WorldLookup[index]
        ),
        points = points,
        trigger = WorldId == index && StageId == 4 && measured(
            CrystalsOwned == WorldCrystalLookup[index]
        ) && ClearedStage && prev(BombState) != 0x10
    )
}

for index in WorldCheevoLookup {
    CrystalClearCheevo(index)
    WorldClearCheevo(index)
}

achievement(
    title = "Kick It Up",
    points = 5,
    description = "Purchase the Kick power-up in the shop.",
    trigger = prev(CurrencyOwned) > CurrencyOwned && BomberKick
)

achievement(
    title = "Not Quite Quick Attack",
    points = 5,
    description = "Purchase the Dash power-up in the shop.",
    trigger = prev(CurrencyOwned) > CurrencyOwned && BomberDash
)

achievement(
    title = "Connect Up-To-Four",
    points = 5,
    description = "Purchase the Line power-up in the shop.",
    trigger = prev(CurrencyOwned) > CurrencyOwned && BomberLine
)

achievement(
    title = "I Have The Power",
    points = 10,
    description = "Purchase the Full power-up in the shop.",
    trigger = prev(CurrencyOwned) > CurrencyOwned && BomberFull
)

achievement(
    title = "Hearts With Wheels",
    points = 5,
    description = "Purchase any motorcycle in the shop.",
    trigger = prev(CurrencyOwned) > CurrencyOwned && (
        bit4(0xc38d) > prev(bit4(0xc38d)) ||
        bit5(0xc38d) > prev(bit5(0xc38d)) ||
        bit6(0xc38d) > prev(bit6(0xc38d)) ||
        bit7(0xc38d) > prev(bit7(0xc38d))
    )
)

function BikeClearCheevo(index) {
    achievement(
        title = format("Moto-{0} Mastery", index + 1),
        description = format(
            "Clear any two-part non-boss stage using the Moto-{0} without taking damage.",
            index + 1
        ),
        points = 10,
        trigger = StageId != 5 && WorldId <= 6 && (WorldId > 2 || StageId != 0) &&
            once(BomberMotoVehicle == index + 1) && once(GsGamePlay && ClearedSection) &&
            trigger_when(GsGamePlay && ClearedStage) &&
            never(GsGamePlay && OnFoot) && never(WorldId != prev(WorldId)) &&
            never(StageId != prev(StageId)) &&
            never(GsGamePlay && Moto4Health < prev(Moto4Health))
    )
}

for index in range(0, 3, 1) {
    BikeClearCheevo(index)
}

function WorldMastery(index) {
    points = 10
    if (index >= 3) {
        points = 25
    }
    normalClear = never(WorldId != index) && once(StageId == 0 && ClearedStage) &&
            once(StageId == 1 && ClearedStage) && once(StageId == 2 && ClearedStage) &&
            once(StageId == 3 && ClearedStage) && once(StageId == 4 && ClearedStage)
    if (index < 6) {
        normalClear = normalClear && once(StageId == 5 && ClearedBoss)
    }
    else {
        normalClear = normalClear && once(StageId == 5 && SectionId == 1 && ClearedBoss)
    }
    
    achievement(
        title = WorldLookup[index] + " Mastery",
        description = format(
            "Clear all stages of {0} World in a row without losing a life.",
            WorldLookup[index]
        ),
        points = points,
        trigger = never(WorldId != index) && never(LifeCount < prev(LifeCount)) &&
            never(GsTitleScreen) && normalClear
    )
}

for index in range(0, 6, 1) {
    WorldMastery(index)
}

achievement(
    title = "Bombermiser",
    points = 25,
    description = "Beat the game without ever buying anything from the shop in one session.",
    trigger = once(WorldId == 0 && StageId == 0 && ClearedStage) &&
        once(WorldId == 1 && StageId == 0 && ClearedStage) &&
        once(WorldId == 2 && StageId == 0 && ClearedStage) &&
        never(CurrencyOwned < prev(CurrencyOwned)) &&
        trigger_when(WorldId == 6 && StageId == 5 && SectionId == 1 && ClearedBoss)
)

achievement(
    title = "Mega Man In My Bomberman",
    points = 25,
    description = "Clear the Boss Rush Mode without a game over. Use the password from beating Story Mode.",
    trigger = once(GsBossRush) && never(GsGameOver) && never(GsTitleScreen) &&
        WorldId == 6 && StageId == 5 && SectionId == 1 && ClearedBoss
)

for stage in range(0, 1, 1) {
    for loadout in range(0, 2, 1) {
        achievement(
            title = format(
                "{0} Challenge - Loadout {1}",
                StageLookup[stage],
                loadout + 1
            ),
            points = 5,
            description = format(
                "Complete the {0} Challenge stage using Loadout {1}.",
                StageLookup[stage],
                loadout + 1
            ),
            trigger = once(WorldId == 7 + stage) && once(LoadoutLookup[loadout]) && 
                once(ChallengeType == stage) &&
                never(Dying) && never(GsChallengeRank) && GsChallengeResult
        )
        
        achievement(
            title = format(
                "Fast {0} Challenge - Loadout {1}",
                StageLookup[stage],
                loadout + 1
            ),
            points = 10,
            description = format(
                "Complete the {0} Challenge stage using Loadout {1} within 2 minutes.",
                StageLookup[stage],
                loadout + 1
            ),
            trigger = once(WorldId == 7 + stage) && once(LoadoutLookup[loadout]) && 
                once(ChallengeType == stage) &&
                never(Dying) && never(GsChallengeRank) && never(
                    TimeMinutes == 3 && TimeSecondsTen == 0 && TimeSecondsOne == 0
                ) && GsChallengeResult
        )
    }
}

// Leaderboards

for stage in range(0, 1, 1) {
    for loadout in range(0, 2, 1) {
        initialStart = WorldId == 7 + stage &&
            once(ChallengeStartTime) && once(LoadoutLookup[loadout]) &&
            ChallengeType == stage
        leaderboard(
            title = format(
                "Challenge - Time Attack {0} Loadout {1}",
                StageLookup[stage],
                loadout + 1
            ),
            description = format(
                "Clear the {0} Stage as fast as you can with Loadout {1}.",
                StageLookup[stage],
                loadout + 1
            ),
            start = initialStart &&
                never(Dying) && never(GsChallengeRank) &&
                GsChallengeResult,
            cancel = always_false(),
            submit = always_true(),
            lower_is_better = true,
            value = (ChallengeInitTime * 60) - (TimeMinutes * 60) -
                (TimeSecondsTen * 10) - TimeSecondsOne,
            format = "secs"
        )
        for time in range(0, 1, 1) {
            leaderboard(
                title = format(
                    "Challenge - Score Attack {2}-Minute {0} Loadout {1}",
                    StageLookup[stage],
                    loadout + 1,
                    ChallengeTimeLookup[time]
                ),
                description = format(
                    "Get the high score on the {0} Stage with Loadout {1} in {2} minutes.",
                    StageLookup[stage],
                    loadout + 1,
                    ChallengeTimeLookup[time]
                ),
                start = initialStart &&
                    ChallengeTime == time && never(GsChallengeDecide) &&
                    GsChallengeRank,
                    cancel = always_false(),
                    submit = always_true(),
                format = "value",
                value = ChallengeScore
            )
        }
    }
}

leaderboard(
    title = "Boss Rush Time Attack",
    description = "Complete Boss Rush as fast as you can.",
    start = prior(GameState) == 0xd4 && GsGamePlay,
    cancel = Dying,
    submit = always_false(), // Need to confirm the screen.,
    value = always_true(),
    lower_is_better = true,
    format = "frames"
)

// Rich Presence

CharBomb = "💣"
CharFire = "🔥"
CharKick = "🦶"
CharMoto = "🏍️"
CharScore = "💯"
CharLife = "🚶"
CharTime = "⏲️"

TravelLookup = {
    0: "Foot",
    1: format("{0}-1", CharMoto),
    2: format("{0}-2", CharMoto),
    3: format("{0}-3", CharMoto),
    4: format("{0}-4", CharMoto)
}

RpWorld = rich_presence_lookup("World", WorldId, WorldLookup)
RpStage = rich_presence_macro("Number", StageId + 1)
RpChallengeType = rich_presence_lookup("ChallengeStage", ChallengeType, StageLookup)
RpChallengeScore = rich_presence_macro("Number", ChallengeScore)
RpBombCount = rich_presence_macro("Number", BombCount + 1)
RpFireCount = rich_presence_macro("Number", FireCount + 1)
RpLifeCount = rich_presence_macro("Number", LifeCount)
RpTravel = rich_presence_lookup("Travel", BomberMotoVehicle, TravelLookup)
RpTimeMinutes = rich_presence_macro("Number", TimeMinutes)
RpTimeSecondsTen = rich_presence_macro("Number", TimeSecondsTen)
RpTimeSecondsOne = rich_presence_macro("Number", TimeSecondsOne)

rich_presence_conditional_display(
    GsChallengeResult || GsChallengeRank,
    "Challenge Mode End: {0} Stage: {4}{1} {5}{2} {6}{3}",
    RpChallengeType,
    RpChallengeScore,
    RpBombCount,
    RpFireCount,
    CharScore,
    CharBomb,
    CharFire
)

rich_presence_conditional_display(
    GsGamePlay && WorldId >= 7,
    "Challenge Mode: {0} Stage On {7}: {8}{9}:{10}{11} {4}{1} {5}{2} {6}{3}",
    RpChallengeType,
    RpChallengeScore,
    RpBombCount,
    RpFireCount,
    CharScore,
    CharBomb,
    CharFire,
    RpTravel,
    CharTime,
    RpTimeMinutes,
    RpTimeSecondsTen,
    RpTimeSecondsOne
)

rich_presence_conditional_display(
    GsGamePlay && WorldId <= 6,
    "Playing {0}-{1}: {2}{3}:{4}{5} {6}{7} {8}{9} {10}{11}",
    RpWorld,
    RpStage,
    CharTime,
    RpTimeMinutes,
    RpTimeSecondsTen,
    RpTimeSecondsOne,
    CharLife,
    RpLifeCount,
    CharBomb,
    RpBombCount,
    CharFire,
    RpFireCount
)

rich_presence_conditional_display(
    GsInstructions,
    "Learning the Goal of Stage {0}-{1}",
    RpWorld,
    RpStage
)

rich_presence_conditional_display(
    GsShop,
    "Shopping for New Gear"
)

rich_presence_conditional_display(
    GsContinue || GsGameOver,
    "Planet Owen is Doomed..."
)

rich_presence_conditional_display(
    GsWorldSelection,
    "Selecting a World in Bomberman GB 3"
)

rich_presence_conditional_display(
    GsEnding || GsCredits,
    "Planet Owen is Saved!"
)

rich_presence_display("Playing Bomberman GB 3")
