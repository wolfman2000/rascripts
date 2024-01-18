// Mickey's Ultimate Challenge
// #ID = 4055

Loc = word(0xc0f4)
Char = byte(0xc12c)

MinigameCompleted = bit3(0xc44f) + bit4(0xc44f) +
    bit5(0xc44f) + bit6(0xc44f) + bit7(0xc44f) >
    prev(bit3(0xc44f)) + prev(bit4(0xc44f)) +
    prev(bit5(0xc44f)) + prev(bit6(0xc44f)) +
    prev(bit7(0xc44f))

Beans = bit0(0xc450) + bit1(0xc450) + bit2(0xc450) +
    bit3(0xc450) + bit4(0xc450)

Diff = byte(0xc509)
function Hard() => Diff == 2

CharLookup = {
    2: "Minnie",
    3: "Mickey"
}

StateLookup = {
    0x01c0: "about to sleep",
    0x0200: "about to sleep",
    0x0540: "about to sleep",
    0x0a00: "about to sleep",
    0x0cd0: "about to sleep",
    0x99a0: "about to sleep",
    0x0480: "in the library",
    0x0210: "in the gallery",
    0x0140: "by the drawbridge",
    0x0070: "in the wizard tower",
    0x03a0: "in the wizard tower",
    0x04d0: "with the blacksmith",
    0x05a0: "in the clouds",
    0x0400: "awakened by the alarm clock",
    0x0580: "awakened by the alarm clock"
}

// Achievements

achievement(
    title = "Wiblingen Monastery",
    points = 3,
    description = "Assist the librarian with their books.",
    trigger = Loc == 0x0480 && MinigameCompleted
)

achievement(
    title = "Rijksmuseum",
    points = 5,
    description = "Assist the librarian with their books. [Hard]",
    trigger = Loc == 0x0480 && MinigameCompleted && Hard()
)

achievement(
    title = "Galleria Moretti",
    points = 3,
    description = "Clean all of the dust from the gallery paintings.",
    trigger = Loc == 0x0210 && MinigameCompleted
)

achievement(
    title = "Galleria Il Mappamondo",
    points = 5,
    description = "Clean all of the dust from the gallery paintings. [Hard]",
    trigger = Loc == 0x0210 && MinigameCompleted && Hard()
)

achievement(
    title = "Axum Stelae",
    points = 3,
    description = "Bring all of the potions to the magic mirror.",
    trigger = Loc == 0x0070 && MinigameCompleted
)

achievement(
    title = "Minaret of Jam",
    points = 5,
    description = "Bring all of the potions to the magic mirror. [Hard]",
    trigger = Loc == 0x0070 && MinigameCompleted && Hard()
)

achievement(
    title = "Five Circles Bridge",
    points = 3,
    description = "Repair the drawbridge and its pumps.",
    trigger = Loc == 0x0140 && MinigameCompleted
)

achievement(
    title = "Slauerhoffbrug",
    points = 5,
    description = "Repair the drawbridge and its pumps. [Hard]",
    trigger = Loc == 0x0140 && MinigameCompleted && Hard()
)

achievement(
    title = "Samuel Yellin",
    points = 3,
    description = "Be a master mind and identify what's in the toolbox.",
    trigger = Loc == 0x04d0 && MinigameCompleted
)

achievement(
    title = "Lorenz Helmschmied",
    points = 5,
    description = "Be a master mind and identify what's in the toolbox. [Hard]",
    trigger = Loc == 0x04d0 && MinigameCompleted && Hard()
)

achievement(
    title = "Pangu",
    points = 5,
    description = "Wake up the giant.",
    trigger = Loc == 0x0400 && Beans == 5
)

achievement(
    title = "Daidarabotchi",
    points = 10,
    description = "Wake up the giant. [Hard]",
    trigger = Loc == 0x0400 && Beans == 5 && Hard()
)

// RP

RpChar = rich_presence_lookup("Char", Char, CharLookup)
RpLoc = rich_presence_lookup("Loc", Loc, StateLookup, "in the Beanwick Kingdom")
RpBeans = rich_presence_macro("Number", Beans)

EmojiPlant = "🌱"

rich_presence_conditional_display(
    Char < 2 || Char > 3,
    "Getting ready for bed."
)

rich_presence_conditional_display(
    Char >= 2 && Char <= 3,
    "{0} is {1} {2}{3}",
    RpChar,
    RpLoc,
    EmojiPlant,
    RpBeans
)

rich_presence_display(
    "Time for sleep."
)
