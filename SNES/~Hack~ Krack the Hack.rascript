// ~Hack~ Krack The Hack
// #ID = 22846

Lives = byte(0xdbe)
Coins = byte(0xdbf)
Score = tbyte(0xf34)
MusicId = byte(0x0dda)
LevelId = byte(0x13bf)
MessageBox = byte(0x1426)
PlayerX = word(0x94)

InOverworld = byte(0x100) >= 0x0b && byte(0x100) <= 0x0f

function SameMusic(val) {
    return MusicId == val && prev(MusicId) == val
}

function FinishMusic(val) {
    return MusicId == 0x10 && prev(MusicId) == val
}

function DeathMusic(val) {
    return MusicId == 0x1c && prev(MusicId) == val
}

LevelLookup = {
    0x25: "Bowser's Basement",
    0x26: "Basin Bottoms",
    0x27: "Snowpeak Storms",
    0x29: "Highlight Heavens",
    0x06: "Castle Keytastrophe",
    0x2a: "Lavalamp Lake",
    0x2b: "Cave-Mine Corridors",
    0x2d: "Climbfall Cleanse",
    0x05: "Yoshi's Cabin",
    0x2e: "House of the Hollow",
    0x2f: "King Bowser's Keep",
    0x04: "The Secret Palace",
    0x30: "YUMPalovania",
    0x07: "???",
    0x31: "Juxtapositionarian",
    0x28: "Sokobansolvermanianicazen Sins"
}

// Cheevos

BuiltInCheevoData = {
    0x00: {
        "title": "Which Policy Do You Subscribe To?",
        "points": 3,
        "desc": "Answer all questions truthfully during the interrogation.",
        "trigger": (LevelId == 0 && SameMusic(0x24) && MessageBox == 2),
    },
    0x25: {
        "title": "For Some Definition Of Respect",
        "points": 5,
        "desc": "Clear Bowser's Basement without damaging any enemies.",
        "trigger": (LevelId == 0x25 && FinishMusic(0x2c) && MessageBox == 2)
    },
    0x26: {
        "title": "When In Rome...",
        "points": 5,
        "desc": "In Basin Bottoms, act like a Koopa Troopa.",
        "trigger": (LevelId == 0x26 && SameMusic(0x2e) && MessageBox == 2)
    },
    0x27: {
        "title": "Scroll To The Finish?",
        "points": 5,
        "desc": "In Snowpeak Storms, only grab the final key.",
        "trigger": (LevelId == 0x27 && SameMusic(0x1c) && MessageBox == 2)
    },
    0x29: {
        "title": "So Not The Ground?",
        "points": 5,
        "desc": "Reach the heavens in Highlight Heavens.",
        "trigger": (LevelId == 0x29 && SameMusic(0x30) && MessageBox == 2)
    },
    0x06: {
        "title": "Insert Dragon Ball Meme Here",
        "points": 10,
        "desc": "Go beyond as requested in Castle Keytastrophe.",
        "trigger": (LevelId == 0x06 && SameMusic(0x38) && MessageBox == 2)
    },
    0x2a: {
        "title": "Order Is Everything (If You Are Marina)",
        "points": 5,
        "desc": "In Lavalamp Lake, get the key above the lava lotus last.",
        "trigger": (LevelId == 0x2a && FinishMusic(0x31) && MessageBox == 2)
    },
    0x2b: {
        "title": "I'm-a Wario?",
        "points": 10,
        "desc": "Collect every coin in Cave-Mine Corridors, then finish the level.",
        "trigger": (LevelId == 0x2b && FinishMusic(0x25) && MessageBox == 2)
    },
    0x2d: {
        "title": "Upward And Downward",
        "points": 5,
        "desc": "Collect every key in the first part of Climbfall Cleanse in reverse order.",
        "trigger": (LevelId == 0x2d && SameMusic(0x33) && MessageBox == 2)
    },
    0x05: {
        "title": "Doesn't This Count As Something?",
        "points": 10,
        "desc": "Climb on top of Yoshi's Cabin.",
        "trigger": (LevelId == 0x05 && SameMusic(0x20) && MessageBox == 2 &&
            PlayerX < 0x100)
    },
    0x2e: {
        "title": "...Do As The Locals",
        "points": 5,
        "desc": "Mimic the local pumpkin population in House of the Hollow.",
        "trigger": (LevelId == 0x2e && SameMusic(0x32) && MessageBox == 2 &&
            PlayerX > 0x100 && PlayerX < 0x200)
    },
    0x2f: {
        "title": "Eat Your Cherries Folks",
        "points": 10,
        "desc": "Defeat every clone of Bowser in his keep.",
        "trigger": (LevelId == 0x2f && SameMusic(0x36) && MessageBox == 2)
    },
    0x04: {
        "title": "Learning Of Lunacy",
        "points": 10,
        "desc": "Witness Daizo assist you once more in The Secret Palace.",
        "trigger": (LevelId == 0x04 && SameMusic(0x1f) && MessageBox == 2 &&
            PlayerX < 0x20)
    },
    0x30: {
        "title": "The One Run Run",
        "points": 25,
        "desc": "Complete all of YUMPalovania in one life.",
        "trigger": (LevelId == 0x30 && FinishMusic(0x2a) && MessageBox == 2)
    },
    0x31: {
        "title": "Oshiro's Space Cousin?",
        "points": 5,
        "desc": "Spin jump off Jinker in Juxtapositionarian.",
        "trigger": (LevelId == 0x31 && SameMusic(0x27) && MessageBox == 2)
    },
}

function BuiltInCheevo(id) {
    data = BuiltInCheevoData[id]
    achievement(
        title = data["title"],
        points = data["points"],
        description = data["desc"],
        trigger = data["trigger"]
    )
}

for i in BuiltInCheevoData {
    BuiltInCheevo(i)
}

StageClearData = {
    0x25: [0x1ebc, 3, 0x35, "Prison Break"],
    0x26: [0x1ec8, 3, 0x2d, "Bottoms Up"],
    0x27: [0x1ec9, 3, 0x2d, "Let The Storms Rage On"],
    0x29: [0x1ecb, 5, 0x2d, "At Least We Aren't Dining In Hell"],
    0x06: [0x1ea8, 10, 0x2d, "Thank You For The Early Life Buffer"],
    0x2a: [0x1ecc, 5, 0x2d, "The Floor Is Safe...Relatively"],
    0x2b: [0x1ecd, 5, 0x2d, "Forward And Backward"],
    0x2d: [0x1ecf, 5, 0x2d, "Always At Least One Swimming Level"],
    0x05: [0x1ea7, 10, 0x2d, "Not So Happy! Sorry Tim!"],
    0x2e: [0x1ed0, 5, 0x35, "Homes For Some"],
    // AFTER King Bowser's Keep
    0x30: [0x1ed2, 10, 0x28, "No YUMPing Required?"],
    0x31: [0x1ed3, 10, 0x28, "Hacks In Space"],
    0x28: [0x1eca, 25, 0x28, "All The World's A Stage"],
}

function StageClearCheevo(id) {
    data = StageClearData[id]
    achievement(
        title = data[3],
        points = data[1],
        description = format("Clear the stage {0}.", LevelLookup[id]),
        trigger = InOverworld && bit7(data[0]) > prev(bit7(data[0]))
    )
}

for i in StageClearData {
    StageClearCheevo(i)
}

// Bowser's keep (normally after stage clear 0x2e) may have to be coded differently.

achievement(
    title = "Lessons From Wily?",
    description = "Clear the stage King Bowser's Keep.",
    points = 25,
    trigger = LevelId == 0x2f && MusicId == 0x3c && prev(MusicId) == 0x1a
)

MoonData = {
    0x25: [0x1ff2, 2, 5, "Lunacy In The Basement"],
    0x26: [0x1ff2, 1, 5, "Lunacy At The Bottom"],
    0x27: [0x1ff2, 0, 5, "Lunacy In The Storms"],
    0x29: [0x1ff3, 6, 5, "Lunacy In The Heavens"],
    0x06: [0x1fee, 1, 10, "Lunacy In The Castle"],
    0x2a: [0x1ff3, 5, 5, "Lunacy At The Lake"],
    0x2b: [0x1ff3, 4, 5, "Lunacy In The Corridors"],
    0x2d: [0x1ff3, 2, 5, "Lunacy At The Cleansing"],
    0x05: [0x1fee, 2, 10, "Lunacy In The Cabin"],
    0x2e: [0x1ff3, 1, 5, "Lunacy In The Hollow"],
    0x2f: [0x1ff3, 0, 10, "Lunacy In The Keep"],
    0x30: [0x1ff4, 7, 5, "Lunacy With The YUMP"],
    0x31: [0x1ff4, 6, 5, "Lunacy In Space...Wait. That's Normal!"],
    0x28: [0x1ff3, 7, 5, "Lunacy With The Sins"]
}

function MoonCheevo(id) {
    data = MoonData[id]
    achievement(
        title = data[3],
        points = data[2],
        description = format("Collect a 3-up moon in {0}.", LevelLookup[id]),
        trigger = LevelId == id && bit(data[1], data[0]) > prev(bit(data[1], data[0]))
    )
}

for i in MoonData {
    MoonCheevo(i)
}

achievement(
    title = "Actual Lunacy With The YUMP [m]",
    points = 10,
    description = format("Collect the 3-up moon at the end of YUMPalovania."),
    trigger = never(LevelId != 0x30) && never(PlayerX < 0x1900) &&
        repeated(3, Lives > prev(Lives))
)

// You've earned these cutscenes.

achievement(
    title = "Warnings Are So Overrated",
    points = 10,
    description = "Watch the cutscene [The Great Koopa's Warning].",
    trigger = LevelId == 0 && MusicId == 0x47
)

achievement(
    title = "It's Always A Multiple Of 100...",
    points = 10,
    description = "Watch the cutscene [100 Years Ago].",
    trigger = LevelId == 0 && MusicId == 0x43
)

// Leaderboards

EscapeTimer = byte(0xf3c) * 3600 + byte(0xf3b) * 60 + byte(0xf3a)

leaderboard(
    title = "Final Segment - Fewest Deaths",
    description = "The clock is ticking...",
    start = LevelId == 0x2f &&
        SameMusic(0x3b) && prev(tbyte(0xf3a)) == 0 && EscapeTimer == 10200,
    cancel = (EscapeTimer == 0 && prev(tbyte(0xf3a)) != 0) || LevelId != 0x2f,
    submit = MusicId == 0x3c && prev(MusicId) == 0x1a,
    value = measured(Lives < prev(Lives)),
    lower_is_better = true
)

leaderboard(
    title = "Final Segment - Fastest Time",
    description = "The clock is ticking...",
    start = LevelId == 0x2f &&
        EscapeTimer != 0 && MusicId == 0x3c && prev(MusicId) == 0x1a,
    cancel = always_false(),
    submit = always_true(),
    value = EscapeTimer,
    format = "FRAMES"
)

// Rich Presence

EmojiTurtle = "🐢"

SubmapLookup = {
    4: "Bowser Valley II",
    5: "Newfoundworld"
}

EmojiCoin = "💰"
EmojiScore = "💯"

RpLevel = rich_presence_lookup("Level", LevelId, LevelLookup, "Some Undocumented Location")
RpSubmap = rich_presence_lookup("Submap", byte(0x13c3), SubmapLookup, "Konamina")


rich_presence_conditional_display(
    byte(0x100) <= 0x0a,
    "Krack the Hack is ready to hack."
)

rich_presence_conditional_display(
    byte(0xdb4) > 100 || Lives > 100,
    "Krack the Hack has fallen."
)

rich_presence_conditional_display(
    once(MusicId == 0x3d) && never(MusicId == 0x15),
    "Krack the Hack has succeeded...but at what cost?"
)

rich_presence_conditional_display(
    InOverworld,
    "Krack the Hack in {0} | {1}{2} {3}{4} {5}{6}",
    RpSubmap,
    rich_presence_macro("Number", Lives + 1),
    EmojiTurtle,
    rich_presence_macro("Number", Coins),
    EmojiCoin,
    rich_presence_macro("Number", Score * 10),
    EmojiScore
)

rich_presence_conditional_display(
    LevelId > 0,
    "Krack the Hack in {0} | {1}{2} {3}{4} {5}{6}",
    RpLevel,
    rich_presence_macro("Number", Lives + 1),
    EmojiTurtle,
    rich_presence_macro("Number", Coins),
    EmojiCoin,
    rich_presence_macro("Number", Score * 10),
    EmojiScore
)

rich_presence_display(
    "Krack the Hack is confused about how this message showed up."
)
