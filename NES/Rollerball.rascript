// Rollerball
// #ID = 1923

TableLoc = byte(0x7b)
TableSky = TableLoc == 0
TableHi = TableLoc == 1
TableMid = TableLoc == 2
TableLow = TableLoc == 3

Pinball1X = byte(0x80)
Pinball1Y = byte(0x84)
Pinball2X = byte(0x81)
Pinball2Y = byte(0x85)

BallsLeft = byte(0x0306)
MusicId = byte(0x52f)

function HasBalls() => BallsLeft != 0 && BallsLeft < 9

function Music(addr) => MusicId == addr || prior(MusicId) == addr

Multiplayer = MusicId == 0x09 || Music(0x0b) || MusicId == 0x03
Singleplayer = Music(0x01) || Music(0x02) || Music(0x05) || Music(0x0a)

function CurrScore() =>
    byte(0x313) * 10000000 +
    byte(0x314) * 1000000 +
    byte(0x315) * 100000 +
    byte(0x316) * 10000 +
    byte(0x317) * 1000 +
    byte(0x318) * 100 +
    byte(0x319) * 10

function PrevScore() =>
    prev(byte(0x313)) * 10000000 +
    prev(byte(0x314)) * 1000000 +
    prev(byte(0x315)) * 100000 +
    prev(byte(0x316)) * 10000 +
    prev(byte(0x317)) * 1000 +
    prev(byte(0x318)) * 100 +
    prev(byte(0x319)) * 10

function CurrScoreThousand() =>
    byte(0x313) * 10000 +
    byte(0x314) * 1000 +
    byte(0x315) * 100 +
    byte(0x316) * 10 +
    byte(0x317)

function PrevScoreThousand() =>
    prev(byte(0x313)) * 10000 +
    prev(byte(0x314)) * 1000 +
    prev(byte(0x315)) * 100 +
    prev(byte(0x316)) * 10 +
    prev(byte(0x317))

LeftBell = bit0(0x6c0) == 0
LeftCherry = byte(0x6c0) == 1
LeftEggplant = byte(0x6c0) == 3

MiddleBell = byte(0x6c1) == 3
MiddleCherry = bit0(0x6c1) == 0
MiddleEggplant = byte(0x6c1) == 1

RightBell = byte(0x6c2) == 1
RightCherry = byte(0x6c2) == 3
RightEggplant = bit0(0x6c2) == 0

SlotDone = byte(0x6c5) == 0 && prev(byte(0x6c5)) == 1

// Achievements

achievement(
    title = "Who Even Enjoys Eggplant?",
    description = "Match three eggplants on the slots.",
    points = 10,
    trigger = HasBalls() && SlotDone && LeftEggplant && MiddleEggplant && RightEggplant
)

achievement(
    title = "Ringing In The New Cheevo",
    description = "Match three bells on the slots.",
    points = 10,
    trigger = HasBalls() && SlotDone && LeftBell && MiddleBell && RightBell
)

achievement(
    title = "Do Pinballs Like Fruit?",
    description = "Match three cherries on the slots.",
    points = 10,
    trigger = HasBalls() && SlotDone && LeftCherry && MiddleCherry && RightCherry
)

achievement(
    title = "Consider Yourself Collected",
    description = "Collect the bonus right by the ball launch exit.",
    points = 5,
    trigger = HasBalls() && TableHi && prev(TableLoc) == 1 && tbyte(0x655) == 0 &&
        ((prev(tbyte(0x655)) == 0xffff00) ||
        (prev(tbyte(0x655)) == 0x00ffff) ||
        (prev(tbyte(0x655)) == 0xff00ff))
)

achievement(
    title = "Left To Score Incrementally",
    description = "Increase the bonus in the middle of the table using the wall targets.",
    points = 5,
    trigger = HasBalls() && TableMid && prev(TableLoc) == 2 &&
        byte(0x662) == 0 && prev(byte(0x662)) == 7 &&
        prev(byte(0x6d2)) + 1 == byte(0x6d2)
)

achievement(
    title = "Middle Of The Pack",
    description = "Increase the bonus in the middle of the table using the left ceiling targets.",
    points = 5,
    trigger = HasBalls() && TableMid && prev(TableLoc) == 2 &&
        byte(0x663) == 0 && prev(byte(0x663)) == 7 &&
        prev(byte(0x6d2)) + 1 == byte(0x6d2)
)

achievement(
    title = "Right Away: Enjoy The Points",
    description = "Increase the bonus in the middle of the table using the right ceiling targets.",
    points = 5,
    trigger = HasBalls() && TableMid && prev(TableLoc) == 2 &&
        byte(0x664) == 0 && prev(byte(0x664)) == 7 &&
        prev(byte(0x6d2)) + 1 == byte(0x6d2)
)

achievement(
    title = "Variable Point Target? Alright...",
    description = "Bank 10000 points or more with the middle bonus slot.",
    points = 10,
    trigger = HasBalls() && TableMid && prev(TableLoc) == 2 &&
        byte(0x6d2) == 0 && prev(byte(0x6d2)) >= 2 &&
        CurrScoreThousand() >= 10 + PrevScoreThousand()
)

achievement(
    title = "Consistency With Middling Targets",
    description = "Bank 50000 points or more with the middle bonus slot.",
    points = 25,
    trigger = HasBalls() && TableMid && prev(TableLoc) == 2 &&
        byte(0x6d2) == 0 && prev(byte(0x6d2)) >= 5 &&
        CurrScoreThousand() >= 50 + PrevScoreThousand()
)

achievement(
    title = "Now This Is Rediculous",
    description = "Bank 1000000 points with the middle bonus slot.",
    points = 50,
    trigger = HasBalls() && TableMid && prev(TableLoc) == 2 &&
        byte(0x6d2) == 0 && prev(byte(0x6d2)) == 7 &&
        CurrScoreThousand() == 1000 + PrevScoreThousand()
)

achievement(
    title = "Small Bonus",
    description = "Have 20000 bonus points stored on your current ball.",
    points = 5,
    trigger = HasBalls() && CurrScore() != 0 &&
        prev(byte(0x6eb)) < 20 && byte(0x6eb) >= 20
)

achievement(
    title = "Medium Bonus",
    description = "Have 50000 bonus points stored on your current ball.",
    points = 10,
    trigger = HasBalls() && CurrScore() != 0 &&
        prev(byte(0x6eb)) < 50 && byte(0x6eb) >= 50
)

achievement(
    title = "Large Bonus",
    description = "Have 100000 bonus points stored on your current ball.",
    points = 25,
    trigger = HasBalls() && CurrScore() != 0 &&
        prev(byte(0x6eb)) < 100 && byte(0x6eb) >= 100
)

achievement(
    title = "Worthwhile Bumpers?",
    description = "Get 10000 points off of a bumper hit.",
    points = 10,
    trigger = HasBalls() && CurrScoreThousand() == 10 + PrevScoreThousand() &&
        prev(word(0x6de)) != 0 &&
        (
        (Pinball1Y < 0x85 && Pinball1Y > 0x60 &&
        Pinball1X < 0x88 && Pinball1X > 0x5a) ||
        (Pinball2Y < 0x85 && Pinball2Y > 0x60 &&
        Pinball2X < 0x88 && Pinball2X > 0x5a))
)

achievement(
    title = "Emergency Exit",
    description = "Take the Exit Hole back to the initial position.",
    points = 10,
    trigger = HasBalls() && CurrScore() != 0 && TableLow && prev(TableLoc) == 3 &&
        ((prev(Pinball1X) > 0x63 && prev(Pinball1X) < 0xd0 &&
        Pinball1X >= 0xd8 && prev(Pinball1Y) < 0xb0) ||
        (prev(Pinball2X) > 0x63 && prev(Pinball2X) < 0xd0 &&
        Pinball2X >= 0xd8 && prev(Pinball2Y) < 0xb0))
)

achievement(
    title = "That Was Close",
    description = "Activate the Flipper Saver while at the bottom part of the table.",
    points = 5,
    trigger = HasBalls() && CurrScore() != 0 && TableLow &&
        word(0x6fd) > 0 && prev(word(0x6fd)) == 0
)

achievement(
    title = "Preparing For Later",
    description = "Lock a ball in the sky part of the table.",
    points = 5,
    trigger = HasBalls() && CurrScore() != 0 && (TableHi || TableSky) &&
        byte(0x650) > prev(byte(0x650))
)

achievement(
    title = "Don't These Belong In The Center?",
    description = "In the sky part, activate the ball saver.",
    points = 10,
    trigger = HasBalls() && CurrScore() != 0 && TableSky &&
        prev(byte(0x68d)) == 0 && byte(0x68d) == 5
)

achievement(
    title = "Well, Do As They Say",
    description = "In the sky part, open the right side gate.",
    points = 10,
    trigger = HasBalls() && CurrScore() != 0 && TableSky &&
        byte(0x68c) == 0xff && prev(byte(0x68c)) == 0
)

achievement(
    title = "Bumper Bonanza Beginnings",
    description = "Activate the Bumper Bonanza Bonus in the sky.",
    points = 10,
    trigger = HasBalls() && CurrScore() != 0 && TableSky &&
        dword(0x645) == 0x0a0a0a0a && prev(dword(0x645)) != 0x0a0a0a0a
)

achievement(
    title = "Bumper Bonanza Bliss",
    description = "Complete the Bumper Bonanza Bonus and earn an extra ball.",
    points = 25,
    trigger = HasBalls() && CurrScore() != 0 && TableSky &&
        byte(0x704) == 1 && prev(byte(0x704)) == 0
)

achievement(
    title = "Do You Choose Luck Or Skill?",
    description = "Get a 5x bonus multiplier.",
    points = 50,
    trigger = HasBalls() && CurrScore() != 0 && __ornext(TableSky || TableHi) &&
        prev(byte(0x6ee)) == 4 && byte(0x6ee) == 5
)

// Leaderboard

leaderboard(
    title = "Highest Score (Thousands)",
    description = "Show your skill.",
    start = MusicId == 0x06 && prev(MusicId) != 0x06 && CurrScore() > 0,
    cancel = always_false(),
    submit = always_true(),
    value = CurrScoreThousand()
)

// RP

EmojiBalls = "🎱"
EmojiScore = "💯"

RpScore = rich_presence_macro("Number", CurrScore())

rich_presence_conditional_display(
    Music(0x04),
    "Rocking with the Rollerball Title Screen"
)

rich_presence_conditional_display(
    MusicId == 0x06,
    "Game Over!"
)

rich_presence_conditional_display(
    Singleplayer,
    "Pinball Time! {0}{1} {2}{3}",
    EmojiBalls,
    rich_presence_macro("Number", BallsLeft),
    EmojiScore,
    RpScore
)

rich_presence_conditional_display(
    Multiplayer,
    "Enjoying the Rollerball Multiplayer"
)

rich_presence_display(
    "Rolling With Rollerball"
)
