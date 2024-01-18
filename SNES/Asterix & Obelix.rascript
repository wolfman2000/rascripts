// Asterix & Obelix
// #ID = 393

StarsInStage = byte(0x102f) + byte(0x1031)
StarsInEval = byte(0x1037) + byte(0x1039)

Timer = word(0x1075)

StageId = byte(0x1097)
MapId = byte(0x1099)

function MainMenu() => StageId == 0
function TitleScreen() => byte(0x1090) == 0
function StageComplete() => StageId == 0x34

TwoPlayersActive = byte(0x101c) != 0xff && byte(0x101e) != 0xff
P2Disabled = disable_when(
    byte(0x1090) == 0xff && StageId != 0 && TwoPlayersActive,
    until=MainMenu()
)

InvinDisabled = disable_when(byte(0xee8) != 0 && byte(0x1095) != 0)

Diff = byte(0x116f)
P1Char = byte(0x1171)
P2Char = byte(0x1173)

PALives = byte(0x101b + (bit0(0x1171) * 2))
PAHealthUi = byte(0x5f + (bit0(0x1171) * 0x2c))

Hard = Diff == 3

P1Obe = P1Char == 1
P1Ast = P1Char == 2

P2Obe = P2Char == 1
P2Ast = P2Char == 2

function BeatStage(val, place) {
    always = prev(StageId) == val
    fallback = StageComplete()
    if val == 5 && place == 4 {
        fallback = StageId == 6
    }
    else if val == 0x1a {
        fallback = StageId == 0x0a
    }
    else if val == 0x1d {
        fallback = StageId == 0x0e
    }
    else if val == 0x11 && place == 0x0f {
        // Intentionally empty
    }
    else if val >= 0x11 {
        fallback = StageId == val + 1
    }
    return always && fallback
}

function BeatStageMap(map) {
    if map == 1 || map == 3 {
        map = map + 0x15
    }
    fallback = MapId == map && StageComplete() && prev(StageId) < 0x1f
    if (map == 4) {
        fallback = prev(StageId) == 5 && StageId == 6
    }
    else if (map == 8) {
        fallback = prev(StageId) == 0x1a && StageId == 0x0a
    }
    else if (map == 0x0c || (map >= 0x1b && map <= 0x1d)) {
        fallback = prev(StageId) == 0x1d && StageId == 0x0e
    }
    else if (map == 0x10) {
        fallback = prev(StageId) == 0x11 && StageId == 0x12
    }
    else if (map == 0x14) {
        fallback = prev(StageId) == 0x15 && StageId == 0x16
    }
    return fallback
}

function BeatStageMapless(map) {
    fallback = StageComplete() && prev(StageId) < 0x1f
    if (map == 4) {
        fallback = prev(StageId) == 5 && StageId == 6
    }
    else if (map == 8) {
        fallback = prev(StageId) == 0x1a && StageId == 0x0a
    }
    else if (map == 0x0c || (map >= 0x1b && map <= 0x1d)) {
        fallback = prev(StageId) == 0x1d && StageId == 0x0e
    }
    else if (map == 0x10) {
        fallback = prev(StageId) == 0x11 && StageId == 0x12
    }
    else if (map == 0x14) {
        fallback = prev(StageId) == 0x15 && StageId == 0x16
    }
    return fallback
}

BonusFinish = (prev(byte(0x105f)) + prev(byte(0x1061)) < 100) &&
    (byte(0x105f) + byte(0x1061) == 100)

CharLookup = {
    1: "Obelix",
    2: "Asterix"
}

DiffLookup = {
    1: "Easy",
    2: "Normal",
    3: "Hard"
}

MapLookup = {
    0x00: "The Gaul",
    0x01: "Britania Act 1 - The Crossing",
    0x16: "Britania Act 1 - The Crossing",
    0x02: "Britania Act 2 - Countryside",
    0x17: "Britania Act 2 - Countryside",
    0x03: "Britania Act 3 - London",
    0x18: "Britania Act 3 - London",
    0x04: "Britania Act 4 - Rugby",
    0x05: "Helvetia Act 5 - Swiss Frontier",
    0x06: "Helvetia Act 6 - The Lake",
    0x07: "Helvetia Act 7 - The Mountains",
    0x08: "Helvetia Act 8 - The Bank",
    0x19: "Helvetia Act 8 - The Bank",
    0x09: "Grecia Act 9 - Piraeus",
    0x0a: "Grecia Act 10 - Countryside",
    0x0b: "Grecia Act 11 - Olympia",
    0x0c: "Grecia Act 12 - Result",
    0x0d: "Egyptia Act 13 - The Desert",
    0x0e: "Egyptia Act 14 - The Nile",
    0x0f: "Egyptia Act 15 - The Desert Camp",
    0x10: "Egyptia Act 16 - The Palace",
    0x11: "Hispania Act 17 - The Pirate Ship",
    0x12: "Hispania Act 18 - The Pyrenees",
    0x13: "Hispania Act 19 - The Roman Camp",
    0x14: "Hispania Act 20 - Gladiator",
}

CharacterLookup = {
    0x00: "Titlescreen",
    0x01: "Obelix is in",
    0x02: "Asterix is in",
}

// Achievements

// Why do some stages have two triggers?
MainStageTrigger = [
    [0, 2, "The Gaul", 5],
    // Britania
    [1, 3, "The Crossing", 5],
    [2, 4, "Britania's Countryside", 5],
    [3, 5, "London", 10],
    [4, 5, "Rugby", 10],
    // Helvetia,
    [5, 7, "Swiss Frontier", 5],
    [6, 8, "The Lake", 5],
    [7, 9, "The Mountains", 10],
    [8, 0x1a, "The Bank", 10],
    // Grecia
    [9, 0x0b, "Piraeus", 5],
    [10, 0x0c, "Grieca's Countryside", 5],
    [11, 0x0d, "Olympia", 10],
    [12, 0x1d, "Result", 10],
    // Egyptia
    [13, 0x0f, "The Desert", 5],
    [14, 0x10, "The Nile", 5],
    [15, 0x11, "The Desert Camp", 10],
    [16, 0x11, "The Palace", 10],
    // Hispania
    [17, 0x12, "The Pirate Ship", 5],
    [18, 0x13, "The Pyrenees", 5],
    [19, 0x14, "The Roman Camp", 10],
    [20, 0x15, "The Gladiator", 10]
]

for i in range(1, 2) {
    for j in MainStageTrigger {
        char = CharLookup[3 - i]
        achievement(
            title = format("{0} and {1}", char, j[2]),
            points = j[3],
            description = format("Complete {0} as {1}", MapLookup[j[0]], char),
            trigger = BeatStage(j[1], j[0]) && never(MainMenu()) && P1Char == 3 - i
        )
    }
}

function HardModeCheevo(stageData, title, location, points) {
    mission = tally_of(stageData, length(stageData), s => once(BeatStageMap(s[0])))
    achievement(
        title = title,
        points = points,
        description = format("Clear all stages of {0} consecutively on Hard Mode.", location),
        trigger = InvinDisabled && P2Disabled &&
            measured(mission, Diff == 3) && never(MainMenu())
    )
}

HardModeCheevo([[0, 2], [0x16, 3], [2, 4], [0x18, 5], [4, 5]], "Vincens Britania", "Britania (and Gaul)", 10)
HardModeCheevo([[5, 7], [6, 8], [7, 9], [8, 0x1a]], "Vincens Helvetia", "Helvetia", 10)
HardModeCheevo([[9, 0x0b], [10, 0x0c], [11, 0x0d], [12, 0x1d]], "Vincens Grecia", "Grecia", 10)
HardModeCheevo([[13, 0x0f], [14, 0x10], [15, 0x11], [16, 0x11]], "Vincens Egyptia", "Egyptia", 25)
HardModeCheevo([[17, 0x12], [18, 0x13], [19, 0x14], [20, 0x15]], "Vincens Hispania", "Hispania", 25)

ReducedCheevoData = [
    [0, 2, "in Gallia", 5],
    [1, 3, "in Transitu (Aqua)", 5],
    [0x16, 3, "in Transitu (Terra)", 5],
    [2, 4, "in Britania in Agris", 5],
    [3, 5, "in London", 10],
    [5, 6, "in Finibus Helvetia", 5],
    [6, 8, "Lacus", 5],
    [7, 9, "Montibus", 10],
    [8, 0x1a, "Ripae", 10],
    [9, 0x0b, "Piraeo", 5],
    [10, 0x0c, "in Grecia in Patria", 5],
    [11, 0x0d, "Olympiae", 10],
    [13, 0x0f, "in Solitudine", 5],
    [14, 0x10, "Nili", 5],
    [15, 0x11, "in Desertum Castra", 10],
    [16, 0x11, "Palatium", 10],
    [17, 0x12, "in Navis Pirata", 5],
    [18, 0x13, "in Pyrenaeis", 5],
    [19, 0x14, "in Castris Romanorum", 10]
]

function ReducedDamageCheevo(cheevoData) {
    fbLoc = MapLookup[cheevoData[0]]
    if (cheevoData[2] == "in Transitu (Aqua)") {
        fbLoc = "the water portion of " + fbLoc
    }
    else if (cheevoData[2] == "in Transitu (Terra)") {
        fbLoc = "the land portion of " + fbLoc
    }
    fbBeat = BeatStageMap(cheevoData[0])
    if (cheevoData[2] == "in Transitu (Aqua)") {
        fbBeat = prev(StageId) == 2 && StageId == 0x17
    }
    activate = (
        Timer > prev(Timer) ||
        (MapId == cheevoData[0] && prev(MapId) == cheevoData[0] - 1)
    )
    if (cheevoData[2] == "in Transitu (Terra)") {
        activate = Timer > prev(Timer) || (MapId == 0x16 && prev(MapId) == 0x01)
    }
    else if cheevoData[0] == 3 {
        activate = Timer > prev(Timer) && StageId == 4
    }
    else if cheevoData[0] == 9 {
        activate = Timer > prev(Timer) || (MapId == 0x09 && prev(MapId) == 0x19)
    }
    else if cheevoData[0] == 11 {
        activate = activate && StageId == 0x0c
    }
    else if cheevoData[0] == 13 {
        activate = (
            Timer > prev(Timer) ||
            (MapId == cheevoData[0] &&
                prev(MapId) >= cheevoData[0] - 2) &&
                prev(MapId) <= cheevoData[0] - 1
        )
    }
    mapDisable = MapId != cheevoData[0]
    if (cheevoData[0] == 2) {
        mapDisable = mapDisable && MapId != 0x17
    }
    else if (cheevoData[0] == 3) {
        mapDisable = mapDisable && MapId != 0x18
    }
    else if (cheevoData[0] == 8) {
        mapDisable = mapDisable && MapId != 0x19
    }
    else if (cheevoData[0] == 11) {
        mapDisable = mapDisable && StageId >= 0x1b
    }
    achievement(
        title = format("Superfuerat Per {0}", cheevoData[2]),
        points = cheevoData[3],
        description = format(
            "Clear {0} without losing half your maximum health. Recovering health has no effect.",
            fbLoc
        ),
        trigger = InvinDisabled && P2Disabled &&
            never(mapDisable) && never(StageId >= 0x1f && StageId < 0x34) &&
            once(activate) &&
            disable_when(
                repeated(0x14, PAHealthUi < prev(PAHealthUi)),
                until=Timer > prev(Timer) || TitleScreen()
            ) &&
            disable_when(
                once(PALives < prev(PALives) || PALives == 0xff),
                until=Timer > prev(Timer) || TitleScreen()
            ) &&
            trigger_when(fbBeat)
    )
}

for i in ReducedCheevoData {
    ReducedDamageCheevo(i)
}

// Rugby
achievement(
    title = "Competens Ludos",
    points = 10,
    description = "Complete a Try in Rugby (3 points) while only needing one attempt.",
    trigger = InvinDisabled && P2Disabled && MapId == 4 &&
        byte(0x260a) == 1 && prev(byte(0x260a)) == 1 && byte(0xf2a5) == 0 &&
        trigger_when(3 + prev(byte(0xf7a)) == byte(0xf7a))
)

achievement(
    title = "Competens Olympia",
    points = 25,
    description = "Win all three events in the Olympics.",
    trigger = InvinDisabled && P2Disabled && StageId >= 0x1b && StageId <= 0x1d &&
        byte(0x10f5) == 9 && prev(byte(0x10f5)) == 6
)

achievement(
    title = "Competens Tauro Pugnatum",
    points = 10,
    description = "Be successful in Bull Fighting: do it within 3 lives!",
    trigger = InvinDisabled && P2Disabled &&
        once(MapId == 0x14 && prev(MapId) != 0x14) &&
        never(repeated(3, PALives < prev(PALives))) &&
        never(PALives == 0) &&
        trigger_when(prev(StageId) == 0x15) &&
        trigger_when(StageId == 0x16)
)

BonusStageCheevo = [
    [[0], "in Gallia"],
    [[1, 0x16], "in Transitu"],
    [[2, 0x17], "in Britania in Agris"],
    [[3, 0x18], "in London"],
    [[5], "in Finibus Helvetia"],
    [[6], "Lacus"],
    [[7], "Montibus"],
    [[9], "Piraeo"],
    [[10], "in Grecia in Patria"],
    [[11], "Olympiae"],
    [[13], "in Solitudine"],
    [[14], "Nili"],
    [[15], "in Desertum Castra"],
    [[17], "in Navis Pirata"],
    [[18], "in Pyrenaeis"],
    [[19], "in Castris Romanorum"]
]

function ActivateBonusStageCheevo(cheevoData) {
    validMaps = always_false()
    for i in cheevoData[0] {
        validMaps = validMaps || MapId == i
    }
    mapLoc = cheevoData[0][0]
    beatMap = array_pop(cheevoData[0])
    
    achievement(
        title = format("Videntes Stellas {0}", cheevoData[1]),
        points = 5,
        description = format(
            "Clear {0} after collecting all 10 stars.",
            MapLookup[mapLoc]
        ),
        trigger = InvinDisabled && P2Disabled &&
            measured(StarsInStage == 10, when=__ornext(validMaps)) &&
            BeatStageMapless(mapLoc)
    )
}

for i in BonusStageCheevo {
    ActivateBonusStageCheevo(i)
}

achievement(
    title = "Bonus Perfectio",
    points = 5,
    description = format("Clear any bonus stage with 100% completion."),
    trigger = InvinDisabled && P2Disabled && StageId >= 0x1f &&
        prev(byte(0x105f)) + prev(byte(0x1061)) < 100 &&
        byte(0x105f) + byte(0x1061) == 100
)

// Rich Presence

EmojiStar = "⭐"
RpMap = rich_presence_lookup("Map", MapId, MapLookup)
RpP1Char = rich_presence_lookup("Char", P1Char, CharLookup)
RpP2Char = rich_presence_lookup("Char", P2Char, CharLookup)
RpStars = rich_presence_macro("Number", StarsInStage)

rich_presence_conditional_display(TitleScreen() || MainMenu(), "Titlescreen")

rich_presence_conditional_display(StageId == 0x16, "The End")

rich_presence_conditional_display(
    TwoPlayersActive && prior(StageId) < 0x1f && StageId == 0x34,
    "{0} and {1} are done with {2}",
    RpP1Char,
    RpP2Char,
    RpMap
)


rich_presence_conditional_display(
    prior(StageId) < 0x1f && StageId == 0x34,
    "{0} is done with {1}",
    RpP1Char,
    RpMap
)

rich_presence_conditional_display(
    TwoPlayersActive && StageId == 0x0C,
    "{0} and {1} are in Grecia Act 11 - Olympia {2}{3}",
    RpP1Char,
    RpP2Char,
    EmojiStar,
    RpStars
)

rich_presence_conditional_display(
    StageId == 0x0C,
    "{0} is in Grecia Act 11 - Olympia {1}{2}",
    RpP1Char,
    EmojiStar,
    RpStars
)

rich_presence_conditional_display(
    TwoPlayersActive && StageId == 0x1B,
    "{0} and {1} are in Grecia Act 12 - Running",
    RpP1Char,
    RpP2Char
)

rich_presence_conditional_display(
    StageId == 0x1B,
    "{0} is in Grecia Act 12 - Running",
    RpP1Char
)

rich_presence_conditional_display(
    TwoPlayersActive && StageId == 0x1C,
    "{0} and {1} are in Grecia Act 12 - The Hurdles",
    RpP1Char,
    RpP2Char
)

rich_presence_conditional_display(
    StageId == 0x1C,
    "{0} is in Grecia Act 12 - The Hurdles",
    RpP1Char
)

rich_presence_conditional_display(
    TwoPlayersActive && StageId == 0x1D,
    "{0} and {1} are in Grecia Act 12 - The Javelin",
    RpP1Char,
    RpP2Char
)

rich_presence_conditional_display(
    StageId == 0x1D,
    "{0} is in Grecia Act 12 - The Javelin",
    RpP1Char
)

InBonusStage = (StageId >= 0x1f && StageId < 0x34) ||
    (prior(StageId) >= 0x1f && prior(StageId) < 0x34)

rich_presence_conditional_display(
    TwoPlayersActive && InBonusStage,
    "{0} and {1} are in {2} (Bonus Stage)",
    RpP1Char,
    RpP2Char,
    RpMap
)

rich_presence_conditional_display(
    InBonusStage,
    "{0} is in {1} (Bonus Stage)",
    RpP1Char,
    RpMap
)

rich_presence_conditional_display(
    TwoPlayersActive,
    "{0} and {1} are in {2} {3}{4}",
    RpP1Char,
    RpP2Char,
    RpMap,
    EmojiStar,
    RpStars
)

rich_presence_display("{0} is in {1} {2}{3}",
    RpP1Char,
    RpMap,
    EmojiStar,
    RpStars
)




