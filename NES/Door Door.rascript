// Door Door
// #ID = 4771

Dead = byte(0x50) == 0xf0 || byte(0x50) == 0xfe ||
    prev(byte(0x50)) == 0xf0 || prev(byte(0x50)) == 0xfe
BeatLevel = byte(0x50) == 0xfd && prev(byte(0x50)) != 0xfd

Aliens = byte(0xb5)

Player1 = byte(0xc2) == 0

Lives = byte(0xcc)

Score = word(0xd4) * 100
PrevScore = prev(word(0xd4)) * 100

LevelId = byte(0xf3)

// Cheevos

DoorTitles = {
    0: "Door To Door",
    5: "Knockin' On Heaven's Door",
    10: "Stage Door Canteen",
    15: "The Spook Who Sat By The Door",
    20: "Through The Back Door",
    25: "Codename: Kids Next Door",
    30: "The Door In The Floor",
    35: "The Spy Next Door",
    40: "The House Next Door",
    45: "The Girl Next Door",
    50: "Stage Door"
}

DoorPoints = {
    0: 1,
    5: 5,
    10: 5,
    15: 10,
    20: 10,
    25: 10,
    30: 25,
    35: 25,
    40: 25,
    45: 50,
    50: 50
}

achievement(
    title = DoorTitles[0],
    points = DoorPoints[0],
    description = "Complete the tutorial level.",
    trigger = never(Lives == 0) && LevelId == 0 && BeatLevel
)

function BatchFiveCheevo(target) {
    achievement(
        title = DoorTitles[target],
        points = DoorPoints[target],
        description = format("Complete levels {0} - {1}.", target - 4, target),
        trigger = never(Lives == 0) &&
            once(LevelId == target - 4 && BeatLevel) &&
            once(LevelId == target - 3 && BeatLevel) &&
            once(LevelId == target - 2 && BeatLevel) &&
            once(LevelId == target - 1 && BeatLevel) &&
            once(LevelId == target && BeatLevel)
    )
}

for i in range(5, 50, 5) {
    BatchFiveCheevo(i)
}

AlienTitles = {
    2: "The Tiger Next Door",
    3: "The Mine With The Iron Door",
    4: "Stranger At My Door"
}

AlienPoints = {
    2: 5,
    3: 10,
    4: 25
}

function AlienCheevo(target) {
    achievement(
        title = AlienTitles[target],
        points = AlienPoints[target],
        description = format("Trap at least {0} aliens in a single door.", target),
        trigger = never(Lives == 0) &&
            unless(Dead) &&
            prev(Aliens) - Aliens >= target &&
            prev(Aliens) - Aliens <= 10
    )
}

for i in AlienPoints {
    AlienCheevo(i)
}

// Leaderboard

leaderboard(
    title = "High Score Single Loop",
    description = "Get the highest score you can!",
    start = once(prev(LevelId) == 0 && LevelId == 1 && Score == 100) &&
        ((Lives == 0) || (LevelId == 50 && BeatLevel)),
    cancel = always_false(),
    submit = always_true(),
    value = Score
)

// RP

EmojiSmile = "☺️"

rich_presence_conditional_display(
    Lives != 0 && Lives < 10,
    "1UP-{0} Round {1} {2}{3}",
    rich_presence_macro("Number", Score),
    rich_presence_macro("Number", LevelId),
    EmojiSmile,
    rich_presence_macro("Number", Lives)
)

rich_presence_display(
    "Wishing A Door Door was A Jar Jar. Eh...maybe not."
)
