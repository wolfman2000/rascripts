// Legacy of Ys: Books I & II
// #ID = 9896

// Check if the string hex values equal the hex values at the passed address.
// This comes from Etron's tutorials.
function StringCompare(address, string) {
    return all_of(range(0, length(string) - 1), i => byte(address + i) == string[i])
}

function PrevStringCompare(address, string) {
    return all_of(range(0, length(string) - 1), i => prev(byte(address + i)) == string[i])
}

function SpentGold(address, total) {
    return always_true()
    // return address < prev(address)
    // return prev(address) - address <= total
}

function EarnedGold(address, total) {
    return always_true()
    // return address > prev(address)
    // return address - prev(address) >= total
}

function SetBit(address, tBit) {
    return bit(tBit, address) > prev(bit(tBit, address))
}

function ClearBit(address, tBit) {
    return bit(tBit, address) < prev(bit(tBit, address))
}

Ys1 = byte(0x0444e0) == 1
Ys2 = byte(0x0444e0) == 2

Ys1CurHp = word(0x2972c4)
Ys1MaxHp = word(0x2972c6)
Ys1Gold = dword(0x2972cc)
Ys1Exp = dword(0x2972c0)

function Ys1SpentGold(total) => SpentGold(Ys1Gold, total)
function Ys1EarnedGold(total) => EarnedGold(Ys1Gold, total)

Ys1Difficulty = byte(0x2c0820)
Ys1DiffNormal = Ys1Difficulty == 3
Ys1DiffNightmare = Ys1Difficulty == 4

Ys1AllowedDiff = Ys1 && (Ys1Difficulty != 1 && Ys1Difficulty != 2)

Ys1LocationRef = 0x2984f0
Ys1BrigadeHQ = [0x42, 0x72, 0x69, 0x67, 0x61, 0x64, 0x65, 0x20, 0x48, 0x51]
Ys1BrigadeArmory = [0x42, 0x72, 0x69, 0x67, 0x61, 0x64, 0x65, 0x20, 
0x41, 0x72, 0x6d, 0x6f, 0x72, 0x79]
Ys1DeosArmor = [0x44, 0x65, 0x6f, 0x73, 0x27, 0x73, 0x20, 0x41, 0x72, 0x6d, 0x6f, 0x72]
Ys1Rosetti = [0x52, 0x6f, 0x73, 0x65, 0x74, 0x74, 0x69, 0x27,
0x73, 0x20, 0x57, 0x65, 0x61, 0x70, 0x6f, 0x6e, 0x73]
Ys1Seer = [0x54, 0x68, 0x65, 0x20, 0x53, 0x65, 0x65, 0x72,
0x27, 0x73, 0x20, 0x53, 0x68, 0x6f, 0x70]
Ys1PimShop = [0x50, 0x69, 0x6d, 0x27, 0x73, 0x20, 0x50, 0x61,
0x77, 0x6e, 0x20, 0x53, 0x68, 0x6f, 0x70]
Ys1OrmanPub = [0x4f, 0x72, 0x6d, 0x61, 0x6e, 0x27, 0x73, 0x20, 0x50, 0x75, 0x62]
Ys1Plains = [0x50, 0x6c, 0x61, 0x69, 0x6e, 0x73]
Ys1JevahHome = [0x4a, 0x65, 0x76, 0x61, 0x68, 0x27, 0x73, 0x20,
0x48, 0x6f, 0x75, 0x73, 0x65]
Ys1Temple = [0x54, 0x65, 0x6d, 0x70, 0x6c, 0x65]
Ys1TempleB1 = [0x54, 0x65, 0x6d, 0x70, 0x6c, 0x65, 0x20, 0x42, 0x31]
Ys1TempleB2 = [0x54, 0x65, 0x6d, 0x70, 0x6c, 0x65, 0x20, 0x42, 0x32]
Ys1TempleB3 = [0x54, 0x65, 0x6d, 0x70, 0x6c, 0x65, 0x20, 0x42, 0x33]
Ys1Vageux = [0x56, 0x61, 0x67, 0x65, 0x75, 0x78, 0x2d,
0x56, 0x61, 0x72, 0x64, 0x65, 0x74, 0x74, 0x65]
Ys1Mayor = [0x4d, 0x61, 0x79, 0x6f, 0x72, 0x27, 0x73, 0x20,
    0x48, 0x6f, 0x75, 0x73, 0x65]
Ys1MineB1 = [0x4d, 0x69, 0x6e, 0x65, 0x20, 0x42, 0x31]
Ys1MineB2 = [0x4d, 0x69, 0x6e, 0x65, 0x20, 0x42, 0x32]
Ys1MineB3 = [0x4d, 0x69, 0x6e, 0x65, 0x20, 0x42, 0x33]
Ys1MineBB = [0x4d, 0x69, 0x6e, 0x65, 0x20, 0x42, 0x6f, 0x74, 0x74, 0x6f, 0x6d]
Ys1TownWalls = [0x54, 0x6f, 0x77, 0x6e, 0x20, 0x57, 0x61, 0x6c, 0x6c, 0x73]

Ys1PathEvil = [0x50, 0x61, 0x74, 0x68, 0x20, 0x74, 0x6f, 0x20, 0x45, 0x76, 0x69, 0x6c]
Ys1DahmF01 = [0x44, 0x61, 0x68, 0x6d, 0x20, 0x54, 0x6f, 0x77, 0x65, 0x72, 0x20,
    0x46, 0x31
]
Ys1DahmF02 = [0x44, 0x61, 0x68, 0x6d, 0x20, 0x54, 0x6f, 0x77, 0x65, 0x72, 0x20,
    0x46, 0x32
]
Ys1DahmF03 = [0x44, 0x61, 0x68, 0x6d, 0x20, 0x54, 0x6f, 0x77, 0x65, 0x72, 0x20,
    0x46, 0x33
]
Ys1DahmF04 = [0x44, 0x61, 0x68, 0x6d, 0x20, 0x54, 0x6f, 0x77, 0x65, 0x72, 0x20,
    0x46, 0x34
]
Ys1DahmF06 = [0x44, 0x61, 0x68, 0x6d, 0x20, 0x54, 0x6f, 0x77, 0x65, 0x72, 0x20,
    0x46, 0x36
]
Ys1DahmF08 = [0x44, 0x61, 0x68, 0x6d, 0x20, 0x54, 0x6f, 0x77, 0x65, 0x72, 0x20,
    0x46, 0x38
]
Ys1DahmF11 = [0x44, 0x61, 0x68, 0x6d, 0x20, 0x54, 0x6f, 0x77, 0x65, 0x72, 0x20,
    0x46, 0x31, 0x31
]
Ys1DahmF14 = [0x44, 0x61, 0x68, 0x6d, 0x20, 0x54, 0x6f, 0x77, 0x65, 0x72, 0x20,
    0x46, 0x31, 0x34
]
Ys1DahmF15 = [0x44, 0x61, 0x68, 0x6d, 0x20, 0x54, 0x6f, 0x77, 0x65, 0x72, 0x20,
    0x46, 0x31, 0x35
]
Ys1DahmF19 = [0x44, 0x61, 0x68, 0x6d, 0x20, 0x54, 0x6f, 0x77, 0x65, 0x72, 0x20,
    0x46, 0x31, 0x39
]
Ys1DahmF20 = [0x44, 0x61, 0x68, 0x6d, 0x20, 0x54, 0x6f, 0x77, 0x65, 0x72, 0x20,
    0x46, 0x32, 0x30
]
Ys1DahmF21 = [0x44, 0x61, 0x68, 0x6d, 0x20, 0x54, 0x6f, 0x77, 0x65, 0x72, 0x20,
    0x46, 0x32, 0x31
]
Ys1DahmF25 = [0x44, 0x61, 0x68, 0x6d, 0x20, 0x54, 0x6f, 0x77, 0x65, 0x72, 0x20,
    0x46, 0x32, 0x35
]

Ys1LadoSpire = [0x4c, 0x61, 0x64, 0x6f, 0x20, 0x53, 0x70, 0x69,
0x72, 0x65, 0x20, 0x33, 0x46]

Ys1GivenShortSword = SetBit(0x29abe8, 0)

Ys1TimeAttack = Ys1 && byte(0x2972d0) > 0 && Ys1Exp == 0 && Ys1Difficulty == 2

Ys2CurHp = word(0x2492f4)
Ys2MaxHp = word(0x2492f6)
Ys2Gold = dword(0x2492f0)
Ys2Exp = dword(0x2492ec)
Ys2Difficulty = byte(0x284104)

Ys2AllowedDiff = Ys2 && (Ys1Difficulty != 1 && Ys1Difficulty != 2)
Ys2TimeAttack = Ys2 && byte(0x249300) > 0 && Ys2Exp == 0 && Ys2Difficulty == 2

function Ys2SpentGold(total) => SpentGold(Ys2Gold, total)
function Ys2EarnedGold(total) => EarnedGold(Ys2Gold, total)
function Ys2EarnedExp(total) => prev(Ys2Exp) + total == Ys2Exp

Ys2LocationRef = 0x24ac88

Ys2LiliaHouse = [0x4c, 0x69, 0x6c, 0x69, 0x61, 0x27, 0x73, 0x20,
    0x48, 0x6f, 0x75, 0x73, 0x65
]
Ys2LanceVillage = [0x4c, 0x61, 0x6e, 0x63, 0x65, 0x20, 0x56, 0x69,
    0x6c, 0x6c, 0x61, 0x67, 0x65
]
Ys2JeidPawn = [
    0x4a, 0x65, 0x69, 0x64, 0x27, 0x73, 0x20,
    0x50, 0x61, 0x77, 0x6e, 0x20, 0x53, 0x68, 0x6f, 0x70
]
Ys2GuidoArmory = [
    0x47, 0x75, 0x69, 0x64, 0x6f, 0x27, 0x73, 0x20,
    0x41, 0x72, 0x6d, 0x6f, 0x72, 0x79
]
Ys2Field = [0x46, 0x69, 0x65, 0x6c, 0x64]
Ys2MoondoriaRuins = [0x4d, 0x6f, 0x6f, 0x6e, 0x64, 0x6f, 0x72, 0x69, 0x61,
    0x20, 0x52, 0x75, 0x69, 0x6e, 0x73
]
Ys2HadalMausoleum = [0x48, 0x61, 0x64, 0x61, 0x6c, 0x27, 0x73, 0x20,
    0x4d, 0x61, 0x75, 0x73, 0x6f, 0x6c, 0x65, 0x75
]
Ys2TovahMausoleum = [0x54, 0x6f, 0x76, 0x61, 0x68, 0x27, 0x73, 0x20,
    0x4d, 0x61, 0x75, 0x73, 0x6f, 0x6c, 0x65, 0x75
]
Ys2DabbyMausoleum = [0x44, 0x61, 0x62, 0x62, 0x79, 0x27, 0x73, 0x20,
    0x4d, 0x61, 0x75, 0x73, 0x6f, 0x6c, 0x65, 0x75
]
Ys2MessaMausoleum = [0x4d, 0x65, 0x73, 0x73, 0x61, 0x27, 0x73, 0x20,
    0x4d, 0x61, 0x75, 0x73, 0x6f, 0x6c, 0x65, 0x75
]
Ys2GemmaMausoleum = [0x47, 0x65, 0x6d, 0x6d, 0x61, 0x27, 0x73, 0x20,
    0x4d, 0x61, 0x75, 0x73, 0x6f, 0x6c, 0x65, 0x75
]
Ys2FactMausoleum = [0x46, 0x61, 0x63, 0x74, 0x27, 0x73, 0x20,
    0x4d, 0x61, 0x75, 0x73, 0x6f, 0x6c, 0x65, 0x75
]
Ys2RastiniMines = [
    0x52, 0x61, 0x73, 0x74, 0x69, 0x6e, 0x69, 0x20,
    0x4d, 0x69, 0x6e, 0x65, 0x73
]
Ys2ToalSanctuary = [
    0x54, 0x6f, 0x61, 0x6c, 0x20,
    0x53, 0x61, 0x6e, 0x63, 0x74, 0x75, 0x61, 0x72, 0x79
]
Ys2NoltiaIceWall = [
    0x4e, 0x6f, 0x6c, 0x74, 0x69, 0x61, 0x20, 0x49, 0x63, 0x65,
    0x20, 0x57, 0x61, 0x6c, 0x6c, 0x73
]
Ys2LavaVillage = [
    0x4c, 0x61, 0x76, 0x61, 0x20,
    0x56, 0x69, 0x6c, 0x6c, 0x61, 0x67, 0x65
]
Ys2RooNest = [
    0x52, 0x6f, 0x6f, 0x20, 0x4e, 0x65, 0x73, 0x74
]
Ys2Burnedbless = [
    0x42, 0x75, 0x72, 0x6e, 0x65, 0x64, 0x62, 0x6c, 0x65, 0x73, 0x73
]
Ys2ZalemWeapon = [
    0x5a, 0x61, 0x6c, 0x65, 0x6d, 0x27, 0x73, 0x20,
    0x57, 0x65, 0x61, 0x70, 0x6f, 0x6e, 0x73
]
Ys2HadatHouse = [
    0x48, 0x61, 0x64, 0x61, 0x74, 0x27, 0x73, 0x20,
    0x48, 0x6f, 0x75, 0x73, 0x65
]
Ys2TempleHadal = [
    0x54, 0x65, 0x6d, 0x70, 0x6c, 0x65, 0x3a, 0x20,
    0x48, 0x61, 0x64, 0x61, 0x6c
]
Ys2TempleGemma = [
    0x54, 0x65, 0x6d, 0x70, 0x6c, 0x65, 0x3a, 0x20,
    0x47, 0x65, 0x6d, 0x6d, 0x61
]
Ys2TempleFact = [
    0x54, 0x65, 0x6d, 0x70, 0x6c, 0x65, 0x3a, 0x20,
    0x46, 0x61, 0x63, 0x74
]
Ys2TempleDabby = [
    0x54, 0x65, 0x6d, 0x70, 0x6c, 0x65, 0x3a, 0x20,
    0x44, 0x61, 0x62, 0x62, 0x79
]
Ys2AncientWell = [
    0x41, 0x6e, 0x63, 0x69, 0x65, 0x6e, 0x74, 0x20,
    0x57, 0x65, 0x6c, 0x6c
]
Ys2Runaways = [
    0x52, 0x75, 0x6e, 0x61, 0x77, 0x61, 0x79, 0x73, 0x27, 0x20,
    0x48, 0x69, 0x64, 0x65, 0x6f, 0x75, 0x74
]
Ys2Canal = [
    0x55, 0x6e, 0x64, 0x65, 0x72, 0x67, 0x72, 0x6f, 0x75, 0x6e, 0x64, 0x20,
    0x43, 0x61, 0x6e, 0x61, 0x6c
]
Ys2TempleEast = [
    0x54, 0x65, 0x6d, 0x70, 0x6c, 0x65, 0x3a, 0x20,
    0x45, 0x61, 0x73, 0x74, 0x20, 0x57, 0x69, 0x6e, 0x67
]
Ys2BellTower = [
    0x42, 0x65, 0x6c, 0x6c, 0x20,
    0x54, 0x6f, 0x77, 0x65, 0x72
]
Ys2Underpass = [
    0x54, 0x65, 0x6d, 0x70, 0x6c, 0x65, 0x20,
    0x55, 0x6e, 0x64, 0x65, 0x72, 0x70, 0x61, 0x73, 0x73
]
Ys2Center = [
    0x43, 0x65, 0x6e, 0x74, 0x65, 0x72, 0x20,
    0x6f, 0x66, 0x20, 0x59, 0x73
]
Ys2DarkThrone = [
    0x44, 0x61, 0x72, 0x6b, 0x20,
    0x50, 0x65, 0x61, 0x72, 0x6c, 0x20,
    0x54, 0x68, 0x72, 0x6f, 0x6e, 0x65
]

// Cheevos

Ys1FoundEquipment = [
    [
        "Defense Brigade Offensive", 2, "Short Sword",
        [StringCompare(Ys1LocationRef, Ys1BrigadeHQ)]
    ],
    [
        "How Long Is It?", 2, "Long Sword",
        [StringCompare(Ys1LocationRef, Ys1Rosetti) && Ys1SpentGold(2000)],
        
    ],
    [
        "Joys Of Curves", 2, "Talwarl",
        [StringCompare(Ys1LocationRef, Ys1Rosetti) && Ys1SpentGold(5000),
        StringCompare(Ys1LocationRef, Ys1BrigadeArmory),
        StringCompare(Ys1LocationRef, Ys1DahmF02)],
        
    ],
    [
        "Not Exactly The Arcade Game", 3, "Defender",
        [StringCompare(Ys1LocationRef, Ys1Vageux)]
    ],
    [
        "Vampires Beware", 2, "Silver Sword",
        [StringCompare(Ys1LocationRef, Ys1Plains)]
    ],
    [
        "Dragon Warrior I Called: Return This", 2, "Flame Sword",
        [StringCompare(Ys1LocationRef, Ys1DahmF20)]
    ],
    [
        "Cheap But Worth It", 2, "Small Shield",
        [StringCompare(Ys1LocationRef, Ys1DeosArmor) && Ys1SpentGold(700)],
    ],
    [
        "Animal Or Vegetable Tanned?", 2, "Medium Shield",
        [StringCompare(Ys1LocationRef, Ys1DeosArmor) && Ys1SpentGold(2000)],
    ],
    [
        "Large And In Charge", 2, "Large Shield",
        [StringCompare(Ys1LocationRef, Ys1DeosArmor) && Ys1SpentGold(6000),
        StringCompare(Ys1LocationRef, Ys1DahmF06)],
    ],
    [
        "No Eating This, Sorry Titans", 3, "Ruby Shield",
        [StringCompare(Ys1LocationRef, Ys1Vageux)],
    ],
    [
        "Looks More Red/Orange Than Silver", 3, "Silver Shield",
        [StringCompare(Ys1LocationRef, Ys1TempleB3)],
    ],
    [
        "Battle Hardened", 2, "Battle Shield",
        [StringCompare(Ys1LocationRef, Ys1DahmF15)],
    ],
    [
        "How Does This Not Poke The Skin?", 2, "Chain Mail",
        [StringCompare(Ys1LocationRef, Ys1DeosArmor) && Ys1SpentGold(400)],
    ],
    [
        "Good Enough To Eat [Off Of]", 2, "Plate Mail",
        [StringCompare(Ys1LocationRef, Ys1DeosArmor) && Ys1SpentGold(2000)],
    ],
    [
        "I've Had Enough Of Duran Duran", 2, "Reflex",
        [StringCompare(Ys1LocationRef, Ys1DeosArmor) && Ys1SpentGold(5000),
        StringCompare(Ys1LocationRef, Ys1DahmF04)],
    ],
    [
        "How Does One Spell This Anyway?", 3, "Mithril Mail",
        [StringCompare(Ys1LocationRef, Ys1Vageux)]
    ],
    [
        "Almost Like A Knight", 2, "Silver Armor",
        [StringCompare(Ys1LocationRef, Ys1MineB1)]
    ],
    [
        "Now You're Just Flaunting", 2, "Battle Armor",
        [StringCompare(Ys1LocationRef, Ys1DahmF19)]
    ],
    [
        "At Least It's Not A Glove", 2, "Power Ring",
        [StringCompare(Ys1LocationRef, Ys1Mayor)]
    ],
    [
        "Didn't Link Have A Blue One?", 2, "Defense Ring",
        [StringCompare(Ys1LocationRef, Ys1Temple)]
    ],
    [
        "Sonic The Hedgehog Need Not Apply", 2, "Time Ring",
        [StringCompare(Ys1LocationRef, Ys1MineB1)]
    ],
    [
        "Recovery For The Impatient", 2, "Heal Ring",
        [StringCompare(Ys1LocationRef, Ys1MineB2)]
    ],
    [
        "Hatred, Anger, & Agony", 2, "Evil Ring",
        [StringCompare(Ys1LocationRef, Ys1DahmF02)]
    ],
]

function Ys1EquipCheevo(offset, title, points, item, validLocs, startText = "Obtain the") {
    achievement(
        title = title,
        points = points,
        description = format("[Ys 1] {1} {0}.", item, startText),
        trigger = Ys1AllowedDiff && any_of(validLocs, l => l) && offset > prev(offset)
    )
}

Ys1EquipOffset = 0
for i in Ys1FoundEquipment {
    Ys1EquipCheevo(bit0(0x29abe8 + Ys1EquipOffset), i[0], i[1], i[2], i[3])
    Ys1EquipOffset = Ys1EquipOffset + 1
}

Ys1FoundItems = [
    [
        0x29ac0b,
        "At Least It's Not Orbs This Time", 2, "Crystal",
        [StringCompare(Ys1LocationRef, Ys1Seer)],
    ],
    [
        0x29ac1d,
        "Papers Please", 5, "Parchment",
        [StringCompare(Ys1LocationRef, Ys1Plains)]
    ],
    [
        0x29ac07,
        "Tail Cave Would Like A Word",
        3, "Temple Key",
        [StringCompare(Ys1LocationRef, Ys1JevahHome)]
    ],
    [
        0x29ac06,
        "Not The Greatest For Reception",
        3, "Cell Key",
        [StringCompare(Ys1LocationRef, Ys1TempleB2)]
    ],
    [
        0x29ac05,
        "At Least It's Not Locked Inside",
        3, "Chest Key",
        [StringCompare(Ys1LocationRef, Ys1TempleB2)]
    ],
    [
        0x29ac1b,
        "Isn't That Just Your Face?",
        3, "Mask of Eyes",
        [StringCompare(Ys1LocationRef, Ys1TempleB1)]
    ],
    [
        0x29ac08,
        "Respect The Elephants",
        3, "Ivory Key",
        [StringCompare(Ys1LocationRef, Ys1TempleB3)]
    ],
    [
        0x29ac09,
        "Sonic's Worst Key",
        3, "Marble Key",
        [StringCompare(Ys1LocationRef, Ys1TempleB3)]
    ],
    [
        0x29abff,
        "I've Had Enough Of These Snakes",
        10,
        "Blue Book of Ys after defeating Nygtilger",
        [StringCompare(Ys1LocationRef, Ys1TempleB3) && bit0(0x29ac33) == 1]
    ],
    [
        0x29ac00,
        "This Is Now Personal",
        10,
        "Red Book of Ys",
        [StringCompare(Ys1LocationRef, Ys1Seer) && bit0(0x29ac39) == 1]
    ],
    [
        0x29ac0c,
        "The Roda To Rebirth",
        5,
        "Roda Seed",
        [StringCompare(Ys1LocationRef, Ys1MineB2)]
    ],
    [
        0x29ac1e,
        "Healing In Nature",
        5,
        "Herb",
        [StringCompare(Ys1LocationRef, Ys1Plains)]
    ],
    [
        0x29ac0a,
        "The ESRB Had A Fit",
        5,
        "Dahm Key",
        [StringCompare(Ys1LocationRef, Ys1MineB3)]
    ],
    [
        0x29ac01,
        "At Least Dracula Isn't Cheap...Usually",
        10,
        "Dark Blue Book of Ys after defeating Vagullion",
        [StringCompare(Ys1LocationRef, Ys1MineBB) && bit0(0x29ac34) == 1]
    ],
    [
        0x29ac1c,
        "Even When Trapped, Must Be Fashionable",
        10,
        "Blue Necklace by Trading a Statue",
        [StringCompare(Ys1LocationRef, Ys1DahmF03) && bit0(0x29acd2) == 1]
    ],
    [
        0x29ac02,
        "The Ancestor Of The Mechantid?",
        10,
        "Orange Book of Ys after defeating Pictimos",
        [StringCompare(Ys1LocationRef, Ys1DahmF08)]
    ],
    [
        0x29ac03,
        "Ancient Bullet Frenzy",
        10,
        "Green Book of Ys after defeating Khonsclard",
        [StringCompare(Ys1LocationRef, Ys1DahmF14)]
    ],
    [
        0x29ac11,
        "Ancient Lens Of Truth",
        5,
        "Monocle",
        [StringCompare(Ys1LocationRef, Ys1LadoSpire)]
    ],
    [
        0x29ac12,
        "Why Were Elevators Not Invented Yet?",
        5,
        "Blue Amulet",
        [StringCompare(Ys1LocationRef, Ys1DahmF11)]
    ]
]

for i in Ys1FoundItems {
    tBit = bit0(i[0])
    Ys1EquipCheevo(tBit, i[1], i[2], i[3], i[4])
}

Ys1EquipCheevo(
    bit0(0x29ac31),
    "Turning Fact Into Fiction",
    25,
    "final book of Ys and enjoy the ending.",
    [StringCompare(Ys1LocationRef, Ys1DahmF25)],
    "Read the"
)

Ys1ReturnedItems = [
    [
        0x29ac14,
        "May Their Marriage Be Successful",
        5,
        "Sapphire Ring",
        "Donis at Orman's Pub",
        [StringCompare(Ys1LocationRef, Ys1OrmanPub)]
    ],
    [
        0x29ac0e,
        "No Need To Play The Blues",
        5,
        "Silver Harmonica",
        "Reah at Minea's Walls",
        [StringCompare(Ys1LocationRef, Ys1TownWalls)]
    ]
]

function Ys1ReturnItemCheevo(offset, title, points, item, target, validLocs) {
    achievement(
        title = title,
        points = points,
        description = format("[Ys 1] Give the {0} to {1}.", item, target),
        trigger = Ys1AllowedDiff && any_of(validLocs, l => l) && offset < prev(offset)
    )
}

for i in Ys1ReturnedItems {
    tBit = bit0(i[0])
    Ys1ReturnItemCheevo(tBit, i[1], i[2], i[3], i[4], i[5])
}

Ys1SoldItems = [
    [
        0x29ac16,
        "Vendor Trash? In This Game?",
        5,
        "Gold Pedestal",
        StringCompare(Ys1LocationRef, Ys1PimShop) && Ys1EarnedGold(2000)
    ],
    [
        0x29ac13,
        "Less Worth Than Gold? How?",
        5, "Ruby",
        StringCompare(Ys1LocationRef, Ys1PimShop) && Ys1EarnedGold(1200)
    ],
]

function Ys1SoldItemCheevo(offset, title, points, item, condition) {
    achievement(
        title = title,
        points = points,
        description = format("[Ys 1] Sell the {0}.", item),
        trigger = Ys1AllowedDiff && condition && offset < prev(offset)
    )
}

for i in Ys1SoldItems {
    tBit = bit0(i[0])
    Ys1SoldItemCheevo(tBit, i[1], i[2], i[3], i[4])
}

Ys1BoughtItems = [
    [
        0x29ac18,
        "No Need For Red Bull",
        2,
        "Wing",
        [StringCompare(Ys1LocationRef, Ys1PimShop) && Ys1SpentGold(200)]
    ],
    [
        0x29ac1a,
        "Reflecting On This Achievement",
        2,
        "Mirror",
        [StringCompare(Ys1LocationRef, Ys1PimShop) && Ys1SpentGold(500)]
    ]
]

function Ys1BoughtItemCheevo(offset, title, points, item, validLocs) {
    achievement(
        title = title,
        points = points,
        description = format("[Ys 1] Buy the {0}.", item),
        trigger = Ys1AllowedDiff && any_of(validLocs, l => l) && offset > prev(offset)
    )
}

for i in Ys1BoughtItems {
    tBit = bit0(i[0])
    Ys1BoughtItemCheevo(tBit, i[1], i[2], i[3], i[4])
}

Ys1FoughtBosses = [
    [
        "Bloody Mary's Cousin",
        5,
        "Jenocres at the Temple",
        StringCompare(Ys1LocationRef, Ys1Temple) && byte(0x29ac29) == 1 &&
        prev(byte(0x29ac29)) == 1 && SetBit(0x29ac32, 0)
    ],
    [
        "You Spin Me Right Round",
        10,
        "Petrorex at Vageux-Vardette",
        StringCompare(Ys1LocationRef, Ys1Vageux) && SetBit(0x29ac39, 0)
    ],
    [
        "Double Trouble",
        10,
        "Yogrex & Omrgun at Dahm Tower",
        StringCompare(Ys1LocationRef, Ys1DahmF21) && SetBit(0x29ac37, 0)
    ]
]

function Ys1FoughtBossCheevo(title, points, desc, condition) {
    achievement(
        title = title,
        points = points,
        description = format("[Ys 1] Defeat {0}.", desc),
        trigger = Ys1AllowedDiff && condition
    )
}

for i in Ys1FoughtBosses {
    Ys1FoughtBossCheevo(i[0], i[1], i[2], i[3])
}

achievement(
    title = "That Escort Wasn't Too Bad",
    points = 5,
    description = "[Ys 1] Escort Feena back to Jevah's house.",
    trigger = Ys1AllowedDiff && StringCompare(Ys1LocationRef, Ys1JevahHome) &&
        byte(0x29ac28) == 0x0d && prev(byte(0x29ac28)) != 0x0d &&
        byte(0x29aca1) == 0 && byte(0x29aca2) == 0 && byte(0x29aca3) == 0
)

achievement(
    title = "The Point Of No Return",
    points = 10,
    description = "[Ys 1] Enter the Dahm Tower.",
    trigger = Ys1AllowedDiff && PrevStringCompare(Ys1LocationRef, Ys1PathEvil) &&
        StringCompare(Ys1LocationRef, Ys1DahmF01)
)

achievement(
    title = "Too Much Red Bull Is Dangerous! [m]",
    points = 5,
    description = "[Ys 1] Attempt to bring a Wing to the Dahm Tower.",
    trigger = Ys1AllowedDiff && StringCompare(Ys1LocationRef, Ys1PathEvil) &&
        SetBit(0x29acbe, 0)
)

achievement(
    title = "Cataloguing Book 1",
    points = 25,
    description = "[Ys 1] Complete the Time Attack.",
    trigger = Ys1TimeAttack && StringCompare(Ys1LocationRef, Ys1DahmF25) &&
        SetBit(0x29ac38, 0)
)

function Ys2SimpleCheevo(title, points, item, address, conditions, startText = "Obtain the") {
    achievement(
        title = title,
        points = points,
        description = format("[Ys 2] {1} {0}.", item, startText),
        trigger = Ys2AllowedDiff && address && any_of(conditions, c => c)
    )
}

Ys2FoundItems = [
    [
        "A Prelude To Eventual Action",
        1,
        "letter from Banoa",
        SetBit(0x2505fb, 0),
        [StringCompare(Ys2LocationRef, Ys2LiliaHouse)]
    ],
    [
        "No Doctor Today, Thanks",
        1,
        "Apple",
        SetBit(0x250602, 0),
        [StringCompare(Ys2LocationRef, Ys2LanceVillage),
        StringCompare(Ys2LocationRef, Ys2JeidPawn)]
    ],
    [
        "I Wood Like That, Thanks",
        2,
        "Wooden Shield",
        SetBit(0x2505ca, 0),
        [StringCompare(Ys2LocationRef, Ys2GuidoArmory) && Ys2SpentGold(100),
        StringCompare(Ys2LocationRef, Ys2ZalemWeapon) && Ys2SpentGold(100)]
    ],
    [
        "Let The Slashing Commence",
        2,
        "Short Sword",
        SetBit(0x2505c4, 0),
        [StringCompare(Ys2LocationRef, Ys2GuidoArmory) && Ys2SpentGold(200)]
    ],
    [
        "Does The Five Second Rule Apply?",
        2,
        "Roda Fruit",
        SetBit(0x250603, 0),
        [StringCompare(Ys2LocationRef, Ys2MoondoriaRuins)]
    ],
    [
        "Suddenly, Spot The Difference On Textures",
        2,
        "Ancient Tablet",
        SetBit(0x2505e8, 0),
        [StringCompare(Ys2LocationRef, Ys2MoondoriaRuins)]
    ],
    [
        "The Chains I Get, But Why Mail?",
        2,
        "Chain Mail",
        SetBit(0x2505d0, 0),
        [StringCompare(Ys2LocationRef, Ys2GuidoArmory) && Ys2SpentGold(500)]
    ],
    [
        "You Can Fly",
        2,
        "Wing",
        SetBit(0x250600, 0),
        [StringCompare(Ys2LocationRef, Ys2JeidPawn) && Ys2SpentGold(100)]
    ],
    [
        "Would Hellish Be Better?",
        2,
        "Heavenly Staff",
        SetBit(0x2505e9, 0),
        [StringCompare(Ys2LocationRef, Ys2MoondoriaRuins)]
    ],
    // The mattock cheevo is used for saving Fleah Ral, not finding the thing.
    [
        "Starting To See Cleria-ly",
        3,
        "Cleria Ring",
        SetBit(0x2505df, 0),
        [StringCompare(Ys2LocationRef, Ys2ToalSanctuary)]
    ],
    [
        "Why Is The First Spell Always Fire?",
        3,
        "Fire Magic",
        SetBit(0x2505d6, 0),
        [StringCompare(Ys2LocationRef, Ys2RastiniMines)]
    ],
    [
        "Healing Comes In All Forms",
        3,
        "Medicinal Herb",
        byte(0x250601) > prev(byte(0x250601)),
        [StringCompare(Ys2LocationRef, Ys2RastiniMines),
        StringCompare(Ys2LocationRef, Ys2NoltiaIceWall)]
    ],
    
    [
        "Flowers? In Caves? Really?",
        3,
        "Celceta Flower",
        SetBit(0x250605, 0),
        [StringCompare(Ys2LocationRef, Ys2RastiniMines)]
    ],
    [
        "Let There Be Light",
        3,
        "Light Magic",
        SetBit(0x2505d7, 0),
        [StringCompare(Ys2LocationRef, Ys2RastiniMines)]
    ],
    [
        "Were Good Bells Out Of Stock?",
        3,
        "Evil Bell",
        SetBit(0x2505f4, 0),
        [StringCompare(Ys2LocationRef, Ys2RastiniMines)]
    ],
    [
        "Long Days Await",
        3,
        "Long Sword",
        SetBit(0x2505c5, 0) && Ys2SpentGold(1000),
        [StringCompare(Ys2LocationRef, Ys2GuidoArmory),
        StringCompare(Ys2LocationRef, Ys2ZalemWeapon)]
    ],
    [
        "Size Is Relative",
        3,
        "Small Shield",
        SetBit(0x2505cb, 0) && Ys2SpentGold(1500),
        [StringCompare(Ys2LocationRef, Ys2GuidoArmory),
        StringCompare(Ys2LocationRef, Ys2ZalemWeapon)]
    ],
    [
        "Who Needs Wings These Days?",
        3,
        "Return Magic",
        SetBit(0x2505d8, 0),
        [StringCompare(Ys2LocationRef, Ys2LiliaHouse)]
    ],
    [
        "Chicken Not Included",
        3,
        "Breast Plate",
        SetBit(0x2505d1, 0) && Ys2SpentGold(2000),
        [StringCompare(Ys2LocationRef, Ys2GuidoArmory),
        StringCompare(Ys2LocationRef, Ys2ZalemWeapon)]
    ],
    [
        "Stay Cool",
        3,
        "Ice Mist Orb",
        SetBit(0x2505eb, 0),
        [StringCompare(Ys2LocationRef, Ys2NoltiaIceWall)]
    ],
    [
        "Spirited Away",
        3,
        "Spirit Cloak",
        SetBit(0x2505dc, 0),
        [StringCompare(Ys2LocationRef, Ys2NoltiaIceWall)]
    ],
    [
        "This Is No Place To Hawk Wares",
        3,
        "Hawk Statue",
        SetBit(0x2505dd, 0),
        [StringCompare(Ys2LocationRef, Ys2NoltiaIceWall)]
    ],
    [
        "Magic Of The Mind",
        3,
        "Telepathy Magic",
        SetBit(0x2501ec, 0),
        [StringCompare(Ys2LocationRef, Ys2NoltiaIceWall)]
    ],
    [
        "Blue Toad No Longer Has Slippery Shoes",
        3,
        "Rock Shoes",
        SetBit(0x2505fd, 0),
        [StringCompare(Ys2LocationRef, Ys2NoltiaIceWall)]
    ],
    [
        "Mickey Mouse's Next Game?",
        3,
        "Mirror of Illusions",
        SetBit(0x2505f6, 0),
        [StringCompare(Ys2LocationRef, Ys2NoltiaIceWall)]
    ],
    [
        "The Roo Whisperer",
        3,
        "Earrings of Whispers",
        SetBit(0x2505ee, 0),
        [StringCompare(Ys2LocationRef, Ys2LavaVillage)]
    ],
    [
        "Straight Slices Are Boring", // Maybe move this to just after Mirror of Illusions?
        3,
        "Talwarl",
        SetBit(0x2505c6, 0) && Ys2SpentGold(5000),
        [StringCompare(Ys2LocationRef, Ys2GuidoArmory),
        StringCompare(Ys2LocationRef, Ys2ZalemWeapon)]
    ],
    [
        "The Roda To Wellness",
        3,
        "Roda Leaf",
        SetBit(0x2505fe, 0),
        [StringCompare(Ys2LocationRef, Ys2RooNest)]
    ],
    [
        "No Pirates For Cursing Here",
        3,
        "Black Pearl",
        SetBit(0x2505f7, 0),
        [StringCompare(Ys2LocationRef, Ys2Burnedbless)]
    ],
    [
        "Kirby's Favorite Weapon",
        3,
        "Hyper Cutter",
        SetBit(0x2505c7, 0) && Ys2SpentGold(10000),
        [StringCompare(Ys2LocationRef, Ys2ZalemWeapon)]
    ],
    [
        "It's How You Use It That Counts",
        3,
        "Large Shield",
        SetBit(0x2505cc, 0) && Ys2SpentGold(6000),
        [StringCompare(Ys2LocationRef, Ys2GuidoArmory),
        StringCompare(Ys2LocationRef, Ys2ZalemWeapon)]
    ],
    [
        "Forgotten In The Dishwasher For Some",
        3,
        "Plate Mail",
        SetBit(0x2505d2, 0) && Ys2SpentGold(8000),
        [StringCompare(Ys2LocationRef, Ys2GuidoArmory),
        StringCompare(Ys2LocationRef, Ys2ZalemWeapon)]
    ],
    [
        "That's It: I'm Sticking With DDR Supernova",
        3,
        "Reflex",
        SetBit(0x2505d3, 0) && Ys2SpentGold(16000),
        [StringCompare(Ys2LocationRef, Ys2ZalemWeapon)]
    ],
    [
        "Can This Be Found At Beaches?",
        3,
        "Lira Shell",
        SetBit(0x2505ef, 0),
        [StringCompare(Ys2LocationRef, Ys2HadatHouse)]
    ],
    [
        "I Permit You To Have Cheevo Points",
        3,
        "Permit",
        SetBit(0x2505f0, 0),
        [StringCompare(Ys2LocationRef, Ys2TempleGemma)]
    ],
    [
        "Is This Ring In The Wrong Game?",
        3,
        "Peace Ring",
        SetBit(0x2505e0, 0),
        [StringCompare(Ys2LocationRef, Ys2TempleFact)]
    ],
    [
        "Looks A Little Like A Grail To Me...",
        3,
        "Holy Cup",
        SetBit(0x2505f8, 0),
        [StringCompare(Ys2LocationRef, Ys2TempleDabby)]
    ],
    [
        "Apprentice Of Unlocking",
        3,
        "Temple Key",
        SetBit(0x2505ec, 0),
        [StringCompare(Ys2LocationRef, Ys2Runaways)]
    ],
    [
        "Misleading Magic Names",
        3,
        "Time Stop Magic",
        SetBit(0x2505d9, 0),
        [StringCompare(Ys2LocationRef, Ys2TempleDabby)]
    ],
    [
        "No Signs Of Deficiency Or Anemia Here",
        3,
        "Iron Shield",
        SetBit(0x2505cd, 0),
        [StringCompare(Ys2LocationRef, Ys2TempleDabby)]
    ],
    [
        "All That Glitters Is Not Gold",
        3,
        "Silver Pendant",
        SetBit(0x2505f1, 0),
        [StringCompare(Ys2LocationRef, Ys2Canal)]
    ],
    [
        "Preparing For A War",
        3,
        "Battle Shield",
        SetBit(0x2505ce, 0),
        [StringCompare(Ys2LocationRef, Ys2TempleEast)]
    ],
    [
        "Memories Of Water Temple",
        3,
        "Water Control Room Key",
        SetBit(0x2505ed, 0),
        [StringCompare(Ys2LocationRef, Ys2Canal)]
    ],
    [
        "More Preparing For A War",
        3,
        "Battle Armor",
        SetBit(0x2505d4, 0),
        [StringCompare(Ys2LocationRef, Ys2Canal)]
    ],
    [
        "Preparations Are Completed",
        3,
        "Battle Sword",
        SetBit(0x2505c8, 0),
        [StringCompare(Ys2LocationRef, Ys2Canal)]
    ],
    [
        "Cheevo Hunting Is For The Birds",
        3,
        "Falcon Statue",
        SetBit(0x2505de, 0),
        [StringCompare(Ys2LocationRef, Ys2Canal)]
    ],
    [
        "Sweet Dreams Are Made Of These?",
        3,
        "Dreaming Statue",
        SetBit(0x2505f9, 0),
        [StringCompare(Ys2LocationRef, Ys2BellTower)]
    ],
    [
        "Of Course, Some Things Do Glitter In Gold",
        3,
        "Gold Pendant",
        SetBit(0x2505f2, 0),
        [StringCompare(Ys2LocationRef, Ys2Canal)]
    ],
    [
        "Clerian Offensive",
        3,
        "Cleria Sword",
        SetBit(0x2505c9, 0),
        [StringCompare(Ys2LocationRef, Ys2Canal)]
    ],
    [
        "Clerian Protection",
        3,
        "Cleria Armor",
        SetBit(0x2505d5, 0),
        [StringCompare(Ys2LocationRef, Ys2HadatHouse)]
    ],
    [
        "Where Was This Magic LAST Battle?!?",
        3,
        "Shield Magic",
        SetBit(0x2505db, 0),
        [StringCompare(Ys2LocationRef, Ys2Center)]
    ],
    [
        "The Power Of The Goddesses",
        3,
        "Goddess Ring",
        SetBit(0x2505e1, 0),
        [StringCompare(Ys2LocationRef, Ys2Center)]
    ],
    [
        "Clerian Defensive",
        3,
        "Cleria Shield",
        SetBit(0x2505cf, 0),
        [StringCompare(Ys2LocationRef, Ys2Center)]
    ],
]

for i in Ys2FoundItems {
    Ys2SimpleCheevo(i[0], i[1], i[2], i[3], i[4])
}

Ys2SimpleCheevo(
    "Alright, This Escort Was Worse", // After black pearl
    5,
    "Talf back to Lava Village",
    Ys2EarnedExp(900),
    [StringCompare(Ys2LocationRef, Ys2LavaVillage)],
    "Bring"
)

Ys2SimpleCheevo(
    "Well, That Was Uncomfortable",
    5,
    "yourself of the Roo curse",
    ClearBit(0x2501bc, 1),
    [StringCompare(Ys2LocationRef, Ys2AncientWell)],
    "Cure"
)

Ys2GivenItems = [
    [
        "Stop And Smell The...Marls?", // Apply this before Five Second Rule
        2,
        "Marl Flower to Lilia",
        ClearBit(0x250604, 0),
        [StringCompare(Ys2LocationRef, Ys2Field),]
    ],
    
]

for i in Ys2GivenItems {
    Ys2SimpleCheevo(i[0], i[1], i[2], i[3], i[4], "Give the")
}

Ys2ReturnedBooks = [
    [
        "Hadal Handled", // Apply this after You Can Fly
        3,
        "Book of Hadal to the Mausoleum",
        ClearBit(0x2505e2, 0) && SetBit(0x2505e2, 7),
        [StringCompare(Ys2LocationRef, Ys2HadalMausoleum)]
    ],
    [
        "Tovah Treated Well", // Apply this after Would Hellish Be Better,
        3,
        "Book of Tovah to the Mausoleum",
        ClearBit(0x2505e3, 0) && SetBit(0x2505e3, 7),
        [StringCompare(Ys2LocationRef, Ys2TovahMausoleum)]
    ],
    [
        "Dabby Dreaming On", // Apply this after Mattock Quest,
        3,
        "Book of Dabby to the Mausoleum",
        ClearBit(0x2505e4, 0) && SetBit(0x2505e4, 7),
        [StringCompare(Ys2LocationRef, Ys2DabbyMausoleum)]
    ],
    [
        "Messa Moved Peacefully", // Apply this after Medicinal Herb
        3,
        "Book of Messa to the Mausoleum",
        ClearBit(0x2505e5, 0) && SetBit(0x2505e5, 7),
        [StringCompare(Ys2LocationRef, Ys2MessaMausoleum)]
    ],
    [
        "Gemma Glad", // Apply this after Medicinal Herb
        3,
        "Book of Gemma to the Mausoleum",
        ClearBit(0x2505e6, 0) && SetBit(0x2505e6, 7),
        [StringCompare(Ys2LocationRef, Ys2GemmaMausoleum)]
    ],
    [
        "Fact No Longer Fiction", // Apply this after Return Magic
        3,
        "Book of Fact to the Mausoleum",
        ClearBit(0x2505e7, 0) && SetBit(0x2505e7, 7),
        [StringCompare(Ys2LocationRef, Ys2FactMausoleum)]
    ]
]

for i in Ys2ReturnedBooks {
    Ys2SimpleCheevo(i[0], i[1], i[2], i[3], i[4], "Return the")
}

Ys2BossData = [
    [
        "Ancient Bullet Frenzy -- The Sequel", // After Medicinal Herb
        10,
        "Belagunder in the Rastini Mines",
        SetBit(0x2501c6, 0) && SetBit(0x250441, 0),
        [StringCompare(Ys2LocationRef, Ys2RastiniMines)]
    ],
    [
        "Cirno's New Pet", // After Mirror of Illusions
        10,
        "Tyalmath in the Noltia Ice Walls",
        SetBit(0x2501c7, 0) && SetBit(0x250441, 0),
        [StringCompare(Ys2LocationRef, Ys2NoltiaIceWall)]
    ],
    [
        "Take Care Of Your Teeth Folks", // After Escort Mission
        10,
        "Gelaldy in Burnedbless",
        SetBit(0x2501c8, 0) && SetBit(0x250441, 0),
        [StringCompare(Ys2LocationRef, Ys2Burnedbless)]
    ],
    [
        "Why Must It Always Be Spiders?", // After Silver Pendant
        10,
        "Druegar in Temple: Hadal",
        SetBit(0x2501c9, 0) && SetBit(0x250441, 0),
        [StringCompare(Ys2LocationRef, Ys2TempleHadal)]
    ],
    [
        "Koakuma Would Be Impressed", // After Falcon Statue
        25,
        "Zava in the Bell Tower",
        SetBit(0x2501ca, 0) && SetBit(0x250441, 0),
        [StringCompare(Ys2LocationRef, Ys2BellTower)]
    ],
    [
        "Edna Says No Capes!", // After Cleria Armor
        10,
        "Duless in the Temple Underpass",
        SetBit(0x2501cb, 0) && SetBit(0x250441, 0),
        [StringCompare(Ys2LocationRef, Ys2Underpass)]
    ],
    [
        "Cursing The Cursed Curse Word", // After Cleria Armor
        25,
        "Dahm in the Dark Pearl Throne",
        SetBit(0x2501cc, 0) && SetBit(0x250441, 0),
        [StringCompare(Ys2LocationRef, Ys2DarkThrone)]
    ],
]

for i in Ys2BossData {
    Ys2SimpleCheevo(i[0], i[1], i[2], i[3], i[4], "Defeat the boss")
}

Ys2SellData = [
    [
        "We're Having A Sale!", // After Evil Mask
        5,
        "Iron Ore to Guido",
        ClearBit(0x2505ea, 0) && Ys2EarnedGold(3000),
        [StringCompare(Ys2LocationRef, Ys2GuidoArmory)]
    ]
]

for i in Ys2SellData {
    Ys2SimpleCheevo(i[0], i[1], i[2], i[3], i[4], "Sell the")
}

// Use this after Tovah Treated Well
Ys2SimpleCheevo(
    "Smarter Than A Dwarf In A Fortress",
    3,
    "Mattock to free Dr. Fleah",
    SetBit(0x2502ae, 1) && ClearBit(0x2502ae, 0),
    [StringCompare(Ys2LocationRef, Ys2RastiniMines)],
    "Use the"
)

achievement(
    title = "Cataloguing Book 2",
    points = 25,
    description = "[Ys 2] Complete the Time Attack.",
    trigger = Ys2TimeAttack && StringCompare(Ys2LocationRef, Ys2DarkThrone) &&
        byte(0x2501cc) > prev(byte(0x2501cc))
)

// Leaderboards

function TimeAttackLeaderboard(game, name, base) {
    leaderboard(
        title = format("{0} Time Attack", name),
        description = "Beat the boss or die trying!",
        start = game && prev(dword(base)) == 0 &&
            __ornext(byte(base) != 0 || byte(base + 1) != 0 || byte(base + 2) != 0 ||
            byte(base + 3) != 0),
        cancel = always_false(),
        submit = always_true(),
        value = byte(base) * 216000 + byte(base + 1) * 3600 +
            byte(base + 2) * 60 + byte(base + 3),
        format = "FRAMES",
        lower_is_better = true
    )
}

function Ys1TimeAttackLeaderboard(name, base) {
    TimeAttackLeaderboard(Ys1TimeAttack && Ys1CurHp > 0, name, base)
}

Ys1TimeAttackLeaderboard("Jenocres", 0x296f98)
Ys1TimeAttackLeaderboard("Nygtilger", 0x296f9c)
Ys1TimeAttackLeaderboard("Petrorex", 0x296fa0)
Ys1TimeAttackLeaderboard("Vagullion", 0x296fa4)
Ys1TimeAttackLeaderboard("Pictimos", 0x296fa8)
Ys1TimeAttackLeaderboard("Khonsclard", 0x296fac)
Ys1TimeAttackLeaderboard("Yogrex and Omrgun", 0x296fb0)
Ys1TimeAttackLeaderboard("Dark Fact", 0x296fb4)


function Ys2TimeAttackLeaderboard(name, base) {
    TimeAttackLeaderboard(Ys2TimeAttack && Ys2CurHp > 0, name, base)
}

Ys2TimeAttackLeaderboard("Belagunder", 0x248ff4)
Ys2TimeAttackLeaderboard("Tyalmath", 0x248ff8)
Ys2TimeAttackLeaderboard("Gelaldy", 0x248ffc)
Ys2TimeAttackLeaderboard("Druegar", 0x249000)
Ys2TimeAttackLeaderboard("Zava", 0x249004)
Ys2TimeAttackLeaderboard("Duless", 0x249008)
Ys2TimeAttackLeaderboard("Dahm", 0x24900c)

// Rich Presence

RpYs1Loc0 = rich_presence_macro("ASCIIChar", byte(0x2984f0))
RpYs1Loc1 = rich_presence_macro("ASCIIChar", byte(0x2984f1))
RpYs1Loc2 = rich_presence_macro("ASCIIChar", byte(0x2984f2))
RpYs1Loc3 = rich_presence_macro("ASCIIChar", byte(0x2984f3))
RpYs1Loc4 = rich_presence_macro("ASCIIChar", byte(0x2984f4))
RpYs1Loc5 = rich_presence_macro("ASCIIChar", byte(0x2984f5))
RpYs1Loc6 = rich_presence_macro("ASCIIChar", byte(0x2984f6))
RpYs1Loc7 = rich_presence_macro("ASCIIChar", byte(0x2984f7))
RpYs1Loc8 = rich_presence_macro("ASCIIChar", byte(0x2984f8))
RpYs1Loc9 = rich_presence_macro("ASCIIChar", byte(0x2984f9))
RpYs1LocA = rich_presence_macro("ASCIIChar", byte(0x2984fa))
RpYs1LocB = rich_presence_macro("ASCIIChar", byte(0x2984fb))
RpYs1LocC = rich_presence_macro("ASCIIChar", byte(0x2984fc))
RpYs1LocD = rich_presence_macro("ASCIIChar", byte(0x2984fd))
RpYs1LocE = rich_presence_macro("ASCIIChar", byte(0x2984fe))
RpYs1LocF = rich_presence_macro("ASCIIChar", byte(0x2984ff))
RpYs1LocG = rich_presence_macro("ASCIIChar", byte(0x298500))

RpYs2Loc0 = rich_presence_macro("ASCIIChar", byte(0x24ac88))
RpYs2Loc1 = rich_presence_macro("ASCIIChar", byte(0x24ac89))
RpYs2Loc2 = rich_presence_macro("ASCIIChar", byte(0x24ac8a))
RpYs2Loc3 = rich_presence_macro("ASCIIChar", byte(0x24ac8b))
RpYs2Loc4 = rich_presence_macro("ASCIIChar", byte(0x24ac8c))
RpYs2Loc5 = rich_presence_macro("ASCIIChar", byte(0x24ac8d))
RpYs2Loc6 = rich_presence_macro("ASCIIChar", byte(0x24ac8e))
RpYs2Loc7 = rich_presence_macro("ASCIIChar", byte(0x24ac8f))
RpYs2Loc8 = rich_presence_macro("ASCIIChar", byte(0x24ac90))
RpYs2Loc9 = rich_presence_macro("ASCIIChar", byte(0x24ac91))
RpYs2LocA = rich_presence_macro("ASCIIChar", byte(0x24ac92))
RpYs2LocB = rich_presence_macro("ASCIIChar", byte(0x24ac93))
RpYs2LocC = rich_presence_macro("ASCIIChar", byte(0x24ac94))
RpYs2LocD = rich_presence_macro("ASCIIChar", byte(0x24ac95))
RpYs2LocE = rich_presence_macro("ASCIIChar", byte(0x24ac96))
RpYs2LocF = rich_presence_macro("ASCIIChar", byte(0x24ac97))
RpYs2LocG = rich_presence_macro("ASCIIChar", byte(0x24ac98))

RpAscii = "{0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11}{12}{13}{14}{15}{16}"

DiffLookup = {
    1: "Very Easy",
    2: "Easy",
    3: "Normal",
    4: "Nightmare"
}

RpYs1Diff = rich_presence_lookup("Diff", Ys1Difficulty, DiffLookup)
RpYs2Diff = rich_presence_lookup("Diff", Ys2Difficulty, DiffLookup)

rich_presence_conditional_display(
    Ys1 && Ys1CurHp == 0,
    "[Ys 1] Adol is preparing for his journey."
)

rich_presence_conditional_display(
    Ys1TimeAttack,
    "[Ys 1] [Time Attack] At " + RpAscii + ": {17}/{18} HP",
    RpYs1Loc0,
    RpYs1Loc1,
    RpYs1Loc2,
    RpYs1Loc3,
    RpYs1Loc4,
    RpYs1Loc5,
    RpYs1Loc6,
    RpYs1Loc7,
    RpYs1Loc8,
    RpYs1Loc9,
    RpYs1LocA,
    RpYs1LocB,
    RpYs1LocC,
    RpYs1LocD,
    RpYs1LocE,
    RpYs1LocF,
    RpYs1LocG,
    rich_presence_macro("Number", Ys1CurHp),
    rich_presence_macro("Number", Ys1MaxHp)
)

rich_presence_conditional_display(
    Ys1 && byte(0x2984f0) != 0,
    "[Ys 1] [{19}] At " + RpAscii + ": {17}/{18} HP",
    RpYs1Loc0,
    RpYs1Loc1,
    RpYs1Loc2,
    RpYs1Loc3,
    RpYs1Loc4,
    RpYs1Loc5,
    RpYs1Loc6,
    RpYs1Loc7,
    RpYs1Loc8,
    RpYs1Loc9,
    RpYs1LocA,
    RpYs1LocB,
    RpYs1LocC,
    RpYs1LocD,
    RpYs1LocE,
    RpYs1LocF,
    RpYs1LocG,
    rich_presence_macro("Number", Ys1CurHp),
    rich_presence_macro("Number", Ys1MaxHp),
    RpYs1Diff
)

rich_presence_conditional_display(
    Ys1,
    "[Ys 1] Likely On Menus"
)

rich_presence_conditional_display(
    Ys2 && Ys2CurHp == 0,
    "[Ys 2] Adol is preparing for his journey."
)

rich_presence_conditional_display(
    Ys2TimeAttack,
    "[Ys 2] [Time Attack] At " + RpAscii + ": {17}/{18} HP",
    RpYs2Loc0,
    RpYs2Loc1,
    RpYs2Loc2,
    RpYs2Loc3,
    RpYs2Loc4,
    RpYs2Loc5,
    RpYs2Loc6,
    RpYs2Loc7,
    RpYs2Loc8,
    RpYs2Loc9,
    RpYs2LocA,
    RpYs2LocB,
    RpYs2LocC,
    RpYs2LocD,
    RpYs2LocE,
    RpYs2LocF,
    RpYs2LocG,
    rich_presence_macro("Number", Ys2CurHp),
    rich_presence_macro("Number", Ys2MaxHp)
)

rich_presence_conditional_display(
    Ys2 && byte(0x24ac88) != 0,
    "[Ys 2] [{19}] At " + RpAscii + ": {17}/{18} HP",
    RpYs2Loc0,
    RpYs2Loc1,
    RpYs2Loc2,
    RpYs2Loc3,
    RpYs2Loc4,
    RpYs2Loc5,
    RpYs2Loc6,
    RpYs2Loc7,
    RpYs2Loc8,
    RpYs2Loc9,
    RpYs2LocA,
    RpYs2LocB,
    RpYs2LocC,
    RpYs2LocD,
    RpYs2LocE,
    RpYs2LocF,
    RpYs2LocG,
    rich_presence_macro("Number", Ys2CurHp),
    rich_presence_macro("Number", Ys2MaxHp),
    RpYs2Diff
)

rich_presence_conditional_display(
    Ys2,
    "[Ys 2]"
)

rich_presence_display(
    "Studying up on the Legacy of Ys"
)

