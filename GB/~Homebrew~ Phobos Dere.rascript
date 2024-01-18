// ~Homebrew~ Phobos Dere .GB
// #ID = 22395

PosX = word(0xc0ac)
PosY = word(0xc0ae)

Location = byte(0xc6b0)

LocMuseum = "at the hanging gardens museum"
LocDungeon = "in the underground dungeon"
LocApartment = "in the apartment"
LocForest = "in the forest"
LocCity = "in the city"
LocTower = "in the museum tower"
LocPC = "using the PC"
LocFish = "at the fishing hole"
LocMansion = "in the mansion lab"

LocationLookup = {
    0x02: LocApartment,
    0x03: LocMuseum,
    0x04: LocMuseum,
    0x05: LocMuseum,
    0x06: LocMuseum,
    0x07: LocMuseum,
    0x08: LocMuseum,
    0x0a: LocMuseum,
    0x0b: LocMuseum,
    0x0c: "wandering as a spirit",
    0x0d: LocPC,
    0x0e: LocPC,
    0x0f: LocDungeon,
    0x10: LocPC,
    0x11: LocApartment,
    0x12: LocApartment,
    0x13: LocApartment,
    0x14: LocApartment,
    0x15: LocApartment,
    0x16: LocApartment,
    0x17: LocPC,
    0x18: LocPC,
    0x19: LocPC,
    0x1a: LocDungeon,
    0x1b: "dealing with technical support",
    0x1c: LocMuseum,
    0x1e: LocMuseum,
    0x27: LocMuseum,
    0x28: LocMuseum,
    0x29: LocMuseum,
    0x2a: LocMuseum,
    0x2b: LocMuseum,
    0x2d: LocDungeon,
    0x2e: LocDungeon,
    0x2f: LocFish,
    0x30: LocFish,
    0x32: LocFish,
    0x33: LocFish,
    0x34: LocForest,
    0x35: LocForest,
    0x36: LocDungeon,
    0x37: "dealing with technical support",
    0x38: "dealing with technical support",
    0x39: "dealing with technical support",
    0x3a: "dealing with technical support",
    0x3b: "dealing with technical support",
    0x3c: LocPC,
    0x3d: LocPC,
    0x3e: LocPC,
    0x3f: LocPC,
    0x40: LocPC,
    0x41: LocPC,
    0x42: LocPC,
    0x44: LocPC,
    0x46: "at home (outside)",
    0x47: LocFish,
    0x48: "at home (inside)",
    0x49: LocForest,
    0x4a: LocForest,
    0x4b: LocForest,
    0x4c: LocForest,
    0x4d: LocForest,
    0x50: LocMuseum,
    0x51: LocMuseum,
    0x52: LocForest,
    0x53: LocForest,
    0x54: LocForest,
    0x55: LocForest,
    0x56: LocForest,
    0x57: LocForest,
    0x58: LocForest,
    0x59: LocForest,
    0x5a: LocForest,
    0x5b: LocForest,
    0x5c: LocPC,
    0x5d: "at home (inside)",
    0x5e: LocForest,
    0x5f: LocForest,
    0x60: LocForest,
    0x61: LocCity, // "in the sewer",
    0x62: LocCity, // "in the sewer",
    0x63: LocCity, // "in the sewer",
    0x64: LocMuseum,
    0x65: LocForest,
    0x66: LocMuseum,
    0x67: LocForest,
    0x68: LocForest,
    0x69: LocPC,
    0x6a: LocPC,
    0x6c: LocCity, // "in the sewer",
    0x6d: LocForest,
    0x6f: LocPC,
    0x70: LocCity, // "in a vent",
    0x71: LocMansion,
    0x72: LocMansion,
    0x73: LocMansion,
    0x74: LocMansion,
    0x75: LocMansion,
    0x76: LocMansion,
    0x77: LocMansion,
    0x78: LocMansion,
    0x79: LocMansion,
    0x7a: LocMansion,
    0x7b: LocPC,
    0x7c: LocMuseum,
    0x7d: LocMuseum,
    0x7e: LocMuseum,
    0x7f: LocMuseum,
    0x80: LocCity,
    0x81: LocCity,
    0x82: LocCity,
    0x83: LocCity,
    0x84: LocCity,
    0x85: LocCity,
    0x86: LocCity,
    0x87: LocCity,
    0x88: LocCity,
    0x89: LocCity,
    0x8a: LocCity,
    0x8b: LocCity, // "in a vent",
    0x8d: LocCity,
    0x8e: LocCity,
    0x8f: LocCity,
    0x90: LocCity,
    0x91: LocPC,
    0x92: LocPC,
    0x93: LocCity,
    0x94: LocCity,
    0x95: LocCity,
    0x96: LocCity,
    0x97: LocCity,
    0x99: LocTower,
    0x9a: LocTower,
    0x9c: LocTower,
    0x9d: LocMuseum,
    0x9e: LocCity,
    0x9f: LocTower,
    0xa1: LocTower,
    0xa2: LocDungeon,
    0xa3: LocForest,
    0xa4: LocTower,
    0xa5: LocTower,
    0xa6: LocTower,
    0xa7: LocTower,
    0xa8: LocTower,
    0xa9: LocTower,
    0xaa: "outside",
    0xab: LocPC,
    0xac: LocTower,
    0xad: LocTower,
    0xae: LocTower,
    0xaf: "outside",
    0xb0: "outside",
    0xb2: LocTower,
    0xb3: "being sacrificed",
    0xb4: "being sacrificed",
    0xb5: "being sacrificed",
    0xb6: "being sacrificed",
    0xb8: LocForest,
    0xb7: "at the market",
    
}

Days = byte(0xcd54)
Seeds = byte(0xcd57)
Crops = byte(0xcd58)
Bait = byte(0xcd60)
Fish = byte(0xcd62)
Coins = byte(0xcd64)
FoodPacks = byte(0xcd6f)
GameStarted = bit0(0xcd75) == 1

// achievements

achievement(
    title = "Sleeping With The Fishes",
    points = 2,
    description = "Reach the bottom of the fishing hole.",
    trigger = GameStarted && byte(0xcd21) == 6 && 
        prev(Location) == 0x30 && Location == 0x32
)

achievement(
    title = "Welcoming Our Soul Overlords",
    points = 2,
    description = "Find and touch the one watching over your body.",
    trigger = GameStarted && Location == 0x0c &&
        PosX <= 0x20 && PosY <= 0x20 &&
        __ornext(prev(PosX) > 0x20 || prev(PosY) > 0x20)
)

achievement(
    title = "What's In This Dish Anyway?",
    points = 3,
    description = "Cook a meal for yourself.",
    trigger = GameStarted && Location == 0x48 &&
        FoodPacks + 1 == prev(FoodPacks)
)

achievement(
    title = "It's A Living",
    points = 3,
    description = "Grow your own corn.",
    trigger = GameStarted && Location == 0x48 &&
        Days > prev(Days) &&
        (
            byte(0xcd55) > prior(byte(0xcd55)) && byte(0xcd55) == 4 ||
            byte(0xcd59) > prior(byte(0xcd59)) && byte(0xcd59) == 4 ||
            byte(0xcd5b) > prior(byte(0xcd5b)) && byte(0xcd5b) == 4
        )
)

achievement(
    title = "Teaching Versus Giving",
    points = 5,
    description = "Purchase a fishing pole.",
    trigger = GameStarted && Location == 0xb7 &&
        bit0(0xcd65) > prev(bit0(0xcd65))
)

achievement(
    title = "Gravity Falls? That Wood Be Silly.",
    points = 4,
    description = "Experience gravity while in the forest.",
    trigger = GameStarted && Location == 0x59 && bit0(0xcd26) == 1 &&
        __ornext(prev(Location) == 0x58 || prev(bit0(0xcd26)) == 0)
)

achievement(
    title = "That's One Way To Leave...Or Enter",
    points = 4,
    description = "Get out of the forest.",
    trigger = GameStarted && prev(Location) == 0x70 && Location == 0x78
)

achievement(
    title = "You Have Urned This",
    points = 4,
    description = "Turn in the 3 urns to the...eccentric old man.",
    trigger = GameStarted && 
        measured(byte(0xcd78) == 3, when=Location == 0x74) &&
        bit0(0xcd7b) > prev(bit0(0xcd7b))
)

achievement(
    title = "Article 'Bout Continuity",
    points = 3,
    description = "Learn about the PROTO DERE researchers.",
    trigger = GameStarted &&
        __ornext(Location == 0x80 || Location == 0x9e) &&
        bit0(0xcd80) > prev(bit0(0xcd80))
)

achievement(
    title = "A Small Piece Of Purrfection",
    points = 2,
    description = "Pet the cat.",
    trigger = GameStarted && Location == 0x88 &&
        bit0(0xcd87) > prev(bit0(0xcd87))
)

achievement(
    title = "That Was Bull-et",
    points = 4,
    description = "Meet Sara before her untimely demise.",
    trigger = GameStarted && Location == 0x96 &&
        prev(Location) == 0x95
)

achievement(
    title = "NPCs Are Key",
    points = 4,
    description = "Locate and acquire the ceremony key.",
    trigger = GameStarted && Location == 0x07 && bit0(0xccee) > prev(bit0(0xccee))
)

achievement(
    title = "An Eye For An Eye",
    points = 4,
    description = "Locate and acquire an eye.",
    trigger = GameStarted && Location == 0x09 && bit0(0xccfc) > prev(bit0(0xccfc))
)

achievement(
    title = "Testing The Limits",
    points = 5,
    description = "Start being tested...as if you weren't already.",
    trigger = GameStarted && Location == 0x7f && bit0(0xcd50) > prev(bit0(0xcd50))
)

achievement(
    title = "Light As A Feather",
    points = 5,
    description = "Obtain the feather from the locked chest.",
    trigger = GameStarted && Location == 0x66 && bit0(0xcd39) > prev(bit0(0xcd39))
)

achievement(
    title = "My Beating Heart",
    points = 5,
    description = "Obtain the heart from the locked chest.",
    trigger = GameStarted && Location == 0x64 && bit0(0xcd37) > prev(bit0(0xcd37))
)

achievement(
    title = "This Feels Familiar",
    points = 5,
    description = "Using the PC, head back to a familiar location.",
    trigger = GameStarted && Location == 0x48 && prev(Location) == 0x10
)

achievement(
    title = "Not This Again",
    points = 10,
    description = "Reach the end of the forest. Again.",
    trigger = GameStarted && 
        prior(Location) == 0xa3 && Location == 0x1a &&
        PosY >= 0x3a8 && prev(PosY) < 0x3a8
)

achievement(
    title = "Enough Mind Rot For Now",
    points = 5,
    description = "Finish using the computer.",
    trigger = GameStarted &&
        prev(Location) == 0x69 && Location == 0x11
)

achievement(
    title = "Where's The Dog?",
    points = 5,
    description = "Take out 16 fairies in Fairy Hunt.",
    trigger = GameStarted &&
        Location == 0x44 && byte(0xcd0c) == 1 &&
        prev(byte(0xcd0d)) == 5 && byte(0xcd0d) == 6 &&
        byte(0xcd0f) != 0
)

achievement(
    title = "Well, That Was Quick",
    points = 5,
    description = "Win at Pong, best 2 out of 3.",
    trigger = GameStarted && Location >= 0x41 && Location <= 0x42 &&
        byte(0xcce4) == 2 && prev(byte(0xcce4)) == 1
)

achievement(
    title = "Back To Reality",
    points = 5,
    description = "Finish using the computer. For real this time.",
    trigger = GameStarted && Location == 0x05 && prev(Location) == 0x51 &&
        bit0(0xcd43) > prev(bit0(0xcd43))
)

achievement(
    title = "Body For A Body",
    points = 10,
    description = "Get outside after the last sacrifice.",
    trigger = GameStarted && Location == 0xaf && prev(Location) == 0xae &&
        bit0(0xcd4d) == 0
)

achievement(
    title = "Soul For A Soul",
    points = 10,
    description = "Get outside after flagging down technical support.",
    trigger = GameStarted && Location == 0x1e && prev(Location) == 0x05 &&
        bit0(0xcd4b) == 1
)

// RP

EmojiCrops = "🌽"
EmojiFish = "🐟"
EmojiFood = "🥫"
EmojiSeed = "🥒"
EmojiBait = "🐛"
EmojiCoins = "💰"
EmojiDays = "📅"

rich_presence_conditional_display(
    !GameStarted,
    "Horror...gulp."
)

rich_presence_conditional_display(
    GameStarted,
    "Currently {0}. {1}{2} {3}{4} {5}{6} {7}{8} {9}{10} {11}{12} {13}{14}",
    rich_presence_lookup("Loc", Location, LocationLookup, "somewhere mysterious"),
    EmojiCrops,
    rich_presence_macro("Number", Crops),
    EmojiFish,
    rich_presence_macro("Number", Fish),
    EmojiFood,
    rich_presence_macro("Number", FoodPacks),
    EmojiSeed,
    rich_presence_macro("Number", Seeds),
    EmojiBait,
    rich_presence_macro("Number", Bait),
    EmojiCoins,
    rich_presence_macro("Number", Coins),
    EmojiDays,
    rich_presence_macro("Number", Days)
)

rich_presence_display("Welcome to PHOBOS DERE")
