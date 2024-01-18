// Asterix & Obelix
// #ID = 2501

ALookup = {
    0x00: "Britania Act 1",
    0x01: "Britania Act 2",
    0x02: "Britania Act 2",
    0x03: "Britania Act 3",
    0x04: "Britania Act 3",
    0x05: "Britania Act 4",
    0x06: "Helvetia Act 1",
    0x07: "Helvetia Act 2",
    0x08: "Helvetia Act 3",
    0x09: "Helvetia Act 4 ",
    0x0a: "Helvetia Act 4 ",
    0x0b: "Greece Act 1",
    0x0c: "Greece Act 2",
    0x0d: "Greece Act 3",
    0x0e: "Greece Act 4",
    0x0f: "Hispania Act 1",
    0x10: "Hispania Act 2",
    0x11: "Hispania Act 3",
    0x12: "Hispania Act 4",
    0x13: "Game Ending",
}

CLookup = {
    0: "Astérix",
    1: "Obélix",
}

ClivesLookup = {
    0: "👱🏻‍♂️",
    1: "👨🏻‍🦰",
}

DLookup = {
    0: "Easy",
    1: "Medium",
    2: "Hard",
}

StageId = byte(0xc06e)
PlaceId = byte(0xc071)
Health = byte(0xc08c)
Lives = byte(0xc08d)
Stars = byte(0xc08e)
Coins = byte(0xc090)
Difficulty = byte(0xc0d1)
Char = byte(0xc0f0)
RugbyScore = byte(0xc0f4)
MusicId = byte(0xc201)
GameState = word(0xdffe)

function CurrTime() => byte(0xc080) * 10 + byte(0xc07f)
function PrevTime() => prev(byte(0xc080)) * 10 + prev(byte(0xc07f))
function PriorTime() => prior(byte(0xc080)) * 10 + prior(byte(0xc07f))

function LostHealth() => Health < prev(Health)
function LostHealthOverflow() => prev(Health) == 0 && Health == 8 && MusicId != 0x70
function GotHit() => byte(0xc063) < 0xff && prev(byte(0xc063)) != 0xff
function LostLife() => Lives < prev(Lives)
function DeathMusic() => MusicId == 0x70 && prev(MusicId) != 0x70
function TimeUp() => GameState == 0x73e
function GameOver() => GameState == 0x755
function CharSelect() => GameState == 0x37d

function StageFinish(futureStage) {
    if (futureStage > 0x0f) {
        return 0x767
    }
    if (futureStage == 6 || futureStage == 0x0b || futureStage == 0x0f) {
        return 0x3f6
    }
    return 0x77b
}

NormalStageData = [
    ["Wild Hogs", "Britania", "1", 0x01],
    ["Hill Side", "Britania", "2", 0x03],
    ["Prison Break", "Britania", "3", 0x05],
    ["Londinium Vs. Roma", "Britania", "4", 0x06],
    ["Get out of My Swamp", "Helvetia", "1", 0x07],
    ["Sailing Away", "Helvetia", "2", 0x08],
    ["Do You Wanna Build a Snowman?", "Helvetia", 3, 0x09],
    ["Bank Heist", "Helvetia", "4", 0x0b],
    ["A Pirates Life for Me", "Greece", "1", 0x0c],
    ["Attack of the Killer Plants", "Greece", "2", 0x0d],
    ["Street Rat", "Greece", "3", 0x0e],
    ["Champion!", "Greece", "4", 0x0f],
    ["Ahoy!", "Hispania", "1", 0x10],
    ["Slippery Slopes", "Hispania", "2", 0x11],
    ["Ready, A- FIRE!", "Hispania", "3", 0x12],
    ["Running of the Bulls", "Hispania", "4", 0x13]
]

function NormalStageCheckpoint(index) {
    checkpoint = always_true()
    if (index >= 1 && index <= 3) {
        checkpoint = once(
            PlaceId == NormalStageData[0][3] &&
            GameState == StageFinish(NormalStageData[0][3])
        )
    }
    else if (index >= 5 && index <= 7) {
        checkpoint = once(
            PlaceId == NormalStageData[4][3] &&
            GameState == StageFinish(NormalStageData[4][3])
        )
    }
    else if (index >= 9 && index <= 11) {
        checkpoint = once(
            PlaceId == NormalStageData[8][3] &&
            GameState == StageFinish(NormalStageData[8][3])
        )
    }
    else if (index >= 13 && index <= 15) {
        checkpoint = once(
            PlaceId == NormalStageData[12][3] &&
            GameState == StageFinish(NormalStageData[12][3])
        )
    }
    return checkpoint
}

function BeatStage(index, stageData) {
    return Difficulty != 0 && NormalStageCheckpoint(index) &&
        never(CharSelect()) &&
        PlaceId == stageData[3] && GameState == StageFinish(stageData[3])
}

function NormalStageCheevo(index) {
    stageData = NormalStageData[index]
    points = 5
    desc = format(
        "Beat {0} act {1}",
        stageData[1],
        stageData[2]
    )
    if (index == 15) {
        points = 10
        desc = desc + " and beat the game"
    }
    achievement(
        title = stageData[0],
        points = points,
        id = 6862 + index,
        description = desc,
        trigger = BeatStage(index, stageData)
    )
}

for i in range(0, 15) {
    NormalStageCheevo(i)
}

function BonusStageCheevo(index) {
    stageData = NormalStageData[index]
    points = 5
    desc = format("Beat {0} act {1} with all 10 bonus stars.", stageData[1], stageData[2])
    achievement(
        title = format("Seeing Stars in {0} Act {1}", stageData[1], stageData[2]),
        points = points,
        description = desc,
        trigger = BeatStage(index, stageData) && Stars == 10
    )
}

for i in range(0, 15) {
    if (i != 3 && i != 7 && i != 11 && i != 15) {
        BonusStageCheevo(i)
    }
}

CurrentStageData = [
    [0, 0],
    [1, 2],
    [3, 4],
    [5, 5],
    [6, 6],
    [7, 7],
    [8, 8],
    [9, 10],
    [11, 11],
    [12, 12],
    [13, 13],
    [14, 14],
    [15, 15],
    [16, 16],
    [17, 17],
    [18, 18]
]

MissionData = [
    "without taking damage",
    "without taking damage",
    "without taking damage",
    "without taking damage",
    "without taking damage",
    "without taking damage",
    "without taking damage",
    "without taking damage",
    "without taking damage",
    "without taking damage",
    "without taking damage",
    "without taking damage",
    "without taking damage",
    "without taking damage",
    "without taking damage",
    "without losing two lives"
]

function InStage(index) =>
    StageId >= CurrentStageData[index][0] &&
    StageId <= CurrentStageData[index][1]

function Stage14ChallengeCheevo(index) {
    stageData = NormalStageData[index]
    achievement(
        title = format(
            "Mission Successful In {0} Act {1}",
            stageData[1],
            stageData[2]
        ),
        points = 10,
        description = "Score 3 points in Britania Act 4 without losing the ball.",
        trigger = InStage(index) && disable_when(
            LostHealth(),
            until = CharSelect() || 
            (prev(word(0xc017)) > 0x100 && word(0xc017) == 0x37) || MusicId == 0x70
        ) && disable_when(
            DeathMusic(),
            until = GameOver() || CharSelect() || MusicId != 0x70
        ) && Difficulty != 0 &&
        never(GameOver()) &&
        trigger_when(prev(RugbyScore) + 3 == RugbyScore)
        
    )
}

function Stage34ChallengeCheevo(index) {
    stageData = NormalStageData[index]
    achievement(
        title = format(
            "Mission Successful In {0} Act {1}",
            stageData[1],
            stageData[2]
        ),
        points = 10,
        description = "Score all six points in the Olympic Games.",
        trigger = Difficulty != 0 && InStage(index) &&
            never(GameOver()) &&
            BeatStage(index, NormalStageData[index]) &&
            byte(0xcbaa) == 6
    )
}

function Stage44ChallengeCheevo(index) {
    stageData = NormalStageData[index]
    achievement(
        title = format(
            "Mission Successful In {0} Act {1}",
            stageData[1],
            stageData[2]
        ),
        points = 10,
        description = "Beat Hispania act 4 before losing two lives.",
        trigger = InStage(index) && never(
                repeated(2, StageId == 0x12 && Lives < prev(Lives))
            ) && never(CharSelect()) && never(GameOver()) &&
            trigger_when(BeatStage(index, NormalStageData[index]))
    )
}

TimerValid = CurrTime() < PriorTime()

function ChallengeCheevo(index) {
    stageData = NormalStageData[index]
    currData = CurrentStageData[index]
    challenge = disable_when(
        (GotHit()),
        until=GameOver() || CharSelect() || TimeUp() ||
            StageId < currData[0] && prev(StageId) < currData[0] ||
            StageId > currData[1] && prev(StageId) > currData[1] ||
            !InStage(index) ||
            (MusicId != 0x70 && prev(MusicId) == 0x70 && currData[0] == currData[1]) ||
            (MusicId != 0x70 && prev(MusicId) == 0x70 && StageId != currData[1])
    ) &&
    disable_when(
        (DeathMusic()),
        until=GameOver() || CharSelect() || TimeUp() ||
            !InStage(index) ||
            (MusicId != 0x70 && prev(MusicId) == 0x70 && currData[0] == currData[1]) ||
            (MusicId != 0x70 && prev(MusicId) == 0x70 && StageId != currData[1])
    )
    stageObj = "Beat"
    finish = GameState == StageFinish(stageData[3])
    if (currData[1] == 0x0a) {
        finish = sum_of(range(0, 9), i => byte(0xc5b8 + i)) == 10
    }
    achievement(
        title = format(
            "Mission Successful In {0} Act {1}",
            stageData[1],
            stageData[2]
        ),
        points = 10,
        description = format(
            "{3} {0} act {1} {2}.",
            stageData[1],
            stageData[2],
            MissionData[index],
            stageObj
        ),
        trigger = Difficulty != 0 && challenge && 
            never(MusicId == 0x71) &&
            never(GameState >= 0x160 && GameState <= 0x180) &&
            never(GameState == 0x36d) &&
            trigger_when(TimerValid) &&
            trigger_when(finish)
    )
}

for i in range(0, 15) {
    if i == 3 {
        Stage14ChallengeCheevo(i)
    }
    else if (i == 11) {
        Stage34ChallengeCheevo(i)
    }
    else if (i == 15) {
        Stage44ChallengeCheevo(i)
    }
    else {
        ChallengeCheevo(i)
    }
}

achievement(
    title = "The Classic",
    points = 10,
    description = "Beat the entire game as Asterix.",
    trigger = never(CharSelect()) && Char == 0 && once(BeatStage(0, NormalStageData[0])) &&
        BeatStage(15, NormalStageData[15])
)

achievement(
    title = "The Original",
    points = 10,
    description = "Beat the entire game as Obelix.",
    trigger = never(CharSelect()) && Char == 1 && once(BeatStage(0, NormalStageData[0])) &&
        BeatStage(15, NormalStageData[15])
)

achievement(
    title = "Hard Work Pays Off",
    points = 25,
    description = "Beat the entire game on Hard Mode.",
    trigger = never(CharSelect()) && Difficulty == 2 && once(BeatStage(0, NormalStageData[0])) &&
        BeatStage(15, NormalStageData[15])
)

// Leaderboards

leaderboard(
    title = "Hispania Act 2 Bonus Stage Validator",
    description = "This bonus stage is accessible after all.",
    start = InStage(13) && BeatStage(13, NormalStageData[13]) && Stars == 10,
    cancel = always_false(),
    submit = always_true(),
    value = 1000
)

function FixedLeaderboard(diff, char) {
    diffName = DLookup[diff]
    charName = CLookup[char]
    leaderboard(
        title = format(
            "{0} {1} RTA",
            diffName,
            charName
        ),
        description = format(
            "Beat the game with {0} on {1} difficulty as quick as you can.",
            charName,
            diffName
        ),
        start = Char == char && Difficulty == diff &&
            PlaceId == 0 && PrevTime() == 0 && CurrTime() != 0,
        cancel = GameState == word(0x0755),
        submit = PlaceId == 0x13 && GameState == 0x767,
        value = always_true(),
        format = "MILLISECS",
        lower_is_better = true
    )
}

for i in range(0, 2) {
    for j in range(0, 1) {
        FixedLeaderboard(i, j)
    }
}

// Rich Presence

RpCharLookup = rich_presence_lookup("C", Char, CLookup)

rich_presence_conditional_display(
    StageId != 0x00 || byte(0x00C07D) != 0x00,
    "{0} in {1} on {2} [⭐{3}] [💰{4}] [{5}{6}]",
    RpCharLookup,
    rich_presence_lookup("A", StageId, ALookup, "Bonus Level"),
    rich_presence_lookup("D", Difficulty, DLookup),
    rich_presence_macro("Number", Stars),
    rich_presence_macro("Number", Coins),
    rich_presence_lookup("Clives", Char, ClivesLookup),
    rich_presence_macro("Number", Lives)
)

rich_presence_display("Astérix and Obélix")

