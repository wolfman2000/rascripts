// Spyro: Season of Ice
// #ID = 4203

StageLookup = {
    0x0: "Autumn Fairy Home",
    0x1: "Market Mesa",
    0x2: "Lava Prairie",
    0x3: "Mermaid Coast",
    0x4: "Stone Age Speedway",
    0x5: "Ant Farm",
    0x6: "Winter Fairy Home",
    0x7: "Hummingbird Fort",
    0x8: "Panda Gardens",
    0x9: "Honey Marsh",
    0xa: "Ice Age Speedway",
    0xb: "Wasp City",
    0xc: "Spring Fairy Home",
    0xd: "Time Machine Lab",
    0xe: "Roman City",
    0xf: "Twilight Bulb Factory",
    0x10: "Aqua Age Speedway",
    0x11: "Beetle Burrows",
    0x12: "Summer Fairy Home",
    0x13: "Dusty Trails",
    0x14: "Star Park",
    0x15: "Space Age Speedway",
    0x16: "Caterpillar Gardens",
    0x17: "Grendor's Lair",
    0x63: "Dragonfly X",
}

LanguageBit = bit5(0x0)
LanguageOffset = LanguageBit * 0x10

Cheats = byte(0x2254 + LanguageOffset)

StageId = byte(0x75b0)
OldStageId = byte(0x1493 + LanguageOffset)
SaveStageId = byte(0x481e6)


function Stage(val) {
    return __ornext(StageId == val || SaveStageId == val || OldStageId == val)
}
// Cheevos

achievement(
    title = "Winter", points = 5,
    description = "Reach the Winter Fairy Home.",
    id = 30352, badge = "31082", published = "11/29/2015 7:50:48 AM", modified = "2/28/2022 11:54:32 PM",
    trigger = Cheats == 0 &&
        bit0(0x1438 + LanguageOffset) > prev(bit0(0x1438 + LanguageOffset)) &&
        Stage(6)
)

achievement(
    title = "Spring", points = 5,
    description = "Reach the Spring Fairy Home.",
    id = 30360, badge = "31083", published = "11/29/2015 7:50:57 AM", modified = "3/12/2022 6:16:42 PM",
    trigger = Cheats == 0 &&
        prev(OldStageId) == 0x17 &&
        Stage(0x0c)
)

achievement(
    title = "Summer", points = 5,
    description = "Reach the Summer Fairy Home",
    id = 30368, badge = "31084", published = "11/29/2015 7:51:06 AM", modified = "2/28/2022 11:55:27 PM",
    trigger = Cheats == 0 &&
        bit0(0x1468 + LanguageOffset) > prev(bit0(0x1468 + LanguageOffset)) &&
        Stage(0x12)
)

function StageCompleteCheevo(data) {
    prevTotal = prev(word(data[2] + LanguageOffset) / 2) + prev(word(data[2] + LanguageOffset + 2))
    currTotal = (word(data[2] + LanguageOffset) / 2) + word(data[2] + LanguageOffset + 2)
    achievement(
        title = data[0],
        description = format("Collect all gems and rescue all fairies in {0}.", data[0]),
        points = 5,
        trigger = Stage(data[1]) &&
            prevTotal <= data[3] - 1 &&
            prevTotal >= data[3] - 50 &&
            measured(currTotal >= data[3], when=Cheats == 0)
    )
}

StageCompleteData = [
    ["Autumn Fairy Home", 0, 0x1420, 305],
    ["Market Mesa", 1, 0x1424, 306],
    ["Lava Prairie", 2, 0x1428, 306],
    ["Mermaid Coast", 3, 0x142c, 306],
    ["Stone Age Speedway", 4, 0x1430, 302],
    ["Ant Farm", 5, 0x1434, 201],
    ["Winter Fairy Home", 6, 0x1438, 305],
    ["Hummingbird Fort", 7, 0x143c, 406],
    ["Panda Gardens", 8, 0x1440, 306],
    ["Honey Marsh", 9, 0x1444, 306],
    ["Ice Age Speedway", 0xa, 0x1448, 302],
    ["Wasp City", 0x0b, 0x144c, 201],
    ["Spring Fairy Home", 0x0c, 0x1450, 305],
    ["Time Machine Lab", 0x0d, 0x1454, 406],
    ["Roman City", 0x0e, 0x1458, 306],
    ["Twilight Bulb Factory", 0x0f, 0x145c, 406],
    ["Aqua Age Speedway", 0x10, 0x1460, 302],
    ["Beetle Burrows", 0x11, 0x1464, 201], // in Summer instead of Spring 
    ["Summer Fairy Home", 0x12, 0x1468, 305],
    ["Dusty Trails", 0x13, 0x146c, 406],
    ["Star Park", 0x14, 0x1470, 406],
    ["Space Age Speedway", 0x15, 0x1474, 302],
    ["Caterpillar Gardens", 0x16, 0x1478, 201], // in Spring instead of Summer 
]

for i in StageCompleteData {
    StageCompleteCheevo(i)
}

WorldCompletionData = [
    ["Autumn", [0, 1, 2, 3, 4, 5], 1726],
    ["Winter", [6, 7, 8, 9, 10, 11], 1826],
    ["Spring", [12, 13, 14, 15, 16, 22], 1926],
    ["Summer", [17, 18, 19, 20, 21], 1620],
]

function WorldCompletionCheevo(data) {
    prevSum = 0
    currSum = 0
    for d in data[1] {
        prevSum = prevSum + prev(word(0x1420 + (d * 4) + LanguageOffset) / 2)
        prevSum = prevSum + prev(word(0x1420 + (d * 4) + LanguageOffset + 2))
        currSum = currSum + (word(0x1420 + (d * 4) + LanguageOffset) / 2)
        currSum = currSum + (word(0x1420 + (d * 4) + LanguageOffset + 2))
    }
    achievement(
        title = format("{0} Completionist", data[0]),
        description = format("Collect all gems and rescue all fairies in every {0} Fairy Home portal.", data[0]),
        points = 10,
        trigger = __ornext(any_of(data[1], d => Stage(d))) &&
            prevSum < data[2] && prevSum >= data[2] - 200 &&
            measured(currSum >= data[2], when=Cheats == 0)
    )
}

for i in WorldCompletionData {
    WorldCompletionCheevo(i)
}

PrevFairyCount = sum_of(range(0, 0x17), i => prev(word(0x1420 + LanguageOffset + (i * 4))) / 2)
CurrFairyCount = sum_of(range(0, 0x17), i => word(0x1420 + LanguageOffset + (i * 4)) / 2)
for i in range(0, 0x17) {
    
}

achievement(
    title = "Fairy Well", points = 25,
    description = "Rescue all fairies",
    id = 30375, badge = "31060", published = "11/29/2015 7:51:13 AM", modified = "11/19/2021 2:07:49 PM",
    trigger = StageId <= 0x17 && PrevFairyCount == 99 && measured(CurrFairyCount == 100, when=Cheats == 0)
)

// Ticket 66756: This one triggered for me very early, just after I started the Aqua age speedway. At that point I
//               think I had only 5200 gems when this popped
//               RetroAchievements Hash: 76aad0726be3ac24f3c5a7a8e64379d3
//               Emulator: RetroArch (mGBA)
//               Emulator Version: 1.15.0

PrevGemCount = sum_of(range(0, 0x16), i => prev(word(0x1422 + LanguageOffset + (i * 4))))
CurrGemCount = sum_of(range(0, 0x16), i => word(0x1422 + LanguageOffset + (i * 4)))

achievement(
    title = "Moneybags", points = 25,
    description = "Collect all gems",
    id = 30376, badge = "31061", published = "11/29/2015 7:51:14 AM", modified = "2/12/2022 9:43:24 PM",
    trigger = StageId <= 0x17 && PrevGemCount < 7000 && PrevGemCount >= 6900 &&
        measured(CurrGemCount >= 7000, when=Cheats == 0)
)

achievement(
    title = "World's Greatest Dragon", points = 50,
    description = "Reach 100% game completion",
    id = 30377, badge = "31062", published = "11/29/2015 7:51:15 AM", modified = "10/16/2019 12:48:46 AM",
    trigger = StageId <= 0x17 &&
        PrevFairyCount + PrevGemCount < 7100 && PrevFairyCount + PrevGemCount >= 7000 &&
        measured(CurrFairyCount + CurrGemCount >= 7100, when=Cheats == 0, format="percent")
)

achievement(
    title = "Dragonfly X", points = 5,
    description = "Enter Dragonfly X through the portal in Summer Fairy Home",
    id = 30378, badge = "31063", published = "11/29/2015 7:51:16 AM", modified = "8/3/2019 7:26:42 AM",
    trigger = Cheats == 0 && StageId == 0x63 &&     prev(StageId) == 0x12
)

achievement(
    title = "Dragonfly X-treme", points = 10,
    description = "Complete a level in the Dragonfly X minigame without taking damage",
    id = 30379, badge = "31065", published = "11/29/2015 7:51:17 AM", modified = "10/16/2019 12:48:46 AM",
    trigger = byte(0x047438) == 0x01 && byte(0x04746C) >= 0x01 && unless(byte(0x047464) == 0x01) && 
              unless(once(byte(0x046982) > prev(byte(0x046982)))) &&
              ((never(byte(0x04746C) != prev(byte(0x04746C)))) ||
               (never(byte(0x047438) == 0x02) && never(byte(0x0474B2) != prev(byte(0x0474B2)))))
)

EmojiGem = "💎"
EmojiFairy = "🧚"

rich_presence_display("{0} {1} {2}/100 {3} {4}/7000",
    rich_presence_lookup("Stage", SaveStageId, StageLookup),
    EmojiFairy,
    rich_presence_macro("Number", CurrFairyCount),
    EmojiGem,
    rich_presence_macro("Number", CurrGemCount)
)
