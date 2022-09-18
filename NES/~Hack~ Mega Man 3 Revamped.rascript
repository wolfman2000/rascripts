// ~Hack~ Mega Man 3 Revamped
// #ID = 15922

// Indepenedent Functions

function HasWeapon(target) {
    return bit7(target) == 1
}

function RobotHealth(target) {
    return bit4(target) * 16 + bit3(target) * 8 +
        bit2(target) * 4 + bit1(target) * 2 + bit0(target)
}

function PrevRobotHealth(target) {
    return prev(bit4(target)) * 16 + prev(bit3(target)) * 8 +
        prev(bit2(target)) * 4 + prev(bit1(target)) * 2 + prev(bit0(target))
}

BossSelection = byte(0x13) + byte(0x12)

PressedB = bit6(0x14) == 1

StageId = byte(0x22)
PlayerStatus = byte(0x30)


NotPaused = byte(0x78) == 0

InControlA = byte(0x99) == 0x55

EquippedWeaponBase = 0xa0
EquippedWeapon = low4(EquippedWeaponBase)

PlayerHealth = 0xa2
WeaponGE = 0xa3
WeaponNE = 0xa4
WeaponHA = 0xa5
WeaponMA = 0xa6
WeaponTO = 0xa7
WeaponSN = 0xa8
WeaponRC = 0xa9
WeaponSP = 0xaa
WeaponRM = 0xab
WeaponSH = 0xac
WeaponRJ = 0xad

UsedRush = EquippedWeapon >= 7 && bit0(EquippedWeaponBase) == 1 && InControlA && 
    byte(PlayerHealth + EquippedWeapon) < prev(byte(PlayerHealth + EquippedWeapon))

UsedRushCoil = EquippedWeapon == 7 && bit0(EquippedWeaponBase) == 1 && InControlA && 
    byte(PlayerHealth + EquippedWeapon) < prev(byte(PlayerHealth + EquippedWeapon))

UsedAnyFull = EquippedWeapon != 0 && InControlA &&
    byte(PlayerHealth + EquippedWeapon) < prev(byte(PlayerHealth + EquippedWeapon))

UsedAnyPartial = EquippedWeapon != 0 && InControlA && byte(0xb5) != prev(byte(0xb5))

UsedWeaponFull = EquippedWeapon != 0 && EquippedWeapon != 9 && EquippedWeapon <= 10 && 
    bitcount(EquippedWeapon) <= 2 && InControlA &&
    byte(PlayerHealth + EquippedWeapon) < prev(byte(PlayerHealth + EquippedWeapon))

UsedWeaponPartial = EquippedWeapon != 0 && EquippedWeapon != 9 && EquippedWeapon <= 10 && 
    bitcount(EquippedWeapon) <= 2 && InControlA &&
    byte(0xb5) != prev(byte(0xb5))

Lives = byte(0xae)
Tanks = byte(0xaf)

LostHealth = RobotHealth(PlayerHealth) < PrevRobotHealth(PlayerHealth)
PastGameOver = prev(Lives) == 0 && Lives == 2
LostLife = Lives + 1 == prev(Lives)

MusicId = byte(0xd9)
ScreenId = byte(0xf9)

MegaManY = byte(0x3c0)

PlayerTeleportingDown = PlayerStatus == 0x04 && prev(MegaManY) < 0x10 && MegaManY >= 0x10

BossHealth = 0x4ff

EquippedWeaponLookup = {
    0: "P",
    1: "GE",
    2: "NE",
    3: "HA",
    4: "MA",
    5: "TO",
    6: "SN",
    7: "RC",
    8: "SP",
    9: "RM",
    10: "SH",
    11: "RJ"
}

// Cheevos

StageLookup = {
    0x00: "Needle Man",
    0x01: "Magnet Man",
    0x02: "Gemini Man",
    0x03: "Hard Man",
    0x04: "Top Man",
    0x05: "Snake Man",
    0x06: "Spark Man",
    0x07: "Shadow Man",
    0x08: "Doc Needle",
    0x09: "Doc Gemini",
    0x0a: "Doc Spark",
    0x0b: "Doc Shadow",
    0x0c: "Wily 1",
    0x0d: "Wily 2",
    0x0e: "Wily 3",
    0x0f: "Wily 4",
    0x10: "Wily 5",
    0x11: "Wily 6"
}

StageRevisitLookup = {
    0x08: "Needle Man",
    0x09: "Gemini Man",
    0x0a: "Spark Man",
    0x0b: "Shadow Man"
}

StageBossName = {
    0x00: "Needle Man",
    0x01: "Magnet Man",
    0x02: "Gemini Man",
    0x03: "Hard Man",
    0x04: "Top Man",
    0x05: "Snake Man",
    0x06: "Spark Man",
    0x07: "Shadow Man",
}

StageBossScreen = {
    0x00: 0x14,
    0x01: 0x14,
    0x02: 0x1d,
    0x03: 0x17,
    0x04: 0x15,
    0x05: 0x19,
    0x06: 0x17,
    0x07: 0x16,
    0x08: 0x1e,
    0x09: 0x1e,
    0x0a: 0x19,
    0x0b: 0x19,
    0x0c: 0x19,
    0x0d: 0x1f,
    0x0e: 0x16,
    0x0f: 0x09,
    0x10: 0x01,
    0x11: 0x02
}

StageWeaponOffsetLookup = {
    0x00: 2,
    0x01: 4,
    0x02: 1,
    0x03: 3,
    0x04: 5,
    0x05: 6,
    0x06: 8,
    0x07: 10,
}

GetWeaponTitle = {
    0: "Not The Knitting Kind",
    1: "Opposites Attract",
    2: "No Two Player Mode, Sorry",
    3: "Don't Smirk",
    4: "Does Anyone Use This?",
    5: "Rattling Across The Ground",
    6: "A Spark Of Hope",
    7: "Not Historically Accurate"
}

function GetWeaponCheevo(stageId) {
    weaponTarget = bit7(0xa2 + StageWeaponOffsetLookup[stageId])
    achievement(
        title = GetWeaponTitle[stageId],
        points = 5,
        description = format(
            "Defeat {0} and claim his weapon.",
            StageLookup[stageId]
        ),
        trigger = StageId == stageId && ScreenId == StageBossScreen[stageId] &&
            weaponTarget > prev(weaponTarget)
    )
}

for i in range(0, 7, 1) {
    GetWeaponCheevo(i)
}

DocRobotTitleNames = {
    0x08: "The Explosive Tornadoes",
    0x09: "The Still Bubbles",
    0x0a: "The Strongest Boomerangs",
    0x0b: "The Burning Wood"
}

DocRobotFirstBossDoor = {
    0x08: 0x0a,
    0x09: 0x11,
    0x0a: 0x0b,
    0x0b: 0x0f,
}

DocRobotFinalBossDoor = {
    0x08: 0x1e,
    0x09: 0x1e,
    0x0a: 0x19,
    0x0b: 0x19
}

DocRobotStageToOld = {
    0x08: 0,
    0x09: 2,
    0x0a: 6,
    0x0b: 7
}

function DocRobotCheevo(stageId) {
    oldStage = DocRobotStageToOld[stageId]
    achievement(
        title = DocRobotTitleNames[stageId],
        points = 10,
        description = format(
            "Chase Doc Man out of {0}'s planet.",
            StageLookup[oldStage]
        ),
        trigger = StageId == stageId && ScreenId == DocRobotFinalBossDoor[stageId] &&
            MusicId == 0x38
    )
}

for i in DocRobotTitleNames {
    DocRobotCheevo(i)
}

BreakManBeaten = StageId == 0x16 && prev(StageId) == 0x03 &&
            ScreenId == 0x00 && prior(ScreenId) == 0x18

achievement(
    title = "You'll Never See It Coming...",
    points = 5,
    description = "Defeat your red rival...wait, why is that face familiar?",
    trigger = BreakManBeaten
)

WilyStageCheevoTitles = {
    0x0c: "That's A Lot Of...Turtles?",
    0x0d: "Now With Improved Hitboxes",
    0x0e: "A Speedrunner's Worst Nightmare: RNG",
    0x0f: "Why Is This A Tradition?",
    0x10: "Spider Wily Does Not Have The Same Ring To It",
    0x11: "Getting Achievements Means More Acclaim"
}

WilyStageBossName = {
    0x0c: "the Kamegoro Maker",
    0x0d: "the Yellow Devil",
    0x0e: "the Holographic Mega Men",
    0x0f: "the Boss Rush Gauntlet",
    0x10: "Wily Machine 3",
    0x11: "Gamma"
}

function WilyStageCheevo(stageId) {
    musicTarget = MusicId >= 0x37 && MusicId <= 0x38
    if (stageId == 0x0f) {
        musicTarget = MusicId == 0x0a
    }
    achievement(
        title = WilyStageCheevoTitles[stageId],
        points = 10,
        description = format(
            "Defeat {0}.",
            WilyStageBossName[stageId]
        ),
        trigger = StageId == stageId && ScreenId == StageBossScreen[stageId] &&
            musicTarget
    )
}

for i in range(0, 5, 1) {
    WilyStageCheevo(i + 0x0c)
}

// Challenge Cheevos

AnyWeapon = HasWeapon(WeaponSP) || HasWeapon(WeaponSN) ||
        HasWeapon(WeaponNE) || HasWeapon(WeaponHA) ||
        HasWeapon(WeaponTO) || HasWeapon(WeaponGE) ||
        HasWeapon(WeaponMA) || HasWeapon(WeaponSH)

function RobotMasterDodgingCheevo(stageId) {
    achievement(
        title = "Nimble Towards " + StageBossName[stageId],
        points = 10,
        description = format(
            "Reach the boss corridor of {0} under Perfect Run conditions.",
            StageBossName[stageId]
        ),
        trigger = once(StageId == stageId && ScreenId == 0 && PlayerTeleportingDown
        ) &&
        never(LostLife) &&
        never(LostHealth) &&
        never(PastGameOver) &&
        never(UsedAnyFull) &&
        never(UsedAnyPartial) &&
        trigger_when(ScreenId == StageBossScreen[stageId] - 1)
    )
}

function RmBusterOnlyCheevo(stageId) {
    bossRoom = StageBossScreen[stageId]
    weaponTarget = bit7(0xa2 + StageWeaponOffsetLookup[stageId])
    intended = 
        once(StageId == stageId &&
            ScreenId == bossRoom &&
            prev(ScreenId) == bossRoom - 1) &&
        trigger_when(StageId == stageId && weaponTarget > prev(weaponTarget)) &&
        never(StageId == stageId && prev(Tanks) - 1 == Tanks) &&
        never(StageId == stageId && UsedAnyFull) &&
        never(StageId == stageId && UsedAnyPartial) &&
        never(StageId == stageId && LostLife) &&
        never(StageId == stageId && PastGameOver)
    
    rematch = 
        once(StageId == 0x0f && prev(ScreenId) == 8 && ScreenId == 0x0a + (stageId * 2)) &&
        never(StageId == 0x0f && ScreenId < 8) &&
        trigger_when(StageId == 0x0f && prev(ScreenId) == 0x0a + (stageId * 2) && ScreenId == 8) &&
        never(StageId == 0x0f && prev(Tanks) - 1 == Tanks) &&
        never(StageId == 0x0f && UsedAnyFull) &&
        never(StageId == 0x0f && UsedAnyPartial) &&
        never(StageId == 0x0f && LostLife) &&
        never(StageId == 0x0f && PastGameOver)
    
    achievement(
        title = "Bustin' Up " + StageBossName[stageId],
        points = 5,
        description = format(
            "Defeat {0} using only the plasma cannon. No E-Tank usage either.",
            StageBossName[stageId]
        ),
        trigger = intended || rematch
    )
}

function RmNoDamageCheevo(stageId) {
    bossRoom = StageBossScreen[stageId]
    weaponTarget = bit7(0xa2 + StageWeaponOffsetLookup[stageId])
    intended = 
    once(StageId == stageId &&
        ScreenId == bossRoom &&
        prev(ScreenId) == bossRoom - 1) &&
        trigger_when(StageId == stageId && weaponTarget > prev(weaponTarget)) &&
        never(StageId == stageId && LostHealth) &&
        never(StageId == stageId && LostLife) &&
        never(StageId == stageId && PastGameOver)
        
    rematch = once(StageId == 0x0f && prev(ScreenId) == 8 && ScreenId == 0x0a + (stageId * 2)) &&
        never(StageId == 0x0f && ScreenId < 8) &&
        trigger_when(
        StageId == 0x0f && prev(ScreenId) == 0x0a + (stageId * 2) && ScreenId == 8) &&
        never(StageId == 0x0f && UsedAnyFull) &&
        never(StageId == 0x0f && UsedAnyPartial) &&
        never(StageId == 0x0f && LostLife) &&
        never(StageId == 0x0f && PastGameOver)
        
    achievement(
        title = "Untouched Against " + StageBossName[stageId],
        points = 10,
        description = format(
            "Defeat {0} without getting hit.",
            StageBossName[stageId]
        ),
        trigger = intended || rematch
    )
}

for i in range(0, 7) {
    RobotMasterDodgingCheevo(i)
    RmBusterOnlyCheevo(i)
    RmNoDamageCheevo(i)
}

DocLineup = {
    810: "Crash Man",
    830: "Air Man",
    917: "Flash Man",
    930: "Bubble Man",
    1011: "Metal Man",
    1025: "Quick Man",
    1115: "Heat Man",
    1125: "Wood Man"
}

function DocNimbleFirstCheevo(stageId, screenId) {
    target = screenId - 1
    docId = stageId * 100 + screenId
    achievement(
        title = "Nimble Towards " + DocLineup[docId],
        points = 10,
        description = format(
            "Reach the boss corridor of {0} under Perfect Run conditions.",
            DocLineup[docId]
        ),
        trigger = once(StageId == stageId && ScreenId == 0 && PlayerTeleportingDown
        ) &&
        never(LostLife) &&
        never(LostHealth) &&
        never(PastGameOver) &&
        never(UsedAnyFull) &&
        never(UsedAnyPartial) &&
        trigger_when(ScreenId == target)
    )
}

function DocNimbleSecondCheevo(stageId, priorScreenId, bossScreenId) {
    target = bossScreenId - 1
    oldDocId = stageId * 100 + priorScreenId
    newDocId = stageId * 100 + bossScreenId
    desc = "After beating {0}, reach the boss corridor of {1} under Perfect Run conditions."
    rush = never(UsedRush)
    if (stageId == 8) {
        desc = desc + " Rust Jet is allowed at that one part."
        rush = never(ScreenId < 0x0b && UsedRush) && never(ScreenId > 0x12 && UsedRush)
    }
    if (stageId == 9) {
        desc = desc + " Rush Marine is allowed at that one part."
        rush = never(ScreenId < 0x13 && UsedRush) && never(ScreenId > 0x16 && UsedRush)
    }
    achievement(
        title = "Nimble Towards " + DocLineup[newDocId],
        points = 10,
        description = format(
            desc,
            DocLineup[oldDocId],
            DocLineup[newDocId]
        ),
        trigger = once(StageId == stageId && prev(ScreenId) == priorScreenId &&
            ScreenId == priorScreenId + 1
        ) &&
        never(LostLife) &&
        never(LostHealth) &&
        never(PastGameOver) &&
        rush &&
        never(UsedWeaponFull) &&
        never(UsedWeaponPartial) &&
        trigger_when(ScreenId == target)
    )
    
}

function DocBusterOnlyCheevo(stageId, screenId) {
    last = MusicId == 0x38
    if (screenId < 0x15) {
        last = ScreenId == screenId + 1
    }
    docId = stageId * 100 + screenId
    achievement(
        title = "Bustin' Up " + DocLineup[docId],
        points = 10,
        description = format(
            "Defeat {0} using only the plasma cannon. No E-Tank usage either.",
             DocLineup[docId]
        ),
        trigger = once(prev(ScreenId) == screenId - 1 && ScreenId == screenId) &&
            never(StageId != stageId) && 
            never(prev(Tanks) - 1 == Tanks) &&
            never(UsedAnyFull) && never(UsedAnyPartial) &&
            never(LostLife) && never(PastGameOver)
            && trigger_when(last)
    )
}

function DocNoDamageCheevo(stageId, screenId) {
    last = MusicId == 0x38
    if (screenId < 0x15) {
        last = ScreenId == screenId + 1
    }
    docId = stageId * 100 + screenId
    achievement(
        title = "Untouched Against " + DocLineup[docId],
        points = 10,
        description = format(
            "Defeat {0} without getting hit.",
             DocLineup[docId]
        ),
        trigger = once(prev(ScreenId) == screenId - 1 && ScreenId == screenId) &&
            never(StageId != stageId) && 
            never(LostHealth) &&
            never(LostLife) && never(PastGameOver)
            && trigger_when(last)
    )
}

for i in range(8, 11) {
    DocNimbleFirstCheevo(i, DocRobotFirstBossDoor[i])
    DocBusterOnlyCheevo(i, DocRobotFirstBossDoor[i])
    DocNoDamageCheevo(i, DocRobotFirstBossDoor[i])
    DocNimbleSecondCheevo(i, DocRobotFirstBossDoor[i], DocRobotFinalBossDoor[i])
    DocBusterOnlyCheevo(i, DocRobotFinalBossDoor[i])
    DocNoDamageCheevo(i, DocRobotFinalBossDoor[i])
}

achievement(
    title = "Bustin' Up Break Man",
    points = 5,
    description = format(
        "Defeat Break Man using only the plasma cannon. No E-Tank usage either."
    ),
    trigger = once(ScreenId == 0x18 && StageId == 3 && MusicId == 0x11) &&
        never(prev(Tanks) - 1 == Tanks) &&
        never(UsedAnyFull) && never(UsedAnyPartial) &&
        never(LostLife) && never(PastGameOver) &&
        trigger_when(BreakManBeaten)
)

achievement(
    title = "Untouched Against Break Man",
    points = 5,
    description = format(
        "Defeat Break Man without getting hit."
    ),
    trigger = once(ScreenId == 0x18 && StageId == 3 && MusicId == 0x11) &&
        never(LostHealth) &&
        never(LostLife) && never(PastGameOver) &&
        trigger_when(BreakManBeaten)
)

function WilyStageCheevo(stageId) {
    target = StageBossScreen[stageId] - 1
    if (stageId == 0x0f) {
        target = 7
    }
    
    achievement(
        title = "Nimble Towards " + WilyStageBossName[stageId],
        points = 10,
        description = format(
            "Reach the boss corridor of {0} under Perfect Run conditions.",
            WilyStageBossName[stageId]
        ),
        trigger = once(StageId == stageId && ScreenId == 0 && PlayerTeleportingDown
        ) &&
        never(LostLife) &&
        never(LostHealth) &&
        never(PastGameOver) &&
        never(UsedAnyFull) &&
        never(UsedAnyPartial) &&
        trigger_when(ScreenId == target)
    )
}

function WilyBusterOnlyCheevo(stageId) {
    musicTarget = MusicId >= 0x37 && MusicId <= 0x38
    screenId = StageBossScreen[stageId]
    enteredScreen = prev(ScreenId) == screenId - 1 && ScreenId == screenId
    bannedWeapons = never(UsedAnyFull) && never(UsedAnyPartial)
    if (stageId == 0x0f) {
        musicTarget = MusicId == 0x0a && ScreenId == 9
        enteredScreen = prev(ScreenId) == 6 && ScreenId == 7
    }
    
    descStart = "Defeat {0} using only the plasma cannon"
    points = 25
    if (stageId == 0x0c) {
        points = 10
    }
    if (stageId == 0x0f) {
        descStart = descStart + " in one life"
    }
    if (stageId == 0x11) {
        descStart = descStart + " during the first half"
        bannedWeapons = never(UsedWeaponFull) && never(UsedWeaponPartial)
    }
    
    achievement(
        title = "Bustin' Up " + WilyStageBossName[stageId],
        points = points,
        description = format(
            descStart + ". No E-Tank usage either.",
            WilyStageBossName[stageId]
        ),
        trigger = never(StageId != stageId) && once(enteredScreen) &&
            never(prev(Tanks) - 1 == Tanks) &&
            bannedWeapons &&
            never(LostLife) && never(PastGameOver) &&
            trigger_when(musicTarget)
    )
}

function WilyNoDamageCheevo(stageId) {
    musicTarget = MusicId >= 0x37 && MusicId <= 0x38
    screenId = StageBossScreen[stageId]
    enteredScreen = prev(ScreenId) == screenId - 1 && ScreenId == screenId
    if (stageId == 0x0f) {
        musicTarget = MusicId == 0x0a && ScreenId == 9
        enteredScreen = prev(ScreenId) == 6 && ScreenId == 7
    }
    
    descStart = "Defeat {0} without getting hit"
    points = 25
    if (stageId == 0x0c) {
        points = 10
    }
    if (stageId == 0x0f) {
        descStart = descStart + " in one life"
        points = 50
    }
    if (stageId == 0x11) {
        enteredScreen = ScreenId == 0 && PlayerTeleportingDown
    }
    
    achievement(
        title = "Untouched Against " + WilyStageBossName[stageId],
        points = points,
        description = format(
            descStart + ".",
            WilyStageBossName[stageId]
        ),
        trigger = never(StageId != stageId) && once(enteredScreen) &&
            never(LostHealth) &&
            never(LostLife) && never(PastGameOver) &&
            trigger_when(musicTarget)
    )
}

for i in range(0, 5, 1) {
    if (i < 4) {
        WilyStageCheevo(i + 0x0c)
    }
     WilyBusterOnlyCheevo(i + 0x0c)
     WilyNoDamageCheevo(i + 0x0c)
}



// Rushless:
// Stage 8, screens 0b -> 12: ONE Rush Jet
// Stage 9, screens 13 -> 16: ONE Rush Marine
// Last stage, screen 1: ONE Rush Coil

StartNewGame = !AnyWeapon && prev(StageId) >= 0x14 && prev(StageId) <= 0x15 && StageId <= 7

achievement(
    title = "Return To Sender",
    points = 25,
    description = "Beat the Boss Rush using the same weapon each one uses. No Rush allowed.",
    trigger = once(prev(ScreenId) == 6 && ScreenId == 7) &&
        never(StageId != 0x0f) &&
        never(ScreenId >= 0x0a && EquippedWeapon == 0 && NotPaused && PressedB) &&
        never(ScreenId >= 0x0a && UsedRush) &&
        never(ScreenId == 0x0a && EquippedWeapon != 2 && UsedAnyFull) &&
        never(ScreenId == 0x0a && EquippedWeapon != 2 && UsedAnyPartial) &&
        never(ScreenId == 0x0c && EquippedWeapon != 4 && UsedAnyFull) &&
        never(ScreenId == 0x0c && EquippedWeapon != 4 && UsedAnyPartial) &&
        never(ScreenId == 0x0e && EquippedWeapon != 1 && UsedAnyFull) &&
        never(ScreenId == 0x0e && EquippedWeapon != 1 && UsedAnyPartial) &&
        never(ScreenId == 0x10 && EquippedWeapon != 3 && UsedAnyFull) &&
        never(ScreenId == 0x10 && EquippedWeapon != 3 && UsedAnyPartial) &&
        never(ScreenId == 0x12 && EquippedWeapon != 5 && UsedAnyFull) &&
        never(ScreenId == 0x12 && EquippedWeapon != 5 && UsedAnyPartial) &&
        never(ScreenId == 0x14 && EquippedWeapon != 6 && UsedAnyFull) &&
        never(ScreenId == 0x14 && EquippedWeapon != 6 && UsedAnyPartial) &&
        never(ScreenId == 0x16 && EquippedWeapon != 8 && UsedAnyFull) &&
        never(ScreenId == 0x16 && EquippedWeapon != 8 && UsedAnyPartial) &&
        never(ScreenId == 0x18 && EquippedWeapon != 10 && UsedAnyFull) &&
        never(ScreenId == 0x18 && EquippedWeapon != 10 && UsedAnyPartial) &&
        trigger_when(ScreenId == 9)
)

achievement(
    title = "Every Dog Has His Day",
    points = 50,
    description = "Beat the entire game in one sitting using Rush only on required screens.",
    trigger = once(StartNewGame) &&
    never(StageId != 8 && StageId != 9 && StageId != 0x11 && UsedRush) &&
    never(StageId == 8 && ScreenId < 0x0b && UsedRush) &&
    never(StageId == 8 && ScreenId > 0x12 && UsedRush) &&
    never(StageId == 9 && ScreenId < 0x13 && UsedRush) &&
    never(StageId == 9 && ScreenId > 0x16 && UsedRush) &&
    never(StageId == 0x11 && ScreenId < 2 && UsedRush) &&
    trigger_when(StageId == 0x11 && MusicId == 0x37)
)

function PerfectRobotMasterCheevo(stageId) {
    achievement(
        title = "RoahmMythril VS " + StageBossName[stageId],
        points = 25,
        description = format(
            "Beat {0} (including the stage) under Perfect Run conditions. No checkpoints, reset on failure.",
            StageBossName[stageId]
        ),
        trigger = once(StageId == stageId && ScreenId == 0 && PlayerTeleportingDown
        ) &&
        never(LostLife) &&
        never(LostHealth) &&
        never(PastGameOver) &&
        never(UsedAnyFull) &&
        never(UsedAnyPartial) &&
        trigger_when(MusicId == 0x38)
    )
}

for i in range(0, 7) {
    // PerfectRobotMasterCheevo(i)
}

function PerfectDocRobotCheevo(stageId) {
    firstBoss = DocRobotFirstBossDoor[stageId]
    finalBoss = DocRobotFinalBossDoor[stageId]
    firstId = stageId * 100 + firstBoss
    finalId = stageId * 100 + finalBoss
    rush = never(UsedRush)
    if (stageId == 8) {
        rush = never(ScreenId < 0x0b && UsedRush) && never(ScreenId > 0x12 && UsedRush)
    }
    else if (stageId == 9) {
        rush = never(ScreenId < 0x13 && UsedRush) && never(ScreenId > 0x16 && UsedRush)
    }
    achievement(
        title = "RoahmMythril VS Doc " + StageRevisitLookup[stageId],
        points = 50,
        description = format(
            "Beat the stage, Doc {0} Man and Doc {1} Man under Perfect Run conditions. " +
            "No checkpoints.",
            DocLineup[firstId],
            DocLineup[finalId]
        ),
        trigger = once(StageId == stageId && ScreenId == 0 && PlayerTeleportingDown
        ) &&
        never(LostLife) &&
        never(LostHealth) &&
        never(PastGameOver) &&
        rush &&
        never(UsedWeaponFull) &&
        never(UsedWeaponPartial) &&
        trigger_when(MusicId == 0x38)
    )
}

for i in range(8, 11) {
    // PerfectDocRobotCheevo(i)
}

function PerfectBreakManCheevo() {
    achievement(
    title = "RoahmMythril VS Break Man",
    points = 10,
    description = "Beat Break Man under Perfect Run conditions.",
    trigger = once(StageId == 3 && ScreenId == 0x18 && MusicId == 0x11) &&
        never(LostLife) &&
        never(LostHealth) &&
        never(PastGameOver) &&
        never(UsedAnyFull) &&
        never(UsedAnyPartial) &&
        trigger_when(BreakManBeaten)
)
}

// PerfectBreakManCheevo()

function PerfectWilyCheevo(stageId) {
    musicTarget = MusicId >= 0x37 && MusicId <= 0x38
    bannedWeapons = never(UsedAnyFull) && never(UsedAnyPartial)
    if (stageId == 0x0f) {
        musicTarget = MusicId == 0x0a && ScreenId == 9
    }
    
    descStart = "Clear the {0} stage under Perfect Run conditions."
    if (stageId == 0x11) {
        bannedWeapons = never(UsedWeaponFull && RobotHealth(BossHealth) > 16) &&
            never(UsedWeaponPartial && RobotHealth(BossHealth) > 16)
    }
    
    achievement(
        title = "RoahmMythril VS " + WilyStageBossName[stageId],
        points = 25,
        description = format(
            descStart + ". No checkpoints.",
            WilyStageBossName[stageId]
        ),
        trigger = 
            once(StageId == stageId && ScreenId == 0 && PlayerTeleportingDown
        ) &&
            bannedWeapons &&
            never(LostLife) &&
            never(LostHealth) && never(PastGameOver) &&
            trigger_when(musicTarget)
    )
}

for i in range(0, 5, 1) {
     // PerfectWilyCheevo(i + 0x0c)
}

function RoahmMythrilNightmareCheevo() {
achievement(
    title = "RoahmMythril's Perfect Nightmare",
    points = 100,
    description = "Beat the entire game in one sitting under Perfect Run conditions. " +
        "Reset on failure.",
    trigger = once(StartNewGame) &&
    never(LostLife) &&
    never(LostHealth) &&
    never(StageId < 0x11 && UsedWeaponFull) &&
    never(StageId < 0x11 && UsedWeaponPartial) &&
    never(StageId == 0x11 && ScreenId < 2 && UsedWeaponFull) &&
    never(StageId == 0x11 && ScreenId < 2 && UsedWeaponPartial) &&
    never(StageId == 0x11 && ScreenId == 2 && RobotHealth(BossHealth) > 16 && UsedWeaponFull) &&
    never(StageId == 0x11 && ScreenId == 2 && RobotHealth(BossHealth) > 16 && UsedWeaponPartial) &&
    never(StageId != 8 && StageId != 9 && StageId != 0x11 && UsedRush) &&
    never(StageId == 8 && ScreenId < 0x0b && UsedRush) &&
    never(StageId == 8 && ScreenId > 0x12 && UsedRush) &&
    never(StageId == 9 && ScreenId < 0x13 && UsedRush) &&
    never(StageId == 9 && ScreenId > 0x16 && UsedRush) &&
    never(StageId == 0x11 && ScreenId < 2 && UsedRush) &&
    trigger_when(StageId == 0x11 && MusicId == 0x37)
)
}

// Leaderboards

leaderboard(
    title = "First Eight Robot Masters",
    description = "Beat the first eight robot masters as quick as you can. Game overs allowed.",
    start = !AnyWeapon && MusicId == 0x33 && prev(MusicId) == 0x10,
    cancel = !AnyWeapon && MusicId == 0x10,
    submit = bit7(WeaponMA) + bit7(WeaponGE) + bit7(WeaponNE) +
        bit7(WeaponSN) + bit7(WeaponHA) + bit7(WeaponSP) +
        bit7(WeaponSH) + bit7(WeaponTO) == 7 &&
        RobotHealth(PlayerHealth) != 0 && prev(MusicId) == 0x0c && MusicId == 0xf2,
    value = always_true(),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Beat The Game All Stages",
    description = "Beat all stages as fast as you can. Game overs allowed.",
    start = !AnyWeapon && MusicId == 0x33 && prev(MusicId) == 0x10,
    cancel = !AnyWeapon && MusicId == 0x10,
    submit = StageId == 0x11 &&
        RobotHealth(PlayerHealth) != 0 && prev(MusicId) == 0x0c && MusicId == 0xf2,
    value = always_true(),
    lower_is_better = true,
    format = "FRAMES"
)

// Rich Presence

RpSelectRobotMasterLookup = {
    0: "Spark",
    1: "Snake",
    2: "Needle",
    3: "Hard",
    4: "No",
    5: "Top",
    6: "Gemini",
    7: "Magnet",
    8: "Shadow"
}

RpSelectDocRobotLookup = {
    0: "Spark",
    1: "No",
    2: "Needle",
    3: "No",
    4: "No",
    5: "No",
    6: "Gemini",
    7: "No",
    8: "Shadow"
}

RpSelectRobotMaster = rich_presence_lookup("SelectMaster", BossSelection, RpSelectRobotMasterLookup)
RpSelectDocRobot = rich_presence_lookup("SelectDoc", BossSelection, RpSelectDocRobotLookup)
RpStageId = rich_presence_lookup("Stage", StageId, StageLookup)
RpDocStageId = rich_presence_lookup("DocStage", StageId, StageRevisitLookup)

RpPlayerHealth = rich_presence_macro("Number", RobotHealth(PlayerHealth))
RpLives = rich_presence_macro("Number", Lives)
RpTanks = rich_presence_macro("Number", Tanks)
RpEquippedWeapon = rich_presence_lookup("Weapon", EquippedWeapon, EquippedWeaponLookup)

Battery = "🔋"
Robot = "🤖"
ETank = "ⓔ"
Gun = "🔫"

RpStats = Battery + ": {0}/28 " + Gun + ": {3} " + Robot + ": {1} " + ETank + ": {2}"

AllWeapons = HasWeapon(WeaponSP) && HasWeapon(WeaponSN) &&
        HasWeapon(WeaponNE) && HasWeapon(WeaponHA) &&
        HasWeapon(WeaponTO) && HasWeapon(WeaponGE) &&
        HasWeapon(WeaponMA) && HasWeapon(WeaponSH)

rich_presence_conditional_display(
    MusicId == 0x35,
    "You Got Weapon From {0}!",
    RpStageId
)

rich_presence_conditional_display(
    MusicId == 0x38 && AllWeapons && StageId >= 0x08 && StageId <= 0x0b,
    "Doc Man Chased Out of {0}'s Stage",
    RpDocStageId
)

rich_presence_conditional_display(
    MusicId == 0x33 && AllWeapons,
    "Heading to {0}'s Stage to Chase Doc Man",
    RpDocStageId
)

rich_presence_conditional_display(
    MusicId == 0x33,
    "Heading to {0}'s Stage",
    RpStageId
)

// first stage ID: 0x03 -> 0x16->0x0c
// second stage ID: 0x0c -> 0x16 -> 0x0d
rich_presence_conditional_display(
    MusicId == 0x36,
    "Chasing Down Dr. Wily"
)

rich_presence_conditional_display(
    MusicId == 0 || MusicId == 0x1b || (StageId == 0x16 && prev(StageId) == 0x03),
    "Learning the Lore"
)

rich_presence_conditional_display(
    MusicId == 0x0f,
    "Congrats on Finishing this Revamped Journey"
)

rich_presence_conditional_display(
    MusicId == 0x12,
    "Reviewing the Notebook"
)

rich_presence_conditional_display(
    StageId == 0x11 && prior(StageId) == 0x16 && MusicId == 0xf0,
    "Starting the Epilogue"
)

rich_presence_conditional_display(
    MusicId == 0xf0,
    "Booting Up Sequence Activated"
)

rich_presence_conditional_display(
    MusicId == 0x0e,
    "Entering a Password"
)

rich_presence_conditional_display(
    StageId == 0x0c && ScreenId == 0x19,
    "VS Kamegoro Maker: " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon
)

rich_presence_conditional_display(
    StageId == 0x0d && ScreenId == 0x1f,
    "VS Yellow Devil: " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon
)

rich_presence_conditional_display(
    StageId == 0x0e && ScreenId == 0x16,
    "VS Holographic Mega Men: " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon
)

rich_presence_conditional_display(
    StageId == 0x0f && ScreenId == 0x08,
    "It's Boss Rush Time! " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon
)

rich_presence_conditional_display(
    StageId == 0x0f && ScreenId == 0x09,
    "That was an annoying tradition! " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon
)

BossRushScreenLookup = {
    0x0a: "Needle",
    0x0c: "Magnet",
    0x0e: "Gemini",
    0x10: "Hard",
    0x12: "Top",
    0x14: "Snake",
    0x16: "Spark",
    0x18: "Shadow"
}

rich_presence_conditional_display(
    StageId == 0x0f && ScreenId > 0x09,
    "VS {4} Man Rematch: " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon,
    rich_presence_lookup("Rematch", ScreenId, BossRushScreenLookup)
)


rich_presence_conditional_display(
    StageId == 0x10 && ScreenId == 0x01,
    "VS Wily Machine 3: " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon
)

rich_presence_conditional_display(
    StageId == 0x11 && ScreenId == 0x02,
    "VS Gamma: " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon
)

rich_presence_conditional_display(
    StageId >= 0x0c,
    "Getting Through {4}: " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon,
    RpStageId
)

rich_presence_conditional_display(
    MusicId == 0x10 && byte(0x60) == 0x12,
    "About to Fight Break Man"
)

rich_presence_conditional_display(
    MusicId == 0x10 && AllWeapons,
    "Thinking of chasing Doc Man to {0} Man's stage",
    RpSelectDocRobot
)

rich_presence_conditional_display(
    MusicId == 0x10,
    "Thinking of facing off against {0} Man",
    RpSelectRobotMaster
)

rich_presence_conditional_display(
    StageId == 0x08 && ScreenId == 0x0a,
    "VS Doc Crash Man: " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon
)

rich_presence_conditional_display(
    StageId == 0x08 && ScreenId == 0x1e,
    "VS Doc Air Man: " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon
)

rich_presence_conditional_display(
    StageId == 0x09 && ScreenId == 0x11,
    "VS Doc Flash Man: " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon
)

rich_presence_conditional_display(
    StageId == 0x09 && ScreenId == 0x1e,
    "VS Doc Bubble Man: " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon
)

rich_presence_conditional_display(
    StageId == 0x0a && ScreenId == 0x0b,
    "VS Doc Metal Man: " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon
)

rich_presence_conditional_display(
    StageId == 0x0a && ScreenId == 0x19,
    "VS Doc Quick Man: " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon
)

rich_presence_conditional_display(
    StageId == 0x0b && ScreenId == 0x0f,
    "VS Doc Heat Man: " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon
)

rich_presence_conditional_display(
    StageId == 0x0b && ScreenId == 0x19,
    "VS Doc Wood Man: " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon
)

rich_presence_conditional_display(
    StageId >= 0x08 && StageId <= 0x0b,
    "Chasing Doc Man in {4}'s stage: " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon,
    RpDocStageId
)

rich_presence_conditional_display(
    StageId == 1 && ScreenId == 0x05,
    "Break Man blocks the way to Magnet Man: " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon
)

rich_presence_conditional_display(
    StageId == 2 && ScreenId == 0x09,
    "Break Man opens the way to Gemini Man: " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon
)

rich_presence_conditional_display(
    StageId == 3 && ScreenId == 0x13,
    "Break Man blocks the way to Hard Man: " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon
)

rich_presence_conditional_display(
    StageId == 3 && ScreenId == 0x18,
    "VS Break Man: " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon
)

rich_presence_conditional_display(
    StageId == 7 && ScreenId == 0x05,
    "Break Man blocks the way to Shadow Man: " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon
)

rich_presence_conditional_display(
    (StageId == 6 && ScreenId == 0x17) ||
    (StageId == 7 && ScreenId == 0x16) ||
    (StageId == 5 && ScreenId == 0x19) ||
    (StageId == 4 && ScreenId == 0x15) ||
    (StageId == 3 && ScreenId == 0x17) ||
    (StageId == 2 && ScreenId == 0x1d) ||
    (StageId == 1 && ScreenId == 0x14) ||
    (StageId == 0 && ScreenId == 0x14),
    "VS {4}: " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon,
    RpStageId
)

rich_presence_conditional_display(
    StageId <= 7,
    "Approaching {4}: " + RpStats,
    RpPlayerHealth,
    RpLives,
    RpTanks,
    RpEquippedWeapon,
    RpStageId
)

rich_presence_display(
    "Playing Mega Man 3 Revamped"
)
