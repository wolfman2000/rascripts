// ~Hack~ Rockman 3: The Last of Mushroom Kingdom?!
// #ID = 18976

// Independent Functions Below

// How much energy is in a bar? This can represent health or ammo.
function RemainingBar(address) {
    return bit4(address) * 16 +
        bit3(address) * 8 +
        bit2(address) * 4 +
        bit1(address) * 2 +
        bit0(address)
}

// How much energy was in the bar previously?
function PrevRemainingBar(address) {
    return prev(bit4(address)) * 16 +
        prev(bit3(address)) * 8 +
        prev(bit2(address)) * 4 +
        prev(bit1(address)) * 2 +
        prev(bit0(address))
}

// Is a weapon enabled? If health, is the player bar showing?
function BarEnabled(address) {
    return bit7(address) == 1 && bit6(address) == 0
}

// Variables Below

PressedB = bit6(0x14) == 1

// The Internal Stage according to the engine.
InternalStage = byte(0x22)

// Has the player beat the game?
OnPostGameStage = InternalStage == 22 || InternalStage == 20 || InternalStage == 19

// Mega Man's Status
PlayerStatus = byte(0x30)

IsDead = PlayerStatus == 0x0e

// Currently Equipped Weapon
CurrentWeapon = low4(0xa0)

// Arm Cannon Weapon
ArmCannon = byte(0xa2)

// Equipped Weapon
EquippedWeapon = byte(CurrentWeapon + 0xa2)

HasGeminiLaser = bit7(0xa3) == 1
HasNeedleCannon = bit7(0xa4) == 1
HasHardKnuckle = bit7(0xa5) == 1
HasMagnetMissile = bit7(0xa6) == 1
HasTopSpin = bit7(0xa7) == 1
HasSearchSnake = bit7(0xa8) == 1
HasSparkShock = bit7(0xaa) == 1
HasShadowBlade = bit7(0xac) == 1

LifeCount = bcd(byte(0xae))
ETankCount = byte(0xaf)

IsControllable = bit7(0xb2) == 1
BecameControllable = IsControllable && prev(bit7(0xb2)) == 0

BossTime = byte(0xb3) == 0x8e

FiredMultiEnergyWeapon = prev(low4(0xb5)) != low4(0xb5)

// The music
CurrentMusic = byte(0xd9)
TitleScreenMusic = CurrentMusic == 0x00
OverWorldMusic = CurrentMusic == 0x01
UnderGroundMusic = CurrentMusic == 0x02
UnderWaterMusic = CurrentMusic == 0x03
SMB1CastleMusic = CurrentMusic == 0x04
CoinHeavenMusic = CurrentMusic == 0x05
SMB3CastleMusic = CurrentMusic == 0x06
WhistleMusic = CurrentMusic == 0x11
GameOverMusic = CurrentMusic == 0x39
AnyPlatformMusic = OverWorldMusic || UnderWaterMusic || UnderGroundMusic ||
    SMB1CastleMusic || SMB3CastleMusic
RobotMasterMusic = CurrentMusic == 0x0c
AnyBattleMusic = RobotMasterMusic || CurrentMusic == 0x07 || CurrentMusic == 0x09 ||
    CurrentMusic == 0x0d || CurrentMusic == 0x11
AnyVictoryMusic = CurrentMusic == 0x38 || CurrentMusic == 0x3A

// The X position on the current screen.
XCoords = byte(0x360)

// The current screen within the internal stage.
XScreen = byte(0x380)

// The current screen Mega Man is in vertically.
// This is primarily 0 when on screen and 0xFF when off.
YScreen = byte(0x3a0)
OnScreen = YScreen == 0
OffScreen = YScreen == 0xff

// The Y position on the current screen.
YCoords = byte(0x3c0)

BossHP = RemainingBar(0xb0)
VisibleBossHP = RemainingBar(0xb0)

// Dependent Functions Below
function TeleportingDown() => PlayerStatus == 0x04 && prev(byte(0x50)) != 8
function TeleportingOut() => PlayerStatus == 0x11

// Is Mega Man starting a new stage?
// Note both current and prior.

StartStageLookup = {
    // 1-1
    0: [InternalStage == 0 && XScreen == 0 && BecameControllable],
    // 1-2
    200: [
        InternalStage == 2 && XScreen == 0 && BecameControllable,
        InternalStage == 2 && XScreen == 0 && prior(byte(0x22)) == 0 &&
            prior(byte(0x380)) <= 16 && prior(byte(0x380)) >= 14 &&
            TeleportingDown()
    ],
    // 1-3
    100: [
        InternalStage == 1 && XScreen == 0 && BecameControllable,
        InternalStage == 1 && XScreen == 0 && prior(byte(0x22)) == 2 &&
            prior(byte(0x380)) == 0x0a && TeleportingDown()
    ],
    // 2-1
    16: [
        InternalStage == 0 && XScreen == 16 && BecameControllable,
        InternalStage == 0 && XScreen == 16 && prior(byte(0x22)) == 1 &&
            prior(byte(0x380)) == 9 && TeleportingDown(),
        InternalStage == 0 && XScreen == 16 && prior(byte(0x22)) == 2 &&
            prior(byte(0x380)) > 0x0a && TeleportingDown()
    ],
    // 2-2
    300: [
        InternalStage == 3 && XScreen == 0 && BecameControllable,
        InternalStage == 3 && XScreen == 0 && prior(byte(0x22)) == 0 &&
            prior(byte(0x380)) >= 28 && prior(byte(0x380)) <= 30 &&
            TeleportingDown()
    ],
    // 2-3
    400: [
        InternalStage == 4 && XScreen == 0 && BecameControllable,
        InternalStage == 4 && XScreen == 0 && prior(byte(0x22)) == 3 &&
            prior(byte(0x380)) == 11 && TeleportingDown()
    ],
    // 3-1,
    500: [
        InternalStage == 5 && XScreen == 0 && BecameControllable,
        InternalStage == 5 && XScreen == 0 && prior(byte(0x22)) == 4 &&
            prior(byte(0x380)) == 16 && TeleportingDown(),
        InternalStage == 5 && XScreen == 0 && prior(byte(0x22)) == 2 &&
            prior(byte(0x380)) > 0x0a && TeleportingDown()
    ],
    // 3-2
    516: [
        InternalStage == 5 && XScreen == 16 && BecameControllable,
        InternalStage == 5 && XScreen == 16 && prior(byte(0x380)) >= 12 &&
            prior(byte(0x380)) <= 14 && TeleportingDown()
    ],
    // 3-3
    600: [
        InternalStage == 6 && XScreen == 0 && BecameControllable,
        InternalStage == 6 && XScreen == 0 && prior(byte(0x22)) == 5 &&
            prior(byte(0x380)) == 29 && TeleportingDown()
    ],
    // 4-1
    122: [
        InternalStage == 1 && XScreen == 22 && BecameControllable,
        InternalStage == 1 && XScreen == 22 &&
            prior(byte(0x22)) == 6 && prior(byte(0x380)) == 9 && TeleportingDown(),
        InternalStage == 1 && XScreen == 22 &&
            prior(byte(0x22)) == 2 && prior(byte(0x380)) > 0x0a && TeleportingDown()
    ],
    // 4-2
    213: [
        InternalStage == 2 && XScreen == 13 && BecameControllable,
        InternalStage == 2 && XScreen == 13 && prior(byte(0x22)) == 1 &&
            prior(byte(0x380)) >= 36 && prior(byte(0x380)) <= 38 &&
            TeleportingDown()
    ],
    // 4-3
    705: [
        InternalStage == 7 && XScreen == 5 && BecameControllable,
        InternalStage == 7 && XScreen == 5 && prior(byte(0x22)) == 2 &&
            prior(byte(0x380)) == 0x18 && TeleportingDown()
    ],
    // 5-1
    800: [
        InternalStage == 8 && XScreen == 0 && BecameControllable,
        InternalStage == 8 && XScreen == 0 && prior(byte(0x22)) == 7 &&
            prior(byte(0x380)) == 14 && TeleportingDown(),
        InternalStage == 8 && XScreen == 0 && prior(byte(0x22)) == 2 &&
            prior(byte(0x380)) > 0x18 && TeleportingDown()
    ],
    // 5-2
    816: [
        InternalStage == 8 && XScreen == 16 && BecameControllable,
        InternalStage == 8 && XScreen == 16 && prior(byte(0x380)) >= 12 &&
            prior(byte(0x380)) <= 14 && TeleportingDown()
    ],
    // 5-3
    111: [
        InternalStage == 1 && XScreen == 11 && BecameControllable,
        InternalStage == 1 && XScreen == 11 && prior(byte(0x22)) == 8 &&
            prior(byte(0x380)) == 28 && TeleportingDown()
    ],
    // 6-1
    900: [
        InternalStage == 9 && XScreen == 0 && BecameControllable,
        InternalStage == 9 && XScreen == 0 && prior(byte(0x22)) == 1 &&
            prior(byte(0x380)) == 20 && TeleportingDown(),
        InternalStage == 9 && XScreen == 0 && prior(byte(0x22)) == 7 &&
            prior(byte(0x380)) == 3 && TeleportingDown()
    ],
    // 6-2
    915: [
        InternalStage == 9 && XScreen == 15 && BecameControllable,
        InternalStage == 9 && XScreen == 15 && prior(byte(0x380)) >= 11 &&
            prior(byte(0x380)) <= 13 && TeleportingDown()
    ],
    // 6-3
    1000: [
        InternalStage == 10 && XScreen == 0 && BecameControllable,
        InternalStage == 10 && XScreen == 0 && prior(byte(0x22)) == 9 &&
            prior(byte(0x380)) == 28 && TeleportingDown()
    ],
    // 7-1
    432: [
        InternalStage == 4 && XScreen == 32 && BecameControllable,
        InternalStage == 4 && XScreen == 32 && prior(byte(0x22)) == 10 &&
            prior(byte(0x380)) == 10 && TeleportingDown(),
        InternalStage == 4 && XScreen == 32 && prior(byte(0x22)) == 7 &&
            prior(byte(0x380)) == 3 && TeleportingDown()
    ],
    // 7-2
    313: [
        InternalStage == 3 && XScreen == 13 && BecameControllable,
        InternalStage == 3 && XScreen == 13 && prior(byte(0x22)) == 4 &&
            prior(byte(0x380)) >= 43 && TeleportingDown()
    ],
    // 7-3
    416: [
        InternalStage == 4 && XScreen == 16 && BecameControllable,
        InternalStage == 4 && XScreen == 16 && prior(byte(0x22)) == 3 &&
            prior(byte(0x380)) == 24 && TeleportingDown()
    ],
    // 8-1
    1100: [
        InternalStage == 11 && XScreen == 0 && BecameControllable,
        InternalStage == 11 && XScreen == 0 && prior(byte(0x22)) == 4 &&
            prior(byte(0x380)) == 30 && TeleportingDown(),
        InternalStage == 11 && XScreen == 0 && prior(byte(0x22)) == 7 &&
            prior(byte(0x380)) == 3 && TeleportingDown()
    ],
    // 8-2
    611: [
        InternalStage == 6 && XScreen == 11 && BecameControllable,
        InternalStage == 6 && XScreen == 11 && prior(byte(0x22)) == 11 &&
            prior(byte(0x380)) >= 23 && TeleportingDown()
    ],
    // 8-3
    716: [
        InternalStage == 7 && XScreen == 16 && BecameControllable,
        InternalStage == 7 && XScreen == 16 && prior(byte(0x22)) == 6 &&
            prior(byte(0x380)) == 24 && TeleportingDown()
    ],
    // W-1
    1200: [
        InternalStage == 12 && XScreen == 0 && BecameControllable,
        InternalStage == 12 && XScreen == 0 && prior(byte(0x22)) == 7 &&
            prior(byte(0x380)) > 25 && TeleportingDown()
    ],
    // W-2
    1300: [
        InternalStage == 13 && XScreen == 0 && BecameControllable,
        InternalStage == 13 && XScreen == 0 && prior(byte(0x22)) == 12 &&
            prior(byte(0x380)) == 17 && TeleportingDown()
    ],
    // W-3
    1500: [
        InternalStage == 15 && XScreen == 0 && BecameControllable,
        InternalStage == 15 && XScreen == 0 && prior(byte(0x22)) == 13 &&
            prior(byte(0x380)) == 19 && TeleportingDown()
    ],
    // W-4
    1600: [
        InternalStage == 16 && XScreen == 0 && BecameControllable,
        InternalStage == 16 && XScreen == 0 && prior(byte(0x22)) == 15 &&
            prior(byte(0x380)) == 31 && TeleportingDown()
    ],
    // W-5
    1700: [
        InternalStage == 17 && XScreen == 0 && BecameControllable,
        InternalStage == 17 && XScreen == 0 && prior(byte(0x22)) == 16 &&
            prior(byte(0x380)) == 5 && TeleportingDown()
    ]
}

function IsStartingStage(stage, screen) {
    return StartStageLookup[stage * 100 + screen]
}

// Is Mega Man warping into the current screen?
// This is mainly for starting leaderboards.
function IsWarpingIn(stage, screen) {
    return StartStageLookup[stage * 100 + screen]
}

// Does Mega Man have a master weapon equipped?
// This is mainly for ensuring Perfect Run cheevos happen.
function HasMasterWeaponEquipped() => CurrentWeapon != 0 && CurrentWeapon != 7 &&
    CurrentWeapon != 9 && CurrentWeapon != 11

// Does Mega Man have a Rush item equipped?
// This is mainly for detecting if Rush is or is not used.
function HasRushEquipped() => CurrentWeapon == 7 || CurrentWeapon == 9 || CurrentWeapon == 11

// A common function for defeating bosses with no extra conditions.
function DefeatBossCommonCheevo(stage, screen, bossBarAddress, shouldTrigger = false) {
    common = InternalStage == stage && XScreen == screen
    bossDead = PrevRemainingBar(bossBarAddress) > 0 && RemainingBar(bossBarAddress) == 0
    if (shouldTrigger == true) {
        return common && trigger_when(bossDead)        
    }
    return common && bossDead
}


// Lookups Below
WorldNumberToBoss = {
    1: "Needle",
    2: "Shadow",
    3: "Hard",
    4: "Top",
    5: "Spark",
    6: "Gemini",
    7: "Snake",
    8: "Magnet"
}

// This lookup is mainly for the stages that have robot masters.
WorldNumberToInternalFirstStage = {
    1: 0,
    2: 0,
    3: 5,
    4: 1,
    5: 8,
    6: 9,
    7: 4,
    8: 11
}

// What screen in the stage do you first spawn in?
WorldNumberToInternalFirstStageScreen = {
    1: 0,
    2: 16,
    3: 0,
    4: 22,
    5: 0,
    6: 0,
    7: 32,
    8: 0
}

// Which screen is the robot master on?
WorldNumberToInternalBossScreen = {
    1: 13,
    2: 29,
    3: 13,
    4: 37,
    5: 13,
    6: 12,
    7: 44,
    8: 24
}

// Which internal stage contains the X-2 level?
WorldNumberToInternalSecondStage = {
    1: 2,
    2: 3,
    3: 5,
    4: 2,
    5: 8,
    6: 9,
    7: 3,
    8: 6
}

// What screen starts the X-2 level?
WorldNumberToInternalSecondStageScreen = {
    1: 0,
    2: 0,
    3: 16,
    4: 13,
    5: 16,
    6: 15,
    7: 13,
    8: 11
}

// What screen ends the X-2 level (Normally)?
WorldNumberToInternalSecondStageFinish = {
    1: 10,
    2: 11,
    3: 29,
    4: 24,
    5: 28,
    6: 28,
    7: 24,
    8: 24
}

// Which internal stage contains the X-3 level?
WorldNumberToInternalThirdStage = {
    1: 1,
    2: 4,
    3: 6,
    4: 7,
    5: 1,
    6: 10,
    7: 4,
    8: 7
}

// What screen starts the X-3 level?
WorldNumberToInternalThirdStageScreen = {
    1: 0,
    2: 0,
    3: 0,
    4: 5,
    5: 11,
    6: 0,
    7: 16,
    8: 16
}

// What screen ends the X-3 level?
WorldNumberToInternalThirdStageFinish = {
    1: 9,
    2: 14,
    3: 9,
    4: 14,
    5: 20,
    6: 10,
    7: 30,
    8: 30
}

WilyNumberToStage = {
    1: 12,
    2: 13,
    3: 15,
    4: 16,
    5: 17
}

WilyNumberToBossScreen = {
    1: 16,
    2: 18,
    3: 30,
    4: 4,
    5: 2
}

WilyNumberToBossName = {
    1: "The Kamegoro Maker",
    2: "The Yellow Devil Mk-II",
    3: "Break Man",
    4: "The Wily Machine 3",
    5: "Gamma"
}

// Lookup Functions Below

// Robot Masters can be skipped in this game. This check covers those scenarios.
function SkipsRobotMaster() {
    condition = false
    for worldIndex in range(1, 8, 1) {
         worldStage = WorldNumberToInternalFirstStage[worldIndex]
         worldScreen = WorldNumberToInternalBossScreen[worldIndex] - 1
         condition = condition || (InternalStage == worldStage && XScreen == worldScreen && TeleportingOut())
    }
    return condition
}

// Was Level 1-1 beaten? Either option works.
function Beat11() {
    return TeleportingOut() && prev(InternalStage) == 0 && InternalStage == 2 &&
        XScreen == 0 && (prev(XScreen) == 12 || prev(XScreen) == 14)
}

function WarpedToWorld2() => TeleportingOut() &&
    (prev(InternalStage) == 2 && prev(XScreen) == 11 && InternalStage == 0 && XScreen == 16)

function WarpedToWorld3() => TeleportingOut() &&
    (prev(InternalStage) == 2 && prev(XScreen) == 11 && InternalStage == 5 && XScreen == 0)

function WarpedToWorld4() => TeleportingOut() &&
    (prev(InternalStage) == 2 && prev(XScreen) == 11 && InternalStage == 1 && XScreen == 22)

function WarpedToWorld5() => TeleportingOut() &&
    (prev(InternalStage) == 2 && prev(XScreen) == 26 && InternalStage == 8 && XScreen == 0)

function WarpedToWorld6() => TeleportingOut() &&
    (prev(InternalStage) == 4 && prev(XScreen) == 7 && InternalStage == 6 && XScreen == 0)

function WarpedToWorld7() => TeleportingOut() &&
    (prev(InternalStage) == 4 && prev(XScreen) == 7 && InternalStage == 4 && XScreen == 32)

function WarpedToWorld8() => TeleportingOut() &&
    (prev(InternalStage) == 4 && prev(XScreen) == 7 && InternalStage == 11 && XScreen == 0)

// Did the user take a warp, skipping the X-3 stage?
function TookWorldWarp() {
    return TeleportingOut() &&
    ((prev(InternalStage) == 2 && prev(XScreen) == 11 && InternalStage == 0 && XScreen == 16) ||
    (prev(InternalStage) == 2 && prev(XScreen) == 11 && InternalStage == 5 && XScreen == 0) ||
    (prev(InternalStage) == 2 && prev(XScreen) == 11 && InternalStage == 1 && XScreen == 22) ||
    (prev(InternalStage) == 2 && prev(XScreen) == 26 && InternalStage == 8 && XScreen == 0) ||
    (prev(InternalStage) == 7 && prev(XScreen) == 3 && InternalStage == 9 && XScreen == 0) ||
    (prev(InternalStage) == 7 && prev(XScreen) == 3 && InternalStage == 4 && XScreen == 32) ||
    (prev(InternalStage) == 7 && prev(XScreen) == 3 && InternalStage == 11 && XScreen == 0))
}

// Cheevos Below

// Beat the robot masters. No tricks. Just do it.
function CreateRobotMasterBeatenCheevo(location, worldNumber, points) {
    stage = WorldNumberToInternalFirstStage[worldNumber]
    screen = WorldNumberToInternalBossScreen[worldNumber]
    first = WorldNumberToInternalFirstStageScreen[worldNumber]
    redo = InternalStage == stage && XScreen == first && BecameControllable
    achievement(
        title = "This Isn't " + location,
        points = points,
        description = "Defeat " + WorldNumberToBoss[worldNumber] + " Man in World " + worldNumber + ".",
        trigger = DefeatBossCommonCheevo(stage, screen, 0xb0) &&
            once(RobotMasterMusic && BossHP == 28) &&
            never(redo) &&
            disable_when(IsDead, until=redo || TitleScreenMusic)
    )
}

// Beat the worlds.
function CreateBeatenWorldCheevo(title, worldNumber, points) {
    firstStage = WorldNumberToInternalFirstStage[worldNumber]
    firstScreen = WorldNumberToInternalFirstStageScreen[worldNumber]
    lastStage = WorldNumberToInternalThirdStage[worldNumber]
    lastScreen = WorldNumberToInternalThirdStageFinish[worldNumber]
    achievement(
        title = title,
        points = points,
        description = "Clear World " + worldNumber + " in one session, no game overs.",
        trigger = once(InternalStage == firstStage && XScreen == firstScreen) &&
            InternalStage == lastStage && XScreen == lastScreen &&
            TeleportingOut()
    )
}

CreateRobotMasterBeatenCheevo("New Guinea", 1, 10)
CreateBeatenWorldCheevo("No Castle Yet?", 1, 10)
CreateRobotMasterBeatenCheevo("Mount Vesuvius", 2, 10)
CreateBeatenWorldCheevo("Where Is Another Castle?", 2, 10)
CreateRobotMasterBeatenCheevo("Chile", 3, 10)
CreateBeatenWorldCheevo("Huh: No Castle Here Either", 3, 10)
CreateRobotMasterBeatenCheevo("Australia", 4, 10)
CreateBeatenWorldCheevo("You Know? No Castles Are Nice.", 4, 10)
CreateRobotMasterBeatenCheevo("Las Vegas", 5, 10)
CreateBeatenWorldCheevo("I Don't Miss Those Stinking Castles", 5, 10)
CreateRobotMasterBeatenCheevo("The Moon", 6, 10)
CreateBeatenWorldCheevo("Castles Are Too Ancient", 6, 10)
CreateRobotMasterBeatenCheevo("Africa", 7, 10)
CreateBeatenWorldCheevo("May I Never See A Castle Again", 7, 10)
CreateRobotMasterBeatenCheevo("France", 8, 10)
CreateBeatenWorldCheevo("WILY Castle? Gosh Dang It!", 8, 10)

// A common method for creating wily stage/boss cheevos.
function CreateWilyStageBossBeatenCheevo(title, wilyNumber, points, bossBarAddress) {
    stage = WilyNumberToStage[wilyNumber]
    screen = WilyNumberToBossScreen[wilyNumber]
    boss = WilyNumberToBossName[wilyNumber]
    achievement(
        title = title,
        points = points,
        description = "Defeat " + boss + " in Wily Castle " + wilyNumber + ".",
        trigger = DefeatBossCommonCheevo(stage, screen, bossBarAddress)
    )
}

CreateWilyStageBossBeatenCheevo("Not Exactly a Koopa Troopa", 1, 10, 0xb0)
CreateWilyStageBossBeatenCheevo("Much Taller Than a Kyororo", 2, 25, 0xb0)
CreateWilyStageBossBeatenCheevo("Much Stronger Than Luigi", 3, 10, 0x04ff)
CreateWilyStageBossBeatenCheevo("The More Things Change...", 4, 25, 0x04ff)
CreateWilyStageBossBeatenCheevo("...The More They Stay The Same", 5, 25, 0xb0)

// A cheevo for skipping a robot master.
achievement(
    title = "Wait: You Can Do That?!",
    points = 5,
    description = "Skip any robot master battle in an X-1 level.",
    trigger = SkipsRobotMaster()
)

// Add a cheevo for taking any traditional warp zone.
achievement(
    title = "Does This Count as Fast Travel?",
    points = 5,
    description = "Take any warp zone in 1-2 or 4-2.",
    trigger = TookWorldWarp()
)

// Add a cheevo in 2-2: Take the top path across the big pit.
// Before the pit: screen 3, x 0x15, y 0x84
// Target: screen 3, x 0x48, y 0x34 and lower...though keep screen 255 in mind.
// Forbid: x 0x48, y 0x5a and higher

achievement(
    title = "Leaving the Water is Easy",
    points = 5,
    description = "In 2-2, go over the wide pit and the water.",
    trigger =
        any_of(StartStageLookup[300], s => once(s)) &&
        XScreen == 8 && XCoords == 0x48 && 
        (OffScreen || YCoords <= 0x34) &&
        never(
            InternalStage == 3 && XCoords == 0x48 && OnScreen && YCoords >= 0x5a
        )
)

// Add a cheevo for visiting the same coin heaven twice in one session.
DaytimeHeaven = InternalStage == 0 && prev(XScreen) == 21 && XScreen == 31
NightHeaven = InternalStage == 5 && XScreen == 31
achievement(
    title = "So Nice We See It Twice",
    points = 10,
    description = "In one session, visit the same Coin Heaven from two different worlds. Warps are allowed.",
    trigger = (once(DaytimeHeaven) &&
        once(prev(InternalStage) == 8 && DaytimeHeaven)) ||
        (once(prev(XScreen) == 9 && NightHeaven) &&
        once(prev(InternalStage) == 9 && prev(XScreen) == 20 && NightHeaven))
)

// Add a cheevo in 7-2: reverse the situation of 2-2! Forbid Rush too.
// Forbid: x 0x48, ScreenY 255 OR y 0x14 or lower
// Target: just have it on screen transfer. so XSCreen == 22
Restart72 = StartStageLookup[313]
achievement(
    title = "Leaving the Water is Cheap",
    points = 10,
    description = "In 7-2, stay in the water and traverse the pit. Having Rush equipped is forbidden.",
    trigger =
        any_of(Restart72, s => once(s)) &&
        once(XScreen == 21) && XScreen == 22 &&
        never(InternalStage == 3 && XCoords >= 0x48 && HasRushEquipped()) &&
        never(
            InternalStage == 3 && XCoords == 0x48 && (OffScreen || YCoords <= 0x34)
        )
)

// Add a cheevo in W-2: The original fortress maze.
// internal stage 13, screen 8.
// Forbidden height: aa to c4 inclusive.
// If screen is 10 when on that height, can fail it.
// Enter screen 12: STAY ON BOTTOM. In this case, aa to c4 is preferred.
// Pause if screen 13, Xcoord is d7, Ycoord less than aa
achievement(
    title = "Huh: This Maze Still Exists",
    points = 5,
    description = "In Wily Castle 2, solve the maze correctly on your first attempt.",
    trigger = InternalStage == 13 && once(XScreen == 8) && XScreen == 14 &&
    disable_when(XScreen == 10 && XCoords == 0xd7 && YCoords >= 0xaa && YCoords <= 0xc4, until=InternalStage != 13) &&
    disable_when(XScreen == 13 && XCoords == 0xd7 && YCoords < 0xaa, until=InternalStage != 13)
)

// Add two cheevos in W-3: the two variations of the original 7-4 maze.
// For both, pass if no pauses are hit when the maze is done. (Screen 9)

// Original
// XScreen 3, XCoord 1, YCoord 3a - 54 
// XScreen 4, Xcoord 0, YCoord ba - c4
// XScreen 4, XCoord 0, YCoord 3a - 54
// XScreen 5, XCoord 0, YCoord ba - c4
// XScreen 7, XCoord 1, YCoord ba - c4
// XScreen 8, XCoord 0, YCoord 3a - 54
// XScreen 8, XCoord 0, YCoord ba - c4
// XScreen 8, Xcoord e1, YCoord 7a - 94

function DisableWily3Maze(screen, x, yMin, yMax) {
    return disable_when(
        XScreen == screen && XCoords >= x && XCoords <= x + 2 && YCoords >= yMin && YCoords <= yMax,
        until = InternalStage != 15 && InternalStage != 3
    )
}

achievement(
    title = "Not Even a T-Shirt?",
    points = 5,
    description = "In Wily Castle 3, take the path Mario took from 7-4.",
    trigger = InternalStage == 15 && once(XScreen == 0) && XScreen == 9 &&
    DisableWily3Maze(3, 1, 0x3a, 0x54) &&
    DisableWily3Maze(4, 0, 0xba, 0xc4) &&
    DisableWily3Maze(4, 0, 0x3a, 0x54) &&
    DisableWily3Maze(5, 0, 0xba, 0xc4) &&
    DisableWily3Maze(7, 1, 0xba, 0xc4) &&
    DisableWily3Maze(8, 0, 0x3a, 0x54) &&
    DisableWily3Maze(8, 0, 0xba, 0xc4) &&
    DisableWily3Maze(8, 0xe1, 0x7a, 0x94)
)

// Vs SMB1
// XScreen 3, XCoord 1, YCoord 3a - 54
// XScreen 4, Xcoord 0, YCoord ba - c4
// XScreen 4, Xcoord 0, YCoord 7a - 94
// XScreen 5, XCoord 0, YCoord ba - c4
// XScreen 7, XCoord 1, YCoord 3a - 54
// XScreen 7, XCoord 80, YCoord ba - c4
// XScreen 7, XCoord 80, YCoord 3a - 54
// XScreen 8, XCoord 0, YCoord 7a - c4
// XScreen 8, XCoord 64, YCoord 7a - c4
// XScreen 8, Xcoord e1, YCoord 3a - 54

achievement(
    title = "No Quarters Necessary",
    points = 10,
    description = "In Wily Castle 3, take the path Mario took from 7-4 (Arcade Edition).",
    trigger = InternalStage == 15 && once(XScreen == 0) && XScreen == 9 &&
    DisableWily3Maze(3, 1, 0x3a, 0x54) &&
    DisableWily3Maze(4, 0, 0xba, 0xc4) &&
    DisableWily3Maze(4, 0, 0x7a, 0x94) &&
    DisableWily3Maze(5, 0, 0xba, 0xc4) &&
    DisableWily3Maze(7, 1, 0x3a, 0x54) &&
    DisableWily3Maze(7, 0x80, 0xba, 0xc4) &&
    DisableWily3Maze(7, 0x80, 0x3a, 0x54) &&
    DisableWily3Maze(8, 0, 0x7a, 0xc4) &&
    DisableWily3Maze(8, 0x64, 0x7a, 0xc4) &&
    DisableWily3Maze(8, 0xe1, 0x3a, 0x54)
)

function ChallengeCheevo(start, cancel, submit) {
    lastSubmit = all_of(submit, s => s)
    return any_of(start, s => once(s)) &&
        all_of(cancel, c => never(c)) &&
        lastSubmit
}

onTitle = TitleScreenMusic || CurrentMusic == 0xff
PerfectRunCancel = [
    HasMasterWeaponEquipped() && PressedB &&
        prev(EquippedWeapon) > EquippedWeapon && !onTitle,
    HasMasterWeaponEquipped() && PressedB &&
        FiredMultiEnergyWeapon && !onTitle,
    prev(ArmCannon) > ArmCannon && !onTitle,
    prev(LifeCount) > LifeCount,
    GameOverMusic,
    TitleScreenMusic,
]
PerfectRunPause = [byte(0x78) == 1]

// Perfect Run Cheevo: Stage 1 + Boss
// Warping out via shortcut DOES NOT COUNT!
function CreatePerfectRunRobotCheevo(title, worldNumber, points) {
    firstStage = WorldNumberToInternalFirstStage[worldNumber]
    firstScreen = WorldNumberToInternalFirstStageScreen[worldNumber]
    bossScreen = WorldNumberToInternalBossScreen[worldNumber]
    onTitle = TitleScreenMusic || CurrentMusic == 0xff
    start = IsWarpingIn(firstStage, firstScreen)
    submit = [
        trigger_when(
            once(InternalStage == firstStage && XScreen == bossScreen && RobotMasterMusic)
        ),
        trigger_when(
            DefeatBossCommonCheevo(firstStage, bossScreen, 0xb0, true)
        )
    ]
    cancel = []
    for i in PerfectRunCancel {
        array_push(cancel, i)
    }
    array_push(cancel, XScreen < bossScreen && TeleportingOut())
    achievement(
        title = title,
        points = points,
        description = "Travel to AND defeat " + WorldNumberToBoss[worldNumber] + " Man without taking damage or using master weapons. Rush is allowed.",
        trigger = ChallengeCheevo(start, cancel, submit)
    )
}

// Perfect Run Cheevo: Stage 2
function CreatePerfectRunLevel2Cheevo(title, worldNumber, triggerScreen, points) {
    startStage = WorldNumberToInternalSecondStage[worldNumber]
    startScreen = WorldNumberToInternalSecondStageScreen[worldNumber]
    finishScreen = WorldNumberToInternalSecondStageFinish[worldNumber]
    normal = ""
    if (worldNumber == 2 || worldNumber == 4) {
        normal = "normal "
    }
    start = IsWarpingIn(startStage, startScreen)
    submit = [
        trigger_when(
            XScreen == finishScreen && InternalStage == startStage && TeleportingOut()
        )
    ]
    achievement(
        title = title,
        points = points,
        description = "Travel through " + worldNumber + "-2 and get to the " + normal + "exit without taking damage or using master weapons. Rush is allowed.",
        trigger = ChallengeCheevo(start, PerfectRunCancel, submit)
    )
}

// Perfect Run Cheevo: Stage 3
function CreatePerfectRunLevel3Cheevo(title, worldNumber, triggerScreen, points) {
    startStage = WorldNumberToInternalThirdStage[worldNumber]
    startScreen = WorldNumberToInternalThirdStageScreen[worldNumber]
    finishScreen = WorldNumberToInternalThirdStageFinish[worldNumber]
    start = IsWarpingIn(startStage, startScreen)
    submit = [
        trigger_when(
            XScreen == finishScreen && InternalStage == startStage && TeleportingOut()
        )
    ]
    achievement(
        title = title,
        points = points,
        description = "Travel through " + worldNumber + "-3 and get to the exit without taking damage or using master weapons. Rush is allowed.",
        trigger = ChallengeCheevo(start, PerfectRunCancel, submit)
    )
}

CreatePerfectRunRobotCheevo("Needle in a Haystack", 1, 25)
CreatePerfectRunLevel2Cheevo("Incarnation of Evil", 1, 6, 10)
CreatePerfectRunLevel3Cheevo("Needles", 1, 5, 10)
CreatePerfectRunRobotCheevo("All Hail Shadow", 2, 25)
CreatePerfectRunLevel2Cheevo("Antispecter", 2, 5, 10)
CreatePerfectRunLevel3Cheevo("Shadow Man (From Power Fighters)", 2, 8, 10)
CreatePerfectRunRobotCheevo("Hard-Rock Hallelujah", 3, 25)
CreatePerfectRunLevel2Cheevo("Fate Corrodes Me", 3, 20, 10)
CreatePerfectRunLevel3Cheevo("Solid State Mind", 3, 5, 10)
CreatePerfectRunRobotCheevo("You Spin Me 'Round", 4, 25)
CreatePerfectRunLevel2Cheevo("Moments of Peace", 4, 18, 10)
CreatePerfectRunLevel3Cheevo("Ignition", 4, 10, 10)
CreatePerfectRunRobotCheevo("Make a Circuit With Me", 5, 25)
CreatePerfectRunLevel2Cheevo("Lightning & Blitz  -Okehazama-", 5, 22, 10)
CreatePerfectRunLevel3Cheevo("Spark Man (From Project X)", 5, 16, 10)
CreatePerfectRunRobotCheevo("Double Vision", 6, 25)
CreatePerfectRunLevel2Cheevo("Dance Macabre", 6, 21, 10)
CreatePerfectRunLevel3Cheevo("Crystal Potion", 6, 6, 10)
CreatePerfectRunRobotCheevo("The Union of the Snake", 7, 25)
CreatePerfectRunLevel2Cheevo("Pentacored", 7, 18, 10)
CreatePerfectRunLevel3Cheevo("Vengeance", 7, 24, 10)
CreatePerfectRunRobotCheevo("Opposites Attract", 8, 25)
CreatePerfectRunLevel2Cheevo("Ancient Heroes", 8, 19, 10)
CreatePerfectRunLevel3Cheevo("Blue Lightning", 8, 23, 10)

// Pass in parameters for both music AND boss health location.
// Protoman relies on robot master music + whistle, and doesn't have a visible health bar.
function CreatePerfectRunWilyCheevo(title, wilyNumber, points, music, bossBarAddress) {
    firstStage = WilyNumberToStage[wilyNumber]
    bossScreen = WilyNumberToBossScreen[wilyNumber]
    boss = WilyNumberToBossName[wilyNumber]
    start = IsWarpingIn(firstStage, 0)
    submit = [
        trigger_when(once(XScreen == bossScreen && CurrentMusic == music)) &&
        trigger_when(DefeatBossCommonCheevo(firstStage, bossScreen, bossBarAddress))
    ]
    achievement(
        title = title,
        points = points,
        description = "Clear the whole stage, including " + boss + ", without taking damage or using master weapons. Rush is allowed.",
        trigger = ChallengeCheevo(start, PerfectRunCancel, submit)
    )
}

CreatePerfectRunWilyCheevo("Teen Turtle Tryp", 1, 25, 0x0d, 0xb0)
CreatePerfectRunWilyCheevo("Falling to Pieces", 2, 25, 0x0d, 0xb0)
CreatePerfectRunWilyCheevo("The Breaks", 3, 25, 0x11, 0x04ff)
CreatePerfectRunWilyCheevo("Hot Pursuit in the Lost City of Wily", 4, 25, 0x09, 0x04ff)
CreatePerfectRunWilyCheevo("Theme of e-102 Gamma", 5, 25, 0x07, 0xb0)

// A helper variable for some standalone cheevos and leaderboards.
Initial11Start = InternalStage == 0 && XScreen == 0 && BecameControllable
OnFinalBossScreen = once(XScreen == WilyNumberToBossScreen[5] && CurrentMusic == 0x07)

// And now to be nasty. Beat the whole game without robot master weapons grabbed.
achievement(
    title = "I Don't Need Your Powers",
    points = 50,
    description = "Clear the game in one sitting, all levels, WITHOUT beating any robot masters. Rush is allowed.",
    trigger = once(Initial11Start) && once(Beat11()) && 
    never(WarpedToWorld2()) && never(WarpedToWorld3()) && never(WarpedToWorld4()) &&
    never(WarpedToWorld5()) && never(WarpedToWorld6()) && never(WarpedToWorld7()) && never(WarpedToWorld8()) &&
    InternalStage == 17 && OnFinalBossScreen && trigger_when(prev(BossHP) > 0 && BossHP == 0) &&
    // When you beat a robot master, you gain the weapon shortly. Take advantage of it.
    disable_when(HasGeminiLaser || HasNeedleCannon || HasHardKnuckle || 
        HasMagnetMissile || HasTopSpin || HasSearchSnake || HasSparkShock || 
        HasShadowBlade, until=Initial11Start)
)


// And now to be nasty. Beat the whole game without using Rush.
achievement(
    title = "The Lazy Dog Cinema",
    points = 50,
    description = "Clear the entire game in one sitting, all levels, WITHOUT using Rush. Robot Masters can be skipped.",
    trigger = once(Initial11Start) && once(Beat11()) &&
        never(WarpedToWorld2()) && never(WarpedToWorld3()) && never(WarpedToWorld4()) &&
        never(WarpedToWorld5()) && never(WarpedToWorld6()) && never(WarpedToWorld7()) && never(WarpedToWorld8()) &&
        InternalStage == 17 && OnFinalBossScreen && trigger_when(prev(BossHP) > 0 && BossHP == 0) &&
        disable_when(HasRushEquipped() && prev(EquippedWeapon) > EquippedWeapon, until=Initial11Start) &&
        disable_when(GameOverMusic, until=Initial11Start)
)

// Leaderboards Below

leaderboard(
    title = "Any%",
    description = "In one session, beat the game. No game overs.",
    start = once(Initial11Start) && never(GameOverMusic) && never(TitleScreenMusic),
    cancel = GameOverMusic || TitleScreenMusic,
    submit = InternalStage == 17 && OnFinalBossScreen && prev(BossHP) > 0 && BossHP == 0,
    value = measured(always_true()),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Any% No Robot Masters",
    description = "In one session, beat the game without facing any robot masters. No game overs.",
    start = once(Initial11Start) && never(GameOverMusic) && never(TitleScreenMusic),
    cancel = HasGeminiLaser || HasNeedleCannon || HasHardKnuckle || 
        HasMagnetMissile || HasTopSpin || HasSearchSnake || HasSparkShock || 
        HasShadowBlade || GameOverMusic || TitleScreenMusic,
    submit = InternalStage == 17 && OnFinalBossScreen && prev(BossHP) > 0 && BossHP == 0,
    value = measured(always_true()),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "All Levels",
    description = "In one session, beat the game without warping. No game overs.",
    start = once(Initial11Start) && never(GameOverMusic) && never(TitleScreenMusic),
    cancel = GameOverMusic || TitleScreenMusic || WarpedToWorld2() ||
        WarpedToWorld3() || WarpedToWorld4() || WarpedToWorld5() ||
        WarpedToWorld6() || WarpedToWorld7() || WarpedToWorld8(),
    submit = InternalStage == 17 && OnFinalBossScreen && prev(BossHP) > 0 && BossHP == 0,
    value = measured(always_true()),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "All Levels No Robot Masters",
    description = "In one session, beat the game without warping or facing any robot masters. No game overs.",
    start = once(Initial11Start) && never(GameOverMusic) && never(TitleScreenMusic),
    cancel = HasGeminiLaser || HasNeedleCannon || HasHardKnuckle || 
        HasMagnetMissile || HasTopSpin || HasSearchSnake || HasSparkShock || 
        HasShadowBlade || GameOverMusic || TitleScreenMusic || WarpedToWorld2() ||
        WarpedToWorld3() || WarpedToWorld4() || WarpedToWorld5() ||
        WarpedToWorld6() || WarpedToWorld7() || WarpedToWorld8(),
    submit = InternalStage == 17 && OnFinalBossScreen && prev(BossHP) > 0 && BossHP == 0,
    value = measured(always_true()),
    lower_is_better = true,
    format = "FRAMES"
)

// Rich Presence Below

StageScreenLookup = {
    0: "1-1",
    1: "1-1",
    2: "1-1",
    3: "1-1",
    4: "1-1",
    5: "1-1",
    6: "1-1",
    7: "1-1",
    8: "1-1",
    9: "1-1",
    10: "1-1",
    11: "1-1",
    12: "1-1",
    13: "1-1",
    14: "1-1",
    16: "2-1",
    17: "2-1",
    18: "2-1",
    19: "2-1",
    20: "2-1",
    21: "2-1",
    22: "2-1",
    23: "2-1",
    24: "2-1",
    25: "2-1",
    26: "2-1",
    27: "2-1",
    28: "2-1",
    29: "2-1",
    30: "2-1",
    100: "1-3",
    101: "1-3",
    102: "1-3",
    103: "1-3",
    104: "1-3",
    105: "1-3",
    106: "1-3",
    107: "1-3",
    108: "1-3",
    109: "1-3",
    111: "5-3",
    112: "5-3",
    113: "5-3",
    114: "5-3",
    115: "5-3",
    116: "5-3",
    117: "5-3",
    118: "5-3",
    119: "5-3",
    120: "5-3",
    122: "4-1",
    123: "4-1",
    124: "4-1",
    125: "4-1",
    126: "4-1",
    127: "4-1",
    128: "4-1",
    129: "4-1",
    130: "4-1",
    131: "4-1",
    132: "4-1",
    133: "4-1",
    134: "4-1",
    135: "4-1",
    136: "4-1",
    137: "4-1",
    138: "4-1",
    200: "1-2",
    201: "1-2",
    202: "1-2",
    203: "1-2",
    204: "1-2",
    205: "1-2",
    206: "1-2",
    207: "1-2",
    208: "1-2",
    209: "1-2",
    210: "1-2",
    211: "1-2",
    213: "4-2",
    214: "4-2",
    215: "4-2",
    216: "4-2",
    217: "4-2",
    218: "4-2",
    219: "4-2",
    220: "4-2",
    221: "4-2",
    222: "4-2",
    223: "4-2",
    224: "4-2",
    225: "4-2",
    226: "4-2",
    300: "2-2",
    301: "2-2",
    302: "2-2",
    303: "2-2",
    304: "2-2",
    305: "2-2",
    306: "2-2",
    307: "2-2",
    308: "2-2",
    309: "2-2",
    310: "2-2",
    311: "2-2",
    313: "7-2",
    314: "7-2",
    315: "7-2",
    316: "7-2",
    317: "7-2",
    318: "7-2",
    319: "7-2",
    320: "7-2",
    321: "7-2",
    322: "7-2",
    323: "7-2",
    324: "7-2",
    326: "W-3",
    327: "W-3",
    328: "W-3",
    329: "W-3",
    330: "W-3",
    400: "2-3",
    401: "2-3",
    402: "2-3",
    403: "2-3",
    404: "2-3",
    405: "2-3",
    406: "2-3",
    407: "2-3",
    408: "2-3",
    409: "2-3",
    410: "2-3",
    411: "2-3",
    412: "2-3",
    413: "2-3",
    414: "2-3",
    416: "7-3",
    417: "7-3",
    418: "7-3",
    419: "7-3",
    420: "7-3",
    421: "7-3",
    422: "7-3",
    423: "7-3",
    424: "7-3",
    425: "7-3",
    426: "7-3",
    427: "7-3",
    428: "7-3",
    429: "7-3",
    430: "7-3",
    432: "7-1",
    433: "7-1",
    434: "7-1",
    435: "7-1",
    436: "7-1",
    437: "7-1",
    438: "7-1",
    439: "7-1",
    440: "7-1",
    441: "7-1",
    442: "7-1",
    443: "7-1",
    444: "7-1",
    445: "7-1",
    500: "3-1",
    501: "3-1",
    502: "3-1",
    503: "3-1",
    504: "3-1",
    505: "3-1",
    506: "3-1",
    507: "3-1",
    508: "3-1",
    509: "3-1",
    510: "3-1",
    511: "3-1",
    512: "3-1",
    513: "3-1",
    514: "3-1",
    516: "3-2",
    517: "3-2",
    518: "3-2",
    519: "3-2",
    520: "3-2",
    521: "3-2",
    522: "3-2",
    523: "3-2",
    524: "3-2",
    525: "3-2",
    526: "3-2",
    527: "3-2",
    528: "3-2",
    529: "3-2",
    600: "3-3",
    601: "3-3",
    602: "3-3",
    603: "3-3",
    604: "3-3",
    605: "3-3",
    606: "3-3",
    607: "3-3",
    608: "3-3",
    609: "3-3",
    611: "8-2",
    612: "8-2",
    613: "8-2",
    614: "8-2",
    615: "8-2",
    616: "8-2",
    617: "8-2",
    618: "8-2",
    619: "8-2",
    620: "8-2",
    621: "8-2",
    622: "8-2",
    623: "8-2",
    624: "8-2",
    700: "4-2",
    701: "4-2",
    702: "4-2",
    703: "4-2",
    705: "4-3",
    706: "4-3",
    707: "4-3",
    708: "4-3",
    709: "4-3",
    710: "4-3",
    711: "4-3",
    712: "4-3",
    713: "4-3",
    714: "4-3",
    716: "8-3",
    717: "8-3",
    718: "8-3",
    719: "8-3",
    720: "8-3",
    721: "8-3",
    722: "8-3",
    723: "8-3",
    724: "8-3",
    725: "8-3",
    726: "8-3",
    727: "8-3",
    728: "8-3",
    729: "8-3",
    730: "8-3",
    800: "5-1",
    801: "5-1",
    802: "5-1",
    803: "5-1",
    804: "5-1",
    805: "5-1",
    806: "5-1",
    807: "5-1",
    808: "5-1",
    809: "5-1",
    810: "5-1",
    811: "5-1",
    812: "5-1",
    813: "5-1",
    814: "5-1",
    816: "5-2",
    817: "5-2",
    818: "5-2",
    819: "5-2",
    820: "5-2",
    821: "5-2",
    822: "5-2",
    823: "5-2",
    824: "5-2",
    825: "5-2",
    826: "5-2",
    827: "5-2",
    828: "5-2",
    900: "6-1",
    901: "6-1",
    902: "6-1",
    903: "6-1",
    904: "6-1",
    905: "6-1",
    906: "6-1",
    907: "6-1",
    908: "6-1",
    909: "6-1",
    910: "6-1",
    911: "6-1",
    912: "6-1",
    913: "6-1",
    915: "6-2",
    916: "6-2",
    917: "6-2",
    918: "6-2",
    919: "6-2",
    920: "6-2",
    921: "6-2",
    922: "6-2",
    923: "6-2",
    924: "6-2",
    925: "6-2",
    926: "6-2",
    927: "6-2",
    928: "6-2",
    1000: "6-3",
    1001: "6-3",
    1002: "6-3",
    1003: "6-3",
    1004: "6-3",
    1005: "6-3",
    1006: "6-3",
    1007: "6-3",
    1008: "6-3",
    1009: "6-3",
    1010: "6-3",
    1100: "8-1",
    1101: "8-1",
    1102: "8-1",
    1103: "8-1",
    1104: "8-1",
    1105: "8-1",
    1106: "8-1",
    1107: "8-1",
    1108: "8-1",
    1109: "8-1",
    1110: "8-1",
    1111: "8-1",
    1112: "8-1",
    1113: "8-1",
    1114: "8-1",
    1115: "8-1",
    1116: "8-1",
    1117: "8-1",
    1118: "8-1",
    1119: "8-1",
    1120: "8-1",
    1121: "8-1",
    1122: "8-1",
    1123: "8-1",
    1124: "8-1",
    1125: "8-1",
    1200: "W-1",
    1201: "W-1",
    1202: "W-1",
    1203: "W-1",
    1204: "W-1",
    1205: "W-1",
    1206: "W-1",
    1207: "W-1",
    1208: "W-1",
    1209: "W-1",
    1210: "W-1",
    1211: "W-1",
    1212: "W-1",
    1213: "W-1",
    1214: "W-1",
    1215: "W-1",
    1216: "W-1",
    1217: "W-1",
    1300: "W-2",
    1301: "W-2",
    1302: "W-2",
    1303: "W-2",
    1304: "W-2",
    1305: "W-2",
    1306: "W-2",
    1307: "W-2",
    1308: "W-2",
    1309: "W-2",
    1310: "W-2",
    1311: "W-2",
    1312: "W-2",
    1313: "W-2",
    1314: "W-2",
    1315: "W-2",
    1316: "W-2",
    1317: "W-2",
    1318: "W-2",
    1319: "W-2",
    1500: "W-3",
    1501: "W-3",
    1502: "W-3",
    1503: "W-3",
    1504: "W-3",
    1505: "W-3",
    1506: "W-3",
    1507: "W-3",
    1508: "W-3",
    1509: "W-3",
    1510: "W-3",
    1511: "W-3",
    1512: "W-3",
    1513: "W-3",
    1514: "W-3",
    1515: "W-3",
    1516: "W-3",
    1517: "W-3",
    1518: "W-3",
    1519: "W-3",
    1520: "W-3",
    1521: "W-3",
    1522: "W-3",
    1523: "W-3",
    1524: "W-3",
    1525: "W-3",
    1526: "W-3",
    1527: "W-3",
    1528: "W-3",
    1529: "W-3",
    1530: "W-3",
    1531: "W-3",
    1600: "W-4",
    1601: "W-4",
    1602: "W-4",
    1603: "W-4",
    1604: "W-4",
    1605: "W-4",
    1700: "W-5",
    1701: "W-5",
    1702: "W-5",
}

StageScreenBossLookup = {
    13: "Needle Man",
    14: "Needle Man",
    29: "Shadow Man",
    30: "Shadow Man",
    137: "Top Man",
    138: "Top Man",
    444: "Snake Man",
    445: "Snake Man",
    513: "Hard Man",
    514: "Hard Man",
    813: "Spark Man",
    814: "Spark Man",
    912: "Gemini Man",
    913: "Gemini Man",
    1124: "Magnet Man",
    1125: "Magnet Man",
    1216: "The Kamegoro Maker",
    1217: "The Kamegoro Maker",
    1318: "The Yellow Devil Mk-II",
    1319: "The Yellow Devil Mk-II",
    1530: "Break Man",
    1531: "Break Man",
    1604: "The Wily Machine 3",
    1605: "The Wily Machine 3",
    1702: "Gamma"
}

NormalizedScreen = InternalStage * 100 + XScreen

// What stage are we on?
stageLookup = rich_presence_lookup("Stage", NormalizedScreen, StageScreenLookup, "-1")

// How much health does Mega Man have?
playerHealthValue = rich_presence_macro("Number", RemainingBar(ArmCannon))

// $00A3: Ammo for GE (Gemini Laser)
// $00A4: Ammo for NE (Needle Cannon)
// $00A5: Ammo for HA (Hard Knuckle)
// $00A6: Ammo for MA (Magnet Missile)
// $00A7: Ammo for TO (Top Spin)
// $00A8: Ammo for SN (Search Snake)
// $00A9: Ammo for RC (Rush Coil)
// $00AA: Ammo for SP (Spark Shock)
// $00AB: Ammo for RM (Rush Marine)
// $00AC: Ammo for SH (Shadow Blade)
// $00AD: Ammo for RJ (Rush Jet)

CurrentWeaponLookup = {
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

// What weapon is currently equipped?
equippedWeaponLookup = rich_presence_lookup("Weapon", CurrentWeapon, CurrentWeaponLookup, "P")

lifeCountLookup = rich_presence_macro("Number", LifeCount)
eTankCountLookup = rich_presence_macro("Number", ETankCount)

opponentLookup = rich_presence_lookup("Opponent", NormalizedScreen, StageScreenBossLookup, "No Man")

rich_presence_conditional_display(
    OnPostGameStage,
    "Rockman survived the journey to the Mushroom Kingdom"
)

rich_presence_conditional_display(
    AnyBattleMusic,
    "Rockman ({1}) is fighting {2} on {3} - Lives: {4} - E-Tanks: {5}",
    playerHealthValue,
    equippedWeaponLookup,
    opponentLookup,
    stageLookup,
    lifeCountLookup,
    eTankCountLookup
)

rich_presence_conditional_display(
    AnyVictoryMusic,
    "Rockman ({1}) victorious against {2} on {3} - Lives: {4} - E-Tanks: {5}",
    playerHealthValue,
    equippedWeaponLookup,
    opponentLookup,
    stageLookup,
    lifeCountLookup,
    eTankCountLookup
)

rich_presence_conditional_display(
    CoinHeavenMusic,
    "Rockman ({1}) in Coin Heaven - Lives: {2} - E-Tanks: {3}",
    playerHealthValue,
    equippedWeaponLookup,
    lifeCountLookup,
    eTankCountLookup
)

rich_presence_conditional_display(
    IsDead || AnyPlatformMusic,
    "Rockman ({1}) travelling through {2} - Lives: {3} - E-Tanks: {4}",
    playerHealthValue,
    equippedWeaponLookup,
    stageLookup,
    lifeCountLookup,
    eTankCountLookup
)

rich_presence_conditional_display(
    TitleScreenMusic,
    "Rockman about to journey to the Mushroom Kingdom"
)

rich_presence_display("Rockman in the Mushroom Kingdom")
