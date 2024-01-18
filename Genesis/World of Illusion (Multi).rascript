// World of Illusion starring Mickey Mouse and Donald Duck [Subset - Multi]
// #ID = 24329

Player1 = bit0(0xffd9)
Player1Health = byte(0xa039 + (~Player1 * 0x80))
Player2Health = byte(0xa039 + (Player1 * 0x80))
Lives = byte(0xfd52)
TwoPlayerActive = bit1(0xffd9) == 1

Player1StunState = byte(0xa03e + (~Player1 * 0x80))
Player2StunState = byte(0xa03e + (Player1 * 0x80))

Player1Stunned = prev(Player1StunState) != 0x02 && Player1StunState == 0x02
Player2Stunned = prev(Player2StunState) != 0x02 && Player2StunState == 0x02

Player1LostHealth = Player1Health < prev(Player1Health)
Player2LostHealth = Player2Health < prev(Player2Health)

P1StaticStunned = prev(byte(0xa03e)) != 0x02 && byte(0xa03e) == 0x02 &&
    byte(0xa039) == prev(byte(0xa039))
P2StaticStunned = prev(byte(0xa0be)) != 0x02 && byte(0xa0be) == 0x02 &&
    byte(0xa0b9) == prev(byte(0xa0b9))

P1StaticLostHealth = byte(0xa039) < prev(byte(0xa039))
P2StaticLostHealth = byte(0xa0b9) < prev(byte(0xa0b9))

DemoOn = byte(0xfc8d) == 1
WorldId = byte(0xffda)
ActId = byte(0xffdc)
MusicId = byte(0xfd2a)

StartBossTune = prev(MusicId) != 0x97 && MusicId == 0x97
StartLastTune = prev(MusicId) != 0x98 && MusicId == 0x98
VictoryTune = prev(MusicId) != 0x99 && MusicId == 0x99

// Cheevos

function PeacefulCheevo(world, act, name, points, cond) {
    achievement(
        title = format("Peaceful Through {0}", name),
        points = points,
        description = format(
            "Clear Act {0}-{1} without stunning the other player.",
            world,
            act + 1
        ),
        trigger =
            never(DemoOn) &&
            never(!TwoPlayerActive) &&
            never(WorldId != world) &&
            never(ActId != act) &&
            never(P1StaticStunned) &&
            never(P2StaticStunned) &&
            never(P1StaticLostHealth) &&
            never(P2StaticLostHealth) &&
            cond
    )
}

UiHealthGain = byte(0xfd30) > prev(byte(0xfd30))

achievement(
    title = "Teamwork Through The Woods",
    points = 5,
    description = "Clear Act 1-1 without stunning each other or losing health.",
    trigger = 
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        never(P1StaticStunned) &&
        never(P2StaticStunned) &&
        never(P1StaticLostHealth) &&
        never(P2StaticLostHealth) &&
        never(Lives < prev(Lives)) &&
        never(WorldId != 1) &&
        once(ActId == 0 && word(0xa010) < 0xe0 && UiHealthGain) &&
        trigger_when(ActId == 3)
)

achievement(
    title = "Teamwork Through The Mines",
    points = 5,
    description = "Clear Act 1-2 without stunning each other or losing health.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        never(P1StaticStunned) &&
        never(P2StaticStunned) &&
        never(P1StaticLostHealth) &&
        never(P2StaticLostHealth) &&
        never(Lives < prev(Lives)) &&
        never(WorldId != 1) &&
        once(ActId == 3 && word(0xa010) < 0xe0 && byte(0xa014) < 0x80 && UiHealthGain) &&
        trigger_when(ActId == 4)
)

achievement(
    title = "Teamwork Through The Spider Cave",
    points = 5,
    description = "Clear Act 1-3 without stunning each other or losing health.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        never(P1StaticStunned) &&
        never(P2StaticStunned) &&
        never(P1StaticLostHealth) &&
        never(P2StaticLostHealth) &&
        never(Lives < prev(Lives)) &&
        never(WorldId != 1) &&
        once(ActId == 4 && word(0xa010) < 0x30 && 0xa014 > 0x70 && UiHealthGain) &&
        trigger_when(ActId == 5)
)

achievement(
    title = "Teamwork Against The Spider Boss",
    points = 5,
    description = "Defeat the Spider Boss without stunning each other or losing health.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        never(P1StaticStunned) &&
        never(P2StaticStunned) &&
        never(P1StaticLostHealth) &&
        never(P2StaticLostHealth) &&
        never(Lives < prev(Lives)) &&
        never(WorldId != 1) &&
        once(ActId == 5 && StartBossTune) &&
        trigger_when(VictoryTune)
)

achievement(
    title = "Clearing The Forest",
    points = 5,
    description = "Defeat the Spider Boss of the Forest.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        WorldId == 1 && VictoryTune
)

achievement(
    title = "Teamwork Through The Carpet Ride",
    points = 5,
    description = "Clear Act 2-1 without stunning each other or losing health.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        never(P1StaticStunned) &&
        never(P2StaticStunned) &&
        never(P1StaticLostHealth) &&
        never(P2StaticLostHealth) &&
        never(Lives < prev(Lives)) &&
        never(WorldId != 2) &&
        once(ActId == 0 && word(0xa010) < 0x78 && UiHealthGain) &&
        trigger_when(ActId == 0x0f)
)

achievement(
    title = "Teamwork Through The Cliffs",
    points = 5,
    description = "Clear Act 2-2 without stunning each other or losing health.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        never(P1StaticStunned) &&
        never(P2StaticStunned) &&
        never(P1StaticLostHealth) &&
        never(P2StaticLostHealth) &&
        never(Lives < prev(Lives)) &&
        never(WorldId != 2) &&
        once(ActId == 0x0f && word(0xa010) < 0xe0 && word(0xa014) > 0x540 && UiHealthGain) &&
        trigger_when(ActId == 0x10)
)

achievement(
    title = "Teamwork Above The Clouds",
    points = 5,
    description = "Clear Act 2-3 without stunning each other or losing health.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        never(P1StaticStunned) &&
        never(P2StaticStunned) &&
        never(P1StaticLostHealth) &&
        never(P2StaticLostHealth) &&
        never(Lives < prev(Lives)) &&
        never(WorldId != 2) &&
        once(ActId == 0x10 && word(0xa010) < 0x30 && 0xa014 > 0x70 && UiHealthGain) &&
        trigger_when(ActId == 0x11)
)

achievement(
    title = "Teamwork Against The Dragons",
    points = 5,
    description = "Defeat the Dragon Bosses without stunning each other or losing health.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        never(P1StaticStunned) &&
        never(P2StaticStunned) &&
        never(P1StaticLostHealth) &&
        never(P2StaticLostHealth) &&
        never(Lives < prev(Lives)) &&
        never(WorldId != 2) &&
        once(ActId == 0x11 && StartBossTune) &&
        trigger_when(VictoryTune)
)

achievement(
    title = "Clearing The Clouds",
    points = 5,
    description = "Defeat the Dragon Bosses of the Clouds.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        WorldId == 2 && VictoryTune
)

achievement(
    title = "Teamwork Through The Sea",
    points = 10,
    description = "Clear Act 3-1 without stunning each other or losing health.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        never(P1StaticStunned) &&
        never(P2StaticStunned) &&
        never(P1StaticLostHealth) &&
        never(P2StaticLostHealth) &&
        never(Lives < prev(Lives)) &&
        never(WorldId != 3) &&
        once(ActId == 0 && word(0xa010) < 0x78 && UiHealthGain) &&
        trigger_when(ActId >= 5 && ActId <= 6)
)

achievement(
    title = "Teamwork Through Atlantis",
    points = 10,
    description = "Clear Act 3-2 without stunning each other or losing health.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        never(P1StaticStunned) &&
        never(P2StaticStunned) &&
        never(P1StaticLostHealth) &&
        never(P2StaticLostHealth) &&
        never(Lives < prev(Lives)) &&
        never(WorldId != 3) &&
        once(ActId == 5 && word(0xa010) < 0xe0 && UiHealthGain) &&
        trigger_when(ActId == 7)
)

achievement(
    title = "Teamwork Through The Sunken Ship",
    points = 10,
    description = "Clear Act 3-3 without stunning each other or losing health.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        never(P1StaticStunned) &&
        never(P2StaticStunned) &&
        never(P1StaticLostHealth) &&
        never(P2StaticLostHealth) &&
        never(Lives < prev(Lives)) &&
        never(WorldId != 3) &&
        once(ActId == 7 && word(0xa010) < 0x30 && 0xa014 > 0x70 && UiHealthGain) &&
        trigger_when(ActId == 8)       
)

achievement(
    title = "Teamwork Against The Shark",
    points = 10,
    description = "Defeat the Shark Boss without stunning each other or losing health thrice.",
    trigger = never(DemoOn) &&
        never(!TwoPlayerActive) &&
        never(tally(
            3,
            P1StaticStunned,
            P2StaticStunned,
            P1StaticLostHealth,
            P2StaticLostHealth
        )) &&
        never(Lives == 0) &&
        never(WorldId != 3) &&
        never(ActId != 8) &&
        once(ActId == 8 && StartBossTune) &&
        trigger_when(VictoryTune)
)

achievement(
    title = "Clearing The Sea",
    points = 5,
    description = "Defeat the Shark Boss of the Sea.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        WorldId == 3 && VictoryTune
)

achievement(
    title = "Teamwork Through The Den",
    points = 5,
    description = "Clear Act 4-1 without stunning each other or losing health.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        never(P1StaticStunned) &&
        never(P2StaticStunned) &&
        never(P1StaticLostHealth) &&
        never(P2StaticLostHealth) &&
        never(Lives < prev(Lives)) &&
        never(WorldId != 4) &&
        once(ActId == 0 && word(0xa010) < 0xe0 &&
            word(0xa014) >= 0x300 && word(0xa014) < 0x400 && UiHealthGain) &&
        trigger_when(ActId == 0x0a)
)

achievement(
    title = "Teamwork Through The Holidays",
    points = 10,
    description = "Clear Act 4-2 without stunning each other or losing health.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        never(P1StaticStunned) &&
        never(P2StaticStunned) &&
        never(P1StaticLostHealth) &&
        never(P2StaticLostHealth) &&
        never(Lives < prev(Lives)) &&
        never(WorldId != 4) &&
        once(ActId == 0x0a && word(0xa010) < 0xe0 && word(0xa014) > 0x160 && UiHealthGain) &&
        trigger_when(ActId == 0x0b)
)

achievement(
    title = "Teamwork Through The Den...Again?",
    points = 5,
    description = "Clear Act 4-3 without stunning each other or losing health.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        never(P1StaticStunned) &&
        never(P2StaticStunned) &&
        never(P1StaticLostHealth) &&
        never(P2StaticLostHealth) &&
        never(Lives == 0) &&
        never(WorldId != 4) &&
        once(
            ActId == 0x0b &&
            word(0xa010) > 0x180 && word(0xa010) < 0x240 &&
            word(0xa014) > 0x200 && word(0xa014) < 0x300 && UiHealthGain
        ) &&
        trigger_when(ActId == 0x0c)
)

achievement(
    title = "Teamwork Through The Candy",
    points = 10,
    description = "Clear Act 4-4 without stunning each other or losing health.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        never(P1StaticStunned &&
            word(0xa014) != 0x21c && word(0xa014) != 0x15c && word(0xa014) != 0x10c) &&
        never(P2StaticStunned &&
            word(0xa094) != 0x21c && word(0xa094) != 0x15c && word(0xa094) != 0x10c) &&
        never(P1StaticLostHealth) &&
        never(P2StaticLostHealth) &&
        never(Lives < prev(Lives)) &&
        never(WorldId != 4) &&
        once(ActId == 0x0c && word(0xa010) < 0x40 && 0xa014 > 0x380 && UiHealthGain) &&
        trigger_when(ActId == 0x0d)
)

achievement(
    title = "Teamwork Against The Witch",
    points = 10,
    description = "Defeat the Witch Boss without stunning each other or losing health twice.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        never(tally(
            2,
            P1StaticStunned,
            P2StaticStunned,
            P1StaticLostHealth,
            P2StaticLostHealth
        )) &&
        never(Lives < prev(Lives)) &&
        never(WorldId != 4) &&
        once(ActId == 0x0d && StartBossTune) &&
        trigger_when(VictoryTune)
)

achievement(
    title = "Clearing The Library",
    points = 5,
    description = "Defeat the Witch Boss of the Library.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        WorldId == 4 && VictoryTune
)

achievement(
    title = "Teamwork Through The Wonderland",
    points = 5,
    description = "Clear Act 5-1 without stunning each other or losing health.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        never(P1StaticStunned) &&
        never(P2StaticStunned) &&
        never(P1StaticLostHealth) &&
        never(P2StaticLostHealth) &&
        never(Lives < prev(Lives)) &&
        never(WorldId != 5) &&
        once(ActId == 0 && word(0xa010) < 0x78 && UiHealthGain) &&
        trigger_when(ActId == 7)
)

achievement(
    title = "Teamwork Through The Memories",
    points = 10,
    description = "Clear Act 5-2 without stunning each other or losing health.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        never(P1StaticStunned) &&
        never(P2StaticStunned) &&
        never(P1StaticLostHealth) &&
        never(P2StaticLostHealth) &&
        never(Lives < prev(Lives)) &&
        never(WorldId != 5) &&
        once(ActId == 7 && prev(ActId) == 0) &&
        trigger_when(ActId == 0x0d)
)

achievement(
    title = "Teamwork Through The Hall",
    points = 10,
    description = "Clear Act 5-3 without stunning each other or losing health.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        never(P1StaticStunned) &&
        never(P2StaticStunned) &&
        never(P1StaticLostHealth) &&
        never(P2StaticLostHealth) &&
        never(Lives < prev(Lives)) &&
        never(WorldId != 5) &&
        once(ActId == 0x0d && word(0xa010) < 0x30 && 0xa014 > 0x70 && UiHealthGain) &&
        trigger_when(ActId == 0x0e)
)

achievement(
    title = "Teamwork Through The Glass",
    points = 10,
    description = "Clear Act 5-4 without stunning each other or losing health.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        never(P1StaticStunned) &&
        never(P2StaticStunned) &&
        never(P1StaticLostHealth) &&
        never(P2StaticLostHealth) &&
        never(Lives < prev(Lives)) &&
        never(WorldId != 5) &&
        once(ActId == 0x0e && word(0xa010) < 0x30 && 0xa014 > 0x70 && UiHealthGain) &&
        trigger_when(ActId == 0x0f)
)

achievement(
    title = "Teamwork Against Big Bad Pete",
    points = 10,
    description = "Defeat Big Bad Pete without stunning each other or losing health thrice.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        never(tally(
            3,
            P1StaticStunned,
            P2StaticStunned,
            P1StaticLostHealth,
            P2StaticLostHealth
        )) &&
        never(Lives == 0) &&
        never(WorldId != 5) &&
        once(ActId == 0x0f && StartLastTune) &&
        trigger_when(byte(0x91b0) == 0xff && byte(0x91a6) == 0x28)
)

achievement(
    title = "Escaping The Magic Box",
    points = 10,
    description = "Defeat Big Bad Pete and escape the World of Illusion.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        WorldId == 5 && ActId == 0x0f && byte(0x91b0) == 0xff && byte(0x91a6) == 0x28
)

achievement(
    title = "Aww, They Do Love Each Other",
    points = 25,
    description = "Complete the entire game together without running out of tries.",
    trigger =
        never(DemoOn) &&
        never(!TwoPlayerActive) &&
        never(WorldId == 0) &&
        never(Lives == 0) &&
        once(WorldId == 1 && ActId == 0 && word(0xa010) < 0xe0 && UiHealthGain) &&
        trigger_when(tally(5,
            WorldId == 1 && VictoryTune,
            WorldId == 2 && VictoryTune,
            WorldId == 3 && VictoryTune,
            WorldId == 4 && VictoryTune,
            WorldId == 5 && ActId == 0x0f && byte(0x91b0) == 0xff && byte(0x91a6) == 0x28
        ))
)

// Leaderboards

// RP

WorldLookup = {
    0: "The Main Menu",
    1: "The Forest",
    2: "The Clouds",
    3: "The Sea",
    4: "The Library",
    5: "The Magic Box",
}

PlayerLookup = {
    0: "Donald",
    1: "Mickey",
}

EmojiMickey = "♥️"
EmojiDonald = "♠️"
EmojiNoSuit = "🂠"

MickeyHealthLookup = {
    0: (EmojiNoSuit + EmojiNoSuit + EmojiNoSuit + EmojiNoSuit +
        EmojiNoSuit + EmojiNoSuit + EmojiNoSuit + EmojiNoSuit),
    1: (EmojiMickey + EmojiNoSuit + EmojiNoSuit + EmojiNoSuit +
        EmojiNoSuit + EmojiNoSuit + EmojiNoSuit + EmojiNoSuit),
    2: (EmojiMickey + EmojiMickey + EmojiNoSuit + EmojiNoSuit +
        EmojiNoSuit + EmojiNoSuit + EmojiNoSuit + EmojiNoSuit),
    3: (EmojiMickey + EmojiMickey + EmojiMickey + EmojiNoSuit +
        EmojiNoSuit + EmojiNoSuit + EmojiNoSuit + EmojiNoSuit),
    4: (EmojiMickey + EmojiMickey + EmojiMickey + EmojiMickey +
        EmojiNoSuit + EmojiNoSuit + EmojiNoSuit + EmojiNoSuit),
    5: (EmojiMickey + EmojiMickey + EmojiMickey + EmojiMickey +
        EmojiMickey + EmojiNoSuit + EmojiNoSuit + EmojiNoSuit),
    6: (EmojiMickey + EmojiMickey + EmojiMickey + EmojiMickey +
        EmojiMickey + EmojiMickey + EmojiNoSuit + EmojiNoSuit),
    7: (EmojiMickey + EmojiMickey + EmojiMickey + EmojiMickey +
        EmojiMickey + EmojiMickey + EmojiMickey + EmojiNoSuit),
    8: (EmojiMickey + EmojiMickey + EmojiMickey + EmojiMickey +
        EmojiMickey + EmojiMickey + EmojiMickey + EmojiMickey),
}
DonaldHealthLookup = {
    0: (EmojiNoSuit + EmojiNoSuit + EmojiNoSuit + EmojiNoSuit +
        EmojiNoSuit + EmojiNoSuit + EmojiNoSuit + EmojiNoSuit),
    1: (EmojiDonald + EmojiNoSuit + EmojiNoSuit + EmojiNoSuit +
        EmojiNoSuit + EmojiNoSuit + EmojiNoSuit + EmojiNoSuit),
    2: (EmojiDonald + EmojiDonald + EmojiNoSuit + EmojiNoSuit +
        EmojiNoSuit + EmojiNoSuit + EmojiNoSuit + EmojiNoSuit),
    3: (EmojiDonald + EmojiDonald + EmojiDonald + EmojiNoSuit +
        EmojiNoSuit + EmojiNoSuit + EmojiNoSuit + EmojiNoSuit),
    4: (EmojiDonald + EmojiDonald + EmojiDonald + EmojiDonald +
        EmojiNoSuit + EmojiNoSuit + EmojiNoSuit + EmojiNoSuit),
    5: (EmojiDonald + EmojiDonald + EmojiDonald + EmojiDonald +
        EmojiDonald + EmojiNoSuit + EmojiNoSuit + EmojiNoSuit),
    6: (EmojiDonald + EmojiDonald + EmojiDonald + EmojiDonald +
        EmojiDonald + EmojiDonald + EmojiNoSuit + EmojiNoSuit),
    7: (EmojiDonald + EmojiDonald + EmojiDonald + EmojiDonald +
        EmojiDonald + EmojiDonald + EmojiDonald + EmojiNoSuit),
    8: (EmojiDonald + EmojiDonald + EmojiDonald + EmojiDonald +
        EmojiDonald + EmojiDonald + EmojiDonald + EmojiDonald),
}

RpLives = rich_presence_macro("Number", Lives)

RpPlayer1 = rich_presence_lookup("Char", Player1, PlayerLookup)
RpPlayer2 = rich_presence_lookup("Char", ~Player1, PlayerLookup)
RpWorld = rich_presence_lookup("World", WorldId, WorldLookup)

rich_presence_conditional_display(
    once(TwoPlayerActive && word(0xffd0) == 0x8011 && WorldId == 5) && never(WorldId == 0),
    "The magic show is about to begin."
)

rich_presence_conditional_display(
    WorldId == 0,
    "Preparing for the magic show."
)

rich_presence_conditional_display(
    !TwoPlayerActive,
    "{0} is practicing in {1} for the duet magic show.",
    RpPlayer1,
    RpWorld
)


rich_presence_display(
    "Mickey {0}{1} and Donald {2}{3} in {4} with {5} Tries",
    EmojiMickey,
    rich_presence_macro("Number", Player1Health),
    EmojiDonald,
    rich_presence_macro("Number", Player2Health),
    RpWorld,
    rich_presence_macro("Number", Lives)
)
