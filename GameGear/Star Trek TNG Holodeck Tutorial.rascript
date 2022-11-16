// Star Trek - The Next Generation - The Advanced Holodeck Tutorial
// #ID = 20094

// Variables

GameState = byte(0x0d0b)
GsPicardBriefing = GameState == 0x0d
GsMissionEnd = GameState == 0x0e

GsMissionWon = GsMissionEnd && byte(0x0d51) == 1
GsMissionLost = GsMissionEnd && byte(0x0d51) == 3

OverrideEnabled = GameState == 0x1c && bit1(0x0dab) == 1

MissionType = byte(0x0ed1)
MissionTypeLookup = {
    0: "Colony Siege",
    1: "Futile Resistance",
    2: "Violator",
    3: "Contact Lost",
    4: "Ferengi Disruption",
    5: "Distress Call",
    6: "Ferengi Freighter Siege",
    7: "Romulan Blockade",
    8: "Klingon Assault",
    9: "Deliver Vaccine",
    10: "Escort Ambassador",
    11: "Deliver Generators",
    12: "Escort Scientists",
    13: "Evacuate Expedition",
    14: "Warp Core Breach",
    15: "Stolen Cargo",
    16: "Massive Disruption",
    17: "Lethal Virus",
    18: "Evacuate Starbase",
    19: "Destroy Asteroid"
}

MissionTypeRpLookup = {
    0: "Stop the siege at",
    1: "Stop the Borg at",
    2: "Preserve the peace treaty at",
    3: "Communication lost from starbase at",
    4: "Stop Ferengi Marauders at",
    5: "Respond to a distress call at",
    6: "Stop the freighter siege at",
    7: "Destroy the blockade at",
    8: "Protect the U.S.S. Cochrane at",
    9: "Bring a vaccine to",
    10: "Bring an ambassador to",
    11: "Bring generators to",
    12: "Escort scientists to",
    13: "Evacuate the expedition at",
    14: "Save the crew from warp core breach at",
    15: "Retrieve stolen cargo from",
    16: "Evacuate the colonists from",
    17: "Beam up the colonists from",
    18: "Evacuate the crew from",
    19: "Destroy the asteroid near"
}

MissionTypeTitleLookup = {
    0: "The Siege",
    1: "I, Borg",
    2: "Future Imperfect",
    3: "Lost & Found",
    4: "The Last Outpost",
    5: "The Sound of Her Voice",
    6: "Peak Performance",
    7: "Redemption",
    8: "Day of the Dove",
    9: "The Naked Now",
    10: "Is There in Truth No Beauty?",
    11: "The Next Phase",
    12: "The Measure of a Man",
    13: "This Side of Paradise",
    14: "Contagion",
    15: "That Hope Is You",
    16: "That Which Survives",
    17: "Symbiosis",
    18: "Balance of Terror",
    19: "The Paradise Syndrome"
}

MissionTypePointLookup = {
    0: 3,
    1: 25,
    2: 3,
    3: 5,
    4: 5,
    5: 10,
    6: 3,
    7: 10,
    8: 10,
    9: 10,
    10: 3,
    11: 5,
    12: 10,
    13: 10,
    14: 3,
    15: 5,
    16: 10,
    17: 5,
    18: 5,
    19: 10
}

PlanetTarget = low4(0x0ed2)
PlanetSource = low4(0x0ed3)

PlanetLookup = {
    0: "Earth",
    1: "Vulcan",
    2: "Risa",
    3: "Altair VI",
    4: "Rigel III",
    5: "Krios",
    6: "Penthara",
    7: "Kataan",
    8: "Melona IV",
    9: "Amanugi",
    10: "Tarsus IV",
    11: "Lysia",
    12: "Iconia",
    13: "Crystalia",
    14: "Bajor",
    15: "Angosia"
}

MissionEndDate = word(0x0ed7)
MissionCurDate = word(0x10eb)

PlayerRank = low4(0x0edb)
PlayerRankLookup = {
    0: "Ensign",
    1: "Lieutenant",
    2: "Lt. Commander",
    3: "Commander",
    4: "Captain"
}

PlayerRankPoints = {
    0: 5,
    1: 5,
    2: 10,
    3: 25
}

PlayerStreak = byte(0x0ede)

Stardate = 40000 + MissionCurDate
StardateNumbers = 40000 + (word(0x10eb) / 10)
StardateDecimal = word(0x10eb) % 10

// Achievements

for index in range(0, 3, 1) {
    target = PlayerRankLookup[index + 1]
    achievement(
        title = format("Promotion to {0}", target),
        description = format("Earn your promotion to {0} via Holodeck Training.", target),
        points = PlayerRankPoints[index],
        trigger =
            disable_when(once(OverrideEnabled)) &&
            GsMissionEnd && tally(
            (index + 1) * 2,
            PlayerStreak > prev(PlayerStreak),
            PlayerRank == index + 1 && prev(PlayerRank) == index
        ) && never(PlayerRank == index && PlayerStreak == 0)
    )
}

for index in MissionTypeLookup {
    achievement(
        title = MissionTypeTitleLookup[index],
        description = format(
            "Complete a mission of the type: {0}.",
            MissionTypeLookup[index]
        ),
        points = MissionTypePointLookup[index],
        trigger =
            disable_when(once(OverrideEnabled)) &&
            GsMissionWon && MissionType == index
    )
}

// Leaderboards

ValidEntries = [
    1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0,
    1, 0, 1, 1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0,
    1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0,
    1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
]

ElapsedTime = MissionEndDate - (MissionEndDate - MissionCurDate)

for rankIndex in PlayerRankLookup {
    for missionIndex in MissionTypeLookup {
        if ValidEntries[rankIndex * 20 + missionIndex] == 1 {
            leaderboard(
                title = format(
                    "{0} - {1} RTA",
                    MissionTypeLookup[missionIndex],
                    PlayerRankLookup[rankIndex]
                ),
                description = format(
                    "Complete the {0} mission on {1} as fast as possible (real time).",
                    MissionTypeLookup[missionIndex],
                    PlayerRankLookup[rankIndex]
                ),
                start = disable_when(once(OverrideEnabled)) &&
                    prev(GameState) == 0x0d && GameState == 0x10 &&
                    PlayerRank == rankIndex && MissionType == missionIndex,
                cancel =
                    once(OverrideEnabled) ||
                    GameState == 0x00 ||
                    (prev(GameState) == 0x0e && GameState == 0x0d) ||
                    GsMissionLost,
                submit = GsMissionWon,
                value = always_true(),
                lower_is_better = true,
                format = "FRAMES"
            )
            leaderboard(
                title = format(
                    "{0} - {1} IGT",
                    MissionTypeLookup[missionIndex],
                    PlayerRankLookup[rankIndex]
                ),
                description = format(
                    "Complete the {0} mission on {1} as fast as possible (in-game time).",
                    MissionTypeLookup[missionIndex],
                    PlayerRankLookup[rankIndex]
                ),
                start =
                    disable_when(once(OverrideEnabled)) &&
                    always_false() &&
                    GsMissionWon && MissionType == missionIndex,
                cancel = always_false(),
                submit = always_true(),
                value = ElapsedTime,
                lower_is_better = true,
                format = "VALUE"
            )
        }
    }
}

// Rich Presence

RpRank = rich_presence_lookup("Rank", PlayerRank, PlayerRankLookup)
RpMissionType = rich_presence_lookup("MissionType", MissionType, MissionTypeRpLookup)
RpPlanet = rich_presence_lookup("Planet", PlanetTarget, PlanetLookup)
RpOrbitPlanet = rich_presence_lookup("Planet", byte(0x1122), PlanetLookup)
RpChoosePlanet = rich_presence_lookup("Planet", byte(0x0db2), PlanetLookup)

StateToRp = {
    0x08: "consulting with Worf.",
    0x09: "consulting with Data.",
    0x0a: "consulting with La Forge.",
    0x0b: "consulting with O'Brien.",
    0x0c: "consulting with Riker.",
    0x0e: "wrapped up the mission.",
    0x11: "adjusting the shields.",
    0x12: "adjusting the weapons.",
    0x14: "viewing the sensors.",
    0x15: "focused on repairs.",
    0x16: "viewing ship health.",
    0x17: "using the transporter.",
    0x18: "using the transporter.", // guessing this one.
    0x19: "using the transporter.",
    0x1b: "rerouting power.",
}

RpCommon = "{0}'s Log: Stardate {1}. Assignment: {2} {3}. Presently "

rich_presence_conditional_display(
    GameState < 8 && GameState != 6 && prior(GameState) != 0x13,
    "Entering Starfleet Academy for the Holodeck Tutorial"
)

rich_presence_conditional_display(
    GameState >= 5 && GameState <= 6,
    RpCommon + "warping to {4}.",
    RpRank,
    rich_presence_macro("Number", StardateNumbers),
    RpMissionType,
    RpPlanet,
    RpOrbitPlanet
)

rich_presence_conditional_display(
    GameState == 0x0d && prior(GameState) >= 0x08 && prior(GameState) != 0x0e,
    RpCommon + "finishing the mission.",
    RpRank,
    rich_presence_macro("Number", StardateNumbers),
    RpMissionType,
    RpPlanet
)

rich_presence_conditional_display(
    GameState == 0x10,
    RpCommon + "in {4} space.",
    RpRank,
    rich_presence_macro("Number", StardateNumbers),
    RpMissionType,
    RpPlanet,
    RpOrbitPlanet
)

rich_presence_conditional_display(
    GameState == 0x13,
    RpCommon + "setting a course for {4}.",
    RpRank,
    rich_presence_macro("Number", StardateNumbers),
    RpMissionType,
    RpPlanet,
    RpChoosePlanet
)

rich_presence_conditional_display(
    GameState == 0x18,
    RpCommon + "entering {4} orbit.",
    RpRank,
    rich_presence_macro("Number", StardateNumbers),
    RpMissionType,
    RpPlanet,
    RpOrbitPlanet
)

rich_presence_display(
    RpCommon + "{4}",
    RpRank,
    rich_presence_macro("Number", StardateNumbers),
    RpMissionType,
    RpPlanet,
    rich_presence_lookup("Action", GameState, StateToRp, "helming the Enterprise.")
)
