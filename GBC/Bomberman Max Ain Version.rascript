// Bomberman Max: Ain Version
// #ID = 22474

ActiveCharabomId = byte(0xa011)
CharabomCount = byte(0xa012)

ActiveCharabomUnl = byte(0xa110 + (ActiveCharabomId * 8))
ActiveCharabomLvl = byte(0xa112 + (ActiveCharabomId * 8))
ActiveCharabomAtk = byte(0xa113 + (ActiveCharabomId * 8))
ActiveCharabomDef = byte(0xa114 + (ActiveCharabomId * 8))
ActiveCharabomSpe = byte(0xa115 + (ActiveCharabomId * 8))

Music = byte(0xc000)
World = low4(0xc2d0)
Level = byte(0xc2d1)

BombLevel = low4(0xc2f3)
FireLevel = low4(0xc2f4)
SpedLevel = low4(0xc2f5)
Lives = byte(0xc2f7)

TimeMinutes = low4(0xc300)
TimeSeconds = byte(0xc301)

GoalStatus = byte(0xc62c)
Success = GoalStatus == 1
Retrying = GoalStatus == 255

EmojiTime = "⏲️"
EmojiBot = "🤖"
EmojiBomb = "💣"
EmojiRang = "💥"
EmojiFire = "🔥"
EmojiElec = "⚡"
EmojiAqua = "⛆"
EmojiRock = "🌏"
EmojiAtk = "⚔️"
EmojiDef = "🛡️"
EmojiSpe = "⭐"

function LastSong(val) => Music == val || prior(Music) == val

CharabomName = {
    0: "Draco",
    1: "Shell",
    2: "Pommy",
    3: "Elephan",
    4: "Seadran",
    5: "Marine Eel",
    6: "Knuckle Pommy",
    7: "Panther Fang",
    8: "Twin Dragon",
    9: "Sea Balloon",
    10: "Beast Pommy",
    11: "Big Ox",
    12: "Puteladon",
    13: "Sharkin",
    14: "Hammer Pommy",
    15: "Unicornos",
    16: "Iron Dragon",
    17: "Iron Squid",
    18: "Animal Pommy",
    19: "Mecha Kong",
    20: "Aqua Dragon",
    21: "Pommy Dragon",
    22: "Thunder Kong",
    23: "Thunder Shark",
    24: "Rock Snakey",
    25: "Fire Force",
    26: "Shardra",
    27: "Ox Battra",
    28: "Heat Rock",
    29: "Oct Kong"
}

CharabomElem = {
    0: EmojiFire,
    1: EmojiAqua,
    2: EmojiElec,
    3: EmojiRock,
    4: EmojiFire,
    5: EmojiAqua,
    6: EmojiElec,
    7: EmojiRock,
    8: EmojiFire,
    9: EmojiAqua,
    10: EmojiElec,
    11: EmojiRock,
    12: EmojiFire,
    13: EmojiAqua,
    14: EmojiElec,
    15: EmojiRock,
    16: EmojiFire,
    17: EmojiAqua,
    18: EmojiElec,
    19: EmojiRock,
    20: (EmojiAqua + EmojiFire),
    21: (EmojiFire + EmojiElec),
    22: (EmojiElec + EmojiRock),
    23: (EmojiAqua + EmojiElec),
    24: (EmojiAqua + EmojiRock),
    25: (EmojiRock + EmojiFire),
    26: (EmojiFire + EmojiAqua + EmojiElec),
    27: (EmojiFire + EmojiRock + EmojiElec),
    28: (EmojiFire + EmojiAqua + EmojiRock),
    29: (EmojiAqua + EmojiRock + EmojiElec)
}

WorldLookup = {
    0: "1",
    1: "2",
    2: "3",
    3: "4",
    4: "5"
}

TwoDigit1 = {
    0: "01",
    1: "02",
    2: "03",
    3: "04",
    4: "05",
    5: "06",
    6: "07",
    7: "08",
    8: "09",
    9: "10",
    10: "11",
    11: "12",
    12: "13",
    13: "14",
    14: "15",
    15: "16",
    16: "17",
    17: "18",
    18: "19",
    19: "20",
    20: "21",
    21: "22",
    22: "23",
    23: "24"
}

CharabomRescueData = {
    1: ["I Shell Award You 5 Points", 5, "Shell", 0, 9],
    2: ["Here's Your Mascot", 3, "Pommy", 0, 0],
    4: ["Why Not Burn The Cage?", 5, "Seadran", 1, 1],
    7: ["Cats Deserve Respect", 5, "Panther Fang", 1, 9],
    9: ["Not Seeing The Helium", 5, "Sea Balloon", 2, 9],
    10: ["More Animal Than Beast?", 5, "Beast Pommy", 2, 2],
    12: ["Discount Aerodactyl?", 5, "Puteladon", 3, 3],
    15: ["The Sacred Horse", 5, "Unicornos", 3, 8],
    17: ["Wouldn't This Always Sink?", 10, "Iron Squid", 4, 7],
    18: ["More Beast Than Animal?", 10, "Animal Pommy", 4, 14],
}

// Cheevos

achievement(
    title = "Underrated Tunes",
    points = 1,
    description = "Gain access to the Sound Test.",
    trigger = byte(0xc4e3) == 1 && byte(0xc4e6) == 0x0c
)

achievement(
    title = "More Bombs More Better",
    points = 2,
    description = "Increase your bomb capacity to max during non-boss stages.",
    trigger = Music >= 0x81 && Music <= 0x85 &&
        prev(BombLevel) == 3 && BombLevel == 4
)

achievement(
    title = "Be Thankful You Can See The Full Range",
    points = 2,
    description = "Increase your explosion range capacity to max during non-boss stages.",
    trigger = Music >= 0x81 && Music <= 0x85 &&
        prev(FireLevel) < 4 && FireLevel == 4
)

achievement(
    title = "Aren't Roller Skates Hard To Control?",
    points = 2,
    description = "Increase your walking speed to max during non-boss stages.",
    trigger = Music >= 0x81 && Music <= 0x85 &&
        prev(SpedLevel) < 9 && SpedLevel == 9
)

achievement(
    title = "Bombs? What Bombs? They Are Not Th-- *BOOM*",
    points = 5,
    description = "Collect the Bomb Walk item and have fun going through bombs.",
    trigger = Music >= 0x81 && Music <= 0x85 && 
        bit0(0xc750) > prev(bit0(0xc750))
)

achievement(
    title = "If Only The Infrared Port Worked",
    points = 5,
    description = "Collect the remote bomb item and detonate at will.",
    trigger = Music >= 0x81 && Music <= 0x85 && 
        bit1(0xc750) > prev(bit1(0xc750))
)

achievement(
    title = "Gotta Have Heart",
    points = 5,
    description = "Collect the heart item and survive one fatal blow.",
    trigger = Music >= 0x81 && Music <= 0x85 && 
        bit2(0xc750) > prev(bit2(0xc750))
)

achievement(
    title = "Not Quite Piercing The Heavens",
    points = 5,
    description = "Collect the Bomb Pierce item and destroy multiple soft blocks.",
    trigger = Music >= 0x81 && Music <= 0x85 && 
        bit3(0xc750) > prev(bit3(0xc750))
)

achievement(
    title = "Walls Are Merely Suggestions",
    points = 5,
    description = "Collect the Block Walk item and have fun going through soft blocks.",
    trigger = Music >= 0x81 && Music <= 0x85 && 
        bit4(0xc750) > prev(bit4(0xc750))
)

achievement(
    title = "Kick It Up",
    points = 5,
    description = "Grab the Bomb Kick item and send bombs along the ground.",
    trigger = Music >= 0x81 && Music <= 0x85 && 
        bit5(0xc750) > prev(bit5(0xc750))
)

achievement(
    title = "All In A Row",
    points = 5,
    description = "Grab the Line Bomb item and place all of your bombs in a row.",
    trigger = Music >= 0x81 && Music <= 0x85 && 
        bit6(0xc750) > prev(bit6(0xc750))
)

achievement(
    title = "It's Not So Bad",
    points = 5,
    description = "Grab the Power Glove item and hurl bombs far away.",
    trigger = Music >= 0x81 && Music <= 0x85 &&
        bit7(0xc750) > prev(bit7(0xc750))
)

achievement(
    title = "Safety First",
    points = 5,
    description = "Grab the Safety Vest item and become invincible for some time.",
    trigger = Music >= 0x81 && Music <= 0x85 &&
        prev(byte(0xc751)) < 0xf && byte(0xc751) == 0xf
)

achievement(
    title = "White Bomber...Can Stop Time!",
    points = 5,
    description = "Grab the Clock item and stop both enemies and the timer for a short period.",
    trigger = Music >= 0x81 && Music <= 0x85 &&
        prev(byte(0xc74a)) < 7 && byte(0xc74a) == 7
)

achievement(
    title = "Extra Chances At Making An Explosion",
    points = 5,
    description = "Grab the Bomberman item and earn an extra life.",
    trigger = Music >= 0x81 && Music <=0x85 && Lives > prev(Lives)
)

function StageFormat(world, level) {
    return WorldLookup[world] + "-" + TwoDigit1[level]
}

function CharabomRescue(index) {
    data = CharabomRescueData[index]
    unlockBase = byte(0xa110 + (index * 8))
    achievement(
        title = data[0],
        points = data[1],
        description = format(
            "Rescue {0} from their cage in {1}.",
            data[2],
            StageFormat(data[3], data[4])
        ),
        trigger = World == data[3] && Level == data[4] && Music == 0x99 &&
            unlockBase > prev(unlockBase)
    )
}

CharabomRescueOrder = [2, 1, 4, 7, 10, 9, 12, 15, 17, 18]

for i in CharabomRescueOrder {
    CharabomRescue(i)
}

achievement(
    title = "At Least It's Just One, Right?",
    points = 25,
    description = "Raise any of the ten accessible charaboms to its max level of 60.",
    trigger = ActiveCharabomId == prev(ActiveCharabomId) &&
        prev(ActiveCharabomLvl) == 59 && measured(ActiveCharabomLvl == 60)
)

BossData = {
    0: ["Donkey Kong? Wrong Game!", "Colossus", 0xce19],
    1: ["Ancient Artforms Gone Rogue", "Kabukibot", 0xd219],
    2: ["Tanks For Nothing", "Tankbot", 0xce19],
    3: ["Let's Not Drag This On", "Tian Lung", 0xce19],
    4: ["Maybe Pinky Could Have Helped", "Brain", 0xd219]
}

function BossDefeatCheevo(world) {
    stages = 19
    times = 1
    if (world == 4) {
        stages = 24
        times = 2
    }
    data = BossData[world]
    achievement(
        title = data[0],
        points = 10,
        description = format(
            "Defeat {0} at the end of World {1}.",
            data[1],
            world + 1
        ),
        trigger = World == world && Level >= stages - 3 && Level <= stages - 1 &&
            repeated(times, prev(byte(data[2])) == 2 && byte(data[2]) == 1) &&
            once(prev(byte(data[2])) == 1 && byte(data[2]) == 0) &&
            Music == 0x8e && Success
    )
}

for i in BossData {
    BossDefeatCheevo(i)
}

function BossMinCheevo(world) {
    stages = 19
    startTune = 0x86
    times = 1
    if (world == 4) {
        stages = 24
        startTune = 0x87
        times = 2
    }
    data = BossData[world]
    achievement(
        title = format("Skilled Against {0}", data[1]),
        points = 25,
        description = format("Defeat {0} with only default stats or worse.", data[1]),
        trigger = never(World != world) && never(Level < stages - 3) &&
            never(Level > stages - 1) && never(BombLevel > 1) && never(FireLevel > 1) &&
            never(SpedLevel > 5) && never(Music == 0x97) &&
            never(byte(data[2]) != 0 && Music == 0x8e) &&
            once(prev(Music) != startTune && Music == startTune) &&
            trigger_when(repeated(times, prev(byte(data[2])) == 2 && byte(data[2]) == 1)) &&
            trigger_when(once(prev(byte(data[2])) == 1 && byte(data[2]) == 0)) &&
            trigger_when(Music == 0x8e && Success)
    )
}

for i in BossData {
    BossMinCheevo(i)
}

WorldStageData = {
    0: ["Dino Might", "Zaurus"],
    1: ["If You Must Make Noise...", "Secret"],
    2: ["What Is It Good For?", "Battle"],
    3: ["No Farmlands In Sight", "City"],
    4: ["Time Paradox?", "Future"]
}

function CompletionCheevo(world) {
    stages = 19
    points = 10
    startMusic = 0x86
    times = 1
    if (world == 4) {
        stages = 24
        points = 25
        startMusic = 0x87
        times = 2
    }
    currStage = 0
    prevStage = 0
    boss = BossData[world]
    for i in range(0, stages - 1) {
        val = bit0(0xa031 + (world * 38) + (i * 2))
        currStage = currStage + val
        prevStage = prevStage + prev(val)
    }
    ideal = prevStage == stages - 1
    fallback = never(World != world) && never(Level < stages - 3) &&
        never(Level > stages - 1) && never(Music == 0x97) &&
        once(prev(Music) != startMusic && Music == startMusic) &&
        repeated(times, prev(byte(boss[2])) == 2 && byte(boss[2]) == 1) &&
        once(prev(byte(boss[2])) == 1 && byte(boss[2]) == 0) &&
        Music == 0x8e && Success
        
    achievement(
        title = WorldStageData[world][0],
        points = points,
        description = format(
            "Beat every stage in World {0}, {1} Star. (If it does not pop, defeat {2} again.)",
            world + 1,
            WorldStageData[world][1],
            boss[1]
        ),
        trigger = measured(currStage == stages) && 
            ((ideal && World == world) || fallback)
    )
}

for i in range(0, 4) {
    CompletionCheevo(i)
}

// Leaderboard

leaderboard(
    title = "Beat The Game Single Session",
    description = "Defeat Brain as fast as you can!",
    start = Lives == 3 && ActiveCharabomId == 0 && CharabomCount == 0 &&
        World == 0 && Level == 0 && Music == 0x81 && prev(Music) != 0x81,
    cancel = Music == 0x94 || Music == 0x14 || Music == 0x88,
    submit = World == 4 && Level >= 21 && Level <= 23 && Success && Music == 0x8e,
    value = always_true(),
    format = "FRAMES",
    lower_is_better = true
)

// Rich Presence

RpWorld = rich_presence_lookup("World", World, WorldLookup, "X")
RpLevel = rich_presence_lookup("Level", Level, TwoDigit1, "YY")
RpCharabomName = rich_presence_lookup(
    "CharaName", ActiveCharabomId, CharabomName, "POOOOOX!"
)

rich_presence_conditional_display(
    byte(0xc4e3) == 1,
    "Enjoying the tunes without the stress of Charaboms or Ain."
)

rich_presence_conditional_display(
    World == 0xe,
    "The day is saved thanks to Product Placement!"
)

rich_presence_conditional_display(
    LastSong(0x8c),
    "Selecting a stage like selecting an Ain pen."
)

rich_presence_conditional_display(
    LastSong(0x8d),
    "Learning the objective for stage S{0}-{1}",
    RpWorld,
    RpLevel
)

rich_presence_conditional_display(
    LastSong(0x9e),
    "World {0} Cleared! Celebrate with pens.",
    RpWorld
)

rich_presence_conditional_display(
    LastSong(0x88),
    "Welcome to Bomberman MAX Product Placement edition."
)

rich_presence_conditional_display(
    LastSong(0x14) || LastSong(0x94),
    "Plot dump? Go buy some Ain pens."
)

rich_presence_conditional_display(
    LastSong(0xff) || LastSong(0x00),
    "Booting up the product placement."
)

rich_presence_conditional_display(
    Lives == 0 || LastSong(0x98) || LastSong(0x90),
    "Game Over!"
)

rich_presence_conditional_display(
    CharabomCount == 0,
    "S{0}-{1} {2}{3} {4}{5} {6}{7} {8}{9} w/no Charaboms",
    RpWorld,
    RpLevel,
    EmojiTime,
    rich_presence_value("Seconds", TimeMinutes * 60 + TimeSeconds, "SECS"),
    EmojiBot,
    rich_presence_macro("Number", Lives - 1),
    EmojiBomb,
    rich_presence_macro("Number", BombLevel),
    EmojiRang,
    rich_presence_macro("Number", FireLevel)
)

rich_presence_conditional_display(
    Success && LastSong(0x8e),
    "Leaving S{0}-{1} {2}{3} {4}{5} {6}{7} {8}{9}",
    RpWorld,
    RpLevel,
    EmojiTime,
    rich_presence_value("Seconds", TimeMinutes * 60 + TimeSeconds, "SECS"),
    EmojiBot,
    rich_presence_macro("Number", Lives - 1),
    EmojiBomb,
    rich_presence_macro("Number", BombLevel),
    EmojiRang,
    rich_presence_macro("Number", FireLevel)
)

rich_presence_conditional_display(
    Retrying,
    "Retrying S{0}-{1} {2}{3} {4}{5} {6}{7} {8}{9}",
    RpWorld,
    RpLevel,
    EmojiTime,
    rich_presence_value("Seconds", TimeMinutes * 60 + TimeSeconds, "SECS"),
    EmojiBot,
    rich_presence_macro("Number", Lives - 1),
    EmojiBomb,
    rich_presence_macro("Number", BombLevel),
    EmojiRang,
    rich_presence_macro("Number", FireLevel)
)

rich_presence_display(
    "S{0}-{1} {2}{3} {4}{5} {6}{7} {8}{9} raising {10}{11} Lv {12} {13}{14} {15}{16} {17}{18}",
    RpWorld,
    RpLevel,
    EmojiTime,
    rich_presence_value("Seconds", TimeMinutes * 60 + TimeSeconds, "SECS"),
    EmojiBot,
    rich_presence_macro("Number", Lives - 1),
    EmojiBomb,
    rich_presence_macro("Number", BombLevel),
    EmojiRang,
    rich_presence_macro("Number", FireLevel),
    RpCharabomName,
    rich_presence_lookup("CharaElem", ActiveCharabomId, CharabomElem, "FAKE"),
    rich_presence_macro("Number", ActiveCharabomLvl),
    EmojiAtk,
    rich_presence_macro("Number", ActiveCharabomAtk),
    EmojiDef,
    rich_presence_macro("Number", ActiveCharabomDef),
    EmojiSpe,
    rich_presence_macro("Number", ActiveCharabomSpe)
)
