// Judge Dredd
// #ID = 4315

// Variables

// What buttons are in use?
// Note that this game is 6-button compatible, and it works best if you have that.
PressedUp = bit0(0x10) == 1
PressedDown = bit1(0x10) == 1
PressedLeft = bit2(0x10) == 1
PressedRight = bit3(0x10) == 1
PressedA = bit4(0x11) == 1
PressedB = bit4(0x10) == 1
PressedC = bit5(0x10) == 1
PressedX = bit0(0x11) == 1
PressedY = bit7(0x10) == 1
PressedZ = bit6(0x11) == 1
PressedMode = bit1(0x11) == 1
PressedStart = bit5(0x11) == 1

// Is the game paused?
IsPaused = byte(0x0221) == 1

// Are the objectives complete?
// Remember to compare this to the playing state.
PrimaryObjectiveCounter = byte(0x2b22)
PrimaryObjectiveComplete = PrimaryObjectiveCounter == 0
SecondaryObjectiveCounter = byte(0x2b24)
SecondaryObjectiveComplete = SecondaryObjectiveCounter == 0

// Was the Password Disc picked up?
PickedUpPasswordDisc = byte(0x2b2c) == 1

// How many lives?
Lives = byte(0x2b2f)

// What is the current score?
Score = bcd(byte(0x2b39)) * 1000000 + bcd(byte(0x2b38)) * 10000 +
    bcd(byte(0x2b3b)) * 100 + bcd(byte(0x2b3a))

// How much health does Dredd have?
Health = byte(0x2b40)

// How many hits were taken by Dredd? The lower, the better.
HitsTaken = byte(0x2b4e)

// How many perps were arrested? This is typically worth a higher score.
PerpsArrested = byte(0x2b50)

// How many targets were hit with weapons?
TargetsHit = byte(0x2b54)

// How many perps were sentenced? This can also be interpreted as killed.
PerpsSentenced = byte(0x2b56)

// How many times were weapons fired?
ShotsFired = word(0x2b58)

// Is the stage beaten?
// Make sure to utilize this in conjunction with the other stats.
StageBeaten = byte(0x2b93) == 1

// What weapon is equipped? How much ammo is there?
EquippedWeapon = low4(0x314e)

WeaponBase = 0x3166

AmmoCurrentWeapon = bcd(byte(WeaponBase + (EquippedWeapon * 2)))
AmmoRicochetMissiles = bcd(byte(0x3168))
AmmoGrenades = bcd(byte(0x316a))
AmmoHighExplosiveMissile = bcd(byte(0x316c))
AmmoIncendiaryMissiles = bcd(byte(0x316e))
AmmoArmorPiercingMissiles = bcd(byte(0x3170))
AmmoHeatSeeker = bcd(byte(0x3172))
AmmoDoubleWhammy = bcd(byte(0x3174))
AmmoBoingBubble = bcd(byte(0x3176))
AmmoFlareGun = bcd(byte(0x3178))

WeaponNameLookup = {
    0: "Guns",
    1: "Ricochet Missiles",
    2: "Grenades",
    3: "High Explosive Missiles",
    4: "Incendiary Missiles",
    5: "Armor Piercing Missiles",
    6: "Heat Seekers",
    7: "Double Whammies",
    8: "Boing Bubbles",
    9: "Flares"
}

WeaponEmojiLookup = {
    0: "🔫 (Gun)",
    1: "🪞 (Ricochet)",
    2: "💣 (Grenade)",
    3: "💥 (High Explosive)",
    4: "🔥 (Incendiary)",
    5: "🛡️ (Armor Piercing)",
    6: "🏠 (Heat Seeker)",
    7: "🏠🏠 (Double Whammy)",
    8: "🗯️ (Bubble)",
    9: "💡 (Flare)"
}

// Is Level Select Active?
// Only disable certain cheevos if this is taken advantaged of.
LevelSelectActive = byte(0xe38d) == 0xff

// What level are we in?
LevelId = byte(0x04a4)

WorldStartIds = [1, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 34]
WorldEndIds = [2, 5, 7, 11, 14, 17, 20, 23, 26, 28, 32, 35]

AllValidIds = [
    1, 2,
    3, 4, 5,
    6, 7,
    9, 11,
    12, 13, 14,
    15, 17,
    18, 20,
    21, 23,
    24, 26,
    27, 28,
    30, 31, 32,
    34, 35
]

WorldToLevelIds = {
    0: [1, 2],
    1: [3, 4, 5],
    2: [6, 7],
    3: [9, 11],
    4: [12, 13, 14],
    5: [15, 17],
    6: [18, 20],
    7: [21, 23],
    8: [24, 26],
    9: [27, 28],
    10: [30, 31, 32],
    11: [34, 35]
}

WorldNameLookup = {
    0: "Heavenly Haven",
    1: "Aspen Penal Colony",
    2: "Cursed Earth",
    3: "Mega-City One",
    4: "Council Chambers",
    5: "Outside Janus Lab",
    6: "Inside Janus Lab",
    7: "Gila Munja Invasion",
    8: "RC4 Processing Plant",
    9: "City Towers",
    10: "Justice One",
    11: "Dead World",
}

LevelLookup = {
    1: "Heavenly Haven 1",
    2: "Heavenly Haven 2",
    3: "Aspen Penal Colony 1",
    4: "Aspen Penal Colony 2",
    5: "Aspen Penal Colony 3",
    6: "Cursed Earth 1",
    7: "Cursed Earth 2",
    9: "Mega-City One 1",
    11: "Mega-City One 2",
    12: "Council Chambers 1",
    13: "Council Chambers 2", // primary objective changed: secondary is same.
    14: "Chase To Janus Lab", // Shooter stage: no objectives.
    15: "Outside Janus Lab 1", // Unknown secondary objective. May skip.
    17: "Outside Janus Lab 2", // Unknown secondary objective. May skip.
    18: "Inside Janus Lab 1",
    20: "Inside Janus Lab 2", // Unknown secondary objective. Same as last?,
    21: "Gila Munja Invasion 1",
    23: "Gila Munja Invasion 2",
    24: "RC4 Processing Plant 1",
    26: "RC4 Processing Plant 2",
    27: "City Towers 1",
    28: "City Towers 2",
    30: "Justice One 1",
    31: "Justice One 2",
    32: "Justice One 3", // primary objective changed: secondary is same.
    34: "Dead World 1", // Unknown secondary objective. May skip.
    35: "Dead World 2", // Unknown secondary objective. May skip.
}

// Is the demo playing?
InDemo = byte(0xdf20) == 1

// What's the current game state? 
GameState = word(0xfffe)
GsSegaScreen = GameState == 0x707e
GsCopyright = GameState == 0x70be
GsAcclaim = GameState == 0x70ca
GsProbe = GameState == 0x70d6
GsText = GameState == 0x70e0
GsPressStart = GameState == 0x70ec
GsHighScore = GameState == 0x70fe
GsDemoStage = GameState == 0x7138
GsPreGame = GameState == 0x7182
GsMissionControl = GameState == 0x719e
GsLoadingStage = GameState == 0x71d4 || GameState == 0x719a ||
    GameState == 0x719e
GsInGame = GameState == 0x71e6 || GameState == 0x72d4 || GameState == 0x72ea
GsGameOver = GameState == 0x71c0 || GameState == 0x70c0 || GameState == 0x73d4
GsPaused = GameState == 0x7334
GsLeavingLevel = GameState == 0x7476
GsBonusAward = GameState == 0x7480
GsTerminal = GameState == 0x7504 || GameState == 0x74dc
GsCredits = GameState == 0x759a || GameState == 0x75a4

HasStartedGame = LevelId == 1 && GsMissionControl
HasBeatenGame = LevelId == 35 && GsCredits

// Cheevos

achievement(
    title = "I Am The Cheater",
    description = "Activate the Level Select code. This will disable some cheevos until power off!",
    points = 3,
    trigger = GsProbe && LevelSelectActive
)

for weaponId in range(1, 9, 1) {
    weaponName = WeaponNameLookup[weaponId]
    achievement(
        title = "I Am The Shooter of " + weaponName,
        description = "Collect and fire one round of " + weaponName,
        points = 3,
        trigger = GsInGame && EquippedWeapon == weaponId &&
            AmmoCurrentWeapon < prev(AmmoCurrentWeapon) && PressedA
    )
}

for worldId in range(0, 10) {
    startLevel = WorldStartIds[worldId]
    endLevel = WorldEndIds[worldId]
    worldName = WorldNameLookup[worldId]
    preventLevelWarp = true
    if (worldId > 0) {
        preventLevelWarp = disable_when(LevelId == startLevel && Score == 0 && GsInGame)
    }
    heroPoints = 5
    if (worldId > 8) {
        heroPoints = 10
    }
    achievement(
        title = "I Am The Hero of " + worldName,
        description = format("Complete Chapter {0} ({1}).", (worldId + 1), worldName),
        points = heroPoints,
        trigger = preventLevelWarp && once(LevelId == startLevel && GsLeavingLevel) &&
            once(LevelId == endLevel && GsLeavingLevel)
    )
    
    if (worldId != 5 && worldId != 11) {
    achievement(
        title = "I Am The Detective of " + worldName,
        description = format("Complete All Objectives of Chapter {0} ({1}).",
            (worldId + 1),
            worldName
        ),
        points = 10,
        trigger =
            preventLevelWarp &&
            never(LevelId < startLevel) && never(LevelId > endLevel) &&
            once(LevelId == startLevel && GsLeavingLevel) &&
            once(LevelId == endLevel && GsLeavingLevel) &&
            disable_when(GsLeavingLevel && !SecondaryObjectiveComplete,
                until=LevelId == startLevel && prev(LevelId) != startLevel
            )
    )
    }
    lifelessPoints = 10
    if (worldId > 5) {
        lifelessPoints = 25
    }
    if (worldId > 8) {
        lifelessPoints = 50
    }

    if (worldId != 11) {
    achievement(
        title = "I Am The Survivor of " + worldName,
        description = "Complete Chapter " + (worldId + 1) + " without losing a life.",
        points = lifelessPoints,
        trigger = never(LevelId < startLevel) && never(LevelId > endLevel) &&
            once(LevelId == endLevel && GsLeavingLevel) &&
            disable_when(prev(Lives) > Lives,
            until=prev(LevelId) != startLevel && LevelId == startLevel)
    )
    }
}

achievement(
    title = "I Am The Law!",
    description = "Clear Dead World and beat the game.",
    points = 25,
    trigger = disable_when(LevelId >= 34 && Score == 0 && GsInGame) &&
        once(LevelId == 34 && GsLeavingLevel) && GsCredits
)

for scoreTarget in range(500000, 1000000, 500000) {
    achievement(
        title = "I Am The Scorer of " + scoreTarget + " Points",
        description = "Start a new game & get " + scoreTarget + " points in your run.",
        points = scoreTarget / 100000,
        trigger = (GsInGame || GsBonusAward) && Score > scoreTarget &&
            disable_when(LevelId > 1 && Score == 0 && GsInGame)
    )
}

// Leaderboards

leaderboard(
    title = "Any%",
    description = "Beat the game as fast as possible.",
    start = HasStartedGame,
    cancel = GsGameOver,
    submit = HasBeatenGame,
    value = always_true(),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "All Objectives",
    description = "Beat the game as fast as possible while completing all objectives.",
    start = HasStartedGame,
    cancel = GsGameOver
        || (GsLeavingLevel && !SecondaryObjectiveComplete),
    submit = HasBeatenGame,
    value = always_true(),
    lower_is_better = true,
    format = "FRAMES"
)

for levelId in AllValidIds {
    if (levelId < 34) {
    stageName = LevelLookup[levelId]
    leaderboard(
        title = "IL Fastest Time in Stage " + stageName,
        description = "Complete the stage as fast as possible.",
        start = LevelId == levelId && GsInGame && Score == 0,
        cancel = GsGameOver,
        submit = GsLeavingLevel,
        value = always_true(),
        lower_is_better = true,
        format = "FRAMES"
    )
    
    // See if there are any levels that don't have secondary objectives.
    if (levelId != 14 && levelId != 15 && levelId != 17 && levelId < 34)
    leaderboard(
        title = "IL Fastest Time Both Objectives in Stage " + stageName,
        description = "Complete both objectives & finish the stage as fast as possible.",
        start = LevelId == levelId && GsInGame && Score == 0,
        cancel = GsGameOver || 
            (GsLeavingLevel && !SecondaryObjectiveComplete),
        submit = GsLeavingLevel && SecondaryObjectiveComplete,
        value = always_true(),
        lower_is_better = true,
        format = "FRAMES"
    )
    
    leaderboard(
        title = "Lowest Hits Taken in Stage " + stageName,
        description = "Complete the stage while taking as few hits as possible.",
        start = LevelId == levelId && GsInGame && Score == 0,
        cancel = GsGameOver,
        submit = GsLeavingLevel,
        value = HitsTaken,
        lower_is_better = true,
        format = "VALUE"
    )
    
    if (levelId != 14) {
        leaderboard(
            title = "Most Accurate Shots in Stage " + stageName,
            description = "Complete the stage while staying accurate with your weapons.",
            start = LevelId == levelId && GsInGame && Score == 0,
            cancel = GsGameOver,
            submit = GsLeavingLevel,
            value = 1000 + TargetsHit - ShotsFired,
            format = "VALUE"
        )
    }
    }
}

// RP

RpUnicode = {
    0: "👮", // cop/lives
    1: "💯", // points/score
}

RpLivesUnicode = rich_presence_lookup("Unicode", 0, RpUnicode)
RpScoreUnicode = rich_presence_lookup("Unicode", 1, RpUnicode)

RpLives = rich_presence_macro("Number", Lives)
RpScore = rich_presence_macro("Number", Score)
RpWeapon = rich_presence_lookup("Weapon", EquippedWeapon, WeaponEmojiLookup)
RpAmmo = rich_presence_macro("Number", AmmoCurrentWeapon)
RpLevel = rich_presence_lookup("Stage", LevelId, LevelLookup, "The Long Walk")

rich_presence_conditional_display(
    GsCredits,
    "Dread Is The Law! And Back! And You Better Believe It!"
)

rich_presence_conditional_display(
    GsGameOver,
    "Dread Is The Guilty: Game Over Judge"
)

rich_presence_conditional_display(
    GsLeavingLevel || GsBonusAward,
    "Dread Is The Winner at {0} - 👮{2} 💯{4}",
    RpLevel,
    RpLivesUnicode,
    RpLives,
    RpScoreUnicode,
    RpScore
)

rich_presence_conditional_display(
    (GsLoadingStage || GsInGame || GsTerminal || GsPaused) && EquippedWeapon == 0,
    "Dread Is The Law at {0} - {1} 👮{3} 💯{5}",
    RpLevel,
    RpWeapon,
    RpLivesUnicode,
    RpLives,
    RpScoreUnicode,
    RpScore
)

rich_presence_conditional_display(
    GsLoadingStage || GsInGame || GsTerminal || GsPaused,
    "Dread Is The Law at {0} - {1}{6} 👮{3} 💯{5}",
    RpLevel,
    RpWeapon,
    RpLivesUnicode,
    RpLives,
    RpScoreUnicode,
    RpScore,
    RpAmmo
)

rich_presence_conditional_display(
    GsMissionControl,
    "Dread Is The Preparer For Law (Learning of {0}) - 👮{2} 💯{4}",
    RpLevel,
    RpLivesUnicode,
    RpLives,
    RpScoreUnicode,
    RpScore
)

rich_presence_conditional_display(
    GsDemoStage,
    "Dredd Is The Demo Watcher (Learning of {0})",
    RpLevel
)

rich_presence_conditional_display(
    GsSegaScreen || GsCopyright || GsAcclaim || GsProbe ||
        GsText || GsPressStart || GsHighScore,
    "Dredd Is The Intro Watcher"
)

rich_presence_display("Dredd Is The Law")
