// King's Quest: Quest for the Crown
// #ID = 9996

ScreenId = byte(0x23f)

Died = bit0(0x433) > prev(bit0(0x433))

DialogId = word(0x12b6)
Score = byte(0x127c)

IGT = tbyte(0x1218)

achievement(
    title = "Respect Your Elders",
    points = 2,
    description = "Bow to your king.",
    trigger = ScreenId == 0x35 && DialogId == 0x114 &&
        prev(Score) + 3 == Score
)

achievement(
    title = "Rocking A New Weapon",
    points = 3,
    description = "Locate a small weapon near a rock.",
    trigger = ScreenId == 0x03 && bit0(0x124b) > prev(bit0(0x124b))
)

achievement(
    title = "Getting Boulder [m]",
    points = 1,
    description = "Get crushed by the rock.",
    trigger = ScreenId == 0x03 && Died && byte(0x7b) <= 0x7f
)

achievement(
    title = "This Quest Won't Be Over Easy",
    points = 4,
    description = "Get a golden egg from a nest.",
    trigger = ScreenId == 0x3f && bit0(0x1258) > prev(bit0(0x1258))
)

achievement(
    title = "Carrot Patch Kid",
    points = 3,
    description = "Get a carrot from the garden.",
    trigger = ScreenId >= 0x0f && ScreenId <= 0x10 && 
        bit0(0x1254) > prev(bit0(0x1254))
)

achievement(
    title = "The First Of Many Rings Across The Series",
    points = 4,
    description = "Get a ring from an elf.",
    trigger = ScreenId == 0x12 && bit0(0x1252) > prev(bit0(0x1252))
)

achievement(
    title = "No Strikes On This One",
    points = 3,
    description = "Get a bowl while exploring the world.",
    trigger = ScreenId == 0x1f && bit0(0x125a) > prev(bit0(0x125a))
)

achievement(
    title = "Aww Nuts",
    points = 3,
    description = "Get a walnut filled with gold.",
    trigger = ScreenId == 0x1e && bit0(0x1256) > prev(bit0(0x1256))
)

achievement(
    title = "Barney, My Pebbles!",
    points = 3,
    description = "Get some pebbles. They aren't fruity or cocoa though.",
    trigger = ScreenId == 0x22 && bit0(0x125b) > prev(bit0(0x125b))
)

achievement(
    title = "Treasure Here? I'm Stumped!",
    points = 4,
    description = "Get a pouch with treasure inside.",
    trigger = ScreenId == 0x06 && bit0(0x1253) > prev(bit0(0x1253))
)

achievement(
    title = "Do You Feel Lucky?",
    points = 3,
    description = "Get a four leaf clover.",
    trigger = ScreenId == 0x18 && bit0(0x1261) > prev(bit0(0x1261))
)

achievement(
    title = "Because I Don't Feel Lucky",
    points = 1,
    description = "Get a common clover.",
    trigger = ScreenId == 0x18 && bit0(0x1259) > prev(bit0(0x1259))
)

achievement(
    title = "Oh Bucket",
    points = 4,
    description = "Get the bucket from the well.",
    trigger = ScreenId == 0x0c && bit0(0x124c) > prev(bit0(0x124c))
)

achievement(
    title = "Reflecting On Prophecy",
    points = 10,
    description = "Get the Magic Mirror from the Dragon.",
    trigger = ScreenId == 0x33 && bit0(0x124f) > prev(bit0(0x124f))
)

achievement(
    title = "I'm So Hungry...",
    points = 3,
    description = "Eat the witch's house. Or at least, a wall or something.",
    trigger = ScreenId == 0x1c && DialogId == 0x51b
)

achievement(
    title = "Well Done Indeed [m]",
    points = 1,
    description = "Join the Witch for dinner. ...wait a second.",
    trigger = ScreenId == 0x41 && Died
)

achievement(
    title = "Witch Way Is The Best?",
    points = 10,
    description = "Defeat the Witch in her own house.",
    trigger = ScreenId == 0x41 && DialogId == 0x317 &&
        prior(Score) + 7 == Score
)

achievement(
    title = "Note: Some Cheevos Can Stink",
    points = 4,
    description = "Get both the note and the cheese from the Witch's house.",
    trigger = ScreenId == 0x41 &&
        (bit0(0x125f) + bit0(0x125d) == 2) &&
        (prev(bit0(0x125f)) + prev(bit0(0x125d)) == 1)
)

achievement(
    title = "That Plan Was Not Awash",
    points = 5,
    description = "Prevent future toll trolls for the folks in Daventry.",
    trigger = __ornext(ScreenId == 0x19 || ScreenId == 0x27 || ScreenId == 0x29) &&
        DialogId == 0x619 && prior(Score) + 4 == Score
)

achievement(
    title = "How Is THIS Backwards? [m]",
    points = 10,
    description = "Get the magic beans from the gnome.",
    trigger = ScreenId == 0x28 && DialogId == 0x31b &&
        prior(Score) + 6 == Score
)

achievement(
    title = "Taking Aim",
    points = 4,
    description = "Get the slingshot in the land of the clouds.",
    trigger = ScreenId == 0x3e && bit0(0x1260) > prev(bit0(0x1260))
)

achievement(
    title = "The Bigger They Are... [m]",
    points = 5,
    description = "Take the initiative, and defeat the giant directly.",
    trigger = ScreenId == 0x3a && prev(Score) + 3 == Score
)

achievement(
    title = "The Giant Abreast A Chest",
    points = 10,
    description = "Get the magic chest full of gold.",
    trigger = ScreenId == 0x3a && DialogId == 0x212 &&
        prev(Score) + 8 == Score
)

achievement(
    title = "Food For Fiddle",
    points = 5,
    description = "Obtain the fiddle from the starving couple.",
    trigger = ScreenId == 0x4f && DialogId == 0x20c &&
        prior(Score) + 3 == Score
)

achievement(
    title = "Fairy Rare Encounter",
    points = 3,
    description = "Obtain temporary protection from the fairy.",
    trigger = ScreenId == 0x09 && word(0x1223) == 0x1c20 &&
        prev(word(0x1223)) == 0
)

achievement(
    title = "Rhythm And Music Not Required",
    points = 5,
    description = "Get on the condor.",
    trigger = ScreenId == 0x16 &&
        prev(Score) + 3 == Score
)

achievement(
    title = "Not Mushroom For Arguing",
    points = 3,
    description = "Get the moist mushroom.",
    trigger = ScreenId == 0x2f && DialogId == 0x20f && 
        prior(Score) + 1 == Score
)

achievement(
    title = "Aww Rats [m]",
    points = 4,
    description = "Deal with the rat without giving up your treasures.",
    trigger = ScreenId == 0x4b && DialogId == 0x21b &&
        prior(Score) + 2 == Score
)

achievement(
    title = "Irish Jig [m]",
    points = 4,
    description = "Make the Leprechauns happy before picking up the shield.",
    trigger = ScreenId == 0x4c && DialogId == 0x218 &&
        prior(Score) + 3 == Score
)

achievement(
    title = "Caution: Does Not Protect Against Bad Sequels",
    points = 10,
    description = "Get the Magic Shield from the Leprechaun King.",
    trigger = ScreenId == 0x4d && byte(0x124e) > prev(byte(0x124e)) &&
        prev(Score) + 6 == Score
)

achievement(
    title = "Long Live King Graham!",
    points = 10,
    description = "Bring all three treasures back to Castle Daventry.",
    trigger = ScreenId == 0x35 && DialogId == 0x31a
)

achievement(
    title = "Daventry Is Prosperous",
    points = 25,
    description = "Beat the game with 125 score.",
    trigger = ScreenId == 0x35 && DialogId == 0x31a && Score == 125
)

// Leaderboards

leaderboard(
    title = "Any% Single Session",
    description = "Start a new game and beat it without a game over.",
    start = ScreenId == 1 && prev(ScreenId) == 0 &&
        prev(Score) == 0 && Score == 0,
    cancel = ScreenId == 0 || Died,
    submit = ScreenId == 0x35 && DialogId == 0x31a,
    value = measured(IGT != prev(IGT)),
    lower_is_better = true,
    format = "FRAMES"
)

// RP

EmojiCheck = "✔️"
EmojiNothing = "❌"

ItemLookup = {
    0: EmojiNothing,
    1: EmojiCheck
}

screenLookup = {
    0x0: "Main Menu",
    0x1: "Castle",
    0x2: "Castle",
    0x3: "Rocks",
    0x4: "Serene Lake East",
    0x5: "Serene Lake West",
    0x6: "Log & Stump",
    0x7: "Beautiful Lake East",
    0x8: "Exploring",
    0x9: "Fairy Rare Encounter",
    0xa: "Goat Pen",
    0xb: "Eventual Goat Pen",
    0xc: "Well",
    0xd: "Wolf's Den",
    0xe: "Great Tree",
    0xf: "Garden",
    0x10: "Garden",
    0x11: "East Clear Lake",
    0x12: "West Clear Lake",
    0x13: "Mountain Door",
    0x14: "Crystal Lake",
    0x15: "South Dark Forest",
    0x16: "Dragon's Lair Exit",
    0x17: "Exploring",
    0x18: "Clover Patch",
    0x19: "South Troll Bridge",
    0x1a: "East River Bend",
    0x1b: "Bird Tree",
    0x1c: "Witch House",
    0x1d: "East Dark Forest",
    0x1e: "Walnut Tree",
    0x1f: "South Plains",
    0x20: "South River Bend",
    0x21: "River Fork",
    0x22: "West River Bend",
    0x23: "Gloomy Clearing South",
    0x24: "Boulder Cave",
    0x25: "Swampy Lake",
    0x26: "Meadow",
    0x27: "East Troll Bridge",
    0x28: "Gnome's Dwelling",
    0x29: "North Troll Bridge",
    0x2a: "Stone Bridge",
    0x2b: "Huge Clear Lake",
    0x2c: "Log House West",
    0x2d: "Log House East",
    0x2e: "Gloomy Clearing North",
    0x2f: "River by Castle Daventry",
    0x30: "Clearing",
    0x31: "",
    0x32: "Dragon's Lair",
    0x33: "Dragon's Lair",
    0x34: "Well",
    0x35: "Castle Throne Room",
    0x36: "Castle Entryway",
    0x37: "",
    0x38: "Land of the Clouds",
    0x39: "Land of the Clouds",
    0x3a: "Land of the Clouds",
    0x3b: "Land of the Clouds",
    0x3c: "Land of the Clouds",
    0x3d: "Land of the Clouds",
    0x3e: "Land of the Clouds",
    0x3f: "Large Tree",
    0x40: "",
    0x41: "Witch's House Interior",
    0x42: "Caverns to the Clouds",
    0x43: "",
    0x44: "Caverns to the Clouds",
    0x45: "Caverns to the Clouds",
    0x46: "Climbing the Beanstalk",
    0x47: "Climbing the Beanstalk",
    0x48: "Land of the Clouds",
    0x49: "Leprechaun Cave",
    0x4a: "Leprechaun Cave",
    0x4b: "Leprechaun Cave",
    0x4c: "Leprechaun Cave",
    0x4d: "Leprechaun Cave",
    0x4e: "Leprechaun Cave",
    0x4f: "Log House",
    0x50: "",
    0x51: "",
    0x52: "",
    0x53: "",
    0x54: "",
    0x55: "",
    0x56: "",
    0x57: "",
    0x58: "",
    0x59: "",
    0x5a: "",
    0x5b: "",
    0x5c: "",
    0x5d: "",
    0x5e: "",
    0x5f: "",
    0x60: "",
}

rich_presence_display("------ {0} ------ Score={1} Shield={2} Mirror={3} Treasure={4}",
    rich_presence_lookup("screen", byte(0x00023F), screenLookup),
    rich_presence_value("Score", byte(0x00127C)),
    rich_presence_lookup("Item", bit0(0x124e), ItemLookup),
    rich_presence_lookup("Item", bit0(0x124f), ItemLookup),
    rich_presence_lookup("Item", bit0(0x1250), ItemLookup)
)
