// ~Hack~ Super Metroid: Ancient Chozo
// #ID = 3955

function HadItem(index, addr) => prev(bit(index, addr)) == 1
function HasItem(index, addr) => bit(index, addr) == 1
function BossBeaten(index, addr) => HasItem(index, addr)

function PickedUpItem(index, addr) {
    return bit(index, addr) > prev(bit(index, addr))
}

function WonBoss(index, addr) {
    return PickedUpItem(index, addr)
}

function AllTanks(areas) {
    tanks = []
    for i in areas {
        for j in i {
            array_push(tanks, j)
        }
    }
    return tanks
}

function MeasuredCount(items) {
    len = length(items)
    
    return sum_of(items, i => prev(bit(i[0], i[1]))) == len - 1 &&
        measured(sum_of(items, i => bit(i[0], i[1])) == len)
}

// Variables

GameState = byte(0x0998)
GsIntro = GameState <= 5
GsGameOver = GameState >= 0x13 && GameState <= 0x1a

PhysicsWater = byte(0xad2) == 1

RoomId = word(0x079b)

HasSpeedBooster = HasItem(2, 0xd878)

EquippedSpeedBooster = HasItem(5, 0x9a3)
EquippedSpaceJump = HasItem(1, 0x9a3)
EquippedHiJumpBoots = HasItem(0, 0x9a3)
EquippedGrapple = HasItem(6, 0x9a3)

EnteredGunship = word(0xa44) == 0xe902

CrateriaMissiles = [
    [1, 0xd870, 0x93fe],
    [2, 0xd870, 0x93fe],
    [3, 0xd870, 0x93fe],
    [4, 0xd870, 0x95ff],
    [5, 0xd870, 0x965b],
    [6, 0xd870, 0x975c],
    [1, 0xd871, 0x99bd],
    [4, 0xd871, 0x9a90],
    [4, 0xd88f, 0x9994]
]

CrateriaSuperMissiles = [
    [3, 0xd871, 0x99f9]
]

CrateriaPowerBombs = [
    [0, 0xd870, 0x93aa]
]

CrateriaEnergyTanks = [
    [0, 0xd871, 0x990d],
    [2, 0xd871, 0x99bd]
]

BrinstarMissiles = [
    [7, 0xd871, 0x9c07],
    [2, 0xd872, 0xa521],
    [3, 0xd872, 0xa4da],
    [5, 0xd872, 0x9d19],
    [6, 0xd872, 0x9c89],
    [1, 0xd873, 0xa201],
    [4, 0xd873, 0x9f64],
    [2, 0xd874, 0xa107],
    [4, 0xd874, 0x9f64],
    [5, 0xd874, 0x9f64],
    [4, 0xd875, 0xa471],
    [0, 0xd881, 0x9bc8],
    [7, 0xd88f, 0x9c35]
]

BrinstarSuperMissiles = [
    [6, 0xd871, 0x9b5b], // Spore Spawn Reward
    [0, 0xd872, 0x9bc8], // Spore Spawn Skip,
    [7, 0xd873, 0x9c35]
]

BrinstarPowerBombs = [
    [5, 0xd871, 0x9ad9],
    [0, 0xd873, 0x9e11],
    [3, 0xd873, 0x9e9f],
    [7, 0xd874, 0xa37c],
    [0, 0xd875, 0xa3ae],
]

BrinstarEnergyTanks = [
    [5, 0xd873, 0x9f64],
    [6, 0xd873, 0xa011],
    [1, 0xd874, 0xa0d2],
    [3, 0xd874, 0xa15b],
    [3, 0xd875, 0xa447],
]

BrinstarReserveTanks = [
    [1, 0xd872, 0xa4b1]
]

NorfairMissiles = [
    [1, 0xd876, 0xa788],
    [3, 0xd876, 0xac2b],
    [4, 0xd876, 0xa98d],
    [6, 0xd876, 0xaf72],
    [7, 0xd876, 0xaa41],
    [2, 0xd877, 0xacb3],
    [6, 0xd877, 0xa788],
    [7, 0xd877, 0xa788],
    [0, 0xd878, 0xad5e],
    [1, 0xd878, 0xacf0],
    [3, 0xd878, 0xaade],
    [6, 0xd878, 0xb283],
    [2, 0xd879, 0xb510],
    [4, 0xd879, 0xb40a],
    [5, 0xd879, 0xb656]
]

NorfairSuperMissiles = [
    [7, 0xd878, 0xb283],
]

NorfairPowerBombs = [
    [3, 0xd877, 0xab64],
    [1, 0xd879, 0xb5d5],
    [3, 0xd879, 0xb55a],
]

NorfairEnergyTanks = [
    [0, 0xd877, 0xaa41],
    [1, 0xd877, 0xaa82],
    [6, 0xd879, 0xac5a],
    [0, 0xd87a, 0xb6ee],
]

NorfairReserveTanks = [
    [5, 0xd877, 0xab3b]
]

WreckedShipMissiles = [
    [0, 0xd880, 0xcaf6],
    [2, 0xd880, 0xc98e],
    [3, 0xd880, 0xca52],
    [6, 0xd88f, 0xcccb]
]

WreckedShipSuperMissiles = [
    [5, 0xd880, 0xcda8],
    [6, 0xd880, 0xcdf1]
]

WreckedShipEnergyTanks = [
    [4, 0xd880, 0xcc27]
]

WreckedShipReserveTanks = [
    [1, 0xd880, 0xc98e]
]

MaridiaMissiles = [
    [1, 0xd875, 0x9461],
    [3, 0xd881, 0xd017],
    [5, 0xd881, 0xd13b],
    [6, 0xd881, 0xd1dd],
    [1, 0xd882, 0xd5a7],
    [2, 0xd882, 0xd5a7],
    [4, 0xd882, 0xd5a7],
    [7, 0xd882, 0xd72a],
    [5, 0xd88f, 0xd3b6]
]

MaridiaSuperMissiles = [
    [1, 0xd881, 0xcfc9],
    [4, 0xd881, 0xd13b],
    [5, 0xd882, 0xd5a7]
]

MaridiaPowerBombs = [
    [3, 0xd882, 0xd5a7]
]

MaridiaEnergyTanks = [
    [2, 0xd881, 0xd055],
    [0, 0xd883, 0xd95e]
]

MaridiaReserveTanks = [
    [0, 0xd882, 0xd5ec]
]

AllEnergyTanks = AllTanks([
    CrateriaEnergyTanks,
    BrinstarEnergyTanks,
    NorfairEnergyTanks,
    WreckedShipEnergyTanks,
    MaridiaEnergyTanks
])
AllReserveTanks = AllTanks([
    BrinstarReserveTanks,
    NorfairReserveTanks,
    WreckedShipReserveTanks,
    MaridiaReserveTanks
])
AllMissiles = AllTanks([
    CrateriaMissiles,
    BrinstarMissiles,
    NorfairMissiles,
    WreckedShipMissiles,
    MaridiaMissiles,
])
AllSuperMissiles = AllTanks([
    CrateriaSuperMissiles,
    BrinstarSuperMissiles,
    NorfairSuperMissiles,
    WreckedShipSuperMissiles,
    MaridiaSuperMissiles
])
AllPowerBombs = AllTanks([
    CrateriaPowerBombs,
    BrinstarPowerBombs,
    NorfairPowerBombs,
    MaridiaPowerBombs,
])
AllCrateriaMunitions = AllTanks([
    CrateriaMissiles,
    CrateriaSuperMissiles,
    CrateriaPowerBombs
])
AllBrinstarMunitions = AllTanks([
    BrinstarMissiles,
    BrinstarSuperMissiles,
    BrinstarPowerBombs
])
AllNorfairMunitions = AllTanks([
    NorfairMissiles,
    NorfairSuperMissiles,
    NorfairPowerBombs
])
AllWreckedShipMunitions = AllTanks([
    WreckedShipMissiles,
    WreckedShipSuperMissiles
])
AllMaridiaMunitions = AllTanks([
    MaridiaMissiles,
    MaridiaSuperMissiles,
    MaridiaPowerBombs
])

// Dependent Functions
function Room(addr) => RoomId == addr
function LastRoom(addr) => prev(RoomId) == addr
function PriorRoom(addr) => prior(RoomId) == addr

function AnyItem(items) {
    any_of(items, s => Room(s[2]) && PickedUpItem(s[0], s[1]))
}

function EnteredRoom(addr) {
    return !LastRoom(addr) && Room(addr)
}

// Achievements

// Story Progress

achievement(
    title = "Some Day, This Will Not Be First",
    description = "Pick up the Morphing Ball.",
    points = 2,
    trigger = Room(0x9e9f) && PickedUpItem(2, 0xd873)
)

achievement(
    title = "Always With The Guardians...",
    description = "Defeat the Torizo after picking up the Bombs.",
    points = 5,
    trigger = Room(0x9804) && WonBoss(2, 0xd828)
)

achievement(
    title = "Mega Buster This Ain't",
    description = "Pick up the Charge Beam.",
    points = 5,
    trigger = Room(0x9d19) && PickedUpItem(7, 0xd872)
)

achievement(
    title = "Did IGN Design This Room?",
    description = "Defeat the Spore Spawn.",
    points = 5,
    trigger = Room(0x9dc7) && WonBoss(1, 0xd829)
)

achievement(
    title = "Spazer, Wide, What's The Difference?",
    description = "Pick up the Spazer.",
    points = 5,
    trigger = Room(0x9c07) && PickedUpItem(2, 0xd875)
)

achievement(
    title = "Defenses Bery Much Voosted",
    description = "Pick up the Varia Suit after defeating Kraid.",
    points = 5,
    trigger = PriorRoom(0xa59f) && Room(0xa6e2) && PickedUpItem(0, 0xd876) && 
        BossBeaten(0, 0xd829)
)

achievement(
    title = "Arnold Would Be Proud",
    description = "Pick up the Ice Beam.",
    points = 5,
    trigger = Room(0xa890) && PickedUpItem(2, 0xd876)
)

achievement(
    title = "Lessons From Luigi",
    description = "Pick up the Hi-Jump Boots.",
    points = 5,
    trigger = Room(0xa9e5) && PickedUpItem(5, 0xd876)
)

achievement(
    title = "Severe Case Of Halitosis",
    description = "Defeat Crocomire.",
    points = 10,
    trigger = Room(0xa98d) && WonBoss(1, 0xd82a)
)

achievement(
    title = "Reach For The...Blocks?",
    description = "Pick up the Grappling Beam.",
    points = 5,
    trigger = Room(0xac2b) && PickedUpItem(4, 0xd877)
)

achievement(
    title = "Going Fast The Easy Way",
    description = "Pick up the Speed Booster.",
    points = 5,
    trigger = Room(0xad1b) && PickedUpItem(2, 0xd878)
)

achievement(
    title = "Waving Goodbye",
    description = "Pick up the Wave Beam.",
    points = 5,
    trigger = Room(0xad5e) && PickedUpItem(4, 0xd878)
)

// Intentionally placed here in the order to throw folks off.
achievement(
    title = "It Was Here The Entire Time?!?",
    description = "Pick up the X-Ray Scope.",
    points = 5,
    trigger = BossBeaten(1, 0xd82d) && Room(0xde7a) && PickedUpItem(6, 0xd874)
)

achievement(
    title = "Spooky Scary Lack of Skeletons",
    description = "Defeat Phantoon.",
    points = 10,
    trigger = Room(0xcd13) && WonBoss(0, 0xd82b)
)

achievement(
    title = "Mmmmmmmm. Pancakes.",
    description = "Pick up the Gravity Suit.",
    points = 5,
    trigger = Room(0xc98e) && PickedUpItem(7, 0xd880)
)

achievement(
    title = "The Early Chozo Gets The Botwoon",
    description = "Defeat Botwoon.",
    points = 5,
    trigger = Room(0xd95e) && WonBoss(1, 0xd82c)
)

achievement(
    title = "Spinning As Long As She Wants",
    description = "Pick up the Space Jump after defeating Draygon.",
    points = 10,
    trigger = PriorRoom(0xda60) && Room(0xd913) && PickedUpItem(2, 0xd883) &&
        BossBeaten(0, 0xd82c)
)

achievement(
    title = "No Smelting Required",
    description = "Pick up the Plasma Beam.",
    points = 5,
    trigger = Room(0xd2aa) && PickedUpItem(7, 0xd881)
)

achievement(
    title = "No Nails Or Thumbtacks Will Stop Me",
    description = "Pick up the Spring Ball.",
    points = 5,
    trigger = Room(0xd6d0) && PickedUpItem(6, 0xd882)
)

achievement(
    title = "The Symbol Of Destruction",
    description = "Pick up the Screw Attack after defeating the Golden Torizo.",
    points = 5,
    trigger = PriorRoom(0xb283) && Room(0xb6c1) && PickedUpItem(7, 0xd879) &&
        BossBeaten(2, 0xd82a)
)

achievement(
    title = "Asha Is Taking Notes Here",
    description = "Defeat Ridley.",
    points = 10,
    trigger = Room(0xb32e) && WonBoss(0, 0xd82a)
)

achievement(
    title = "Aw Crap: Here We Go Again",
    description = "Defeat Mother Brain and START LEAVING THE PLANET!",
    points = 10,
    trigger = Room(0xdd58) && WonBoss(1, 0xd82d)
)

// Overall Collection

achievement(
    title = "Faster Than Rhythm Game Songs",
    description = "Pick up your first missile pack.",
    points = 3,
    trigger = Room(0xa107) && PickedUpItem(2, 0xd874)
)

achievement(
    title = "Who Needs Keys When You Have These?",
    description = "Pick up your first super missile pack.",
    points = 5,
    trigger = AnyItem(AllSuperMissiles)
)

achievement(
    title = "I Have The Power! *BOOM*",
    description = "Pick up your first power bomb pack.",
    points = 5,
    trigger = AnyItem(AllPowerBombs)
)

achievement(
    title = "Five Hours Not Required",
    description = "Pick up your first Energy Tank.",
    points = 5,
    trigger = AnyItem(AllEnergyTanks)
)

achievement(
    title = "Not Saying No Here",
    description = "Pick up your first Reserve Tank.",
    points = 5,
    trigger = AnyItem(AllReserveTanks)
)

achievement(
    title = "Cleaning In Crateria",
    description = "Obtain all munitions in Crateria.",
    points = 10,
    trigger = MeasuredCount(AllCrateriaMunitions) && AnyItem(AllCrateriaMunitions)
)

achievement(
    title = "Nothing Left In Norfair",
    description = "Obtain all munitions in Norfair.",
    points = 10,
    trigger = MeasuredCount(AllNorfairMunitions) && AnyItem(AllNorfairMunitions)
)

achievement(
    title = "Breaking Down Brinstar",
    description = "Obtain all munitions in Brinstar.",
    points = 10,
    trigger = MeasuredCount(AllBrinstarMunitions) && AnyItem(AllBrinstarMunitions)
)

achievement(
    title = "Shining The Wrecked Ship",
    description = "Obtain all munitions in the Wrecked Ship.",
    points = 10,
    trigger = MeasuredCount(AllWreckedShipMunitions) && AnyItem(AllWreckedShipMunitions)
)

achievement(
    title = "Making Maridia Clean",
    description = "Obtain all munitions in Maridia.",
    points = 10,
    trigger = MeasuredCount(AllMaridiaMunitions) && AnyItem(AllMaridiaMunitions)
)

achievement(
    title = "All The Caffiene You Need",
    description = "Obtain all 14 Energy Tanks.",
    points = 10,
    trigger = MeasuredCount(AllEnergyTanks) && AnyItem(AllEnergyTanks)
)

achievement(
    title = "We Have Reserves",
    description = "Obtain all four Reserve Tanks.",
    points = 10,
    trigger = MeasuredCount(AllReserveTanks) && AnyItem(AllReserveTanks)
)

// Ending Cheevos

achievement(
    title = "There's The Earth Shattering Kaboom",
    description = "Escape Zebes by yourself.",
    points = 10,
    trigger = BossBeaten(1, 0xd82d) && Room(0x92fd) && EnteredGunship &&
        !HasItem(7, 0xd821)
)

achievement(
    title = "Cannon Respecting Canon",
    description = "Escape Zebes -- but save the animals first!",
    points = 10,
    trigger = BossBeaten(1, 0xd82d) && Room(0x92fd) && EnteredGunship &&
        HasItem(7, 0xd821)
)

achievement(
    title = "We Hardly Knew Ye",
    description = "Escape Zebes before hitting 3 in-game hours.",
    points = 25,
    trigger = repeated(2567, GameState == 0x27) && byte(0x9e0) < 3 &&
        never(GameState != 0x27)
)

PercentCompletion = word(0x1f51) == 0xe7ba

AllItemsFinish = GameState == 0x27 &&
    word(0x9a4) == 0xf32f &&
    word_be(0x9a8) == 0xf10 &&
    word(0x9c4) == 0x5db &&
    byte(0x9c8) == 250 &&
    byte(0x9cc) == 50 &&
    byte(0x9d0) == 50 &&
    word(0x9d4) == 400 &&
    dword_be(0xd870) == 0xffffefff &&
    dword_be(0xd874) == 0xfe1fffff &&
    dword_be(0xd878) == 0xdffe0100 &&
    dword_be(0xd880) == 0xffffff05 &&
    byte(0xd88f) == 0xf0 &&
    prev(word(0x1f51)) != 0xe7ba && PercentCompletion

achievement(
    title = "At Least The Planet Was Cleaned First?",
    description = "Escape Zebes with all items. (104%)",
    points = 25,
    trigger = AllItemsFinish
)

achievement(
    title = "No Bionic Commander",
    description = "Escape Zebes without ever collecting the Grappling Beam.",
    points = 25,
    trigger = BossBeaten(1, 0xd82d) && Room(0x92fd) && EnteredGunship &&
        !HasItem(6, 0x9a5)
)

achievement(
    title = "No Rush To Finish",
    description = "Escape Zebes without ever collecting the Speed Booster.",
    points = 25,
    trigger = BossBeaten(1, 0xd82d) && Room(0x92fd) && EnteredGunship &&
        !HasItem(5, 0x9a5)
)

achievement(
    title = "No Chill At All",
    description = "Escape Zebes without ever collecting the Ice Beam.",
    points = 25,
    trigger = BossBeaten(1, 0xd82d) && Room(0x92fd) && EnteredGunship &&
        !HasItem(1, 0x9a8)
)

// Speedrun Tricks

achievement(
    title = "Catch You On The Flip Side",
    description = "Claim the Bombs, but avoid the battle with the Torizo.",
    points = 10,
    trigger = Room(0x9879) && LastRoom(0x9804) &&
        HasItem(7, 0xd870) &&
        !BossBeaten(2, 0xd828) && !BossBeaten(2, 0xd82d)
)

achievement(
    title = "New Take On An Old Classic [m]",
    description = "Do the new Spore Spawn Skip. Same room as before.",
    points = 10,
    trigger = never(EquippedSpeedBooster) && never(EquippedSpaceJump) &&
        never(EquippedHiJumpBoots) &&
        Room(0x9bc8) && !HadItem(0, 0xd872) &&
        trigger_when(PickedUpItem(0, 0xd872))
)

achievement(
    title = "Toys Tossed By The Pool [m]",
    description = "Immediately after defeating Kraid, pick up the Spring Ball WITHOUT entering Norfair!",
    points = 10,
    trigger = 
        once(WonBoss(0, 0xd829)) &&
        trigger_when(PickedUpItem(6, 0xd882)) &&
        never(Room(0xa7de)) &&
        never(Room(0xad5e)) &&
        never(GsIntro) &&
        never(GsGameOver)
)

achievement(
    title = "My Swinging Arm Is Tired [m]",
    description = "Pick up the Wave Beam -- no GR, SB, or SJ!",
    points = 10,
    trigger =
        once(EnteredRoom(0xad5e) && !HasItem(4, 0xd878)) &&
        never(EquippedSpeedBooster) &&
        never(EquippedSpaceJump) &&
        never(Room(0xa1ad)) &&
        never(Room(0xacf0)) &&
        never(Room(0xa788)) &&
        never(Room(0xaf72)) &&
        never(GsIntro) &&
        never(GsGameOver) &&
        trigger_when(PickedUpItem(4, 0xd878)) // Do the rest
)

// This specific cheevo needs to use Reset Next If, but
// the ability to do so in RATools is limited.
pondLeft = once(LastRoom(0x948c) && Room(0x95ff)) &&
    never(Room(0x948c)) && trigger_when(Room(0x93fe))
pondRight = once(LastRoom(0x93fe) && Room(0x95ff)) &&
    never(Room(0x93fe)) && trigger_when(Room(0x948c))

achievement(
    title = "That's Enough Baths For One Day",
    description = "Cross the small pond to the right of your ship -- no GR, SB, SJ!",
    points = 10,
    trigger = never(PhysicsWater) &&
        never(EquippedSpeedBooster) &&
        never(EquippedSpaceJump) &&
        never(EquippedGrapple) &&
        never(GsIntro) &&
        never(GsGameOver) &&
        (pondLeft || pondRight)
)

achievement(
    title = "No Rushing To Pancakes [m]",
    description = "From Crateria Small Pond, defeat Phantoon & pick up the Gravity Suit in one go -- no Speed Booster or Space Jump!",
    points = 10,
    trigger = once(LastRoom(0x95ff) && Room(0x93fe) && !BossBeaten(0, 0xd82b)) &&
        never(GsIntro) &&
        never(GsGameOver) &&
        never(EquippedSpeedBooster) &&
        never(EquippedSpaceJump) &&
        trigger_when(WonBoss(0, 0xd82b)) &&
        trigger_when(PickedUpItem(7, 0xd880))
)

achievement(
    title = "Since When Are Kiddie Pools Dangerous? [m]",
    description = "Pick up the Energy Tank in the Wrecked Ship without getting damaged -- no Space Jump!",
    points = 10,
    trigger = once(EnteredRoom(0xcc27) && !HasItem(4, 0xd880)) &&
        never(EquippedSpaceJump) &&
        never(GsIntro) &&
        never(GsGameOver) &&
        never(Room(0xcbd5)) &&
        trigger_when(PickedUpItem(4, 0xd880))
)

achievement(
    title = "This Is Not A Randomizer [m]",
    description = "Pick up the Plasma Beam before defeating Draygon.",
    points = 10,
    trigger = Room(0xd2aa) && PickedUpItem(7, 0xd881) && !BossBeaten(0, 0xd82c)
)

achievement(
    title = "Metroids Are Not Just Big Anymore [m]",
    description = "Pick up the Energy Tank from the Ancient Chozo -- no Speed Booster or Space Jump!",
    points = 10,
    trigger = once(EnteredRoom(0xd055) && !HasItem(2, 0xd881)) &&
        never(EquippedSpaceJump) &&
        never(EquippedSpeedBooster) &&
        never(GsIntro) &&
        never(GsGameOver) &&
        never(!Room(0xd055)) &&
        trigger_when(PickedUpItem(2, 0xd881))
)

achievement(
    title = "Key Under The Lava Mat [m]",
    description = "Enter Lower Norfair via the other way -- before taking out Ridley!",
    points = 5,
    trigger = LastRoom(0xad5e) && Room(0xb656) && !BossBeaten(0, 0xd82a)
)

SuperMetroidHealthDrain = prev(word(0x9c2)) - word(0x9c2) < 9 &&
    prev(word(0x9c2)) != word(0x9c2)
LostHealth = word(0x9c2) < prev(word(0x9c2))

achievement(
    title = "Hugs Are Overrated...This Time [m]",
    description = "Do not get caught by the Super Metroid.",
    points = 10,
    trigger = once(LastRoom(0xdc19) && Room(0xdc65)) &&
        never(GsIntro) &&
        never(GsGameOver) &&
        never(SuperMetroidHealthDrain) &&
        trigger_when(Room(0xdcff))
)

achievement(
    title = "Dang You Muscle Memory",
    description = "During the escape, get through the Retro Crateria Escape Tube without taking damage.",
    points = 5,
    trigger = once(LastRoom(0xdede) && Room(0x96ba) && HasItem(6, 0xd821)) &&
        never(GsIntro) &&
        never(GsGameOver) &&
        never(LostHealth) &&
        trigger_when(Room(0x92fd))
)

// Leaderboards

function InGameTime() => byte(0x9da) + byte(0x9dc) * 60 +
    byte(0x9de) * 3600 + byte(0x9e0) * 216000

leaderboard(
    title = "Any% IGT",
    description = "Beat the game! In-Game Time used.",
    start = repeated(2567, GameState == 0x27) && never(GameState != 0x27),
    cancel = always_false(),
    submit = always_true(),
    value = InGameTime(),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "104% IGT",
    description = "Beat the game with all items! In-Game Time used.",
    start = AllItemsFinish,
    cancel = always_false(),
    submit = always_true(),
    value = InGameTime(),
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "Escape Zebes -- Only Escapee",
    description = "Escape Zebes before the time runs out!",
    start = Room(0x91f8) && prev(word(0xa44)) != 0xe902 && EnteredGunship &&
        HasItem(6, 0xd821) && !HasItem(7, 0xd821),
    cancel = always_false(),
    submit = always_true(),
    value = bcd(byte(0x945)) + bcd(byte(0x946)) * 100 + bcd(byte(0x947)) * 6000,
    format = "MILLISECS"
)

leaderboard(
    title = "Escape Zebes -- Canon Ending",
    description = "Save the animals and Escape Zebes before the time runs out!",
    start = Room(0x91f8) && prev(word(0xa44)) != 0xe902 && EnteredGunship &&
        HasItem(6, 0xd821) && HasItem(7, 0xd821),
    cancel = always_false(),
    submit = always_true(),
    value = bcd(byte(0x945)) + bcd(byte(0x946)) * 100 + bcd(byte(0x947)) * 6000,
    format = "MILLISECS"
)

leaderboard(
    title = "Any% RTA",
    description = "Beat the game in one session, one life!",
    start = word(0xaf6) < 0x480 && Room(0x91f8) && bit2(0x9a4) == 0,
    cancel = GameState == 0x19 || GsIntro,
    submit = Room(0x91f8) && EnteredGunship && HasItem(6, 0xd821),
    value = !HasItem(6, 0xd821) || !EnteredGunship,
    lower_is_better = true,
    format = "FRAMES"
)

leaderboard(
    title = "104% RTA",
    description = "Beat the game with all items in one session, one life!",
    start = word(0xaf6) < 0x480 && Room(0x91f8) && bit2(0x9a4) == 0,
    cancel = GameState == 0x19 || GsIntro ||
        (GameState == 0x27 && PercentCompletion && word_be(0x9a8) != 0xf10) ||
        (GameState == 0x27 && PercentCompletion && word(0x9c4) != 0x5db) ||
        (GameState == 0x27 && PercentCompletion && byte(0x9c8) != 250) ||
        (GameState == 0x27 && PercentCompletion && byte(0x9cc) != 50) ||
        (GameState == 0x27 && PercentCompletion && byte(0x9d0) != 50) ||
        (GameState == 0x27 && PercentCompletion && word(0x9d4) != 400) ||
        (GameState == 0x27 && PercentCompletion && dword_be(0xd870) != 0xffffefff) ||
        (GameState == 0x27 && PercentCompletion && dword_be(0xd874) != 0xfe1fffff) ||
        (GameState == 0x27 && PercentCompletion && dword_be(0xd878) != 0xdffe0100) ||
        (GameState == 0x27 && PercentCompletion && dword_be(0xd880) != 0xffffff05) ||
        (GameState == 0x27 && PercentCompletion && byte(0xd88f) != 0xf0),
    submit = GameState == 0x27 && PercentCompletion,
    value = !HasItem(6, 0xd821) || !EnteredGunship,
    lower_is_better = true,
    format = "FRAMES"
)

// Rich Presence

AreaLookup = {
    0: "Crateria",
    1: "Brinstar",
    2: "Norfair",
    3: "Wrecked Ship",
    4: "Maridia",
    5: "Tourian"
}

HudWeaponLookup = {
    0: "Beams",
    1: "Missiles",
    2: "Super Missiles",
    3: "Power Bombs",
    4: "Grappling Beam",
    5: "X-Ray Scope"
}

RpArea = rich_presence_lookup("Area", byte(0x79f), AreaLookup)
RpWeapon = rich_presence_lookup("Weapon", byte(0x9d2), HudWeaponLookup)
RpInGameHours = rich_presence_macro("Number", byte(0x9e0))
RpInGameMinutes = rich_presence_macro("Number", byte(0x9de))

rich_presence_conditional_display(
    GameState >= 0x26 && GameState <= 0x27,
    "Your Mission is Completed Successfully. " +
    "Clear Time {0}:{1}",
    RpInGameHours,
    RpInGameMinutes
)
rich_presence_conditional_display(
    GsIntro || (GameState >= 0x1e && GameState <= 0x25), "Mission Debriefing"
)
rich_presence_display(
    "Samus In {0} Equipped with {1}",
    RpArea,
    RpWeapon
)
