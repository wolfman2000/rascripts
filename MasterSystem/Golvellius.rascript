// Golvellius: Valley of Doom
// #ID = 10001

// Independent Functions

function Gold(address) {
    return bcd(byte(address)) * 100000 +
        bcd(byte(address + 1)) * 1000 +
        bcd(byte(address + 2)) * 10
}

function PrevGold(address) {
    return prev(high4(address)) * 1000000 +
        prev(low4(address)) * 100000 +
        prev(high4(address + 1)) * 10000 +
        prev(low4(address + 1)) * 1000 +
        prev(high4(address + 2)) * 100 +
        prev(low4(address + 2)) * 10
}

// Variables

SoundTest = byte(0x0169)

Enemy00HP = byte(0x0175)

MusicId = byte(0x065f)

OverworldScreenId = byte(0x080d)
CurrentHearts = bcd(byte(0x0836))
CurrentBar = byte(0x081a)
CurrentHealth = bcd(byte(0x0836)) * 7 + byte(0x081a) + 1
PrevHealth = prev(bcd(byte(0x0836))) * 7 + prev(byte(0x081a)) + 1
MaxHearts = byte(0x0839)
MaxHealth = (bcd(byte(0x0839)) + 1) * 7
CurrentGold = Gold(0x083f)
MaxGold = Gold(0x0842)

GreenMea = bit0(0x0846)
PurpleMea = bit1(0x0846)
CrystalBase = 0x0847
SwordBase = 0x0848
ShieldBase = 0x0849

RpGrave = "Graveyard"
RpDesert = "Desert"
RpValley = "Valley"
RpMeadow = "Meadow"
RpSwamp = "Swamp"
RpBeach = "Beach"
RpLake = "Lake"
RpCursed = "Cursed Forest"
RpForest = "Great Forest"

OverworldLookup = {
    0x05: RpForest,
    0x06: RpForest,
    0x07: RpForest,
    0x12: RpForest,
    0x13: RpForest,
    0x14: RpForest,
    0x1f: RpForest,
    0x20: RpForest,
    0x21: RpForest,
    0x2b: RpForest,
    0x2c: RpForest,
    0x2d: RpForest,
    0x2e: RpForest,
    0x38: RpForest,
    0x39: RpForest,
    0x3a: RpForest,
    0x3b: RpForest,
    0x44: RpForest,
    0x45: RpForest,
    0x46: RpForest,
    0x47: RpForest,
    0x48: RpForest,
    0x51: RpForest,
    0x52: RpForest,
    0x53: RpForest,
    0x54: RpForest,
    0x55: RpForest,
    0x60: RpForest,
    0x61: RpForest,
    0x62: RpForest,
    0x6d: RpForest,
    0x6e: RpForest,
    0x6f: RpForest,
    0x00: RpCursed,
    0x01: RpCursed,
    0x02: RpCursed,
    0x03: RpCursed,
    0x04: RpCursed,
    0x0d: RpCursed,
    0x0e: RpCursed,
    0x0f: RpCursed,
    0x10: RpCursed,
    0x11: RpCursed,
    0x1a: RpCursed,
    0x1b: RpCursed,
    0x1c: RpCursed,
    0x1d: RpCursed,
    0x1e: RpCursed,
    0x27: RpCursed,
    0x28: RpCursed,
    0x29: RpCursed,
    0x2a: RpCursed,
    0x34: RpCursed,
    0x35: RpCursed,
    0x36: RpCursed,
    0x37: RpCursed,
    0x41: RpCursed,
    0x42: RpCursed,
    0x43: RpCursed,
    0x4e: RpCursed,
    0x4f: RpCursed,
    0x50: RpCursed,
    0x5b: RpLake,
    0x5c: RpLake,
    0x68: RpLake,
    0x69: RpLake,
    0x75: RpLake,
    0x76: RpLake,
    0x82: RpLake,
    0x83: RpLake,
    0x84: RpLake,
    0x85: RpLake,
    0x8f: RpLake,
    0x90: RpLake,
    0x91: RpLake,
    0x92: RpLake,
    0x9c: RpLake,
    0x9d: RpLake,
    0x9e: RpLake,
    0x9f: RpLake,
    0xa0: RpLake,
    0xa9: RpLake,
    0xaa: RpLake,
    0xab: RpLake,
    0xac: RpLake,
    0xad: RpLake,
    0x5d: RpBeach,
    0x5e: RpBeach,
    0x5f: RpBeach,
    0x6a: RpBeach,
    0x6b: RpBeach,
    0x6c: RpBeach,
    0x77: RpBeach,
    0x78: RpBeach,
    0x79: RpBeach,
    0x7a: RpBeach,
    0x86: RpBeach,
    0x87: RpBeach,
    0x93: RpBeach,
    0x94: RpSwamp,
    0x95: RpSwamp,
    0x96: RpSwamp,
    0x97: RpSwamp,
    0xa1: RpSwamp,
    0xa2: RpSwamp,
    0xa3: RpSwamp,
    0xa4: RpSwamp,
    0xa5: RpSwamp,
    0xae: RpSwamp,
    0xaf: RpSwamp,
    0xb0: RpSwamp,
    0xb1: RpSwamp,
    0xb2: RpSwamp,
    0x56: RpMeadow,
    0x63: RpMeadow,
    0x64: RpMeadow,
    0x70: RpMeadow,
    0x71: RpMeadow,
    0x7b: RpMeadow,
    0x7c: RpMeadow,
    0x7d: RpMeadow,
    0x88: RpMeadow,
    0x89: RpMeadow,
    0x8a: RpMeadow,
    0x8b: RpMeadow,
    0x98: RpMeadow,
    0x08: RpGrave,
    0x09: RpGrave,
    0x0a: RpGrave,
    0x0b: RpGrave,
    0x0c: RpGrave,
    0x15: RpGrave,
    0x16: RpGrave,
    0x17: RpGrave,
    0x18: RpGrave,
    0x19: RpGrave,
    0x22: RpGrave,
    0x23: RpGrave,
    0x24: RpGrave,
    0x25: RpGrave,
    0x26: RpGrave,
    0x2f: RpGrave,
    0x30: RpGrave,
    0x31: RpGrave,
    0x32: RpGrave,
    0x3c: RpGrave,
    0x3d: RpGrave,
    0x3e: RpGrave,
    0x49: RpGrave,
    0x4a: RpGrave,
    0x57: RpGrave,
    0x33: RpDesert,
    0x3f: RpDesert,
    0x40: RpDesert,
    0x4b: RpDesert,
    0x4c: RpDesert,
    0x4d: RpDesert,
    0x58: RpDesert,
    0x59: RpDesert,
    0x5a: RpDesert,
    0x65: RpDesert,
    0x66: RpDesert,
    0x67: RpDesert,
    0x72: RpDesert,
    0x73: RpDesert,
    0x74: RpDesert,
    0x7e: RpDesert,
    0x7f: RpDesert,
    0x80: RpDesert,
    0x81: RpDesert,
    0x8c: RpDesert,
    0x8d: RpDesert,
    0x8e: RpDesert,
    0x99: RpValley,
    0x9a: RpValley,
    0x9b: RpValley,
    0xa6: RpValley,
    0xa7: RpValley,
    0xa8: RpValley,
    0xb3: RpValley,
    0xb4: RpValley,
    0xb5: RpValley,    
}

// Dependent Functions

function IsDead() => CurrentHealth == 1 && (byte(0x0802) == 0x13 || byte(0x0803) == 0x08)
function IsSoundTestOn() => SoundTest == 1 && OverworldScreenId == 0xb6
function IsHeadingToValley() => OverworldScreenId == 0xb6
function InOverworld() => MusicId == 0x20 || MusicId == 0x19 || MusicId == 0x06 ||
    MusicId == 0x0c || MusicId == 0x03
function FightingBoss() => MusicId == 0x1c || MusicId == 0x08 || MusicId == 0x13 ||
    MusicId == 0x1a || MusicId == 0x04
function SpentGold() => CurrentGold < PrevGold(0x083f)
AliveDamage = [
    (CurrentHearts != prev(CurrentHearts)),
    (CurrentBar != prev(CurrentBar)),
    (GreenMea != prev(GreenMea)),
    (PurpleMea != prev(PurpleMea))
]
function NeverTookDamage(musicId) {
    return never(IsDead()) &&
    all_of(AliveDamage, d => 
        disable_when(
            MusicId == musicId && d,
            until=OverworldScreenId != prev(OverworldScreenId)
        )
    )
}

// Achievements

achievement(
    title = "Yes, Master System Tunes Can Rock",
    description = "Access the sound test.",
    points = 1,
    trigger = OverworldScreenId == 0xb6 && byte(0x169) == 1 && byte(0x166) == 1
)

achievement(
    title = "Time To Get Used To Snakes",
    description = "Defeat the first giant snake.",
    points = 2,
    trigger = once(OverworldScreenId == 0xb6 && Enemy00HP == 5) &&
        never(IsDead()) && Enemy00HP == 0
)

achievement(
    title = "Potions Of Life",
    description = "Purchase a Potion of Life.",
    points = 3,
    trigger = MusicId == 0x09 && SpentGold() && MaxHearts - prev(MaxHearts) == 1
)

achievement(
    title = "This Tzedakah Is A Bit Much",
    description = "Purchase a Bible to increase your gold capacity.",
    points = 3,
    trigger = MusicId == 0x09 && SpentGold() && MaxGold > PrevGold(0x0842)
)

AllBossData = [
    ["Desba", "Valley", "Eddie He Ain't", 0xa6, 0x1c, 0x14, 5, 10],
    ["Rolick", "Desert", "No Rockit In This Game", 0x7e, 0x08, 0x24, 5, 10],
    ["Bachular", "Graveyard", "No Bones About It", 0x0a, 0x13, 0x28, 5, 10],
    ["Fosbus", "Swamp", "This Is No Swamp Of Silliness", 0xa4, 0x16, 0x42, 5, 10],
    ["Walric", "Lake", "Needs More Catfish. And Maw.", 0x83, 0x1a, 0x38, 10, 25],
    ["Crawky", "Cursed Forest", "You Tengu It", 0x37, 0x12, 0x30, 10, 25],
    ["Haidee", "Great Forest", "Try The Underworld Next Time", 0x54, 0x0a, 0x7f, 10, 50],
    ["Golvellius", "final dungeon", "Time To Be A Hero", 0x10, 0x1b, 0x78, 25, 25]
]

function DefeatBossCheevo(index) {
    bossDead = Enemy00HP == 0
    if (index == 4) {
        bossDead = Enemy00HP == 0 && byte(0x0195) == 0
    }
    bossData = AllBossData[index]
    achievement(
        title = bossData[2],
        description = format("Defeat {0} in the {1}.", bossData[0], bossData[1]),
        points = bossData[6],
        trigger = once(
            OverworldScreenId == bossData[3] &&
            MusicId == bossData[4] &&
            Enemy00HP == bossData[5]
        ) && never(IsDead()) && bossDead
    )
}

function PerfectBossCheevo(index) {
    bossDead = Enemy00HP == 0
    if (index == 4) {
        bossDead = Enemy00HP == 0 && byte(0x0195) == 0
    }
    bossData = AllBossData[index]
    achievement(
        title = format("Bested {0} [m]", bossData[0]),
        description = format("Defeat {0} without taking damage.", bossData[0]),
        points = bossData[7],
        trigger = once(
            MusicId == bossData[4] &&
            Enemy00HP == bossData[5]
        ) && never(OverworldScreenId != bossData[3]) &&
        never(InOverworld()) &&
        NeverTookDamage(bossData[4]) && trigger_when(bossDead)
    )
}

function PerfectFinalCheevo() {
    achievement(
        title = "Bested Golvellius",
        description = "Defeat Golvellius without using the second wind glitch.",
        points = 25,
        trigger = once(
            MusicId == 0x1b && Enemy00HP == 0x78
        ) && never(OverworldScreenId != 0x10) &&
            never(InOverworld()) &&
            never(byte(0x0836) > 0xd0) &&
            trigger_when(Enemy00HP == 0)
    )
}

for i in range(0, 7) {
    DefeatBossCheevo(i)
    if i < 7 {
    PerfectBossCheevo(i)
    }
    else {
        PerfectFinalCheevo()
    }
}

AllCrystalData = [
    ["Valley", 5, 0xa7, bit0],
    ["Desert", 5, 0x33, bit1],
    ["Graveyard", 5, 0x30, bit2],
    ["Swamp", 5, 0x97, bit3],
    ["Lake", 5, 0x9d, bit4],
    ["Cursed Forest", 5, 0x00, bit5],
    ["Great Forest", 5, 0x07, bit6]
]

function PurchaseCrystalCheevo(index) {
    crystal = AllCrystalData[index]
    mbit = crystal[3]
    achievement(
        title = format("The {0} Crystal", crystal[0]),
        description = format("Obtain the {0} Crystal.", crystal[0]),
        points = crystal[1],
        trigger = OverworldScreenId == crystal[2] && MusicId == 0x09 && SpentGold() &&
            mbit(CrystalBase) > prev(mbit(CrystalBase))
    )
}

for i in range(0, 6) {
    // PurchaseCrystalCheevo(i)
}

achievement(
    title = "We Found The Herb, Show's Over",
    description = "Buy the Green Mea herb.",
    points = 3,
    trigger = MusicId == 0x09 && SpentGold() && GreenMea > prev(GreenMea)
)

achievement(
    title = "The Best Offense...",
    description = "Purchase the fine shield from the desert.",
    points = 3,
    trigger = MusicId == 0x09 && OverworldScreenId == 0x74 && SpentGold() &&
        bit0(ShieldBase) > prev(bit0(ShieldBase))
)

achievement(
    title = "...Is Still Staying Offensive",
    description = "Purchase the Valley Sword from the graveyard.",
    points = 5,
    trigger = MusicId == 0x09 && OverworldScreenId == 0x22 && SpentGold() &&
        bit1(SwordBase) > prev(bit1(SwordBase))
)

achievement(
    title = "Modern-ish Mizugumo",
    description = "Purchase the Aqua Boots from the beach.",
    points = 5,
    trigger = MusicId == 0x09 && OverworldScreenId == 0x5d && SpentGold() &&
        bit6(0x0817) > prev(bit6(0x0817))
)

achievement(
    title = "Plants Come In Many Colors",
    description = "Buy the Purple Mea herb.",
    points = 5,
    trigger = MusicId == 0x09 && SpentGold() && PurpleMea > prev(PurpleMea)
)

achievement(
    title = "What Is A Name?",
    description = "Buy the Ring of Invisibility...and watch it break rocks.",
    points = 5,
    trigger = MusicId == 0x09 && SpentGold() && OverworldScreenId == 0xae &&
        bit3(0x0846) > prev(bit3(0x0846))
)

achievement(
    title = "Small Pendant, Not As Small Protection",
    description = "Buy Aresta's Pendant in the meadow.",
    points = 10,
    trigger = MusicId == 0x09 && SpentGold() && OverworldScreenId == 0x56 &&
        bit0(0x83e) > prev(bit0(0x083e))
)

achievement(
    title = "Alright, A Good Defense Works Too",
    description = "Buy Remedia's Shield in the western forest.",
    points = 10,
    trigger = MusicId == 0x09 && SpentGold() && OverworldScreenId == 0x50 &&
        bit1(0x0849) > prev(bit1(0x0849))
)

achievement(
    title = "Taxes For Lifting Out Of Pedestals",
    description = "Buy the Legendary Sword in the western forest.",
    points = 10,
    trigger = MusicId == 0x09 && SpentGold() && OverworldScreenId == 0x02 &&
        bit2(0x0848) > prev(bit2(0x0848))
)

achievement(
    title = "Vampires Need Not Apply",
    description = "Buy the Magic Mirror in the eastern forest.",
    points = 10,
    trigger = MusicId == 0x09 && SpentGold() && OverworldScreenId == 0x39 &&
        bit2(0x0846) > prev(bit2(0x0846))
)

AllStubbornWomenData = [
    ["Lake", 0xa9],
    ["Cursed Forest", 0x34],
    ["Great Forest", 0x1f]
]

function StubbornWomanCheevo(index) {
    woman = AllStubbornWomenData[index]
    achievement(
        title = format("Peering Into Rings {0}", index + 1),
        points = 10,
        description = format("Bring a green ring to the woman in the {0}.", woman[0]),
        trigger = MusicId == 0x09 && OverworldScreenId == woman[1] &&
            byte(0x084a) < prev(byte(0x084a))
    )
}

for i in range(0, 2) {
    StubbornWomanCheevo(i)
}

achievement(
    title = "Tree-rific Tabi",
    points = 10,
    description = "Buy the Ascent Boots in the eastern forest.",
    trigger = MusicId == 0x09 && SpentGold() && OverworldScreenId == 0x05 &&
        bit7(0x0817) > prev(bit7(0x0817))
)

achievement(
    title = "I'm Full, Thanks",
    points = 25,
    description = "Buy every life potion in the game.",
    trigger = MusicId == 0x09 && SpentGold() && MaxHearts == 0x19 &&
        MaxHearts > prev(MaxHearts)
)

achievement(
    title = "What If I Can't Read?",
    points = 25,
    description = "Buy every bible in the game.",
    trigger = MusicId == 0x09 && SpentGold() && MaxGold == 100000 &&
        PrevGold(0x0842) < 100000
)

achievement(
    title = "Will Love Find A Way?",
    points = 10,
    description = "Buy Ramurasu's Pendant from the graveyard.",
    trigger = MusicId == 0x09 && SpentGold() && OverworldScreenId == 0x18 &&
        bit1(0x083e) > prev(bit1(0x083e))
)

achievement(
    title = "Into The Lion's Den",
    points = 10,
    description = "Enter Golvellius's dungeon with all of the crystals.",
    trigger = MusicId == 0x04 && OverworldScreenId == 0x10 && bitcount(CrystalBase) == 7
)

// Leaderboards

leaderboard(
    title = "Valley Sword%",
    description = "Start a new game & get the Valley Sword as fast as you can.",
    start = OverworldScreenId == 0xb6,
    cancel = MusicId == 0x0d,
    submit = MusicId == 0x09 && OverworldScreenId == 0x22 && SpentGold() &&
        bit1(SwordBase) > prev(bit1(SwordBase)),
    value = always_true(),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Any%",
    description = "Start a new game & beat it as fast as you can.",
    start = OverworldScreenId == 0xb6,
    cancel = MusicId == 0x0d,
    submit = !IsDead() && OverworldScreenId == 0x10 && MusicId == 0x1b &&
        Enemy00HP == 0 && prev(Enemy00HP) != 0,
    value = always_true(),
    lower_is_better = true,
    format = "FRAMES"
)

// Rich Presence

BossNameLookup = {
    0xa6: "Desba",
    0x7e: "Rolick",
    0x0a: "Bachular",
    0xa4: "Fosbus",
    0x83: "Warlic",
    0x37: "Crawky",
    0x54: "Haidee",
    0x10: "Golvellius",
}

function RpHeart() => "❤️"
function RpCurHealth() => rich_presence_value("Number", CurrentHealth)
function RpMaxHealth() => rich_presence_value("Number", MaxHealth)
function RpMoneyBag() => "💰"
function RpCurGold() => rich_presence_value("Number", CurrentGold)
function RpMaxGold() => rich_presence_value("Number", MaxGold)
function RpArea() => rich_presence_lookup("Area", OverworldScreenId, OverworldLookup, "Valley of Doom")
function RpBoss() => rich_presence_lookup("Boss", OverworldScreenId, BossNameLookup, "Someone")

rich_presence_conditional_display(
    IsSoundTestOn(),
    "Kelesis is Enjoying the Tunes of Doom"
)

rich_presence_conditional_display(
    IsHeadingToValley(),
    "Kelesis is Heading to the Valley of Doom - {0} {1}/{2} {3} {4}/{5}",
    RpHeart(),
    RpCurHealth(),
    RpMaxHealth(),
    RpMoneyBag(),
    RpCurGold(),
    RpMaxGold()
)

rich_presence_conditional_display(
    MusicId <= 2,
    "Kelesis is preparing to enter the Valley of Doom."
)

rich_presence_conditional_display(
    MusicId == 0x14 || (prior(MusicId) == 0x14 && MusicId == 0x02),
    "Kelesis has rescued Rena from the Valley of Doom."
)

rich_presence_conditional_display(
    MusicId == 0x05,
    "Kelesis has fallen at the {6} of Doom - {0} {1}/{2} {3} {4}/{5}",
    RpHeart(),
    0,
    RpMaxHealth(),
    RpMoneyBag(),
    RpCurGold(),
    RpMaxGold(),
    RpArea()
)

rich_presence_conditional_display(
    MusicId == 0x1e,
    "Kelesis is victorious against {7} in the {6} of Doom - {0} {1}/{2} {3} {4}/{5}",
    RpHeart(),
    RpCurHealth(),
    RpMaxHealth(),
    RpMoneyBag(),
    RpCurGold(),
    RpMaxGold(),
    RpArea(),
    RpBoss()
)

rich_presence_conditional_display(
    FightingBoss(),
    "Kelesis is fighting {7} in the {6} of Doom - {0} {1}/{2} {3} {4}/{5}",
    RpHeart(),
    RpCurHealth(),
    RpMaxHealth(),
    RpMoneyBag(),
    RpCurGold(),
    RpMaxGold(),
    RpArea(),
    RpBoss()
)

rich_presence_conditional_display(
    MusicId == 0x07 || MusicId == 0x11 || MusicId == 0x04,
    "Kelesis is approaching {7} in the {6} of Doom - {0} {1}/{2} {3} {4}/{5}",
    RpHeart(),
    RpCurHealth(),
    RpMaxHealth(),
    RpMoneyBag(),
    RpCurGold(),
    RpMaxGold(),
    RpArea(),
    RpBoss()
)

rich_presence_conditional_display(
    MusicId == 0x0e,
    "Kelesis is meeting Randar in the {6} of Doom - {0} {1}/{2} {3} {4}/{5}",
    RpHeart(),
    RpCurHealth(),
    RpMaxHealth(),
    RpMoneyBag(),
    RpCurGold(),
    RpMaxGold(),
    RpArea()
)

rich_presence_conditional_display(
    MusicId == 0x0f,
    "Kelesis is dealing with Dina the Devil in the {6} of Doom - {0} {1}/{2} {3} {4}/{5}",
    RpHeart(),
    RpCurHealth(),
    RpMaxHealth(),
    RpMoneyBag(),
    RpCurGold(),
    RpMaxGold(),
    RpArea()
)

rich_presence_conditional_display(
    MusicId == 0x0b,
    "Kelesis is meeting Enny in the {6} of Doom - {0} {1}/{2} {3} {4}/{5}",
    RpHeart(),
    RpCurHealth(),
    RpMaxHealth(),
    RpMoneyBag(),
    RpCurGold(),
    RpMaxGold(),
    RpArea()
)

rich_presence_conditional_display(
    MusicId == 0x17,
    "Kelesis is meeting Winkle in the {6} of Doom - {0} {1}/{2} {3} {4}/{5}",
    RpHeart(),
    RpCurHealth(),
    RpMaxHealth(),
    RpMoneyBag(),
    RpCurGold(),
    RpMaxGold(),
    RpArea()
)

rich_presence_conditional_display(
    MusicId == 0x09,
    "Kelesis is speaking with an old woman in the {6} of Doom - {0} {1}/{2} {3} {4}/{5}",
    RpHeart(),
    RpCurHealth(),
    RpMaxHealth(),
    RpMoneyBag(),
    RpCurGold(),
    RpMaxGold(),
    RpArea()
)

rich_presence_conditional_display(
    MusicId == 0x10,
    "Kelesis is talking with a fairy in the {6} of Doom - {0} {1}/{2} {3} {4}/{5}",
    RpHeart(),
    RpCurHealth(),
    RpMaxHealth(),
    RpMoneyBag(),
    RpCurGold(),
    RpMaxGold(),
    RpArea()
)

rich_presence_display(
    "Kelesis is in the {6} of Doom - {0} {1}/{2} {3} {4}/{5}",
    RpHeart(),
    RpCurHealth(),
    RpMaxHealth(),
    RpMoneyBag(),
    RpCurGold(),
    RpMaxGold(),
    RpArea()
)
