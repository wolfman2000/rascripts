// NewZealand Story, The
// #ID = 2176

// $000E: Horizontal Camera Position [16-bit]
// $001F: Is The Game Paused?
// $0024: Confusing Counter [16-bit BE]
// $0028: Backup Game State
//        0x00: Title Screen/Story Crawl
//        0x01: Stage Title
//        0x02: Loading The Stage
//        0x03: Gameplay (Includes Demo)
//        0x04: Cleared Stage
//        0x05: Player Death
// $0029: World Counter
// $002A: Stage Counter
// $002C: Number of Lives (Zero Means Game Over)
// $002E: Number of Continues/Credits Left
// $003B: Let Go Of Jump After Jumping?
//        Set to 1 if you jumped, and then let go of Jump. If you hold Jump while it's still 1 and you just touched the ground, you get an auto-jump.
// $003F: Unclear counter. [16-bit]
//        Yes, this crosses a traditional alignment boundary.
// $0056: Weapon Flag? Set to 02 when laser cannon
//        01 = bomb
// $0057: Special Flag - set to 08 to teleport to end of level
// $00FF: Potential Music Byte
//        0x01: Nothing (Can Stop Demo)
//        0x02: World 1
//        0x04: Boss Time
//        0x07: Hurry Up
//        0x08: The Devil Appears
//        0x0c: Game Over
//        0x0d: Rescued Kiwi
//        0x0e: Player Death
// $01F9: Backup Pause Byte? (0x08 if paused)
// $0200: Player 1 Buttons Held This Frame? (One Frame Delay Compared to 0x0205)
//        bit0: Jump
//        bit1: Shoot
//        bit2: Select
//        bit3: Start
//        bit4: Up
//        bit5: Right
//        bit6: Down
//        bit7: Left
// $0205: Player 1 Buttons Held This Frame?
//        bit0: Jump
//        bit1: Shoot
//        bit2: Select
//        bit3: Start
//        bit4: Up
//        bit5: Right
//        bit6: Down
//        bit7: Left
// $020A: Player 1 Buttons Tapped This Frame?
//        bit0: Jump
//        bit1: Shoot
//        bit2: Select
//        bit3: Start
//        bit4: Up
//        bit5: Right
//        bit6: Down
//        bit7: Left
// $0298: Kiwi Y-Position
//        Note that this works in conjunction with the camera position.
// $029A: Kiwi X-Position
//        Note that this works in conjunction with the camera position.
// $02B2: Oxygen Meter
//        When in the water, set to 0x4a. Drain slowly until 0x00 (death) or get out of the water (set to 0x72 or some other arbitrary number).
// $038F: Boss 1 Position?
// $0466: Boss 1 Swallow Counter?
//        Upon going up and down, increment by 1. Once this would normally hit 4, go to 0 and eat the Kiwi. This step is fine: you just move to Phase 2.
// $0467: Boss 1 Phase 2 HP? (Reversed if true)
//        The boss has 0x20 HP.
// $0546: Did The Kiwi Die?
//        0x00 while alive.
// $05E5: Score, 10000000s BCD
// $05E6: Score, 100000s BCD
// $05E7: Score, 10000s BCD
// $05E8: Score, 1000s BCD
// $05E9: Score, 100s BCD
// $05EA: Score, 10s BCD
// $05F2: Score, first 8-bits
// $05F3: Score, second 8-bits
// $05F4: Score, third 8-bits WRITABLE
// $064E: Timer To The Devil [16-bit]
//        A warning beep sounds around 0x3d0, with the final alarm at zero. When that happens, get to the end of the stage QUICKLY if you don't want the devil to take you out.

// Variables

// Are we paused?
Paused = low4(0x1f) > 0

// What is the state of the Kiwi?
GameState = low4(0x28)
TitleCard = GameState == 1
LoadingStage = GameState == 2
InGame = GameState == 3

// What world are we in?
WorldId = low4(0x29)

// What stage are we in?
StageId = low4(0x2a)

// How many lives do we have?
Lives = low4(0x2c)

// How many continues/credits are left?
Continues = low4(0x2e)

// Special Weapon Flag
Weapon = low4(0x56)
WeaponBomb = Weapon == 1
WeaponLaser = Weapon == 2

// Music Playing
Music = low4(0xff)
NoMusic = Music == 0 || Music == 1
NormalInStage = Music == 2
BossBattle = Music == 4
BeatGame = Music == 6
HurryUp = Music == 7
DevilAppears = Music == 8
GameOver = Music == 0x0c
BeatLevel = Music == 0x0d
LostLife = Music == 0x0e
AnyInStageMusic = NormalInStage || BossBattle || HurryUp || DevilAppears

// What button was pressed?
// Make sure to only utilize this with music playing to avoid false positives.
ControllerId = 0x20a
TappedShoot = bit1(ControllerId) == 1

// What is the current player's score?
Score = low4(0x5e5) * 1000000 + low4(0x5e6) * 100000 + low4(0x5e7) * 10000 +
    low4(0x5e8) * 1000 + low4(0x5e9) * 100 + low4(0x5ea) * 10

// Lookups

WorldLookup = {
    0: 1,
    1: 2,
    2: 3,
    3: 4,
    4: 4
}

WorldNameLookup = {
    0: "Auckland",
    1: "Rotorua",
    2: "Waitomo Caves",
    3: "Cook Strait",
    4: "Cook Strait"
}

BossLevelLookup = {
    0: 3,
    1: 3,
    2: 3,
    4: 0,
}

BossTitleLookup = {
    0: "Jonah And The Kiwi",
    1: "Game And Kiwi",
    2: "The Iron Kiwi",
    4: "Meet The Kiwi"
}

FullStageLookup = {
    0: "1-1",
    1: "1-2",
    2: "1-3",
    3: "1-4",
    10: "2-1",
    11: "2-2",
    12: "2-3",
    13: "2-4",
    20: "3-1",
    21: "3-2",
    22: "3-3",
    23: "3-4",
    30: "4-1",
    31: "4-2",
    32: "4-3",
    33: "4-4",
    40: "4-F"
}

WeaponTitleLookup = {
    1: "Mighty Bomb Kiwi",
    2: "Kiwi Finger"
}

WeaponEmojiLookup = {
    0: "🏹",
    1: "💣",
    2: "🔫"
}

WeaponNameLookup = {
    0: "Bow & Arrow",
    1: "Bomb",
    2: "Laser Cannon"
}

// Cheevos

for key in BossLevelLookup {
    points = 10
    if key == 4 {
        points = 25
        
    }
    achievement(
        title = BossTitleLookup[key],
        points = points,
        description = "Beat the boss of World " + WorldLookup[key] + ".",
        trigger = WorldId == WorldLookup[key] && StageId == BossLevelLookup[key] &&
            BeatLevel
    )
}

for weaponId in range(1, 2, 1) {
    validWorld = false
    for bossId in BossLevelLookup {
        validWorld = validWorld || (WorldId == bossId && StageId == BossLevelLookup[bossId])
    }
    achievement(
        title = WeaponTitleLookup[weaponId],
        description = "Beat any boss with the " + WeaponNameLookup[weaponId] + ".",
        points = 10,
        trigger = Weapon == weaponId && validWorld &&
            trigger_when(BeatLevel)
    )
}

achievement(
    title = "A Kiwi And A Half",
    points = 25,
    description = "Beat any level without firing your weapon. Well, not World 1.",
    trigger = WorldId > 0 && BeatLevel &&
        disable_when(
            !Paused && TappedShoot && InGame && Music > 1,
            until=prev(StageId) != StageId
        )
)

achievement(
    title = "Long Live The Kiwi",
    points = 50,
    description = "Beat the game without using a continue.",
    trigger = WorldId == 4 && StageId == 0 &&
        trigger_when(BeatLevel) &&
        disable_when(
            (prev(Continues) > Continues || Lives == 0),
            until=Continues == 2 && WorldId == 0 && StageId == 0
        )
)

// Leaderboards

leaderboard(
    title = "Score Attack",
    description = "Get the highest score you can before game overing or finishing.",
    start = WorldId == 0 && StageId == 0 && Continues == 2 && InGame && Music > 1,
    cancel = always_false(),
    submit = GameOver || BeatGame,
    value = Score,
    format = "SCORE"
)

leaderboard(
    title = "Beat The Game No Continues",
    description = "Beat the game as fast as possible. No game overs allowed.",
    start = WorldId == 0 && StageId == 0 && Continues == 2 && InGame && Music > 1,
    cancel = GameOver,
    submit = WorldId == 4 && StageId == 0 && BeatLevel,
    value = always_true(),
    format = "FRAMES",
    lower_is_better = true
)

// Rich Presence

RpWorldName = rich_presence_lookup("Location", WorldId, WorldNameLookup)
RpStage = rich_presence_lookup("Stage", WorldId * 10 + StageId, FullStageLookup)
RpWeapon = rich_presence_lookup("Weapon", Weapon, WeaponEmojiLookup)
RpScore = rich_presence_macro("Number", Score)
RpLives = rich_presence_macro("Number", Lives)
RpContinues = rich_presence_macro("Number", Continues)

rich_presence_conditional_display(
    BeatGame,
    "Tiki rescued Phee-Phee - 💯 {2} 🐤 {3} 🔁 {4}" ,
    RpWorldName,
    RpStage,
    RpScore,
    RpLives,
    RpContinues
)

rich_presence_conditional_display(
    LostLife,
    "Tiki lost a life at {0} {1} - 💯 {2} 🐤 {3} 🔁 {4}" ,
    RpWorldName,
    RpStage,
    RpScore,
    RpLives,
    RpContinues
)

rich_presence_conditional_display(
    GameOver,
    "Tiki game overed at {0} {1} - 💯 {2} 🐤 {3} 🔁 {4}" ,
    RpWorldName,
    RpStage,
    RpScore,
    RpLives,
    RpContinues
)

rich_presence_conditional_display(
    BossBattle,
    "Tiki {5} fighting the boss of {0} {1} - 💯 {2} 🐤 {3} 🔁 {4}" ,
    RpWorldName,
    RpStage,
    RpScore,
    RpLives,
    RpContinues,
    RpWeapon
)

rich_presence_conditional_display(
    BeatLevel && (TitleCard || LoadingStage),
    "Tiki {5} about to enter {0} {1} - 💯 {2} 🐤 {3} 🔁 {4}" ,
    RpWorldName,
    RpStage,
    RpScore,
    RpLives,
    RpContinues,
    RpWeapon
)

rich_presence_conditional_display(
    BeatLevel,
    "Tiki {5} has beaten {0} {1} - 💯 {2} 🐤 {3} 🔁 {4}" ,
    RpWorldName,
    RpStage,
    RpScore,
    RpLives,
    RpContinues,
    RpWeapon
)

rich_presence_conditional_display(
    !NoMusic,
    "Tiki {5} at {0} {1} - 💯 {2} 🐤 {3} 🔁 {4}" ,
    RpWorldName,
    RpStage,
    RpScore,
    RpLives,
    RpContinues,
    RpWeapon
)

rich_presence_display("Tiki In The NewZealand Story")
