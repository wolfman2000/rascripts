// Ganbare Goemon! - Karakuri Douchuu
// #ID = 4847

GameState = byte(0)
Demo = GameState < 3

Players = byte(0xe)
OnePlayer = Players == 0

Lives = byte(0x20)
GameOver = Lives == 0xff
Stage = byte(0x25)

CurHealth = byte(0x40)
MaxHealth = byte(0x41)
Shoes = byte(0x44)
InvincibleTimer = byte(0x46)
Weapon = byte(0x48)
Time = bcd(word(0x50))
PrevTime = prev(high4(0x51)) * 1000 + prev(low4(0x51)) * 100 +
    prev(high4(0x50)) * 10 + prev(low4(0x50))

Armor = byte(0x7c4)
Talismen = byte(0x7c6)
Incense = byte(0x7c8)
Hat = byte(0x7ca)
Helmet = byte(0x7cc)
Bento = byte(0x7ce)
CandleTimer = byte(0x7da)

InternalScore = bcd(tbyte(0x7e4))
Score = InternalScore * 10
InternalPrevScore = prev(high4(0x7e6)) * 100000 +
    prev(low4(0x7e6)) * 10000 +
    prev(high4(0x7e5)) * 1000 +
    prev(low4(0x7e5)) * 100 +
    prev(high4(0x7e4)) * 10 +
    prev(low4(0x7e4)) * 1
PrevScore = prev(high4(0x7e6)) * 1000000 +
    prev(low4(0x7e6)) * 100000 +
    prev(high4(0x7e5)) * 10000 +
    prev(low4(0x7e5)) * 1000 +
    prev(high4(0x7e4)) * 100 +
    prev(low4(0x7e4)) * 10

Cash = byte(0x7c0) * 256 + byte(0x7be)
PrevCash = prev(byte(0x7c0)) * 256 + prev(byte(0x7be))
SpentCash = Lives != 0xff && Cash < PrevCash

// Cheevos

achievement(
    title = "Nothing Personal: I Like Space",
    points = 2,
    description = "Obtain a slingshot.",
    trigger = !Demo && OnePlayer && Weapon > prev(Weapon)
)

achievement(
    title = "Hammering Harry?",
    points = 3,
    description = "Obtain a hammer and become invincible!",
    trigger = !Demo && OnePlayer && prev(InvincibleTimer) < 0xa4 && InvincibleTimer == 0xa4
)

achievement(
    title = "How Many Pairs Does One Need?",
    points = 3,
    description = "Get max speed via shoes.",
    trigger = !Demo && OnePlayer && Shoes == 6 && prev(Shoes) == 4
)

achievement(
    title = "Burning Potential",
    points = 3,
    description = "Buy a candle from a store.",
    trigger = !Demo && OnePlayer && SpentCash && CandleTimer > prev(CandleTimer)
)

achievement(
    title = "No Box Necessary",
    points = 3,
    description = "Buy some bento at a store.",
    trigger = !Demo && OnePlayer && SpentCash && Bento > prev(Bento)
)

achievement(
    title = "Smells Like Temporary Hit Points",
    points = 3,
    description = "Buy some incense at a store.",
    trigger = !Demo && OnePlayer && SpentCash && Incense > prev(Incense)
)

achievement(
    title = "Time Is Money Indeed",
    points = 3,
    description = "Purchase some more time at a store.",
    trigger = !Demo && OnePlayer && SpentCash && (PrevTime + 500) == Time
)

achievement(
    title = "Long Lasting Celebration",
    points = 5,
    description = "Extend your maximum health.",
    trigger = !Demo && OnePlayer && prev(MaxHealth) / 0x20 == 3 && MaxHealth / 0x20 == 4
)

achievement(
    title = "Endurance For All Of Japan",
    points = 10,
    description = "Extend your maximum health...to its maximum.",
    trigger = !Demo && OnePlayer && prev(MaxHealth) / 0x20 == 6 && MaxHealth / 0x20 == 7
)

achievement(
    title = "I'll Stay Right Here, Thanks",
    points = 3,
    description = "Buy a set of talisman at a store.",
    trigger = !Demo && OnePlayer && SpentCash && Talismen > prev(Talismen)
)

achievement(
    title = "Would This Stop A Rocket, Though?",
    points = 3,
    description = "Buy a set of armor at a store.",
    trigger = !Demo && OnePlayer && SpentCash && Armor > prev(Armor)
)

achievement(
    title = "Do Cyclists Need This In Japan?",
    points = 3,
    description = "Buy a helmet at a store.",
    trigger = !Demo && OnePlayer && SpentCash && Helmet > prev(Helmet)
)

achievement(
    title = "Your Average Amigasa",
    points = 3,
    description = "Buy a straw hat at a store.",
    trigger = !Demo && OnePlayer && SpentCash && Hat > prev(Hat)
)

function StageBeatenCheevo(stage, title, points) {
    achievement(
        title = title,
        points = points,
        description = format("Clear stage {0}.", stage + 1),
        trigger = !Demo && OnePlayer && Stage == stage &&
            byte(0xfb) == 0x15 && prev(byte(0xfb)) == 0x19
    )
}

StageTitles = {
    0: "The Town Of Beginnings",
    1: "The Village Of Forests",
    2: "The Mountain Of Peril",
    3: "The Sea Of Silliness",
    4: "The Town Of Middling Affairs",
    5: "The Sea Of Straits",
    6: "The Village Of Mystery",
    7: "The Mountains Of Verticality",
    8: "The Rice Field Of Hunger",
    9: "The Mansion Of Lavishness",
    10: "The Town Of Endings",
    11: "The Castle Wall Of Fortifications",
    12: "The Castle Interior Of Oppulancy",
}

ClearedLoop = Stage == 12 && byte(0x70) == 0x08 &&
    (InternalPrevScore + 2000 <= InternalScore)

for i in range(0, 12) {
    points = 5
    if (i > 3) {
        points = 10
    }
    if (i < 11) {
        StageBeatenCheevo(i, StageTitles[i], points)
    }
    else if (i == 11) {
        achievement(
            title = StageTitles[11],
            points = 10,
            description = format("Clear stage 12."),
            trigger = !Demo && OnePlayer && prev(Stage) == 11 && Stage == 12 &&
                byte(0xfb) == 0x19 && prev(byte(0xfb)) == 0x19
        )
    }
    else if (i == 12) {
        achievement(
            title = StageTitles[12],
            points = 25,
            description = format("Clear stage 13."),
            trigger = !Demo && OnePlayer && ClearedLoop
        )
    }
}

MazeCollection = {
    // Items in maze, points, title
    0: [5, 5, "Simple So Far",],
    1: [6, 5, "Slightly Out Of The Way"],
    2: [6, 5, "Better Than The Last One"],
    3: [7, 5, "No Drowning In This Maze"],
    4: [9, 10, "Finally Getting Bigger"],
    5: [8, 10, "Interior Designer Challenge"],
    6: [8, 5, "Feels Easier Than The Last One"],
    7: [9, 10, "A Very Tall Maze"],
    8: [9, 10, "Lost And Confused"],
    9: [10, 10, "A Maze Within A Maze"],
    10: [10, 10, "How Many More Are There?"],
    12: [15, 25, "No Pass? Hard Pass. But The Points..."]
}

function MazeCheevo(stage) {
    achievement(
        title = MazeCollection[stage][2],
        points = MazeCollection[stage][1],
        description = format("Clear the maze of stage {0} with every item.", stage + 1),
        trigger = 
            never(Demo) &&
            never(!OnePlayer) &&
            never(Stage != stage) &&
            never(byte(0x70) == 0 && prev(byte(0x70)) == 0) &&
            once(byte(0x70) == 7 && prev(byte(0x70)) != 7) &&
            measured(
                tally(
                    MazeCollection[stage][0],
                    byte(0x7de) > prev(byte(0x7de)),
                    byte(0x7dc) > prev(byte(0x7dc))
                )
            ) &&
            once(byte(0x70) == 0 && prev(byte(0x70)) == 7)
    )
}

for i in range(0, 12) {
    if (i != 11)
    MazeCheevo(i)
}

achievement(
    title = "All This For Faster Enemies?",
    points = 50,
    description = "Complete a second loop.",
    trigger = !Demo && OnePlayer && ClearedLoop && byte(0x1f) == 1
)

NewGameEffectively = byte(0x1f) != prev(byte(0x1f)) || 
            (Score == 0 && Stage == 0 && byte(0x1f) == 0)

achievement(
    title = "Pure Raw Skill",
    points = 50,
    description = "Complete any loop WITHOUT buying defensive equipment. Food/time/slingshot is fine.",
    trigger = !Demo && OnePlayer &&
        ClearedLoop &&
        disable_when(once(Hat != 0), until=NewGameEffectively) &&
        disable_when(once(Helmet != 0), until=NewGameEffectively) &&
        disable_when(once(Armor != 0), until=NewGameEffectively) &&
        disable_when(once(Talismen != 0), until=NewGameEffectively) &&
        disable_when(once(Incense != 0), until=NewGameEffectively)
)

// RP

EmojiHeart = "❤️"
EmojiScore = "💯"
EmojiTimer = "⏲️"
EmojiMoney = "💰"

HealthLookup = {
    0x00: "0",
    0x20: "1",
    0x40: "2",
    0x60: "3",
    0x80: "4",
    0xa0: "5",
    0xc0: "6",
    0xe0: "7"
}

rich_presence_conditional_display(
    Demo,
    "Waiting to go for it."
)

rich_presence_display(
    "Go for it Goemon! {6} {7}/{8} {0} {1} {2} {3} {4} {5}",
    EmojiScore,
    rich_presence_macro("Number", Score),
    EmojiTimer,
    rich_presence_macro("Number", Time),
    EmojiMoney,
    rich_presence_macro("Number", Cash),
    EmojiHeart,
    rich_presence_lookup("Health", CurHealth, HealthLookup),
    rich_presence_lookup("Health", MaxHealth, HealthLookup)
)
