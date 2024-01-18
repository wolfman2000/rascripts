// Snow Bros. Jr.
// #ID = 4743

StageIdFixed = byte(0xc67d)
StageIdAmend = byte(0xc67e)
GameState = byte(0xc67f)
Score = word(0xc687)
Lives = byte(0xc699)
SnowLetters = bit0(0xc70a) + bit1(0xc70a) + bit2(0xc70a) + bit3(0xc70a)
PriorSnowLetters = prior(bit0(0xc70a)) + prior(bit0(0xc70a)) +
    prior(bit2(0xc70a)) + prior(bit3(0xc70a))

BonusGameWorld = GameState >= 0x0c && GameState <= 0x0d

// Cheevos

achievement(
    title = "Light Snow?",
    points = 3,
    description = "Get the potion that provides a big head that can kill anyone instantly.",
    trigger = Score != 0 && bit0(0xc69f) > prev(bit0(0xc69f))
)

achievement(
    title = "Long Snow",
    points = 3,
    description = "Get the potion that provides extra range to your attack.",
    trigger = Score != 0 && bit1(0xc69f) > prev(bit1(0xc69f))
)

achievement(
    title = "Dense Snow",
    points = 3,
    description = "Get the potion that provides extra thick snow to your attack.",
    trigger = Score != 0 && bit2(0xc69f) > prev(bit2(0xc69f))
)

achievement(
    title = "Speedy Snow",
    points = 3,
    description = "Get the potion that provides extra movement speed.",
    trigger = Score != 0 && bit3(0xc69f) > prev(bit3(0xc69f))
)

achievement(
    title = "Snow Problem Here",
    points = 10,
    description = "Get an extra life via the SNOW Letter Snowballs.",
    trigger = 
        never(GameState != 3 && !BonusGameWorld) &&
        Lives > prev(Lives) &&
        once(low4(0xc70a) != prev(low4(0xc70a)))
)

achievement(
    title = "Does This Even Matter Anymore?",
    points = 10,
    description = "Beat the high score of 100000 points.",
    trigger = StageIdFixed > 3 && prev(Score) < 10000 && Score >= 10000
)

achievement(
    title = "Cold Hard Cash",
    points = 5,
    description = "Collect a falling banknote.",
    trigger = (GameState == 1 || GameState == 2 || GameState == 5) &&
        prev(Score) + 500 == Score
)

achievement(
    title = "Ascending Past The Gecko",
    points = 5,
    description = "Defeat the gecko in B41F.",
    trigger = Score != 0 && prev(StageIdFixed) == 10 && StageIdFixed == 11
)

achievement(
    title = "Gecko Domination",
    points = 5,
    description = "Defeat the gecko in B41F without losing a life.",
    trigger = once(prev(StageIdFixed) == 9 && StageIdFixed == 10) &&
        never(Lives < prev(Lives)) &&
        never(GameState == 8) &&
        trigger_when(StageIdFixed == 11)
)

achievement(
    title = "Ascending Past The Bomber",
    points = 5,
    description = "Defeat the bomber in B31F.",
    trigger = Score != 0 && prev(StageIdFixed) == 20 && StageIdFixed == 21
)

achievement(
    title = "Bomber Domination",
    points = 5,
    description = "Defeat the bomber in B31F without losing a life.",
    trigger = once(prev(StageIdFixed) == 19 && StageIdFixed == 20) &&
        never(Lives < prev(Lives)) &&
        never(GameState == 8) &&
        trigger_when(StageIdFixed == 21)
)

achievement(
    title = "Ascending Past The Bird",
    points = 10,
    description = "Defeat the bird in B21F.",
    trigger = Score != 0 && prev(StageIdFixed) == 30 && StageIdFixed == 31
)

achievement(
    title = "Bird Domination",
    points = 10,
    description = "Defeat the bird in B21F without losing a life.",
    trigger = once(prev(StageIdFixed) == 29 && StageIdFixed == 30) &&
        never(Lives < prev(Lives)) &&
        never(GameState == 8) &&
        trigger_when(StageIdFixed == 31)
)

achievement(
    title = "Ascending Past The Tengu",
    points = 10,
    description = "Defeat the tengu in B11F.",
    trigger = Score != 0 && prev(StageIdFixed) == 40 && StageIdFixed == 41
)

achievement(
    title = "Tengu Domination",
    points = 10,
    description = "Defeat the tengu in B11F without losing a life.",
    trigger = once(prev(StageIdFixed) == 39 && StageIdFixed == 40) &&
        never(Lives < prev(Lives)) &&
        never(GameState == 8) &&
        trigger_when(StageIdFixed == 41)
)

achievement(
    title = "Ascending Past The Statues",
    points = 10,
    description = "Defeat the statues in B01F.",
    trigger = Score != 0 && StageIdFixed == 50 && GameState == 7
)

achievement(
    title = "Statue Domination",
    points = 10,
    description = "Defeat the statues in B01F without losing a life.",
    trigger = once(prev(StageIdFixed) == 49 && StageIdFixed == 50) &&
        never(Lives < prev(Lives)) &&
        never(GameState == 8) &&
        trigger_when(GameState == 7)
)

achievement(
    title = "Making Peace With The Sun",
    points = 25,
    description = "Defeat the sun in 10F.",
    trigger = Score != 0 && StageIdFixed == 60 && GameState == 0x0b
)

achievement(
    title = "Sun Domination",
    points = 25,
    description = "Defeat the sun in 10F without losing a life.",
    trigger = once(prev(StageIdFixed) == 59 && StageIdFixed == 60) &&
        never(Lives < prev(Lives)) &&
        never(GameState == 8) &&
        trigger_when(GameState == 0x0b)
)

achievement(
    title = "Cool As Ice",
    points = 50,
    description = "Beat the game without using a continue.",
    trigger = once(StageIdFixed == 1 && GameState == 1 && prev(GameState) == 0 &&
        byte(0xc689) == 11) &&
        never(GameState == 8) &&
        trigger_when(GameState == 0x0b)
)

StageLookup = {
    1: "B50F",
    2: "B49F",
    3: "B48F",
    4: "B47F",
    5: "B46F",
    6: "B45F",
    7: "B44F",
    8: "B43F",
    9: "B42F",
    10: "B41F",
    11: "B40F",
    12: "B39F",
    13: "B38F",
    14: "B37F",
    15: "B36F",
    16: "B35F",
    17: "B34F",
    18: "B33F",
    19: "B32F",
    20: "B31F",
    21: "B30F",
    22: "B29F",
    23: "B28F",
    24: "B27F",
    25: "B26F",
    26: "B25F",
    27: "B24F",
    28: "B23F",
    29: "B22F",
    30: "B21F",
    31: "B20F",
    32: "B19F",
    33: "B18F",
    34: "B17F",
    35: "B16F",
    36: "B15F",
    37: "B14F",
    38: "B13F",
    39: "B12F",
    40: "B11F",
    41: "B10F",
    42: "B09F",
    43: "B08F",
    44: "B07F",
    45: "B06F",
    46: "B05F",
    47: "B04F",
    48: "B03F",
    49: "B02F",
    50: "B01F",
    51: "01F",
    52: "02F",
    53: "03F",
    54: "04F",
    55: "05F",
    56: "06F",
    57: "07F",
    58: "08F",
    59: "09F",
    60: "10F"
}

// Rich Presence

EmojiLife = "⛄"
EmojiScore = "💯"
RpFloor = rich_presence_lookup("Floor", StageIdFixed, StageLookup)
RpLives = rich_presence_macro("Number", byte(0xc699))
RpScore = rich_presence_macro("Number", Score * 10)

rich_presence_conditional_display(
    GameState == 0x0b,
    "Suddenly Random Happy Ending With The Sun?"
)

rich_presence_conditional_display(
    GameState >= 0x0c && GameState <= 0x0d,
    "Random Bonus Game Break before climbing {0}",
    RpFloor
)

rich_presence_conditional_display(
    GameState == 4 || GameState == 6 || GameState == 7,
    "Facing a boss on {0} {1}{2} {3}{4}",
    RpFloor,
    EmojiLife,
    RpLives,
    EmojiScore,
    RpScore
)

rich_presence_conditional_display(
    GameState == 3,
    "Hoping to earn a bonus life on {0} {1}{2} {3}{4}",
    RpFloor,
    EmojiLife,
    RpLives,
    EmojiScore,
    RpScore
)

rich_presence_conditional_display(
    GameState == 5 || GameState == 9 ||
        (GameState >= 1 && GameState <= 2) || (GameState == 0 && Score != 0),
    "Climbing up in {0} {1}{2} {3}{4}",
    RpFloor,
    EmojiLife,
    RpLives,
    EmojiScore,
    RpScore
)

rich_presence_conditional_display(
    GameState == 8,
    "Fallen on {0}",
    RpFloor
)

rich_presence_display(
    "Preparing for the Ascent in Snow Bros."
)

