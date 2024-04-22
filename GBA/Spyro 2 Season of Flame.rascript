// Spyro 2: Season of Flame
// #ID = 796

// $0000D0: Potential US/EU Version Discriminator?
//          bit4 set: US
//          bit5 set: EU
// $000850: Potential Music Byte? In Catridge Space?
// $000851: Potential Music Byte? In Catridge Space?
// $000854: Unknown Timer [32-bit]
// $000958: Potential Music Byte? In Catridge Space?
// $00095C: Potential Music Byte? In Catridge Space?
// $0010AC: Buttons Held This Frame Part 1
//          bit0: A
//          bit1: B
//          bit2: Select
//          bit3: Start
//          bit4: Right
//          bit5: Left
//          bit6: Up
//          bit7: Down
// $0010AD: Buttons Held This Frame Part 2
//          bit0: R
//          bit1: L
// $0010B0: Buttons Pressed This Frame Part 1 (See 0x10ac)
// $0010B1: Buttons Pressed This Frame Part 2 (See 0x10ad)
// $0010B4: Unknown Timer [32-bit]
// $00117E: Slow Ticking Counter? [16-bit]
// $0011C3: 00 on screen load and counts up on fadeins
// $001618: Time (4 seconds at ff)
// $001619: Time [seconds x 4] [18m8s at max]
// $00161A: Time (18m 12s each, 77h 22m 08s at max)
// $00161C: Breath Equipped [01=Fire, 02=Ice, 03=Lightning, 04=Superflame, 05=SuperIce]
// $001620: Current Level Red Gems [1]
// $001622: Current Level Green Gems [2]
// $001624: Current Level Purple Gems [5]
// $001626: Current Level Yellow Gems [10]
// $00162A: Active Save Slot (0-2)
//          This persists when entering the main menu.
// $00162C: Breath equipped (EU)
// $001650: Sunny Plains Gems [Hex]
// $001652: Country Farms Gems [Hex]
// $001654: Shamrock Isle Gems [Hex]
// $001656: Temple of Dune Gems [Hex]
// $001658: Tiki Tropics Gems [Hex]
// $00165C: Celestial Plains Gems [Hex]
// $00165E: Candy Land Gems [Hex]
// $001660: Haunted Hills Gems [Hex]
// $001662: Winter Mesa Gems [Hex]
// $001664: Dreamy Castle Gems [Hex]
// $001668: Starry Plains Gems [Hex]
// $00166A: Moon Fondue Gems [Hex]
// $00166C: Gypsy Road Gems [Hex]
// $00166E: Watertopia Gems [Hex]
// $001672: Rumble Jungle Gems [Hex]
// $001674: Alpine Abode Gems [Hex]
// $001676: Minty Mines Gems [Hex]
// $001678: Volcano Vault Gems
// $00167A: Canyon Hop Gems [Hex]
// $00167C: Arctic Outback Gems [Hex]
// $00167E: Lunar Ledges Gems [Hex]
// $001680: Gems [Ripto's Mondo Volcano] [Hex]
// $001A42: Fireflies [Sunny Plain Max 6]
// $001A43: Fireflies [Country Farms Max 7]
// $001A44: Fireflies [Shamrock Isle Max 7]
// $001A45: Fireflies [Temple of Dune Max 7]
// $001A46: Fireflies [Tiki Tropics Max 7]
// $001A48: Fireflies [Celestial Plains Max 6]
// $001A49: Fireflies [Candy Land Max 7]
// $001A4A: Fireflies [Haunted Hills Max 7]
// $001A4B: Fireflies [Winter Mesa Max 7]
// $001A4C: Fireflies [Dreamy Castle Max 7]
// $001A4E: Fireflies [Starry Plains Max 6]
// $001A4F: Fireflies [Moon Fondue Max 6]
// $001A50: Fireflies [Gypsy Road Max 6]
// $001A51: Fireflies [Watertopia Max 6]
// $001A53: Fireflies [Rumble Jungle Max 1]
// $001A54: Fireflies [Alpine Adobe Max 1]
// $001A55: Fireflies [Minty Mines Max 1]
// $001A56: Fireflies [Volcano Vault Max 1]
// $001A57: Fireflies [Canyon Hop Max 1]
// $001A58: Fireflies [Arctic Outback Max 1]
// $001A59: Fireflies [Lunar Ledges Max 1]
// $001A5A: Fireflies [Ripto's Mondo Volcano Max 1]
// $001A5B: Sunny Plains Gem Block
// $001A5C: These blocks show specific gems for each stage
// $001A80: Shamrock Isle Gem Block
// $001A92: Temple of Dune Gem Block
// $001AA5: Tiki Tropics Gem Block
// $001AB8: Celestial Plains Gem Block
// $001ACA: Candy Land Gem Block
// $001ADB: Haunted Hills Gem Block
// $001AF0: Winter Mesa Gem Block
// $001B1B: Starry Plains Gem Block
// $001B51: Watertopia Gem Block
// $001B67: Rumble Jungle Gem Block
// $001B7A: Alpine Adobe Gem block
// $001B8D: Minty Mines Gem Block
// $001BB3: Canyon Hop Gem Block
// $001BBD: Arctic Outback Gem Block
// $001BC8: Lunar Ledges Gem Block
// $001BD3: Ripto's Mondo Volcano Gem Block
// $001BDE: Fireflies [bit0= WaterCave2, bit1= ShamChall2, bit2=CandCake, bit3=ShamChall1, bit4=CanyonHop, bit5=TempleRand3, bit6=GypsyRand1, bit7=Firebreath]
// $001BDF: Fireflies [bit0=StarRand1, bit1=DreamClocks, bit2=SunnyHunter1, bit3=StarAltars, bit4=CeleRand1, bit5=MoonNavSystems, bit6=TikiRand4, bit7=TempleCave]
// $001BE0: Fireflies [bit0=CandRand3, bit1=HauntChall, bit2=Yoric, bit3=HauntCave1, bit4=WaterChall, bit5=AlpAdob, bit6=DreamRand2, bit7=ArcOut]
// $001BE1: Fireflies [bit0=Hockey1, bit1=FarmChall, bit2=HauntCave2, bit3=WinterRand1, bit4=TempleRand2, bit5=HauntPumpkin, bit6=GypsyRand2, bit7=CandCage]
// $001BE2: Fireflies [bit0=HauntRand1, bit1=TikiRand1, bit2=MondoVolc, bit3=TempleChall, bit4=TikiVines, bit5=WinterEscort, bit6=CandChall, bit7=TikiRand2]
// $001BE3: Fireflies [bit0=WinterTrees, bit1=SuperFlame, bit2=StarRand2, bit3=DreamCave, bit4=Bombs, bit5=WaterCave1, bit6=SuperIce, bit7=WaterRand]
// $001BE4: Fireflies [bit0=GypsyFreezetag1, bit1=MoonChall, bit2=ShamRand2, bit3=LunLedg, bit4=GypsySkulls, bit5=MintMine, bit6=ShamRand3, bit7=JumpTut]
// $001BE5: Fireflies [bit0=Lemonade, bit1=DreamMayor, bit2=FarmRand2, bit3=LunarAltars, bit4=WaterFlower, bit5=CeleRand2, bit6=SunnyBianca, bit7=MoonRand1]
// $001BE6: Fireflies [bit0=HauntRand2, bit1=StarHunter, bit2=TempleRand1, bit3=Haystacks, bit4=TikiTorch, bit5=ShamRand1, bit6=Lightning, bit7=CandRand4]
// $001BE7: Fireflies [bit0=Horseshoe, bit1=MoonLightningrods, bit2=FarmRand4, bit3=IceSham, bit4=GypsyFreezetag2,  bit5=StarRand3, bit6=DreamChall2, bit7=SunnyRand1]
// $001BE8: Fireflies [bit0=WaterSoldier, bit1=DreamRand1, bit2=WinterRand2, bit3=HunterRock, bit4=CandRand2, bit5=MoonRand2, bit6=Hockey2, bit7=RumbJung]
// $001BE9: Fireflies [bit0=VolcanoVault, bit1=WinterCandles, bit2=TikiBigTorch, bit3=DreamChall1, bit4=CeleRand3, bit5=MadamMeow, bit6=SunAltars, bit7=CandRand1]
// $001BEA: Fireflies [bit0=TikiRand3, bit1=FarmRand1, bit2=MoonRand3, bit3=FarmRand3]
// $001C58: Current Gems [Hex]
// $001C59: Current Gems x256 [Hex]
// $001C5A: Gems Total [Hex]
// $001C5B: Gems Total [Hex] x256
// $001C5D: Current Stage
// $001C5E: Lives
// $001C5F: Current HP [01-04] [05 with health upgrade]
// $001C65: Dialogue flags
// $001C66: Moneybags Paid [bit0=CanyonHop, bit1=ArcticOutback, bit2=LunarLedges, bit3=MondoVolcano] [bit6,7=vasetut]
// $001C6B: Portals active [bit0=Celestial Plains, bit1=Starry Plains, bit2=Ripto's Lair]
// $001C6D: Key In Inv = bit7, Key Used = bit6, No Key = 00 (US)
//          Current stage (EU)
// $001C6E: 03=Yorik in inv
// $001C6F: 04 = Horseshoe in Inv
// $001C78: Bits related to objectives
// $001C79: Bits related to objectives that count over 8
// $001C7C: Objects in Set Complete [bits]
// $001C85: Objects in Set Complete [Num]
// $001C86: Current Gems [Thousands] [Num]
// $001C87: Current Gems [Hundreds] [Num]
// $001C88: Current Gems [Tens] [Num]
// $001C89: Current Gems [Ones] [Num]
// $001C8A: Fireflies Total [Hundreds] [Num]
// $001C8B: Fireflies Total [Tens] [Num]
// $001C8C: Fireflies Total [Ones] [Num]
// $001C8E: Lives B
// $001CA8: Sparx Panic: Highest Score Earned [32-bit]
// $001CBC: Options (EU)
//          Bit 1 = music
//          Bit 2 = sound
//          Bit 3 = voice
//          Bit 4 = tutorial
// $0026C8: Bit0=Blue Spyro cheat
//          Bit1=All Portals unlocked cheat
//          Bit2=Super Charge cheat
//          Bit3=Atlas Warp cheat
//          Bit4=Infinite Lives cheat
//          Bit5=Dragon Draughts unlocked cheat
//          Bit6=Spark Panic unlocked cheat
//          Bit7=Never Drown cheat
// $0026C9: Bit0=Inifite Ammo (Agent 9) cheat
//          Bit1=Infinite Shield (Agent 9) cheat
//          Bit2=View all Worlds in Atlas cheat
//          Bit3=All Breath types unlocked cheat
// $0026D8: Cheats (EU)
// $003280: Potential Music Byte? In Catridge Space?
// $003281: Potential Music Byte? In Catridge Space?
// $004576: Breath equipped (editing this changes breath) (US)
// $0045B4: Spyro's Z coordinate (US)
// $0045B8: Spyro's X coordinate (US)
// $0045BC: Spyro's Y coordinate (US)
// $00475A: Special breath time left (US)
// $0048A4: Screen position X [From left]
// $0048A8: Screen Position Y [From Top]
// $00640C: Potential Pointer? [32-bit]
// $006414: Only changes on shoot
// $006418: Sparx Panic Level [00=1]
// $00641C: Sparx Panic Lives
// $006420: Sparx Panic Score
// $006421: Sparx Panic Score x256
// $006422: Sparx Panic Score x 65536
// $006423: Sparx Panic Score x 16777216
// $006428: Sparx Panic State [05=Title, 00=Ingame, 01=Paused, 06=Death, 03=Game Over]
// $006440: Flashes to 61 on Sparx Panic start
// $00645A: Awkward Dragon Draughts Detector? [8-bit]
//          This consistently stayed on 0x01 when Dragon Draughts was selected.
// $008008: Improper Pointer for Dragon Draughts [32-bit]
// $00F92F: Gulp Health [03=full, 00=dead] ?
// $03D367: Ripto's Health [02=full, 00=Last]
// $03DFD3: Gulp Health [03=full, 00=dead] ?
// $03E454: Agent 9's health (EU)
// $03ED10: Main Menu: Which Option?
//          0x00: Continue Game
//          0x01: New Game
//          0x02: Options
//          0x03: Credits
//          0x04: Sparx Panic
//          0x05: Dragon Draughts
//          -- This is also reused for the save slot. Need something better.
// $03F178: Hits done to Crush [Death at 03]
// $04672B: Pointer Chaos: Dragon Draughts Horizontal Position
// $046967: Pointer Chaos: Dragon Draughts Horizontal Position
// $046968: Dragon Draughts: Vertical Cursor Position (down to up)
// $046B30: Dragon Draughts: Board and Pieces [64 bytes]
//          Count left to right, bottom to top on this one.
//          0x00: No occupancy
//          0x01: Spyro's Piece
//          0x03: Spyro's King
//          0x04: Elder's Piece
//          0x0c: Elder's King
// $046B78: Agent 9's ammo (EU)
// $046BA3: Pointer Chaos: Dragon Draughts Horizontal Position
// $046E88: Dragon Draughts [32-bit pointer]
//          +0xc990 | Board [64 bytes]
//          +0xc9d0 | In-Game Status [8-bit]
//          +0xc9ec | 1 when a game has been won [8-bit] (Make sure Start was NOT pressed!!!)
//          +0xca03 | Horizontal Cursor Position [8-bit]
// $046EA0: Potential Pointer for Dragon Draughts? [32-bit]
//          See 0x046e88. Note that these two MUST be equal in order for it to count.

StageLookup = {
    0x00: "Sunny Plains",
    0x01: "Country Farms",
    0x02: "Shamrock Isle",
    0x03: "Temple of Dune",
    0x04: "Tiki Tropics",
    0x05: "Battling Crush",
    0x06: "Celestial Plains",
    0x07: "Candy Land",
    0x08: "Haunted Hills",
    0x09: "Winter Mesa",
    0x10: "Battling Ripto",
    0x0a: "Dreamy Castle",
    0x0b: "Battling Gulp",
    0x0c: "Starry Plains",
    0x0d: "Moon Fondue",
    0x0e: "Gypsy Road",
    0x0f: "Watertopia",
    0x11: "Rumble Jungle",
    0x12: "Alpine Adobe",
    0x13: "Minty Mines",
    0x14: "Volcano Vaults",
    0x15: "Canyon Hop",
    0x16: "Arctic Outback",
    0x17: "Lunar Ledges",
    0x18: "Ripto's Mondo Volcano",
}

LangOffset = bit5(0xd0) * 0x10

CheatProtection = bit1(0x0026C8 + LangOffset) == 0x00 && 
              bit2(0x0026C8 + LangOffset) == 0x00 &&
              bit4(0x0026C8 + LangOffset) == 0x00 &&
              bit7(0x0026C8 + LangOffset) == 0x00 &&
              byte(0x0026C9 + LangOffset) == 0x00

achievement(
    title = "Season of Ice", description = "Beat the game without reclaiming your fire breath.", points = 25,
    id = 22700, badge = "22720", published = "5/9/2015 10:47:49 AM", modified = "9/23/2021 9:45:33 PM",
    trigger =
    bit6(0x1c65 + LangOffset) > prev(bit6(0x1c65 + LangOffset)) &&
    byte(0x161C + LangOffset) != 0x01 && bit7(0x1BDE + LangOffset) != 0x01 && 
    bit5(0x1BE1 + LangOffset) != 0x01 && bit4(0x1BE2 + LangOffset) != 0x01 &&
    bit4(0x1BE4 + LangOffset) != 0x01 && bit1(0x1BE5 + LangOffset) != 0x01 && 
    bit3(0x1BE6 + LangOffset) != 0x01 && bit4(0x1BE6 + LangOffset) != 0x01 &&
    bit2(0x1BE9 + LangOffset) != 0x01 && bit6(0x1BE9 + LangOffset) != 0x01 && 
    bit1(0x1BDF + LangOffset) != 0x01 && byte(0x1C5D + LangOffset) == 0x10 &&
    byte(0x1C5F + LangOffset) != 0x00 && byte(0x1C5F + LangOffset) <= 0x05 && 
    CheatProtection
)

achievement(
    title = "The Two-Part Solution", description = "Open a chest.", points = 5,
    id = 22641, badge = "22597", published = "5/8/2015 11:35:20 PM", modified = "9/23/2021 9:49:03 PM",
    trigger = always_true() &&
              bit6(0x001C6D + LangOffset) > prev(bit6(0x001C6D + LangOffset)) &&
              byte(0x006420 + LangOffset) != 0xFF &&
              prev(bit7(0x001C6D + LangOffset)) == 0x01 && 
              bit7(0x001C6D + LangOffset) == 0x00 &&
              byte(0x001C5F + LangOffset) != 0x00 &&
              byte(0x001C5F + LangOffset) <= 0x05 &&
              CheatProtection
)

achievement(
    title = "The Rich Get Richer", description = "Pay Moneybags all four times.", points = 10,
    id = 22642, badge = "22625", published = "5/8/2015 11:35:23 PM", modified = "9/23/2021 9:32:30 PM",
    trigger = always_true() &&
        low4(0x001C66 + LangOffset) == 0x0F &&
        prev(low4(0x001C66 + LangOffset)) < 0x0F &&
        byte(0x001C5F + LangOffset) != 0x00 &&
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Money In Your Wallet", description = "Hold 1000 gems at once.", points = 1,
    id = 22692, badge = "22681", published = "5/8/2015 11:36:40 PM", modified = "12/13/2021 11:48:20 AM",
    trigger = always_true() &&
        prev(byte(0x001C86 + LangOffset)) < 0x01 &&
        measured((byte(0x001C86 + LangOffset) * 0x3E8 +
        byte(0x001C87 + LangOffset) * 0x64 +
        byte(0x001C88 + LangOffset) * 0x0A +
        byte(0x001C89 + LangOffset)) >= 0x3E8) &&
        byte(0x006420 + LangOffset) != 0xFF &&
        byte(0x001C86 + LangOffset) <= 0x08 && 
        byte(0x001C5F + LangOffset) != 0x00 &&
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Slightly Rich", description = "Hold 3000 gems at once.", points = 5,
    id = 22693, badge = "22682", published = "5/8/2015 11:36:42 PM", modified = "9/23/2021 9:26:05 PM",
    trigger = always_true() &&
        byte(0x001C86 + LangOffset) >= 0x03 &&
        byte(0x006420 + LangOffset) != 0xFF &&
        byte(0x001C86 + LangOffset) <= 0x08 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Gem Hoarder", description = "Hold 5000 gems at once.", points = 10,
    id = 22694, badge = "22684", published = "5/8/2015 11:36:43 PM", modified = "9/24/2021 1:24:45 PM",
    trigger = always_true() &&
        byte(0x001C86 + LangOffset) >= 0x05 &&
        byte(0x006420 + LangOffset) != 0xFF &&
        byte(0x001C86 + LangOffset) <= 0x08 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Moneybags", description = "Hold all 8000 gems at once.", points = 25,
    id = 22695, badge = "22686", published = "5/8/2015 11:36:45 PM", modified = "9/24/2021 1:25:15 PM",
    trigger = always_true() &&
        byte(0x001C86 + LangOffset) == 0x08 &&
        byte(0x006420 + LangOffset) != 0xFF &&
        byte(0x001C5F + LangOffset) != 0x00 &&
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

function FireflyCount() => byte(0x001C8A + LangOffset) * 100 +
    byte(0x001C8B + LangOffset) * 10 +
    byte(0x001C8C + LangOffset)

achievement(
    title = "Spark Reignited", description = "Collect 25 total fireflies.", points = 5,
    id = 22688, badge = "22545", published = "5/8/2015 11:36:33 PM", modified = "9/24/2021 1:25:59 PM",
    trigger = always_true() &&
        FireflyCount() >= 25 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Rising Flame", description = "Collect 50 total fireflies.", points = 5,
    id = 22689, badge = "22678", published = "5/8/2015 11:36:36 PM", modified = "9/24/2021 1:26:12 PM",
    trigger = always_true() &&
        FireflyCount() >= 50 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "The Flame Returns", description = "Collect 75 total fireflies.", points = 10,
    id = 22690, badge = "22679", published = "5/8/2015 11:36:37 PM", modified = "9/24/2021 1:27:40 PM",
    trigger = always_true() &&
        FireflyCount() >= 75 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "The Flame Grows Ever Stronger", description = "Collect every firefly.", points = 25,
    id = 22691, badge = "22680", published = "5/8/2015 11:36:39 PM", modified = "9/24/2021 1:27:55 PM",
    trigger = always_true() &&
        FireflyCount() >= 100 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Jalapeno Addict", description = "Get your fire breath back.", points = 5,
    id = 22576, badge = "22546", published = "5/3/2015 1:06:04 PM", modified = "9/24/2021 1:28:36 PM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x01 &&
        prev(byte(0x00161C + LangOffset)) == 0x02 &&
        byte(0x00161C + LangOffset) == 0x01 &&
        byte(0x001C5F + LangOffset) != 0x00 &&
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Crush'd", description = "Defeat Crush.", points = 10,
    id = 22646, badge = "22721", published = "5/8/2015 11:35:29 PM", modified = "9/24/2021 1:28:46 PM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x05 &&
        bit4(0x001C65 + LangOffset) > prev(bit4(0x001C65 + LangOffset)) &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Armor... So Heavy...", description = "Defeat Gulp.", points = 10,
    id = 22654, badge = "22644", published = "5/8/2015 11:35:40 PM", modified = "9/24/2021 1:29:40 PM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x0B &&
        bit5(0x001C65 + LangOffset) > prev(bit5(0x001C65 + LangOffset)) &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "The Cardmaster", description = "Defeat Ripto.", points = 10,
    id = 22660, badge = "22722", published = "5/8/2015 11:35:49 PM", modified = "9/24/2021 1:29:29 PM",
    trigger = always_true() &&
        bit6(0x001C65 + LangOffset) > prev(bit6(0x001C65 + LangOffset)) &&
        byte(0x001C5D + LangOffset) == 0x10 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Nav System Rush", description = "Turn on all the Rocket Navigational Satellites without changing breath.", points = 10,
    id = 22656, badge = "22646", published = "5/8/2015 11:35:44 PM", modified = "11/14/2021 12:20:43 PM",
    trigger = always_true() &&
        repeated(8, byte(0x001C78 + LangOffset) > prev(byte(0x001C78 + LangOffset)) &&
        never(byte(0x001C5D + LangOffset) != 0x0D || byte(0x00161C + LangOffset) != 0x03)) &&
        unless(byte(0x001C5F + LangOffset) == 0x00) &&
        unless(byte(0x001C5F + LangOffset) > 0x05) &&
        unless(byte(0x00161C + LangOffset) > 0x05) &&
        CheatProtection
)

achievement(
    title = "Bright and Solitary", description = "Get all gems and fireflies in Sunny Plains.", points = 5,
    id = 22685, badge = "22659", published = "5/8/2015 11:36:29 PM", modified = "9/24/2021 1:30:45 PM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x00 &&
        word(0x001650 + LangOffset) == 0x12C &&
        byte(0x001A42 + LangOffset) == 0x06 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Farmhand", description = "Get all gems and fireflies in Country Farms.", points = 5,
    id = 22663, badge = "22653", published = "5/8/2015 11:35:53 PM", modified = "9/24/2021 1:31:13 PM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x01 &&
        byte(0x001A43 + LangOffset) == 0x07 &&
        word(0x001652 + LangOffset) == 0x12C &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Extremely Lucky", description = "Get all gems and fireflies in Shamrock Isle.", points = 5,
    id = 22664, badge = "22654", published = "5/8/2015 11:35:55 PM", modified = "9/24/2021 2:00:30 PM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x02 &&
        word(0x001654 + LangOffset) == 0x12C &&
        byte(0x001A44 + LangOffset) == 0x07 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Spyro and the Temple of Dune", description = "Get all gems and fireflies in Temple of Dune.", points = 5,
    id = 22665, badge = "22655", published = "5/8/2015 11:35:56 PM", modified = "9/24/2021 2:01:03 PM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x03 &&
        word(0x001656 + LangOffset) == 0x12C &&
        byte(0x001A45 + LangOffset) == 0x07 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Tropical Vacation", description = "Get all gems and fireflies in Tiki Tropics.", points = 5,
    id = 22666, badge = "22656", published = "5/8/2015 11:35:58 PM", modified = "9/24/2021 2:01:21 PM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x04 &&
        word(0x001658 + LangOffset) == 0x190 &&
        byte(0x001A46 + LangOffset) == 0x07 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Home Invasion", description = "Get all gems and fireflies in Alpine Adobe.", points = 5,
    id = 22667, badge = "22660", published = "5/8/2015 11:36:00 PM", modified = "9/24/2021 2:01:59 PM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x12 &&
        word(0x001674 + LangOffset) == 0x12C &&
        byte(0x001A54 + LangOffset) == 0x01 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Only The Small Gems, Thanks", description = "Get all gems and fireflies in Minty Mines.", points = 5,
    id = 22668, badge = "22657", published = "5/8/2015 11:36:02 PM", modified = "9/24/2021 2:17:18 PM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x13 &&
        word(0x001676 + LangOffset) == 0x12C &&
        byte(0x001A55 + LangOffset) == 0x01 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Green Feet", description = "Get all gems and fireflies in Canyon Hop.", points = 5,
    id = 22669, badge = "22658", published = "5/8/2015 11:36:04 PM", modified = "9/24/2021 2:17:35 PM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x15 &&
        word(0x00167A + LangOffset) == 0x12C &&
        byte(0x001A57 + LangOffset) == 0x01 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Warm and Toasty", description = "100% all worlds in Sunny Plains.", points = 10,
    id = 22670, badge = "22677", published = "5/8/2015 11:36:05 PM", modified = "9/24/2021 2:24:04 PM",
    trigger = always_true() &&
        word(0x001650 + LangOffset) == 0x12C &&
        word(0x001652 + LangOffset) == 0x12C &&
        word(0x001654 + LangOffset) == 0x12C &&
        word(0x001656 + LangOffset) == 0x12C && 
        word(0x001658 + LangOffset) == 0x190 &&
        word(0x001676 + LangOffset) == 0x12C &&
        word(0x001674 + LangOffset) == 0x12C &&
        word(0x00167A + LangOffset) == 0x12C && 
        byte(0x001A42 + LangOffset) == 0x06 &&
        byte(0x001A43 + LangOffset) == 0x07 &&
        byte(0x001A44 + LangOffset) == 0x07 &&
        byte(0x001A45 + LangOffset) == 0x07 && 
        byte(0x001A46 + LangOffset) == 0x07 &&
        byte(0x001A54 + LangOffset) == 0x01 &&
        byte(0x001A55 + LangOffset) == 0x01 &&
        byte(0x001A57 + LangOffset) == 0x01 && 
        byte(0x001C5F + LangOffset) != 0x00 &&
        byte(0x001C5F + LangOffset) <= 0x05 &&
        byte(0x001C5D + LangOffset) <= 0x15 &&
        byte(0x001C5D + LangOffset) != 0x14 && 
        byte(0x001C5D + LangOffset) != 0x11 &&
        byte(0x001C5D + LangOffset) != 0x10 &&
        byte(0x001C5D + LangOffset) != 0x0F &&
        byte(0x001C5D + LangOffset) != 0x0E && 
        byte(0x001C5D + LangOffset) != 0x0D &&
        byte(0x001C5D + LangOffset) != 0x0C &&
        byte(0x001C5D + LangOffset) != 0x0B &&
        byte(0x001C5D + LangOffset) != 0x0A && 
        byte(0x001C5D + LangOffset) != 0x09 &&
        byte(0x001C5D + LangOffset) != 0x08 &&
        byte(0x001C5D + LangOffset) != 0x07 &&
        byte(0x001C5D + LangOffset) != 0x06 && 
        byte(0x001C5D + LangOffset) != 0x05 &&
        CheatProtection
)

achievement(
    title = "Dark and Distant", description = "Get all gems and fireflies in Celestial Plains", points = 5,
    id = 22686, badge = "22667", published = "5/8/2015 11:36:30 PM", modified = "9/24/2021 2:24:51 PM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x06 &&
        word(0x00165C + LangOffset) == 0x12C &&
        byte(0x001A48 + LangOffset) == 0x06 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Candy Savior", description = "Get all gems and fireflies in Candy Lane.", points = 5,
    id = 22672, badge = "22661", published = "5/8/2015 11:36:10 PM", modified = "8/25/2022 12:00:32 AM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x07 &&
        word(0x00165E + LangOffset) == 0x12C &&
        byte(0x001A49 + LangOffset) == 0x07 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Spooky Scary", description = "Get all gems and fireflies in Haunted Hills.", points = 5,
    id = 22673, badge = "22662", published = "5/8/2015 11:36:11 PM", modified = "9/24/2021 2:25:29 PM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x08 &&
        word(0x001660 + LangOffset) == 0x190 &&
        byte(0x001A4A + LangOffset) == 0x07 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Festival Reveler", description = "Get all gems and fireflies in Winter Mesa.", points = 5,
    id = 22674, badge = "22663", published = "5/8/2015 11:36:12 PM", modified = "9/24/2021 2:25:40 PM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x09 &&
        word(0x001662 + LangOffset) == 0x190 &&
        byte(0x001A4B + LangOffset) == 0x07 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Ugh, Water Levels", description = "Get all gems and fireflies in Watertopia.", points = 5,
    id = 22675, badge = "22665", published = "5/8/2015 11:36:14 PM", modified = "9/24/2021 2:26:35 PM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x0F &&
        byte(0x001A51 + LangOffset) == 0x06 &&
        word(0x00166E + LangOffset) == 0x190 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Rambo Incarnate", description = "Get all gems and fireflies in Rumble Jungle.", points = 5,
    id = 22676, badge = "22664", published = "5/8/2015 11:36:15 PM", modified = "9/24/2021 2:26:52 PM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x11 &&
        word(0x001672 + LangOffset) == 0x190 &&
        byte(0x001A53 + LangOffset) == 0x01 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Global Warming", description = "Get all gems and fireflies in Arctic Outback", points = 5,
    id = 22677, badge = "22666", published = "5/8/2015 11:36:17 PM", modified = "9/24/2021 2:27:44 PM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x16 &&
        byte(0x001A58 + LangOffset) == 0x01 &&
        word(0x00167C + LangOffset) == 0x190 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Kangaroos In Space", description = "Get all gems and fireflies in Lunar Ledges.", points = 5,
    id = 22678, badge = "22668", published = "5/8/2015 11:36:18 PM", modified = "9/24/2021 2:28:00 PM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x17 &&
        word(0x00167E + LangOffset) == 0x190 &&
        byte(0x001A59 + LangOffset) == 0x01 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Cold and Desolate", description = "100% all worlds in Celestial Plains.", points = 10,
    id = 22671, badge = "22676", published = "5/8/2015 11:36:08 PM", modified = "9/24/2021 2:30:05 PM",
    trigger = always_true() &&
        word(0x00165E + LangOffset) == 0x12C &&
        word(0x001660 + LangOffset) == 0x190 &&
        word(0x001662 + LangOffset) == 0x190 &&
        word(0x00165C + LangOffset) == 0x12C && 
        word(0x00166E + LangOffset) == 0x190 &&
        word(0x00167C + LangOffset) == 0x190 &&
        word(0x00167E + LangOffset) == 0x190 &&
        word(0x001672 + LangOffset) == 0x190 && 
        byte(0x001A48 + LangOffset) == 0x06 &&
        byte(0x001A49 + LangOffset) == 0x07 &&
        byte(0x001A4A + LangOffset) == 0x07 &&
        byte(0x001A4B + LangOffset) == 0x07 && 
        byte(0x001A51 + LangOffset) == 0x06 &&
        byte(0x001A53 + LangOffset) == 0x01 &&
        byte(0x001A58 + LangOffset) == 0x01 &&
        byte(0x001A59 + LangOffset) == 0x01 && 
        byte(0x001C5D + LangOffset) <= 0x17 &&
        byte(0x001C5D + LangOffset) >= 0x06 &&
        byte(0x001C5D + LangOffset) != 0x15 &&
        byte(0x001C5D + LangOffset) != 0x14 && 
        byte(0x001C5D + LangOffset) != 0x13 &&
        byte(0x001C5D + LangOffset) != 0x12 &&
        byte(0x001C5D + LangOffset) != 0x10 &&
        byte(0x001C5D + LangOffset) != 0x0E && 
        byte(0x001C5D + LangOffset) != 0x0D &&
        byte(0x001C5D + LangOffset) != 0x0C &&
        byte(0x001C5D + LangOffset) != 0x0B &&
        byte(0x001C5D + LangOffset) != 0x0A && 
        byte(0x001C5F + LangOffset) != 0x00 &&
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Glorious and Many", description = "Get all gems and fireflies in Starry Plains", points = 5,
    id = 22687, badge = "22669", published = "5/8/2015 11:36:32 PM", modified = "9/24/2021 2:31:29 PM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x0C &&
        word(0x001668 + LangOffset) == 0x12C &&
        byte(0x001A4E + LangOffset) == 0x06 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "The Sleeping Dragon", description = "Get all gems and fireflies in Dreamy Castle.", points = 5,
    id = 22680, badge = "22670", published = "5/8/2015 11:36:21 PM", modified = "9/24/2021 2:34:01 PM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x0A &&
        byte(0x001A4C + LangOffset) == 0x07 &&
        word(0x001664 + LangOffset) == 0x1F4 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Beep Boop Bop", description = "Get all gems and fireflies in Moon Fondue.", points = 5,
    id = 22681, badge = "22671", published = "5/8/2015 11:36:22 PM", modified = "9/24/2021 2:34:26 PM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x0D &&
        byte(0x001A4F + LangOffset) == 0x06 &&
        word(0x00166A + LangOffset) == 0x190 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Plaster of Paris...?", description = "Get all gems and fireflies in Gypsy Road.", points = 5,
    id = 22682, badge = "22672", published = "5/8/2015 11:36:24 PM", modified = "9/24/2021 2:35:51 PM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x0E &&
        byte(0x001A50 + LangOffset) == 0x06 &&
        word(0x00166C + LangOffset) == 0x190 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "The Ultimate Heist", description = "Get all gems and fireflies in Volcano Vault.", points = 5,
    id = 22683, badge = "22674", published = "5/8/2015 11:36:25 PM", modified = "9/24/2021 2:36:46 PM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x14 &&
        byte(0x001A56 + LangOffset) == 0x01 &&
        word(0x001678 + LangOffset) == 0x1F4 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Totally Mondo", description = "Get all gems and fireflies in Ripto's Mondo Volcano.", points = 5,
    id = 22684, badge = "22685", published = "5/8/2015 11:36:26 PM", modified = "9/24/2021 2:37:16 PM",
    trigger = always_true() &&
        byte(0x001C5D + LangOffset) == 0x18 &&
        byte(0x001A5A + LangOffset) == 0x01 &&
        word(0x001680 + LangOffset) == 0x190 &&
        byte(0x001C5F + LangOffset) != 0x00 && 
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Sparkling and Magnificent", description = "100% all worlds in Starry Plains.", points = 10,
    id = 22679, badge = "22675", published = "5/8/2015 11:36:19 PM", modified = "9/24/2021 2:38:47 PM",
    trigger = always_true() &&
        word(0x001664 + LangOffset) == 0x1F4 &&
        word(0x001668 + LangOffset) == 0x12C &&
        word(0x00166A + LangOffset) == 0x190 &&
        word(0x00166C + LangOffset) == 0x190 && 
        word(0x001678 + LangOffset) == 0x1F4 &&
        word(0x001680 + LangOffset) == 0x190 &&
        byte(0x001A4C + LangOffset) == 0x07 &&
        byte(0x001A4E + LangOffset) == 0x06 && 
        byte(0x001A4F + LangOffset) == 0x06 &&
        byte(0x001A50 + LangOffset) == 0x06 &&
        byte(0x001A56 + LangOffset) == 0x01 &&
        byte(0x001A5A + LangOffset) == 0x01 && 
        byte(0x001C5D + LangOffset) <= 0x18 &&
        byte(0x001C5D + LangOffset) >= 0x0A &&
        byte(0x001C5D + LangOffset) != 0x17 &&
        byte(0x001C5D + LangOffset) != 0x16 && 
        byte(0x001C5D + LangOffset) != 0x15 &&
        byte(0x001C5D + LangOffset) != 0x14 &&
        byte(0x001C5D + LangOffset) != 0x13 &&
        byte(0x001C5D + LangOffset) != 0x12 && 
        byte(0x001C5D + LangOffset) != 0x11 &&
        byte(0x001C5D + LangOffset) != 0x10 &&
        byte(0x001C5D + LangOffset) != 0x0F &&
        byte(0x001C5D + LangOffset) != 0x0B && 
        byte(0x001C5F + LangOffset) != 0x00 &&
        byte(0x001C5F + LangOffset) <= 0x05 &&
        CheatProtection
)

achievement(
    title = "Sparx Your Engines", description = "Reach Level 25 in Sparx Panic", points = 10,
    id = 22586, badge = "22577", published = "5/7/2015 1:40:03 AM", modified = "12/16/2017 10:45:05 PM",
    trigger = byte(0x006418) == 0x18 && never(byte(0x006428) > 0x06) && never(byte(0x006440) != 0x00) && 
              prev(byte(0x006418)) == 0x17
)

achievement(
    title = "Sparxing It Up", description = "Reach Level 50 in Sparx Panic", points = 10,
    id = 22587, badge = "22576", published = "5/7/2015 1:40:05 AM", modified = "1/21/2021 4:09:30 AM",
    trigger = byte(0x006418) == 0x31 && never(byte(0x006428) > 0x06) && never(byte(0x006440) != 0x00) && 
              prev(byte(0x006418)) == 0x30
)

function Music(val) {
    return byte(0x850 + LangOffset) == val// && byte(0x3280 + LangOffset) == val
}

function CheckersMusic() {
    return __ornext(Music(0x6c) || Music(0x98))
}

achievement(
    title = "Reverse The Charge", description = "In Dragon Draughts, get a piece to the end of the board.", points = 5,
    id = 243210, badge = "270081", published = "8/27/2022 2:33:02 AM", modified = "9/13/2022 4:55:13 PM",
    trigger = CheckersMusic() &&
        byte(0x006422) == 0x00 && byte(0x006423) == 0x00 && byte(0x00645A) == 0x01 &&
        tbyte(0x046E88) == tbyte(0x046EA0) &&
        ((bit1(tbyte(0x046E88) + 0x00C9C9) > prev(bit1(tbyte(0x046E88) + 0x00C9C9))) ||
        (bit1(tbyte(0x046E88) + 0x00C9CB) > prev(bit1(tbyte(0x046E88) + 0x00C9CB))) ||
        (bit1(tbyte(0x046E88) + 0x00C9CD) > prev(bit1(tbyte(0x046E88) + 0x00C9CD))) ||
        bit1(tbyte(0x046E88) + 0x00C9CF) > prev(bit1(tbyte(0x046E88) + 0x00C9CF)))
)

achievement(
    title = "Domination Victory", description = "In Dragon Draughts, win by capturing all opposing pieces.", points = 10,
    id = 243211, badge = "270082", published = "8/27/2022 2:33:10 AM", modified = "9/13/2022 4:55:13 PM",
    trigger = CheckersMusic() && byte(0x006422) == 0x00 && byte(0x006423) == 0x00 && byte(0x00645A) == 0x01 && tbyte(0x046E88) ==
               tbyte(0x046EA0) && byte(tbyte(0x046E88) + 0x00C990) <= 0x03 && byte(tbyte(0x046E88) + 0x00C992) <= 0x03 && 
              byte(tbyte(0x046E88) + 0x00C994) <= 0x03 && byte(tbyte(0x046E88) + 0x00C996) <= 0x03 && 
              byte(tbyte(0x046E88) + 0x00C999) <= 0x03 && byte(tbyte(0x046E88) + 0x00C99B) <= 0x03 && 
              byte(tbyte(0x046E88) + 0x00C99D) <= 0x03 && byte(tbyte(0x046E88) + 0x00C99F) <= 0x03 && 
              byte(tbyte(0x046E88) + 0x00C9A0) <= 0x03 && byte(tbyte(0x046E88) + 0x00C9A2) <= 0x03 && 
              byte(tbyte(0x046E88) + 0x00C9A4) <= 0x03 && byte(tbyte(0x046E88) + 0x00C9A6) <= 0x03 && 
              byte(tbyte(0x046E88) + 0x00C9A9) <= 0x03 && byte(tbyte(0x046E88) + 0x00C9AB) <= 0x03 && 
              byte(tbyte(0x046E88) + 0x00C9AD) <= 0x03 && byte(tbyte(0x046E88) + 0x00C9AF) <= 0x03 && 
              byte(tbyte(0x046E88) + 0x00C9B0) <= 0x03 && byte(tbyte(0x046E88) + 0x00C9B2) <= 0x03 && 
              byte(tbyte(0x046E88) + 0x00C9B4) <= 0x03 && byte(tbyte(0x046E88) + 0x00C9B6) <= 0x03 && 
              byte(tbyte(0x046E88) + 0x00C9B9) <= 0x03 && byte(tbyte(0x046E88) + 0x00C9BB) <= 0x03 && 
              byte(tbyte(0x046E88) + 0x00C9BD) <= 0x03 && byte(tbyte(0x046E88) + 0x00C9BF) <= 0x03 && 
              byte(tbyte(0x046E88) + 0x00C9C0) <= 0x03 && byte(tbyte(0x046E88) + 0x00C9C2) <= 0x03 && 
              byte(tbyte(0x046E88) + 0x00C9C4) <= 0x03 && byte(tbyte(0x046E88) + 0x00C9C6) <= 0x03 && 
              byte(tbyte(0x046E88) + 0x00C9C9) <= 0x03 && byte(tbyte(0x046E88) + 0x00C9CB) <= 0x03 && 
              byte(tbyte(0x046E88) + 0x00C9CD) <= 0x03 && byte(tbyte(0x046E88) + 0x00C9CF) <= 0x03 && 
              byte(tbyte(0x046E88) + 0x00C9EC) == 0x01 && ((bit0(tbyte(0x046E88) + 0x00C990) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C992) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C994) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C996) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C999) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C99B) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C99D) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C99F) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C9A0) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C9A2) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C9A4) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C9A6) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C9A9) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C9AB) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C9AD) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C9AF) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C9B0) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C9B2) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C9B4) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C9B6) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C9B9) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C9BB) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C9BD) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C9BF) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C9C0) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C9C2) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C9C4) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C9C6) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C9C9) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C9CB) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C9CD) == 0x01) ||
               bit0(tbyte(0x046E88) + 0x00C9CF) == 0x01)
)

achievement(
    title = "The Winning Move Is Not To Play", description = "In Dragon Draughts, have a game end with someone not allowed to move.", points = 10,
    id = 243212, badge = "270083", published = "8/27/2022 2:33:15 AM", modified = "9/13/2022 4:55:12 PM",
    trigger = CheckersMusic() && byte(0x006422) == 0x00 && byte(0x006423) == 0x00 && byte(0x00645A) == 0x01 &&
        tbyte(0x046E88) == tbyte(0x046EA0) &&
        ((bit0(tbyte(0x046E88) + 0x00C990) == 0x01) ||
        (bit0(tbyte(0x046E88) + 0x00C992) == 0x01) ||
        (bit0(tbyte(0x046E88) + 0x00C994) == 0x01) ||
        (bit0(tbyte(0x046E88) + 0x00C996) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C999) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C99B) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C99D) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C99F) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C9A0) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C9A2) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C9A4) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C9A6) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C9A9) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C9AB) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C9AD) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C9AF) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C9B0) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C9B2) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C9B4) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C9B6) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C9B9) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C9BB) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C9BD) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C9BF) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C9C0) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C9C2) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C9C4) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C9C6) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C9C9) == 0x01) || (bit0(tbyte(0x046E88) + 0x00C9CB) == 0x01) ||
               (bit0(tbyte(0x046E88) + 0x00C9CD) == 0x01) || bit0(tbyte(0x046E88) + 0x00C9CF) == 0x01) && 
              ((bit2(tbyte(0x046E88) + 0x00C990) == 0x01) || (bit2(tbyte(0x046E88) + 0x00C992) == 0x01) ||
               (bit2(tbyte(0x046E88) + 0x00C994) == 0x01) || (bit2(tbyte(0x046E88) + 0x00C996) == 0x01) ||
               (bit2(tbyte(0x046E88) + 0x00C999) == 0x01) || (bit2(tbyte(0x046E88) + 0x00C99B) == 0x01) ||
               (bit2(tbyte(0x046E88) + 0x00C99D) == 0x01) || (bit2(tbyte(0x046E88) + 0x00C99F) == 0x01) ||
               (bit2(tbyte(0x046E88) + 0x00C9A0) == 0x01) || (bit2(tbyte(0x046E88) + 0x00C9A2) == 0x01) ||
               (bit2(tbyte(0x046E88) + 0x00C9A4) == 0x01) || (bit2(tbyte(0x046E88) + 0x00C9A6) == 0x01) ||
               (bit2(tbyte(0x046E88) + 0x00C9A9) == 0x01) || (bit2(tbyte(0x046E88) + 0x00C9AB) == 0x01) ||
               (bit2(tbyte(0x046E88) + 0x00C9AD) == 0x01) || (bit2(tbyte(0x046E88) + 0x00C9AF) == 0x01) ||
               (bit2(tbyte(0x046E88) + 0x00C9B0) == 0x01) || (bit2(tbyte(0x046E88) + 0x00C9B2) == 0x01) ||
               (bit2(tbyte(0x046E88) + 0x00C9B4) == 0x01) || (bit2(tbyte(0x046E88) + 0x00C9B6) == 0x01) ||
               (bit2(tbyte(0x046E88) + 0x00C9B9) == 0x01) || (bit2(tbyte(0x046E88) + 0x00C9BB) == 0x01) ||
               (bit2(tbyte(0x046E88) + 0x00C9BD) == 0x01) || (bit2(tbyte(0x046E88) + 0x00C9BF) == 0x01) ||
               (bit2(tbyte(0x046E88) + 0x00C9C0) == 0x01) || (bit2(tbyte(0x046E88) + 0x00C9C2) == 0x01) ||
               (bit2(tbyte(0x046E88) + 0x00C9C4) == 0x01) || (bit2(tbyte(0x046E88) + 0x00C9C6) == 0x01) ||
               (bit2(tbyte(0x046E88) + 0x00C9C9) == 0x01) || (bit2(tbyte(0x046E88) + 0x00C9CB) == 0x01) ||
               (bit2(tbyte(0x046E88) + 0x00C9CD) == 0x01) || bit2(tbyte(0x046E88) + 0x00C9CF) == 0x01) && 
              byte(tbyte(0x046E88) + 0x00C9EC) == 0x01 &&
              disable_when(bit3(0x0010AC) == 0x01,
               until=(prev(byte(tbyte(0x046E88) + 0x00C9EC)) == 0x01) && byte(tbyte(0x046E88) + 0x00C9EC) == 0x00)
               
)

leaderboard(
    id = 838, title = "Sparx Panic Highscore",
    description = "Try for the highest score in Sparx Panic [Enter from Main Menu]",
    start  = byte(0x006440) == 0x61 && prev(byte(0x006440)) == 0x00,
    cancel = byte(0x006428) == 0xFF,
    submit = byte(0x006428) == 0x03,
    value = byte(0x006420) + byte(0x006421) * 256 + byte(0x006422) * 65536 + byte(0x006423) * 16777216,
    format = "SCORE"
)

rich_presence_display("{0}, {1} Fireflies. IGT: {2}",
    rich_presence_lookup("Stage", byte(0x001C5D), StageLookup),
    rich_presence_value("Fireflies", byte(0x001C8C) + byte(0x001C8B) * 10 + byte(0x001C8A) * 100),
    rich_presence_value("IGT", byte(0x001618) + byte(0x001619) * 256 + byte(0x00161A) * 65536, format="FRAMES")
)
