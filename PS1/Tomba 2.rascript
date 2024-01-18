// Tomba! 2: The Evil Swine Return | Tombi! 2 | Tomba! The Wild Adventures
// #ID = 11306

//0x0bf870: US version Gameplay 
//0x0bffc0: EU version Gameplay 
//0x0c0160: German version Gameplay 
//0x0c0390: Spanish version Gameplay 
//0x0c0450: French verison Gameplay 
//0x0c0680: Italian version Gameplay 
//0x0c1758: Japanese version Gameplay 

function IsValidPointer(addr) =>
    addr == 0xbf870 || addr == 0xbffc0 || addr == 0xc0160 ||
    addr == 0xc0390 || addr == 0xc0450 || addr == 0xc0680 ||
    addr == 0xc1758

ZonePointer = tbyte(0x1ff1a4)
GlobalPointer = tbyte(0x1ff1bc)

ValidGlobalPointer = IsValidPointer(GlobalPointer)
ValidPrevGlobalPointer = IsValidPointer(prev(GlobalPointer))
ValidZonePointer = IsValidPointer(ZonePointer)

CurrentArea = byte(GlobalPointer + 0)
AdventurePoints = dword(GlobalPointer + 0x04)
CurHP = byte(GlobalPointer + 0x2877e)
MaxHP = byte(GlobalPointer + 0x0d)
CurMP = byte(GlobalPointer + 0x0e)
MaxMP = byte(GlobalPointer + 0x0f)
GoldPowder = byte(GlobalPointer + 0x5e5)

function GotItem(addr, target = 1) => prev(addr) == 0 && addr == target

function MissionDone(addr) => addr == 0xff
function MissionCompleteDidFind(addr, target = 1, trigger = false) {
    final = MissionDone(addr)
    if trigger == true {
        final = trigger_when(final)
    }
    return prev(addr) == target && final
}
function MissionCompleteAnyStart(addr) => prev(addr) != 0xff && MissionDone(addr)

EventBurningHouse = byte(GlobalPointer + 0x46)
EventPourWater = byte(GlobalPointer + 0x47)
EventSaveCrab = byte(GlobalPointer + 0x48)
EventWindItUp = byte(GlobalPointer + 0x49)
EventCrabBasket = byte(GlobalPointer + 0x4a)
EventGoldenCrab = byte(GlobalPointer + 0x4b)
EventWinWindmill = byte(GlobalPointer + 0x4c)
EventRemoveCappers = byte(GlobalPointer + 0x4e)
EventDeliverGran = byte(GlobalPointer + 0x56)
EventTakeLift = byte(GlobalPointer + 0x5a)
EventStaticExplosion = byte(GlobalPointer + 0x5d)
EventKillGuards = byte(GlobalPointer + 0x61)
EventCrabBalance = byte(GlobalPointer + 0x65)
EventPigStatue = byte(GlobalPointer + 0x6c)

InventoryPigSuit = byte(GlobalPointer + 0x255)

achievement(
    title = "Firefighter", points = 5,
    description = "Put out the fire in the house.",
    id = 88786, badge = "102804", published = "11/20/2019 8:14:33 PM", modified = "1/20/2020 5:47:49 PM",
    trigger = 
        __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0 &&
        MissionDone(EventBurningHouse) &&
        MissionDone(EventPourWater) &&
        MissionCompleteAnyStart(EventSaveCrab)
)

achievement(
    title = "First Cog", points = 5,
    description = "Lift the bridge and get access to the Waterfall of the Heavens.",
    id = 88788, badge = "103285", published = "11/20/2019 8:27:50 PM", modified = "1/20/2020 5:55:07 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0 &&
        MissionCompleteDidFind(EventWindItUp)
)

achievement(
    title = "A Strange Contraption", points = 5,
    description = "Bring Win the golden crabs.",
    id = 88941, badge = "103291", published = "11/22/2019 2:32:22 PM", modified = "8/20/2021 5:10:01 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0 &&
        MissionDone(EventCrabBasket) &&
        MissionDone(EventGoldenCrab) &&
        MissionCompleteDidFind(EventWinWindmill)
)

achievement(
    title = "Uncapping Exhaust Pipes", points = 5,
    description = "Defeat all the cappers.",
    id = 88942, badge = "102806", published = "11/22/2019 7:53:15 PM", modified = "1/20/2020 6:11:31 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 1 &&
        MissionCompleteAnyStart(EventRemoveCappers)
)

achievement(
    title = "Meeting The Kidnapper", points = 5,
    description = "Have your first chat with the Final Evil Pig.",
    id = 88990, badge = "102814", published = "11/23/2019 7:08:05 PM", modified = "12/20/2020 4:05:22 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 2 &&
        GotItem(byte(GlobalPointer + 0x25b))
)

achievement(
    title = "Kujara Powered Elevator", points = 5,
    description = "Ride the elevator after feeding the Kujara.",
    id = 88991, badge = "103286", published = "11/23/2019 11:09:15 PM", modified = "1/20/2020 6:16:49 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 4 &&
        MissionCompleteDidFind(EventTakeLift)
)

achievement(
    title = "The Second Explosion", points = 5,
    description = "Blow up the rock and get access to the Donglin forest.",
    id = 89270, badge = "102821", published = "11/25/2019 7:30:22 PM", modified = "1/20/2020 6:18:33 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 5 &&
        MissionCompleteDidFind(EventStaticExplosion)
)

achievement(
    title = "Ghostbuster", points = 5,
    description = "Defeat the purple ghost.",
    id = 89324, badge = "102827", published = "11/27/2019 6:39:23 PM", modified = "1/20/2020 6:19:31 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 6 &&
        MissionCompleteDidFind(EventKillGuards)
)

achievement(
    title = "Who You Gonna Call? Tomba!", points = 5,
    description = "Put the Rock Crab on the scale.",
    id = 89388, badge = "103290", published = "11/28/2019 6:37:36 PM", modified = "1/20/2020 6:25:43 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 6 &&
        MissionCompleteDidFind(EventCrabBalance)
)

achievement(
    title = "A Pig Tribe Clown Statue", points = 5,
    description = "Destroy the statue blocking your way to the Water Temple.",
    id = 89431, badge = "102829", published = "11/28/2019 10:44:24 PM", modified = "12/20/2020 9:53:04 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0x07 &&
        MissionCompleteDidFind(EventPigStatue)
)

achievement(
    title = "I Can Swim", points = 5,
    description = "Get the Swimming Pig Suit.",
    id = 89432, badge = "102830", published = "11/28/2019 11:00:16 PM", modified = "1/20/2020 7:45:16 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 8 &&
        GotItem(InventoryPigSuit)
)

achievement(
    title = "Underground Mine Restored", points = 10,
    description = "Capture the Fire Evil Pig.",
    id = 90862, badge = "102841", published = "12/15/2019 12:40:29 PM", modified = "8/21/2021 11:09:44 AM",
    trigger = 
        __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0x0a &&
        MissionCompleteDidFind(byte(GlobalPointer + 0x57))
)

achievement(
    title = "Kujara Ranch Restored", points = 10,
    description = "Capture the Ice Evil Pig.",
    id = 89494, badge = "102832", published = "11/29/2019 10:51:36 PM", modified = "1/20/2020 7:53:55 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0x0b &&
        MissionCompleteDidFind(byte(GlobalPointer + 0x5f))
)

achievement(
    title = "Donglin Forest Restored", points = 10,
    description = "Capture the Ghost Evil Pig.",
    id = 90216, badge = "102835", published = "12/7/2019 11:56:23 PM", modified = "1/20/2020 8:01:53 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0x0c &&
        MissionCompleteDidFind(byte(GlobalPointer + 0x66))
)

achievement(
    title = "Circus Village Restored", points = 10,
    description = "Capture the Earth Evil Pig.",
    id = 90860, badge = "102839", published = "12/15/2019 12:20:10 PM", modified = "5/6/2022 4:23:29 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0x0d &&
        MissionCompleteDidFind(byte(GlobalPointer + 0x6d))
)

achievement(
    title = "Water Temple Restored", points = 10,
    description = "Capture the Water Evil Pig.",
    id = 90214, badge = "103295", published = "12/7/2019 11:41:55 PM", modified = "1/20/2020 8:02:04 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0x0e &&
        MissionCompleteDidFind(byte(GlobalPointer + 0x74))
)

achievement(
    title = "Final Evil Pig Defeated", points = 25,
    description = "Capture the Final Evil Pig.",
    id = 93117, badge = "102849", published = "1/1/2020 4:28:23 PM", modified = "8/13/2023 6:52:04 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0x0f &&
        MissionCompleteDidFind(byte(GlobalPointer + 0x7b))
)

DamagelessData = [
    [25, 0x0a, 0x57, "Fire", "Got Roasted"],
    [25, 0x0b, 0x5f, "Ice", "Got Hypothermia"],
    [25, 0x0c, 0x66, "Ghost", "Got Hog Warts"],
    [25, 0x0d, 0x6d, "Earth", "Got Crushed"],
    [25, 0x0e, 0x74, "Water", "Got Water Filled Lungs"],
    [50, 0x0f, 0x7b, "Final", "Cried \"Wee\" All the Way Home"]
]

function DamagelessCheevo(data) {
    achievement(
        title = format("This Little Piggy {0}", data[4]),
        points = data[0],
        description = format(
            "Capture the {0} Evil Pig without taking damage and without equipping the Golden Powder.",
            data[3]
        ),
        trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
            once(CurHP == 0x00 || CurrentArea != data[1]) &&
            never(
                GlobalPointer >= 0xbf870 && GlobalPointer <= 0xc1758 &&
                ValidPrevGlobalPointer && CurHP != 0x00 && CurHP < prev(CurHP)) &&
            never(GoldPowder == 1) &&
            CurrentArea == data[1] &&
            MissionCompleteDidFind(byte(GlobalPointer + data[2]), trigger = true)
    )
}

for i in DamagelessData {
    DamagelessCheevo(i)
}

achievement(
    title = "Coal Mine Bell", points = 1,
    description = "Find the Coal Mine Bell.",
    id = 90322, badge = "102836", published = "12/8/2019 11:27:14 AM", modified = "1/20/2020 10:17:00 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 2 &&
        GotItem(byte(GlobalPointer + 0x2ea))
)

achievement(
    title = "Minitta Bell", points = 1,
    description = "Find the Minitta Bell.",
    id = 91980, badge = "102842", published = "12/25/2019 1:19:23 PM", modified = "1/20/2020 10:17:57 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 8 &&
        GotItem(byte(GlobalPointer + 0x2dc))
)

Pants = [0x24e, 0x24f, 0x250]

achievement(
    title = "Fancy Pants", points = 5,
    description = "Own all the pants.",
    id = 90213, badge = "103289", published = "12/7/2019 11:35:52 PM", modified = "9/17/2021 4:13:02 PM",
    trigger = 
        sum_of(Pants, p => prev(byte(GlobalPointer + p))) == 2 &&
        measured(sum_of(Pants, p => byte(GlobalPointer + p)) == 3, when=ValidGlobalPointer && ValidPrevGlobalPointer) &&
        all_of(Pants, p => byte(GlobalPointer + p) <= 1)
)

Suits = [0x252, 0x253, 0x255, 0x256, 0x257, 0x258, 0x259, 0x25a]

achievement(
    title = "Fashionista", points = 5,
    description = "Own all the suits.",
    id = 90865, badge = "103292", published = "12/15/2019 1:27:41 PM", modified = "1/20/2020 10:23:48 PM",
    trigger = sum_of(Suits, p => prev(byte(GlobalPointer + p))) == 7 &&
        measured(sum_of(Suits, p => byte(GlobalPointer + p)) == 8, when=ValidGlobalPointer && ValidPrevGlobalPointer) &&
        all_of(Suits, p => byte(GlobalPointer + p) <= 1)
)

achievement(
    title = "Glacier Boomerang", points = 10,
    description = "Find the Glacier Boomerang in the Tower of Courage.",
    id = 92966, badge = "102845", published = "12/31/2019 8:32:52 PM", modified = "1/20/2020 10:24:00 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0x10 &&
        GotItem(byte(GlobalPointer + 0x249))
)

achievement(
    title = "Torch Hammer", points = 10,
    description = "Find the Torch Hammer in the Tower of Strength.",
    id = 90859, badge = "103395", published = "12/15/2019 12:15:12 PM", modified = "1/20/2020 10:26:08 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0x11 &&
        GotItem(byte(GlobalPointer + 0x24c))
)

achievement(
    title = "Doka Pin", points = 10,
    description = "Find the Doka Pin in the Tower of Wisdom.",
    id = 92878, badge = "103297", published = "12/31/2019 1:37:33 PM", modified = "1/20/2020 10:27:22 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0x12 &&
        GotItem(byte(GlobalPointer + 0x246))
)

achievement(
    title = "No Trouble With The Trolley", points = 10,
    description = "Deliver the faster-hardening cement in time.",
    id = 88943, badge = "103367", published = "11/22/2019 11:46:47 PM", modified = "5/6/2022 4:31:41 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0x1 &&
        MissionCompleteDidFind(byte(GlobalPointer + 0x99))
)

achievement(
    title = "A Kujara Washing Expert", points = 10,
    description = "Wash the toughest group of Kujara.",
    id = 89273, badge = "103287", published = "11/25/2019 10:26:01 PM", modified = "1/20/2020 10:29:34 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0x5 &&
        MissionCompleteDidFind(byte(GlobalPointer + 0xbf))
)

achievement(
    title = "Berry Nuts Harvest", points = 10,
    description = "Collect 200 Berry Nuts in the minigame.",
    id = 91981, badge = "103293", published = "12/25/2019 1:37:21 PM", modified = "1/20/2020 10:31:20 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0x14 &&
        prev(byte(GlobalPointer + 0x1b6)) < 200 &&
        byte(GlobalPointer + 0x1b6) >= 200
)

achievement(
    title = "I'm Invincible!", points = 10,
    description = "Obtain the Golden Powder.",
    id = 93101, badge = "102846", published = "1/1/2020 2:11:42 PM", modified = "1/20/2020 10:32:31 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0x13 &&
        GotItem(GoldPowder)
)

achievement(
    title = "A Man's Best Friend", points = 5,
    description = "Free Baron.",
    id = 92877, badge = "102844", published = "12/31/2019 1:03:01 PM", modified = "1/20/2020 10:33:14 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0x6 &&
        MissionCompleteDidFind(byte(GlobalPointer + 0xc1))
)

achievement(
    title = "The Forbidden World", points = 5,
    description = "Get the Taboo status for the first time.",
    id = 90857, badge = "102837", published = "12/15/2019 12:00:44 PM", modified = "1/20/2020 10:37:11 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        prev(bit5(GlobalPointer + 0x11)) < bit5(GlobalPointer + 0x11)
)

TombaEmotion = byte(GlobalPointer + 0x28784)

achievement(
    title = "The Greatest Smile", points = 1,
    description = "Have a laugh at the Donglin Forest.",
    id = 89325, badge = "102828", published = "11/27/2019 7:03:45 PM", modified = "8/21/2021 10:56:26 AM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0x06 &&
        prev(TombaEmotion) != 1 &&
        prev(TombaEmotion) < 2 &&
        TombaEmotion == 1
)

achievement(
    title = "The Greatest Pout", points = 1,
    description = "Cry at the Donglin Forest.",
    id = 89326, badge = "102872", published = "11/27/2019 7:12:12 PM", modified = "8/21/2021 10:56:43 AM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0x06 &&
        prev(TombaEmotion) <= 1 &&
        TombaEmotion == 2
)

achievement(
    title = "Full Strength", points = 25,
    description = "Use all the seeds of strength on the blessed Bonze's fountain.",
    id = 92959, badge = "103296", published = "12/31/2019 3:19:58 PM", modified = "1/20/2020 10:39:21 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 7 &&
        prev(byte(GlobalPointer + 0x1c7)) == 4 &&
        byte(GlobalPointer + 0x1c7) == 5
)

ChestData = [
    [0, 0x444], [1, 0x444], [2, 0x444], [3, 0x444], [4, 0x444], [5, 0x444], [6, 0x444], [7, 0x444],
    [0, 0x445], [1, 0x445], [2, 0x445], [3, 0x445], [4, 0x445], [5, 0x445], [6, 0x445], [7, 0x445],
    [0, 0x446], [1, 0x446], [2, 0x446], [3, 0x446], [4, 0x446], [5, 0x446], [6, 0x446], [7, 0x446],
    [0, 0x447], [1, 0x447], [2, 0x447], [3, 0x447], [4, 0x447], [5, 0x447], [6, 0x447], [7, 0x447],
    [0, 0x448], [1, 0x448], [2, 0x448], [3, 0x448], [4, 0x448], [5, 0x448], [6, 0x448], [7, 0x448],
    [0, 0x449], [1, 0x449], [2, 0x449], [3, 0x449], [4, 0x449], [5, 0x449], [6, 0x449], [7, 0x449],
    [0, 0x44a], [1, 0x44a], [2, 0x44a], [3, 0x44a], [4, 0x44a], [5, 0x44a], [6, 0x44a], [7, 0x44a],
    [0, 0x44b], [1, 0x44b], [2, 0x44b], [3, 0x44b], [4, 0x44b], [5, 0x44b], [6, 0x44b], [7, 0x44b],
    [0, 0x44c], [1, 0x44c], [2, 0x44c], [3, 0x44c], [4, 0x44c], [5, 0x44c], [6, 0x44c], [7, 0x44c],
    [1, 0x44d], [2, 0x44d], [3, 0x44d], [4, 0x44d], [6, 0x44d], [7, 0x44d],
    [0, 0x44e],
    [4, 0x450], [5, 0x450], [6, 0x450],
    [6, 0x45b], [7, 0x45b],
    [0, 0x45c],
    [5, 0x4c4], [6, 0x4c4],
    [0, 0x4c5], [2, 0x4c5], [4, 0x4c5], [5, 0x4c5], [6, 0x4c5], [7, 0x4c5],
    [0, 0x4c6], [1, 0x4c6], [2, 0x4c7],
    [4, 0x4c7], [5, 0x4c7],
]

achievement(
    title = "Treasure Collector", points = 50,
    description = "Open all the chests.",
    id = 93100, badge = "103288", published = "1/1/2020 2:05:55 PM", modified = "8/22/2021 10:53:53 AM",
    trigger = sum_of(ChestData, p => prev(bit(p[0], GlobalPointer + p[1]))) == 97 &&
        measured(sum_of(ChestData, p => bit(p[0], GlobalPointer + p[1])) == 98,
        when=ValidGlobalPointer && ValidPrevGlobalPointer)
)

achievement(
    title = "Max Health", points = 10,
    description = "Have 16 health.",
    id = 91982, badge = "102843", published = "12/25/2019 1:51:05 PM", modified = "1/20/2020 10:40:51 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        prev(MaxHP) < 16 && MaxHP == 16
)

achievement(
    title = "Max Magic", points = 10,
    description = "Increase the magic bar to the maximum.",
    id = 92957, badge = "103294", published = "12/31/2019 3:00:36 PM", modified = "1/20/2020 10:42:56 PM",
    trigger = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        prev(MaxMP) < 0x70 && MaxMP == 0x70
)

Tomba1 = [0xc9, 0xca, 0xcc, 0xcd]

achievement(
    title = "This Is What Those Tomba! 1 Events Were For", points = 10,
    description = "Complete the 4 events from Tomba! 1 data.",
    id = 93480, badge = "102850", published = "1/4/2020 11:33:45 AM", modified = "1/20/2020 10:43:58 PM",
    trigger = sum_of(Tomba1, p => prev(bit7(GlobalPointer + p))) == 3 &&
        measured(sum_of(Tomba1, p => bit7(GlobalPointer + p)) == 4,
        when=ValidGlobalPointer && ValidPrevGlobalPointer)
)

EventData = []
for i in range(0, 137) {
    if i != 62 {
        array_push(EventData, i)
    }
}

achievement(
    title = "First-rate Adventurer", points = 50,
    description = "Complete the game with all 137 events cleared.",
    id = 93481, badge = "103485", published = "1/4/2020 1:51:51 PM", modified = "7/14/2021 7:39:42 PM",
    trigger = MissionCompleteDidFind(byte(GlobalPointer + 0x45)) &&
        measured(sum_of(
            EventData, p => byte(GlobalPointer + 0x45 + p) / 255
        ) == 137, when=ValidGlobalPointer && ValidPrevGlobalPointer)
)

GemData = [
    [7, 0xc6],
    [7, 0xcb],
    [1, 0x444],
    [1, 0x445], [3, 0x445], [6, 0x445],
    [2, 0x446],
    [5, 0x447],
    [1, 0x448],
    [0, 0x449], [5, 0x449],
    [2, 0x44a],
    [2, 0x44b], [3, 0x44b], [5, 0x44b], [7, 0x44b],
    [3, 0x44c], [7, 0x44c],
    [4, 0x44d],
    [5, 0x450],
    [0, 0x45d], [1, 0x45d], [2, 0x45d], [3, 0x45d], [4, 0x45d], [5, 0x45d], [7, 0x45d],
    [0, 0x45e], [1, 0x45e], [2, 0x45e], [3, 0x45e], [4, 0x45e], [5, 0x45e], [6, 0x45e], [7, 0x45e],
    [0, 0x45f], [1, 0x45f], [2, 0x45f], [3, 0x45f], [4, 0x45f], [5, 0x45f], [6, 0x45f], [7, 0x45f],
    [0, 0x460], [1, 0x460], [2, 0x460], [3, 0x460], [4, 0x460], [5, 0x460], [6, 0x460], [7, 0x460],
    [0, 0x461], [1, 0x461], [2, 0x461], [3, 0x461], [4, 0x461],
    [0, 0x462], [1, 0x462], [2, 0x462], [3, 0x462], [4, 0x462], [5, 0x462], [6, 0x462], [7, 0x462],
    [0, 0x463], [1, 0x463], [2, 0x463], [3, 0x463], [4, 0x463], [5, 0x463], [6, 0x463], [7, 0x463],
    [0, 0x464], [1, 0x464], [2, 0x464], [3, 0x464], [4, 0x464], [5, 0x464], [6, 0x464], [7, 0x464],
    [0, 0x465], [5, 0x465], [6, 0x465], [7, 0x465],
    [0, 0x466], [1, 0x466], [2, 0x466], [3, 0x466], [4, 0x466], [5, 0x466], [6, 0x466], [7, 0x466],
    [0, 0x467], [1, 0x467], [2, 0x467], [3, 0x467], [4, 0x467], [5, 0x467], [6, 0x467], [7, 0x467],
    [0, 0x468], [3, 0x468], [4, 0x468], [5, 0x468], [6, 0x468], [7, 0x468],
    [0, 0x469], [1, 0x469], [2, 0x469], [3, 0x469], [4, 0x469], [5, 0x469], [6, 0x469], [7, 0x469],
    [0, 0x46a], [1, 0x46a], [2, 0x46a], [3, 0x46a], [4, 0x46a], [5, 0x46a], [6, 0x46a], [7, 0x46a],
    [0, 0x46b], [1, 0x46b], [2, 0x46b], [3, 0x46b], [4, 0x46b], [5, 0x46b], [6, 0x46b], [7, 0x46b],
    [0, 0x46c], [1, 0x46c], [2, 0x46c], [3, 0x46c], [4, 0x46c], [5, 0x46c], [6, 0x46c], [7, 0x46c],
    [0, 0x46d], [1, 0x46d], [2, 0x46d], [3, 0x46d], [4, 0x46d], [5, 0x46d], [6, 0x46d], [7, 0x46d],
    [0, 0x46e], [1, 0x46e], [2, 0x46e], [3, 0x46e], [4, 0x46e], [5, 0x46e], [6, 0x46e], [7, 0x46e],
    [0, 0x46f], [1, 0x46f], [2, 0x46f], [3, 0x46f], [4, 0x46f], [5, 0x46f], [6, 0x46f], [7, 0x46f],
    [0, 0x470], [1, 0x470], [2, 0x470], [3, 0x470], [4, 0x470], [5, 0x470], [6, 0x470], [7, 0x470],
    [0, 0x471], [1, 0x471], [2, 0x471], [3, 0x471], [4, 0x471], [5, 0x471], [6, 0x471], [7, 0x471],
    [0, 0x472], [1, 0x472], [2, 0x472], [3, 0x472], [4, 0x472], [5, 0x472], [6, 0x472], [7, 0x472],
    [0, 0x473], [1, 0x473], [2, 0x473], [3, 0x473], [4, 0x473], [5, 0x473], [6, 0x473], [7, 0x473],
    [0, 0x474], [1, 0x474], [2, 0x474], [3, 0x474], [4, 0x474], [5, 0x474], [6, 0x474], [7, 0x474],
    [0, 0x475], [1, 0x475], [2, 0x475], [3, 0x475], [4, 0x475], [5, 0x475], [6, 0x475], [7, 0x475],
    [0, 0x476], [1, 0x476], [2, 0x476], [3, 0x476], [4, 0x476], [5, 0x476], [6, 0x476], [7, 0x476],
    [0, 0x477], [1, 0x477], [2, 0x477], [3, 0x477], [4, 0x477], [5, 0x477], [6, 0x477], [7, 0x477],
    [0, 0x478], [1, 0x478], [2, 0x478], [3, 0x478], [4, 0x478], [5, 0x478], [6, 0x478], [7, 0x478],
    [0, 0x479], [1, 0x479], [2, 0x479], [3, 0x479], [4, 0x479], [5, 0x479], [6, 0x479], [7, 0x479],
    [0, 0x47a], [1, 0x47a], [2, 0x47a], [3, 0x47a], [4, 0x47a], [5, 0x47a], [6, 0x47a], [7, 0x47a],
    [0, 0x47b], [1, 0x47b], [2, 0x47b], [3, 0x47b], [4, 0x47b], [5, 0x47b], [6, 0x47b], [7, 0x47b],
    [0, 0x47c], [1, 0x47c], [2, 0x47c], [3, 0x47c], [4, 0x47c], [5, 0x47c], [6, 0x47c], [7, 0x47c],
    [0, 0x47d], [1, 0x47d], [2, 0x47d], [3, 0x47d], [4, 0x47d], [5, 0x47d], [6, 0x47d], [7, 0x47d],
    [0, 0x47e], [1, 0x47e], [2, 0x47e], [3, 0x47e], [4, 0x47e], [5, 0x47e], [6, 0x47e], [7, 0x47e],
    [0, 0x47f], [1, 0x47f], [2, 0x47f], [3, 0x47f], [4, 0x47f], [5, 0x47f], [6, 0x47f], [7, 0x47f],
    [0, 0x480], [1, 0x480], [2, 0x480], [3, 0x480], [4, 0x480], [5, 0x480], [6, 0x480], [7, 0x480],
    [0, 0x481], [2, 0x481], [3, 0x481], [4, 0x481],
    [0, 0x4c4], [1, 0x4c4],
    [5, 0x4c6],
    [0, 0x4c7],
]

// Ticket 66613: One gem doesn't count, making the achievement impossible to unlock (308/309). It's the yellow gem,
//               high up the entrance of Pipe Area and below the White Chest with the 100000 GEM.
//               RetroAchievements Hash: c5612f687ce6df98e8ab1212f51d2f25
//               Emulator: RetroArch (Bettle PSX)
//               Emulator Version: 1.16
// Ticket 61023: j'ai trouver avec beaucoup de mal la dernière gemme mais ça ne valide pas l'achievement :(
//               
//               https://zupimages.net/up/23/26/g9k9.png
//               
//               
//               Google Translate:
//               
//               I found with great difficulty the last gem but it does not validate the achievement :(
//               RetroAchievements Hash: c5612f687ce6df98e8ab1212f51d2f25
//               Emulator: RALibRetro (beetle psx)
//               Emulator Version: RALibretro version 1.6.0-x64
achievement(
    title = "Spyromba", points = 50,
    description = "Collect all the gems (except the ones from infinite sources).",
    id = 92965, badge = "102819", published = "12/31/2019 8:18:53 PM", modified = "4/12/2022 2:58:17 PM",
    trigger = prev(byte(GlobalPointer + 0x1da)) +
        sum_of(GemData, p => prev(bit(p[0], GlobalPointer + p[1]))) == 309 &&
        measured(byte(GlobalPointer + 0x1da) +
        sum_of(GemData, p => bit(p[0], GlobalPointer + p[1])) == 310,
        when=ValidGlobalPointer && ValidPrevGlobalPointer)
)

// Leaderboards

leaderboard(
    title = "Trolley Level 1",
    description = "Cross the finish line using the slower trolley.",
    start = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 3 && byte(GlobalPointer + 0x99) == 0 &&
        word(GlobalPointer + 0x28650) != prev(word(GlobalPointer + 0x28650)) &&
        ((word(GlobalPointer + 0x148) != 0 && prev(word(GlobalPointer + 0x148)) == 0) ||
        word(GlobalPointer + 0x148) < prev(word(GlobalPointer + 0x148))),
    cancel = always_false(),
    submit = always_true(),
    value = word(GlobalPointer + 0x148) * 2,
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Trolley Level 2",
    description = "Cross the finish line using the faster trolley.",
    start = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 3 && byte(GlobalPointer + 0x99) != 0 &&
        word(GlobalPointer + 0x28650) != prev(word(GlobalPointer + 0x28650)) &&
        ((word(GlobalPointer + 0x148) != 0 && prev(word(GlobalPointer + 0x148)) == 0) ||
        word(GlobalPointer + 0x148) < prev(word(GlobalPointer + 0x148))),
    cancel = always_false(),
    submit = always_true(),
    value = word(GlobalPointer + 0x148) * 2,
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Berry Nuts Harvest",
    description = "Get as many berry nuts as you can.",
    start = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0x14 && byte(GlobalPointer + 0x99) != 0 &&
        word(GlobalPointer + 0x1b4) > prev(word(GlobalPointer + 0x1b4)),
    cancel = always_false(),
    submit = always_true(),
    value = word(GlobalPointer + 0x1b4),
    format = "SCORE"
)

leaderboard(
    title = "Fastest Time IGT Any%",
    description = "How quickly can you beat this game?",
    start = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0x15 &&
        MissionCompleteDidFind(byte(GlobalPointer + 0x45)),
    cancel = always_false(),
    submit = always_true(),
    value = dword(GlobalPointer + 8),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    title = "Fastest Time IGT All Events%",
    description = "How quickly can you beat this game with every event? (Needs Tomba 1 save)",
    start = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0x15 &&
        MissionCompleteDidFind(byte(GlobalPointer + 0x45)) &&
        sum_of(
            EventData, p => bit7(GlobalPointer + 0x45 + p)
        ) == 137,
    cancel = always_false(),
    submit = always_true(),
    value = dword(GlobalPointer + 8),
    format = "FRAMES",
    lower_is_better = true
)

leaderboard(
    title = "Lowest AP on Finish",
    description = "How few Adventure Points can you get away with?",
    start = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0x15 &&
        MissionCompleteDidFind(byte(GlobalPointer + 0x45)),
    cancel = always_false(),
    submit = always_true(),
    value = AdventurePoints,
    format = "SCORE",
    lower_is_better = true
)

leaderboard(
    title = "Highest AP on Finish",
    description = "How many Adventure Points can you finish the game with?",
    start = __ornext(ValidGlobalPointer) && __ornext(ValidPrevGlobalPointer) &&
        CurrentArea == 0x15 &&
        MissionCompleteDidFind(byte(GlobalPointer + 0x45)),
    cancel = always_false(),
    submit = always_true(),
    value = AdventurePoints,
    format = "SCORE",
    lower_is_better = false
)

// Rich Presence

AreaLookup = {
    0: "Town of the Fishermen",
    1: "Large Mine Underground",
    2: "Coal-Mining Town",
    3: "The Evil Trolley OF DOOM",
    4: "Kujara Ranch",
    5: "Kujara Summit",
    6: "Donglin Forest",
    7: "Circus Village",
    8: "Water Temple",
    9: "????",
    10: "Fire Evil Pig Arena",
    11: "Ice Evil Pig Arena",
    12: "Ghost Evil Pig Arena",
    13: "Earth Evil Pig Arena",
    14: "Water Evil Pig Arena",
    15: "Final Evil Pig Arena",
    16: "Tower of Courage",
    17: "Tower of Strength",
    18: "Tower of Wisdom",
    19: "Golden Tower",
    20: "Mouse House",
    21: "The Ending",
}

RpArea = rich_presence_lookup("Area", CurrentArea, AreaLookup, "some location")

EmojiHP = "🍎"
EmojiAP = "💯"
EmojiQuests = "🗒️"

rich_presence_conditional_display(
    ValidGlobalPointer,
    "Tomba is at {0}. {1} {2} {3}{4}/{5}",
    RpArea,
    EmojiAP,
    rich_presence_macro("Number", AdventurePoints),
    EmojiQuests,
    rich_presence_macro("Number", byte(GlobalPointer + 0x3a)),
    rich_presence_macro("Number", byte(GlobalPointer + 0x38))
)

rich_presence_conditional_display(
    GlobalPointer < 0x30000 && __ornext(ValidZonePointer),
    "Tomba is heading towards {0}. {1} {2} {3}{4}/{5}",
    rich_presence_lookup("Area", byte(ZonePointer + 0), AreaLookup, "some location"),
    EmojiAP,
    rich_presence_macro("Number", dword(ZonePointer + 4)),
    EmojiQuests,
    rich_presence_macro("Number", byte(ZonePointer + 0x3a)),
    rich_presence_macro("Number", byte(ZonePointer + 0x38))
)

rich_presence_display("Tomba is back at it! Whoopee! (Camp)")
