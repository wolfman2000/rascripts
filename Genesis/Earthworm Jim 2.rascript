// Earthworm Jim 2
// #ID = 2182

// $8FC0: Some sort of graphic tileset RAM?!? [896 bytes]
//        This block was noticed while in The Flyin' King. It's unclear how useful this block is.
// $93C2: Camera Y-Position [16-bit]
// $93C4: Camera X-Position? [16-bit]
//        Need to verify on a platforming level.
// $9434: Map View Mode Cheat?
//        0x00: Off
//        0xFF: On
function IsMapModeOn() => once(byte(0x9434) == 0xff)
// $9438: Cheat Input Counter
//        This goes from 0x00 - 0x07 for the first seven presses. If the 8th press represents a cheat, change to 0xFF. If it does not, or the Cheat Timer Countdown hits 0x00, reset this value to 0x00.
//        Sometimes when the Cheat Timer Countdown goes to 0x00, this value is also set to 0xFF. DO NOT rely on that behavior for cheat detection!
// $9439: Cheat Timer Countdown
//        This counts down from 0xB4 to 0x00. If nothing is pressed by that time, the counter cycles and the existing cheat code is wiped out.
//        Sometimes when the counter cycles, it sets 0x9438 to 0xFF.
// $943A: Cheat Check Button 2
//        Press a button while paused to set this to a non-zero value. The value is locked in when you let go of the button. This allows for values to be ORed together, but no cheats involve more than one button press at once, so be careful if you do that. :P
//        Bit 0: Up
//        Bit 1: Down
//        Bit 2: Left
//        Bit 3: Right
//        Bit 4: B
//        Bit 5: C
//        Bit 6: A
//        Bit 7: Irrelevant since pressing Start would unpause and stop the cheats.
function Cheat2A() => bit6(0x943a)
function Cheat2B() => bit4(0x943a)
function Cheat2C() => bit5(0x943a)
function Cheat2R() => bit3(0x943a)
// $943B: Cheat Check Button 1
//        See 0x943A for button mapping information.
function Cheat1A() => bit6(0x943b)
function Cheat1B() => bit4(0x943b)
function Cheat1C() => bit5(0x943b)
function Cheat1L() => bit2(0x943b)
function Cheat1R() => bit3(0x943b)
function Cheat1D() => bit1(0x943b)
// $943C: Cheat Check Button 4
//        See 0x943A for button mapping information.
function Cheat4A() => bit6(0x943c)
function Cheat4B() => bit4(0x943c)
function Cheat4C() => bit5(0x943c)
function Cheat4L() => bit2(0x943c)
function Cheat4R() => bit3(0x943c)
function Cheat4D() => bit1(0x943c)
// $943D: Cheat Check Button 3
//        See 0x943A for button mapping information.
function Cheat3A() => bit6(0x943d)
function Cheat3B() => bit4(0x943d)
function Cheat3C() => bit5(0x943d)
function Cheat3D() => bit1(0x943d)
// $943E: Cheat Check Button 6
//        See 0x943A for button mapping information.
function Cheat6A() => bit6(0x943e)
function Cheat6B() => bit4(0x943e)
function Cheat6C() => bit5(0x943e)
function Cheat6L() => bit2(0x943e)
function Cheat6R() => bit3(0x943e)
function Cheat6D() => bit1(0x943e)
// $943F: Cheat Check Button 5
//        See 0x943A for button mapping information.
function Cheat5A() => bit6(0x943f)
function Cheat5B() => bit4(0x943f)
function Cheat5C() => bit5(0x943f)
function Cheat5L() => bit2(0x943f)
function Cheat5R() => bit3(0x943f)
function Cheat5U() => bit0(0x943f)
// $9440: Cheat Check Button 8
//        See 0x943A for button mapping information.
//        After pressing a button in this position, the entire cheat is checked. After cheat checking, all of these values are set to 0x00. If the cheat is valid, 0x9438 is also set to 0xFF.
function Cheat8A() => bit6(0x9440)
function Cheat8B() => bit4(0x9440)
function Cheat8C() => bit5(0x9440)
function Cheat8L() => bit2(0x9440)
function Cheat8R() => bit3(0x9440)
function Cheat8U() => bit0(0x9440)
function Cheat8D() => bit1(0x9440)
// $9441: Cheat Check Button 7
//        See 0x943A for button mapping information.
function Cheat7A() => bit6(0x9441)
function Cheat7B() => bit4(0x9441)
function Cheat7C() => bit5(0x9441)
function Cheat7L() => bit2(0x9441)
function Cheat7R() => bit3(0x9441)
function Cheat7U() => bit0(0x9441)

// ACCABABL
function SuperCheat() => once(prev(Cheat1A()) == 1 && prev(Cheat2C()) == 1 && prev(Cheat3C()) == 1 && prev(Cheat4A()) == 1 &&
  prev(Cheat5B()) == 1 && prev(Cheat6A()) == 1 && prev(Cheat7B()) == 1 && prev(Cheat8L()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)
  
// AAAALRRL
function InvincibilityCheat() => IsInvincibilityCheatOn() || once(prev(Cheat1A()) == 1 && prev(Cheat2A()) == 1 && prev(Cheat3A()) == 1 && prev(Cheat4A()) == 1 &&
  prev(Cheat5L()) == 1 && prev(Cheat6R()) == 1 && prev(Cheat7R()) == 1 && prev(Cheat8L()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// ACCBAABU
function MapModeCheat() => IsMapModeOn() || once(prev(Cheat1A()) == 1 && prev(Cheat2C()) == 1 && prev(Cheat3C()) == 1 && prev(Cheat4B()) == 1 &&
  prev(Cheat5A()) == 1 && prev(Cheat6A()) == 1 && prev(Cheat7B()) == 1 && prev(Cheat8U()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// CABABACA
function MealWormsExtraCheat() => once(prev(Cheat1C()) == 1 && prev(Cheat2A()) == 1 && prev(Cheat3B()) == 1 && prev(Cheat4A()) == 1 &&
  prev(Cheat5B()) == 1 && prev(Cheat6A()) == 1 && prev(Cheat7C()) == 1 && prev(Cheat8A()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// CACACACA
function MealWorms10Cheat() => once(prev(Cheat1C()) == 1 && prev(Cheat2A()) == 1 && prev(Cheat3C()) == 1 && prev(Cheat4A()) == 1 &&
  prev(Cheat5C()) == 1 && prev(Cheat6A()) == 1 && prev(Cheat7C()) == 1 && prev(Cheat8A()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// ABCCBABB
function MealWorms81Cheat() => once(prev(Cheat1A()) == 1 && prev(Cheat2B()) == 1 && prev(Cheat3C()) == 1 && prev(Cheat4C()) == 1 &&
  prev(Cheat5B()) == 1 && prev(Cheat6A()) == 1 && prev(Cheat7B()) == 1 && prev(Cheat8B()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// CCCCAABC
function BarnBlasterCheat() => once(prev(Cheat1C()) == 1 && prev(Cheat2C()) == 1 && prev(Cheat3C()) == 1 && prev(Cheat4C()) == 1 &&
  prev(Cheat5A()) == 1 && prev(Cheat6A()) == 1 && prev(Cheat7B()) == 1 && prev(Cheat8C()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// CCCCAABB
function BubbleGunCheat() => once(prev(Cheat1C()) == 1 && prev(Cheat2C()) == 1 && prev(Cheat3C()) == 1 && prev(Cheat4C()) == 1 &&
  prev(Cheat5A()) == 1 && prev(Cheat6A()) == 1 && prev(Cheat7B()) == 1 && prev(Cheat8B()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// CCCCAABA
function HomingMissilesCheat() => once(prev(Cheat1C()) == 1 && prev(Cheat2C()) == 1 && prev(Cheat3C()) == 1 && prev(Cheat4C()) == 1 &&
  prev(Cheat5A()) == 1 && prev(Cheat6A()) == 1 && prev(Cheat7B()) == 1 && prev(Cheat8A()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// CCCCAAAB
function MegaPlasmaCheat() => once(prev(Cheat1C()) == 1 && prev(Cheat2C()) == 1 && prev(Cheat3C()) == 1 && prev(Cheat4C()) == 1 &&
  prev(Cheat5A()) == 1 && prev(Cheat6A()) == 1 && prev(Cheat7A()) == 1 && prev(Cheat8B()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// CCCCAAAC
function ThreeFingerCheat() => once(prev(Cheat1C()) == 1 && prev(Cheat2C()) == 1 && prev(Cheat3C()) == 1 && prev(Cheat4C()) == 1 &&
  prev(Cheat5A()) == 1 && prev(Cheat6A()) == 1 && prev(Cheat7A()) == 1 && prev(Cheat8C()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// ABCCCAAB
function ExtraLifeCheat() => once(prev(Cheat1A()) == 1 && prev(Cheat2B()) == 1 && prev(Cheat3C()) == 1 && prev(Cheat4C()) == 1 &&
  prev(Cheat5C()) == 1 && prev(Cheat6A()) == 1 && prev(Cheat7A()) == 1 && prev(Cheat8B()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// ABCCCAAA
function ExtraLifeOnceCheat() => once(prev(Cheat1A()) == 1 && prev(Cheat2B()) == 1 && prev(Cheat3C()) == 1 && prev(Cheat4C()) == 1 &&
  prev(Cheat5C()) == 1 && prev(Cheat6A()) == 1 && prev(Cheat7A()) == 1 && prev(Cheat8A()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// CBBACBBA
function AmmoRefillCheat() => once(prev(Cheat1C()) == 1 && prev(Cheat2B()) == 1 && prev(Cheat3B()) == 1 && prev(Cheat4A()) == 1 &&
  prev(Cheat5C()) == 1 && prev(Cheat6B()) == 1 && prev(Cheat7B()) == 1 && prev(Cheat8A()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// CBBACBAA
function AmmoRefill2Cheat() => once(prev(Cheat1C()) == 1 && prev(Cheat2B()) == 1 && prev(Cheat3B()) == 1 && prev(Cheat4A()) == 1 &&
  prev(Cheat5C()) == 1 && prev(Cheat6B()) == 1 && prev(Cheat7A()) == 1 && prev(Cheat8A()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// ABCABCAB
function EnergyRefillCheat() => once(prev(Cheat1A()) == 1 && prev(Cheat2B()) == 1 && prev(Cheat3C()) == 1 && prev(Cheat4A()) == 1 &&
  prev(Cheat5B()) == 1 && prev(Cheat6C()) == 1 && prev(Cheat7A()) == 1 && prev(Cheat8B()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// ABCABCAA
function EnergyRefillPlusCheat() => once(prev(Cheat1A()) == 1 && prev(Cheat2B()) == 1 && prev(Cheat3C()) == 1 && prev(Cheat4A()) == 1 &&
  prev(Cheat5B()) == 1 && prev(Cheat6C()) == 1 && prev(Cheat7A()) == 1 && prev(Cheat8A()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// AACCBALR
function ContinueCheat() => once(prev(Cheat1A()) == 1 && prev(Cheat2A()) == 1 && prev(Cheat3C()) == 1 && prev(Cheat4C()) == 1 &&
  prev(Cheat5B()) == 1 && prev(Cheat6A()) == 1 && prev(Cheat7L()) == 1 && prev(Cheat8R()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// AACCBALL
function ContinueOnceCheat() => once(prev(Cheat1A()) == 1 && prev(Cheat2A()) == 1 && prev(Cheat3C()) == 1 && prev(Cheat4C()) == 1 &&
  prev(Cheat5B()) == 1 && prev(Cheat6A()) == 1 && prev(Cheat7L()) == 1 && prev(Cheat8L()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// CABCABUD
function TeleportBombCheat() => once(prev(Cheat1C()) == 1 && prev(Cheat2A()) == 1 && prev(Cheat3B()) == 1 && prev(Cheat4C()) == 1 &&
  prev(Cheat5A()) == 1 && prev(Cheat6B()) == 1 && prev(Cheat7U()) == 1 && prev(Cheat8D()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// BBCABCLR
function WarpToInflatedHead() => once(prev(Cheat1B()) == 1 && prev(Cheat2B()) == 1 && prev(Cheat3C()) == 1 && prev(Cheat4A()) == 1 &&
  prev(Cheat5B()) == 1 && prev(Cheat6C()) == 1 && prev(Cheat7L()) == 1 && prev(Cheat8R()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// ABCRRRRR
function WarpToIso9000() => once(prev(Cheat1A()) == 1 && prev(Cheat2B()) == 1 && prev(Cheat3C()) == 1 && prev(Cheat4R()) == 1 &&
  prev(Cheat5R()) == 1 && prev(Cheat6R()) == 1 && prev(Cheat7R()) == 1 && prev(Cheat8R()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// CCDDARRL
function WarpToLevelAte() => once(prev(Cheat1C()) == 1 && prev(Cheat2C()) == 1 && prev(Cheat3D()) == 1 && prev(Cheat4D()) == 1 &&
  prev(Cheat5A()) == 1 && prev(Cheat6R()) == 1 && prev(Cheat7R()) == 1 && prev(Cheat8L()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// ABCCUCLR
function WarpToVilliPeople() => once(prev(Cheat1A()) == 1 && prev(Cheat2B()) == 1 && prev(Cheat3C()) == 1 && prev(Cheat4C()) == 1 &&
  prev(Cheat5U()) == 1 && prev(Cheat6C()) == 1 && prev(Cheat7L()) == 1 && prev(Cheat8R()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// DACLRDAC
function WarpToUdderlyAbducted() => once(prev(Cheat1D()) == 1 && prev(Cheat2A()) == 1 && prev(Cheat3C()) == 1 && prev(Cheat4L()) == 1 &&
  prev(Cheat5R()) == 1 && prev(Cheat6D()) == 1 && prev(Cheat7A()) == 1 && prev(Cheat8C()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// CCCCCCAA
function WarpToPuppyLove1() => once(prev(Cheat1C()) == 1 && prev(Cheat2C()) == 1 && prev(Cheat3C()) == 1 && prev(Cheat4C()) == 1 &&
  prev(Cheat5C()) == 1 && prev(Cheat6C()) == 1 && prev(Cheat7A()) == 1 && prev(Cheat8A()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// LRBCCLRA
function WarpToPuppyLove2() => once(prev(Cheat1L()) == 1 && prev(Cheat2R()) == 1 && prev(Cheat3B()) == 1 && prev(Cheat4C()) == 1 &&
  prev(Cheat5C()) == 1 && prev(Cheat6L()) == 1 && prev(Cheat7R()) == 1 && prev(Cheat8A()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// RRABCLRA
function WarpToPuppyLove3() => once(prev(Cheat1R()) == 1 && prev(Cheat2R()) == 1 && prev(Cheat3A()) == 1 && prev(Cheat4B()) == 1 &&
  prev(Cheat5C()) == 1 && prev(Cheat6L()) == 1 && prev(Cheat7R()) == 1 && prev(Cheat8A()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// BBCLLLLR
function WarpToSeeJimRun() => once(prev(Cheat1B()) == 1 && prev(Cheat2B()) == 1 && prev(Cheat3C()) == 1 && prev(Cheat4L()) == 1 &&
  prev(Cheat5L()) == 1 && prev(Cheat6L()) == 1 && prev(Cheat7L()) == 1 && prev(Cheat8R()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// ABBACBBR
function WarpToNext() => once(prev(Cheat1A()) == 1 && prev(Cheat2B()) == 1 && prev(Cheat3B()) == 1 && prev(Cheat4A()) == 1 &&
  prev(Cheat5C()) == 1 && prev(Cheat6B()) == 1 && prev(Cheat7B()) == 1 && prev(Cheat8R()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

// CACABAAU
function WarpToEnd() => once(prev(Cheat1C()) == 1 && prev(Cheat2A()) == 1 && prev(Cheat3C()) == 1 && prev(Cheat4A()) == 1 &&
  prev(Cheat5B()) == 1 && prev(Cheat6A()) == 1 && prev(Cheat7A()) == 1 && prev(Cheat8U()) == 1 && dword(0x943a) == 0 && dword(0x943e) == 0)

function AnyWarpCheat() => SuperCheat() || WarpToInflatedHead() || WarpToIso9000() || WarpToLevelAte() || WarpToVilliPeople() || WarpToUdderlyAbducted() ||
  WarpToPuppyLove1() || WarpToPuppyLove2() || WarpToPuppyLove3() || WarpToSeeJimRun() || WarpToNext() || WarpToEnd()

function AnyNonWarpCheat() => InvincibilityCheat() || MapModeCheat() || MealWormsExtraCheat() || MealWorms10Cheat() || MealWorms81Cheat() ||
  BarnBlasterCheat() || BubbleGunCheat() || HomingMissilesCheat() || MegaPlasmaCheat() || ThreeFingerCheat() ||
  ExtraLifeCheat() || ExtraLifeOnceCheat() || AmmoRefillCheat() || AmmoRefill2Cheat() ||
  EnergyRefillCheat() || EnergyRefillPlusCheat() || ContinueCheat() || ContinueOnceCheat() || TeleportBombCheat()

function AnyCheat() => AnyWarpCheat() || AnyNonWarpCheat()

// $9646: Joypad Controller Options
//        There are six possible options for the three buttons. No six-button controller support is available for this game, even though it would have been very helpful.
//        0x3a - Whip with A, Fire with B, Jump with C
//        0x56 - Whip with A, Jump with B, Fire with C
//        0x72 - Fire with A, Whip with B, Jump with C
//        0x8e - Fire with A, Jump with B, Whip with C
//        0xaa - Jump with A, Whip with B, Fire with C
//        0xc6 - Jump with A, Fire with B, Whip with C
// $9652: 8a when alive
function IsJimAlive() => byte(0x9652) == 0x8a
function IsDeadJim() => byte(0x9652) != 0x8a
// $965A: Life / Continue Data (Not Change-able) 
// While you have lives (including 0), you are still in the game. 
// If bits 4 and 6 are 1, then you are on the continue screen. 
function HasGameOvered() => (bit4(0x965A) == 1 && bit6(0x965a) == 1) || (CurrentStage() == 0 && MusicTrack() == 6)
// $966F: Display Digit 1 of Ammo Count?
//        This value generally only becomes 0 intermittently if you only have the normal gun and you have less than 100 ammo. During this time, the ammo count will recharge and blink. As long as you don't run out of ammo, this value should always be 1.
// $9672: Ammo Count Display Digit 1
// $9677: Display Digit 2 of Ammo Count?
//        When using a special weapon, this value will likely stay 0. Otherwise, this one will stay on 1 as long as you have 100 or more ammo of your regular gun, and will blink while recharging ammo.
// $967A: Ammo Count Display Digit 2 (if required)
// $967F: Display Digit 3 of Ammo Count?
//        This value will never "blink". This is 1 if you require 3 digits for displaying your current ammo count or 0 if you do not.
// $9682: Ammo Count Display Digit 3 (if required)
// $9687: Display Digit 4 of Ammo Count?
//        This will (likely) only happen with the regular gun.
// $968A: Ammo Count Display Digit 4 (if required)
function Needs4AmmoDigits() => low4(0x9687) > 0
function Needs3AmmoDigits() => low4(0x9687) == 0 && low4(0x967F) > 0
function Needs2AmmoDigits() => low4(0x9687) == 0 && low4(0x967F) == 0 && low4(0x9677) > 0
// $9692: life [8x] x = 10 porcent [not changeable]
// $96B1: help - Potential End of Level Sequence?
// $97A5: Potential Cutscene for Level 1?
//        When this hits 1 near the end of the level, it's automatically finished. For IL Leaderboard purposes, this could be the ending spot.
// $97B6: help
// $A156: Jim's Animation Cycles?
//        Not really clear here. Could be useful to watch for teleporters in Totally Forked though.
// $A1A2: help
// $A1A4: help 1
// $A1A5: help 2
// $A1A7: Current Stage
//        Order below is traditional stage order.
//        0x00 - Anything but Tangerines - Main Stage
//        0x01 - Anything but Tangerines - Granny Bonus Stage
//        0x0a - Lorenzen's Soil
//        0x02 - Puppy Love Part 1
//        0x09 - Villi People / Blind Cave Salamander (This has multiple names)
//        0x05 - The Flying King
//        0x03 - Puppy Love Part 2
//        0x06 - Udderly Abducted
//        0x07 - Inflated Head
//        0x0e - ISO 9000 - Main Stage
//        0x0f - ISO 9000 - Door Chase Section
//        0x04 - Puppy Love Part 3
//        0x0b - Level Ate - Main Level
//        0x0c - Level Ate - Boss Room
//        0x0d - Level Ate - Totally Forked / Secret Room 37
//        0x10 - See Jim Run, Run Jim Run
function CurrentStage() => byte(0xa1a7)
StageNameLookup = {
    0x00: "Anything But Tangerines",
    0x01: "Anything But Tangerines - Granny Bonus",
    0x0a: "Lorenzen's Soil",
    0x02: "Puppy Love Part 1",
    0x09: "Villi People",
    0x05: "The Flyin' King",
    0x03: "Puppy Love Part 2",
    0x06: "Udderly Abducted",
    0x07: "Inflated Head",
    0x08: "Inflated Head - Hammer Head",
    0x0e: "ISO 9000",
    0x0f: "ISO 9000 - Door Chase",
    0x04: "Puppy Love Part 3",
    0x0b: "Level Ate",
    0x0c: "Level Ate - Flamin' Yawn",
    0x0d: "Level Ate - Secret Room 37",
    0x10: "See Jim Run, Run Jim Run"
}
BaseStageNameLookup = {
    0x00: "Anything But Tangerines",
    0x01: "Anything But Tangerines",
    0x0a: "Lorenzen's Soil",
    0x02: "Puppy Love Part 1",
    0x09: "Villi People",
    0x05: "The Flyin' King",
    0x03: "Puppy Love Part 2",
    0x06: "Udderly Abducted",
    0x07: "Inflated Head",
    0x08: "Inflated Head",
    0x0e: "ISO 9000",
    0x0f: "ISO 9000",
    0x04: "Puppy Love Part 3",
    0x0b: "Level Ate",
    0x0c: "Level Ate",
    0x0d: "Level Ate",
    0x10: "See Jim Run, Run Jim Run"
}
BaseStageIdLookup = {
    0x00: 0x00,
    0x01: 0x00,
    0x0a: 0x0a,
    0x02: 0x02,
    0x09: 0x09,
    0x05: 0x05,
    0x03: 0x03,
    0x06: 0x06,
    0x07: 0x07,
    0x08: 0x07,
    0x0e: 0x0e,
    0x0f: 0x0e,
    0x04: 0x04,
    0x0b: 0x0b,
    0x0c: 0x0b,
    0x0d: 0x0b,
    0x10: 0x10,
}
LevelNumberToDict = {
    1: [0x00, 0x01],
    2: [0x0a],
    3: [0x02],
    4: [0x09],
    5: [0x05],
    6: [0x03],
    7: [0x06],
    8: [0x07, 0x08],
    9: [0x0e, 0x0f],
    10: [0x04],
    11: [0x0b, 0x0c, 0x0d],
    12: [0x10]
}
// $A1C4: Difficulty Selection
//        0x00 - Easy
//        0x01 - Normal
//        0x02 - Difficult
function AtLeastOnNormal() => byte(0xa1c4) >= 1
function OnEasy() => byte(0xa1c4) == 0
function OnNormal() => byte(0xa1c4) == 1
function OnDifficult() => byte(0xa1c4) == 2
DifficultyLookup = {
    0x00: "Easy",
    0x01: "Normal",
    0x02: "Difficult"
}
// $A1C5: Invincibility Cheat Active?
//        0x00: Off
//        0xFF: On
function IsInvincibilityCheatOn() => once(byte(0xa1c5) == 0xff)
// $A1EB: Life Counter
//        For whatever reason, this value is set using the ASCII digit value instead of the decimal value.
//        This likely caps at 9 lives.
function LifeCount() => low4(0xa1eb)
// $A1EC: Can you Control Jim?
//        0x00 - Out of your Control
//        0xFF - Can Control Jim
// $A1EE: Reset
// $A1EF: FF= demo
function NotDemo() => byte(0xa1ef) != 0xFF
function InDemo() => byte(0xa1ef) == 0xFF
// $A1FA: Super Cheat Sound Test Menu
//        Listen to all of the silly sound effects here.
//        This goes from 0x00 - 0x7D.
// $A1FB: Current In-Game Music
//        This will either be in the range of 0x00-0x11 while playing a stage, of 0xFF if nothing is playing. This makes this byte elligible for potential leaderboard starting.
function MusicTrack() => byte(0xa1fb)
function IsMenuMusic() => byte(0xa1fb) == 6
function IsInStageMusic() => MusicTrack() != 6 && MusicTrack() != 0xFF
// $A1FE: Incrementing Counter [16-bit]
//        This resets and goes up whenever a demo starts.
//        Sometimes only the upper byte goes up and not the lower. It's surprisingly inconsistent.
// $A200: number of continues
// $A202: Flags Collected in Anything but Tangerines
//        Bit 0: Earth Flag
//        Bit 1: Worm Flag
//        Bit 2: Jim Flag
//        Bit 3: Beaten Stage
// $A204: Flags Collected in Puppy Love Part 1
//        See 0xa202 for Bit Info
// $A205: Flags Collected in Lorenzen's Soil
//        See 0xa202 for Bit Info
// $A206: Flags Collected in The Flyin' King
//        See 0xa202 for Bit Info
// $A207: Flags Collected in Villi People
//        See 0xa202 for Bit Info
// $A208: Flags Collected in Udderly Abducted
//        See 0xa202 for Bit Info
// $A209: Flags Collected in Puppy Love Part 2
//        See 0xa202 for Bit Info
// $A20A: Flags Collected in ISO 9000
//        See 0xa202 for Bit Info
// $A20B: Flags Collected in Inflated Head
//        See 0xa202 for Bit Info
// $A20C: Flags Collected in Level Ate
//        See 0xa202 for Bit Info
// $A20D: Flags Collected in Puppy Love Part 3
//        See 0xa202 for Bit Info
EarthFlagLookup = {
    0: "❌",
    1: "🌎"
}
WormFlagLookup = {
    0: "❌",
    1: "🐛"
}
JimFlagLookup = {
    0: "❌",
    1: "JIM"
}

LevelOrderToByteLookup = {
    1: 0xa202,
    2: 0xa205,
    3: 0xa204,
    4: 0xa207,
    5: 0xa206,
    6: 0xa209,
    7: 0xa208,
    8: 0xa20b,
    9: 0xa20a,
    10: 0xa20d,
    11: 0xa20c
}
StageNameToFlagLookup = {
    0x00: 0xa202,
    0x01: 0xa202,
    0x0a: 0xa205,
    0x02: 0xa204,
    0x09: 0xa207,
    0x05: 0xa206,
    0x03: 0xa209,
    0x06: 0xa208,
    0x07: 0xa20b,
    0x08: 0xa20b,
    0x0e: 0xa20a,
    0x0f: 0xa20a,
    0x04: 0xa20d,
    0x0b: 0xa20c,
    0x0c: 0xa20c,
    0x0d: 0xa20c
}
LevelNumberToStageName = {
    1: "Anything But Tangerines",
    2: "Lorenzen's Soil",
    3: "Puppy Love Part 1",
    4: "Villi People",
    5: "The Flyin' King",
    6: "Puppy Love Part 2",
    7: "Udderly Abducted",
    8: "Inflated Head",
    9: "ISO 9000",
    10: "Puppy Love Part 3",
    11: "Level Ate",
    12: "See Jim Run, Run Jim Run"
}

function EarthFlagClaimed(levelNumber) {
    levelbyte = LevelOrderToByteLookup[levelNumber]
    return once(bit0(levelbyte) == 1)
}
function WormFlagClaimed(levelNumber) {
    levelbyte = LevelOrderToByteLookup[levelNumber]
    return once(bit1(levelbyte) == 1)
}
function JimFlagClaimed(levelNumber) {
    levelbyte = LevelOrderToByteLookup[levelNumber]
    return once(bit2(levelbyte) == 1)
}
function LevelFlagClaimed(levelNumber) {
    levelbyte = LevelOrderToByteLookup[levelNumber]
    return once(bit3(levelbyte) == 1)
}
function IsFreshStart(levelNumber) {
    levelbyte = LevelOrderToByteLookup[levelNumber]
    return low4(levelbyte) == 0
}

function InLevel(levelNumber) {
    validIds = LevelNumberToDict[levelNumber]
    currentStage = CurrentStage()
    return any_of(validIds, id => id == currentStage)
}

function OutOfLevel(levelNumber) {
    validIds = LevelNumberToDict[levelNumber]
    currentStage = CurrentStage()
    return none_of(validIds, id => id == currentStage)
}

function BeatenLevel(levelNumber) =>  InLevel(levelNumber) &&
    LevelFlagClaimed(levelNumber)

function BeatenLevelWithoutAllFlagsLeaderboard(levelNumber) {
    levelbyte = LevelOrderToByteLookup[levelNumber]
    return bit3(levelbyte) == 1 && (bit2(levelbyte) == 0 || bit1(levelbyte) == 0 || bit0(levelbyte) == 0)
}

function BeatenLevelWithAllFlagsLeaderboard(levelNumber) {
    levelbyte = LevelOrderToByteLookup[levelNumber]
    return low4(levelbyte) == 0x0f
}

function BeatenWithAllFlags(levelNumber) => 
    EarthFlagClaimed(levelNumber) &&
    WormFlagClaimed(levelNumber) &&
    JimFlagClaimed(levelNumber) &&
    LevelFlagClaimed(levelNumber) &&
    InLevel(levelNumber) && disable_when(InLevel(levelNumber + 1))
    
function LevelNotBeaten(levelNumber) {
    if (levelNumber == 12) {
        return true
    }
    levelbyte = LevelOrderToByteLookup[levelNumber]
    return bit3(levelbyte) == 0
}
// $A20F: Semi Stage Flag?
//        Likes to be set to 0x81 after the level card disappears.
function TransitionToCow(levelNumber) {
    return IsJimAlive() && BeatenLevel(levelNumber) &&
        byte(0xa20f) == 0 && prev(byte(0xa20f)) == 0x81
}
// $A216: Facing Direction?
//        0x00: Facing Right
//        0xFF: Facing Left
// $A22C: Character sprite
// $A22D: Character color
// $A284: Facing Direction Duplicate?
//        See 0xA216 for details.
// $A320: Countdown to Cow
//        When this hits 0, the cow at the end of the level says "Well Done".
//        This countdown may be used for other purposes.

function OnCowScreen() => MusicTrack() == 0xff && byte(0xa380) == 0x03 &&
    byte(0xa384) == 0x06 && byte(0xa389) == 0x82 && byte(0xfa38) == 0x0f

// $A4A2: meat hp / Pedro pupa  hp [hard]
function BossHasShownUp() => once(byte(0xa4a2) > 0)
// $A510: Pedro pupa Health
// $A758: help 3
// $AD8C: Game Show Spotlight Timer
//        This goes from 0xa6 to 0xf8. The question is lost when this is 0xf8 and 0xad47 turns to 0x7f.
// $FA82: Player 1 Held Inputs - Cheat Mode
//        Each bit represents one D-Pad direction or button. They are ORed together to represent what is held down at that time.
//        Bit 0: Up
//        Bit 1: Down
//        Bit 2: Left
//        Bit 3: Right
//        Bit 4: B
//        Bit 5: C
//        Bit 6: A
//        Bit 7: Start
//        When unpaused, this value is undefined.
// $FA86: 53ef on cheat code activation
//        
//        unfortunately this address and region is semi-dynamic
// $FACC: Barn Blaster Countdown
//        When it hits 0x04, the screen flashes white, then eventually goes to 0x00.
// $FACF: Is Jim Firing his Gun?
//        0x00 - Not Firing
//        0xFF - Firing
//        This can be a simpler way of setting up "pacifist" achievements, similar to Vectorman.
function HasJimFiredGun() => once(byte(0xfacf) == 0xff)
// $FAD8: Currently Equipped Weapon
//        0x00 - Regular Gun
//        0x01 - Three Finger Gun
//        0x02 - Mega Plasma Gun
//        0x03 - Bubble Gun
//        0x04 - Homing Missiles
//        0x05 - Debug Homing Missiles?
//        0x06 - Barn Blaster
//        Any other values would risk breaking the game.
WeaponIdToName = {
    0: "Regular Gun",
    1: "Three Finger Gun",
    2: "Mega Plasma Gun",
    3: "Bubble Gun",
    4: "Homing Missiles",
    6: "Barn Blaster"
}
WeaponIdLookup = {
    0: "🔫",
    1: "⋔",
    2: "🚀",
    3: "🛁",
    4: "🏠",
    6: "🚜"
}
function CurrentWeapon() => byte(0xfad8)
// $FADE: bullets 0100
function CurrentAmmoHundred() => low4(0xfade)
// $FADF: bullets 1000
function CurrentAmmoThousand() => low4(0xfadf)
// $FAE0: bullets 0001
function CurrentAmmoOne() => low4(0xfae0)
// $FAE1: bullets 0010
function CurrentAmmoTen() => low4(0xfae1)
function CurrentWeaponAmmo() => CurrentAmmoThousand() * 1000 + CurrentAmmoHundred() * 100 + CurrentAmmoTen() * 10 + CurrentAmmoOne()
// $FAE4: Regular Gun Stored Ammo [16-bit]
//        This mainly comes into play after picking up ammo.
// $FAE6: Three Finger Gun Stored Ammo [16-bit]
//        This mainly comes into play after picking up ammo.
// $FAE8: Mega Plasma Gun Stored Ammo [16-bit]
//        This mainly comes into play after picking up ammo.
// $FAEA: Bubble Gun Stored Ammo [16-bit]
//        This mainly comes into play after picking up ammo.
// $FAEC: Homing Missiles Stored Ammo [16-bit]
//        This mainly comes into play after picking up ammo.
// $FAF0: Barn Blaster Stored Ammo [16-bit]
//        This mainly comes into play after picking up ammo.
// $FAFC: Jim's Health (hundred's digit)
// $FAFE: Jim's Health (one's digit)
// $FAFF: Jim's Health (ten's digit)
function CurrentHealth() => low4(0xfafc) * 100 + low4(0xfaff) * 10 + low4(0xfafe)
function PriorHealth() => prev(low4(0xfafc)) * 100 + prev(low4(0xfaff)) * 10 + prev(low4(0xfafe))
// $FB92: Camera X-Position Possibility [16-bit]
// $FB94: Camera X-Position Possibility [16-bit]
// $FBA8: Camera Y-Position [16-bit]
// $FBC2: Is Jim Moving on the Ground?
//        0x00: Staying Still
//        0x01: Moving to the Right
//        0xFF: Moving to the Left
//        Note that jumping locks this value in place until landing.
// #FBCF: Is Jim in a Teleportation Pod? 
//        0x00: Not in a Pod 
//        0xFF: In a Pod, control resumes when reset to 0x00.
function IsJimTeleporting() => byte(0xfbcf) == 0xFF

function IsGameOver() => byte(0xfbcf) == 0xFF && IsDeadJim() && LifeCount() == 0
// $FBD0: Strange Step Counter?
//        Stay on the ground and it keeps incrementing while moving. Jumping resets this value to 0.
// $FBE1: Is Jim on the Ground?
//        0xFF: On the Ground
//        0x00: In the Air
// $FBE3: Misc Animation/Sound Thing
//        This can be lined up with the camera position to know when Psy-Crow gets Taxi'ed. (Watch for value 0x08 here and 4a/49 on the camera x-position ones.)
function IsPsycrowTaxied() => (word(0xfb94) >= 0x4a1e) && byte(0xfbe3) == 0x08
// $FC14: Meal Worms Collected (One's Digit) 
// These are only relevant in Villi People/Salamander and Inflated Head.
function DidWormCountChange() => prev(low4(0xFC14)) != low4(0xFC14)
// $FC15: Meal Worms Collected (Ten's Digit) 
// These are only relevant in Villi People/Salamander and Inflated Head. 
function CurrentWormCount() => (low4(0xFC15) * 10) + low4(0xFC14)
// $FCC6: Puppies Dropped before Peter Attacks
//        This increases for each puppy dropped. Once it hits 4 and the current puppy catching section is done with, Peter damages you and this resets to 0.
function DidPeterGoMad() => prev(byte(0xfcc6)) >= 4 && byte(0xfcc6) == 0
// $FD18: The Flyin' King - Direction
//        0x00 - Flying Forward
//        0x01 - Flying Backward
// $FD1A: The Flyin' King - Rocket Post-Deceleration?
//        When you touch a rocket, you go super fast. Eventually this timer starts at a value and counts down to 0, when you move at normal speed.
// $FD87: Inflated Head Status
//        0x00 - Normal Head
//        0x01 - Barely Inflated, floats down fast.
//        0x02 - Slightly inflated, floats down slow.
//        0x03 - Fully inflated, floats up.
//        0x04 - Popped by Evil the Cat.
function WasPoppedByEvil() => low4(0xfd87) == 0 && prev(low4(0xfd87)) == 4
// $FD8B: Hammer Head Target Practice
//        Hit the plunger and get your reward. No penalties for missing.
function WonHammerHeadPrize() => prev(byte(0xfd8b)) < byte(0xfd8b)
// $FDF3: Memory Game Round Number
//        This goes up to 12 rounds. If you beat the final round, this value becomes 0x0d, or 13.
function HalfwayThroughMemoryGame() => once(byte(0xFDF3) == 0x06)
function CompletedMemoryGame() => byte(0xFDF3) == 0x0d
function MemoryGameRound() => low4(0xfdf3) + 1
// $FE39: Consecutive Quiz Answers Right
//        This actually goes up to 12 since one of the prizes is a worm required for further questioning.
function AnsweredCorrectly() => prev(byte(0xfe39)) < byte(0xfe39)
// $FE80: Countdown Timer (One's Digit)
//        This is used in Lorenzen's Soil and Udderly Abducted.
// $FE81: Countdown Timer (Ten's Digit)
//        This is used in Lorenzen's Soil and Udderly Abducted.
function InGameTimer() => low4(0xfe81) * 10 + low4(0xfe80)
// $FE82: Lorenzen's Soil Rock Summon
//        If the time is not reset in time, set to 0xff and immobilize Jim. He takes 75% damage on normal mode...so this is close to a 1 hit kill.
// $FE83: Time to Tick Down Seconds
//        This goes from 0x55 to 0x00. When this hits 0x00, it cycles back and one in-game second is removed from the timer.
// $FEFB: Option Menu Selection
//        Surprisingly, the numerical order is NOT consistent with the displayed UI.
//        0x00 - Difficulty Selection
//        0x01 - Joypad Configuration
//        0x02 - Password Entry
// $FEFE: Pause Flag
//        0x00: Unpaused
//        0xFF: Paused / Cheat Menu
// $FF1D: Player 1 Controls - Inverted?
//        Each bit represents a button or direction on the controller. The held buttons are ORed together, then Inverted. This means 0xFF represents nothing pressed or held.
//        Bit 0: Up
//        Bit 1: Down
//        Bit 2: Left
//        Bit 3: Right
//        Bit 4: B
//        Bit 5: C
//        Bit 6: A
//        Bit 7: Start
//        Fun fact: Hold A, B, C, then press Start to reset the game.
// $FF1F: Player 1 Controls - Inverted? (Not While Paused)
// $FF29: Puppy Love Current Round (0 Index)
//        The number of rounds is based on the player's difficulty. Look into 0xff2a to see if that value is consistent with the max expected round.
function PeterPuppyRound() => low4(0xff29) + 1
function PastFlagRounds() => once(low4(0xff29) == 3)
function FinishedPeterPuppyDifficult() => low4(0xff29) == 5

// Cheevo IDs to erase (voting approved):
// 5655 (reach Granny Bonus. The cheevo for beating this is enough.)
// 5665 (The Walking Door. You arent' done with the stage at this point.)
// 5668 (reach Flamin' Yawn AKA Meat. You aren't done with the stage at this point.)
// 5753 (Hard You're Dead Meat. No fair equivalent for damageless.)
// 5985 (Hard Pupa Dominated. No fair equivalent for damageless.)

function CreateBeatenLevelNormalCheevo(id, levelNumber, title, points) {
    achievement(
        id = id,
        title = title,
        description = "Beat the level " + LevelNumberToStageName[levelNumber] + ".",
        points = points,
        trigger = unless(AnyCheat()) &&
        never(InDemo()) &&
        never(IsMenuMusic()) &&
        BeatenLevel(levelNumber) && OnCowScreen()
    )
}

// Replace 5657 with this. (Old name: Lorenzen's Soiled)
CreateBeatenLevelNormalCheevo(209715, 1, "Why the Tangerines?", 10)
// Replace 5658 with this. (Old name: Aren't They Adorable?)
CreateBeatenLevelNormalCheevo(209705, 2, "Modern Worm Digging", 10)
// Replace 5659 with this. (Old name: As Blind as a Cave Salamander)
CreateBeatenLevelNormalCheevo(209706, 3, "Odie", 10)
// Replace 5660 with this. (Old name: Flying Pigs and Pirate Ships)
CreateBeatenLevelNormalCheevo(209707, 4, "What Is This Level's Name?", 10)
// Replace 5661 with this. (Old name: Cuteness Overload)
CreateBeatenLevelNormalCheevo(209708, 5, "Flying Pigs + Pirate Ships", 10)
// Replace 5662 with this. (Old name: Udderly Abducted)
CreateBeatenLevelNormalCheevo(209709, 6, "Blue", 10)
// Replace 5663 with this (Old name: Don't be such an airhead)
CreateBeatenLevelNormalCheevo(209710, 7, "No Launching This Time, Sorry.", 10)
// Replace 5664 with this. (Old name: ISO 9000)
CreateBeatenLevelNormalCheevo(209711, 8, "Up, Up, and Away!", 10)
// Replace 5666 with this. (Old name: Pups Galore)
CreateBeatenLevelNormalCheevo(209712, 9, "New Patent: Cow Launcher", 10)
// Replace 5667 with this. (Old name: Eight ate eight)
CreateBeatenLevelNormalCheevo(209713, 10, "Spike", 10)
// Replace 5671 with this. (Old name: See Jim Run)
CreateBeatenLevelNormalCheevo(209714, 11, "Color Splash Did This Second?", 10)


function CreateBeatenLevelDifficultCheevo(levelNumber, title, points) {
    achievement(
        title = title,
        description = format("Beat the level {0} on Difficult.", LevelNumberToStageName[levelNumber] ),
        points = points,
        trigger = unless(AnyCheat()) &&
        never(InDemo()) &&
        never(IsMenuMusic()) &&
        OnDifficult() &&
        BeatenLevel(levelNumber) && OnCowScreen()
    )
}

// Replace 5743 with this. (Old name: [HARD] Lorenzen's Soil)
CreateBeatenLevelDifficultCheevo(1, "I Can Handle Tangerines", 10)
// Replace 5744 with this. (Old name: [HARD] Puppies One)
CreateBeatenLevelDifficultCheevo(2, "Eat Dirt, Dirt!", 10)
// Replace 5745 with this. (Old name: [HARD] Jim's now a Blind Cave Salamander)
CreateBeatenLevelDifficultCheevo(3, "Porkchop", 25)
// Replace 5746 with this. (Old name: [HARD] The Flyin' King)
CreateBeatenLevelDifficultCheevo(4, "At Least the Music is a Classic", 10)
// Replace 5747 with this. (Old name: [HARD] Puppies Two)
CreateBeatenLevelDifficultCheevo(5, "Balloon Bombs Burst Bombastically", 10)
// Replace 5748 with this. (Old name: [HARD] Udderly Abducted)
CreateBeatenLevelDifficultCheevo(6, "Santa's Little Helper", 10)
// Replace 5749 with this. (Old name: [HARD] Inflated Head)
CreateBeatenLevelDifficultCheevo(7, "This is Udderly Ridiculous", 10)
// Replace 5750 with this. (Old name: [HARD] ISO 9000)
CreateBeatenLevelDifficultCheevo(8, "Up Before Up", 10)
// Replace 5751 with this. (Old name: [HARD] Puppies Three)
CreateBeatenLevelDifficultCheevo(9, "New Patent: Super Suit", 25)
// Replace 5752 with this. (Old name: [HARD] Level Ate)
CreateBeatenLevelDifficultCheevo(10, "Pluto", 25)
// Replace 5754 with this. (Old name: [HARD] See Jim Run)
CreateBeatenLevelDifficultCheevo(11, "Thanks for the Feast", 25)

function CreateGameBeatenCheevo(id, title, description, onRightDifficulty) {
    achievement(
        id = id,
        title = title,
        description = description,
        points = 25,
        trigger = unless(AnyCheat()) &&
            never(InDemo()) &&
            onRightDifficulty &&
            CurrentStage() == 0x10 &&
            IsPsycrowTaxied()
    )
}

// Update 5672 to end on taxi smash. (Maybe move the icon to difficult mode)
CreateGameBeatenCheevo(
    209716,
    "Look Left, Right, and Up for Flying Taxis",
    "Beat the game.",
    true
)

// Update 5755 to end on taxi smash.
CreateGameBeatenCheevo(
    209739,
    "...Stays in Lost Vegas",
    "Beat the game on Difficult.",
    OnDifficult()
)

function CreateAllFlagCheevo(levelNumber, title, points) {
    achievement(
        title = title,
        description = "In one session, beat " + LevelNumberToStageName[levelNumber] + " with all flags collected.",
        points = points,
        trigger = unless(AnyCheat()) &&
            !InDemo() && !IsMenuMusic() && BeatenWithAllFlags(levelNumber)
    )
}

// All of these cheevos are new, with no IDs to replace.
CreateAllFlagCheevo(1, "All the Tangerines", 10)
CreateAllFlagCheevo(2, "All the Soil", 10)
CreateAllFlagCheevo(3, "All the Arctic Dogs", 10)
CreateAllFlagCheevo(4, "All the Villi Salamanders", 10)
CreateAllFlagCheevo(5, "All the Snot", 10)
CreateAllFlagCheevo(6, "All the Pup Stars", 10)
CreateAllFlagCheevo(7, "All the Cows", 10)
CreateAllFlagCheevo(8, "All the Cats", 10)
CreateAllFlagCheevo(9, "All the Patents", 10)
CreateAllFlagCheevo(10, "All the 101 Dalmations", 10)
CreateAllFlagCheevo(11, "All the Utensils", 10)

function CreateWeaponFoundCheevo(title, weaponId, points) {
    achievement(
        title = title,
        description = "Pick up the " + WeaponIdToName[weaponId] + " in any stage.",
        points = points,
        trigger = unless(AnyCheat()) && never(InDemo()) && CurrentWeapon() == weaponId
    )
}

// Update 5865 for anti-cheating.
CreateWeaponFoundCheevo("Mega Plasma", 2, 5)
// Update 5866 for anti-cheating.
CreateWeaponFoundCheevo("Barn Blaster", 6, 5)
// Update 5867 for anti-cheating.
CreateWeaponFoundCheevo("The Most Powerful Weapon In The Universe!!", 3, 10)
// Update 5868 for anti-cheating.
CreateWeaponFoundCheevo("Like a Ton of Bricks", 4, 10)
// Update 5869 for anti-cheating.
CreateWeaponFoundCheevo("Getting the Finger..", 1, 10)

// Update 5986 for anti-cheating. ...and make it harder. (Let others be grandfathered in.)
achievement(
    title = "Master of Bubbles",
    description = "Collect the Bubble Gun early on in Difficult mode and bring it to the end of the stage.",
    points = 10,
    trigger = unless(AnyCheat()) && never(InDemo()) && CurrentWeapon() == 3 && 
        disable_when(CurrentWeapon() != 3 && prev(CurrentWeapon() )== 3, IsDeadJim() || CurrentStage() >= 2) &&
        InLevel(1) && trigger_when(LevelFlagClaimed(1))
)

// Add similar cheevos to the above, but make them be fully gunless.
function AddGunlessCheevo(title, levelNumber, points) {
    achievement(
        title = title,
        description = "Complete " + LevelNumberToStageName[levelNumber] + " on Difficult mode without ever using your gun.",
        points = points,
        trigger = unless(AnyCheat()) && never(InDemo()) && OnDifficult() && InLevel(levelNumber) &&
            disable_when(HasJimFiredGun(), OutOfLevel(levelNumber)) && trigger_when(LevelFlagClaimed(levelNumber))
    )
}

// AddGunlessCheevo("Pacifist Salamander", 4, 10)
// AddGunlessCheevo("Pacifist Cow", 7, 10)
// AddGunlessCheevo("Pacifist Lawyer", 9, 10)

// Update 5870 for anti-cheating. ...and maybe improve the detection.
achievement(
    title = "Fully Loaded",
    description = "Have 2000 or More Bullets with your regular Plasma Gun.",
    points = 10,
    // Note to self: look into backup condition after never InDemo. Regular ammo possible to gain while using other weapons.
    trigger = unless(AnyCheat()) && never(InDemo()) && CurrentWeapon() == 0 && CurrentAmmoThousand() >= 2
)

// Update 5673 for anti-cheating.
achievement(
    title = "Twice as Nice!",
    description = "Have 200% Health.",
    points = 10,
    trigger = unless(AnyCheat()) && never(InDemo()) && low4(0xfafc) == 2
)

function CreateBonusAreaSuccessCheevo(title, points, stageId) {
    achievement(
        title = title,
        description = "Complete the secret area of " + BaseStageNameLookup[stageId] + ".",
        points = points,
        trigger = unless(AnyCheat()) && never(InDemo()) && IsJimTeleporting() && prev(CurrentStage()) == stageId && CurrentStage() == BaseStageIdLookup[stageId]
    )
}

// Update 5656 for anti-cheating and clearer notes.
CreateBonusAreaSuccessCheevo("I Love My Nana", 5, 0x01)
// Update 5670 for anti-cheating and clearer notes.
CreateBonusAreaSuccessCheevo("37 is a number", 10, 0x0d)

// New cheevos for collecting & using meal worms.
achievement(
    title = "Questions From Worms",
    description = "In Villi People, bring at least 9 mealworms to The Game Show.",
    points = 10,
    trigger = unless(AnyCheat()) && never(InDemo()) && measured(CurrentWormCount() >= 9, when=CurrentStage() == 0x09) && prev(MusicTrack()) == 0 && MusicTrack() == 2
)
achievement(
    title = "At Least This Isn't the 50s",
    description = "In Villi People, answer at least three questions correctly during The Game Show. Good luck!",
    points = 10,
    // Life count check in play to prevent dying at the memory game and redoing.
    trigger = unless(AnyCheat()) && never(InDemo()) && never(CurrentStage() != 0x09) && never(LifeCount() < prev(LifeCount())) && repeated(3, AnsweredCorrectly())
)
achievement(
    title = "Strength From Worms",
    description = "In Inflated Head, bring at least 9 mealworms to the High Striker.",
    points = 10,
    trigger = unless(AnyCheat()) && never(InDemo()) && measured(CurrentWormCount() >= 9, when=CurrentStage() == 0x08 || CurrentStage() == 0x07) && CurrentStage() == 0x08 && prev(CurrentStage()) == 0x07
)
achievement(
    title = "Test Your Jumping Might!",
    description = "In Inflated Head, win at least three times on the High Striker.",
    points = 10,
    trigger = unless(AnyCheat()) && never(InDemo()) && never(CurrentStage() != 0x08) && repeated(3, WonHammerHeadPrize())
)

// New ID for memory game cheevo.
achievement(
    title = "Memory Madness",
    description = "In Villi People, repeat all 12 sequences without error in the Memory Game.",
    points = 25,
    // Some extra nevers are added in to allow for resetting hits. This also includes if a death is taken during the game.
    trigger = unless(AnyCheat()) && never(InDemo()) && never(CurrentStage() != 0x09) && never(DidWormCountChange()) && HalfwayThroughMemoryGame() && trigger_when(CompletedMemoryGame())
)

// New cheevos for Peter Puppy Protection Policy
function CreatePeterPuppyProtectionPolicyCheevo(title, levelNumber) {
    achievement(
        title = title,
        description = "Complete " + LevelNumberToStageName[levelNumber] + " on Difficult WITHOUT making Peter Puppy mad.",
        points = 50,
        trigger = unless(AnyCheat()) && never(InDemo()) && OnDifficult() && CurrentStage() == LevelNumberToDict[levelNumber][0] &&
            disable_when(DidPeterGoMad(), until=CurrentStage() != LevelNumberToDict[levelNumber][0]) && PastFlagRounds() &&
            trigger_when(LevelFlagClaimed(levelNumber) && FinishedPeterPuppyDifficult())
    )
}

CreatePeterPuppyProtectionPolicyCheevo("Scooby-Doo", 3)
CreatePeterPuppyProtectionPolicyCheevo("Brian", 6)
CreatePeterPuppyProtectionPolicyCheevo("Snoopy", 10)

// New cheevos for damageless boss fights...of which there are only two.
function CreateDamagelessCheevo(title, levelNumber, stageId, boss, points) {
    achievement(
        title = title,
        description = "Defeat " + boss + " on Difficult without taking damage.",
        points = points,
        trigger = unless(AnyCheat()) &&
            never(InDemo()) &&
            OnDifficult() &&
            CurrentStage() == stageId &&
            BossHasShownUp() &&
            disable_when(
                CurrentStage() == stageId && PriorHealth() > CurrentHealth(),
                until=LifeCount() < prev(LifeCount()) || OutOfLevel(levelNumber)
            )
            && trigger_when(TransitionToCow(levelNumber))
    )
}

// CreateDamagelessCheevo("Domination of Pedro Pupa", 2, 0x0a, "Perdo Pupa", 10)

CreateDamagelessCheevo("Domination of Flamin' Yawn", 11, 0x0c, "Flamin' Yawn", 10)

// New cheevo: don't get popped, but do it on one life.
achievement(
    title = "Claws Encounters of the Non-Furred Kind",
    description = "Get to the high striker in one life WITHOUT being popped by Evil the Cat.",
    points = 25,
    trigger = unless(AnyCheat()) && never(InDemo()) && never(IsMenuMusic()) && once(CurrentStage() == 7) && trigger_when(prev(CurrentStage()) == 0x07 && CurrentStage() == 0x08) &&
        disable_when(LifeCount() < prev(LifeCount()) || WasPoppedByEvil(), until=OutOfLevel(8) )
)

// Below here: Leaderboards

function AnyPercentLeaderboard(difficulty, isOnDifficulty) {
    leaderboard(
        title = "Any% " + difficulty,
        description = "Beat the game on " + difficulty + " difficulty as fast as you can. No game overs allowed.",
        start = unless(AnyCheat()) && never(InDemo()) && InLevel(1) && MusicTrack() == 4 && isOnDifficulty && IsFreshStart(1),
        cancel = AnyCheat() || HasGameOvered(),
        submit = InLevel(12) && IsPsycrowTaxied(),
        value = measured(always_true()),
        lower_is_better = true,
        format = "FRAMES"
    )
}

function AllFlagsLeaderboard(id, difficulty, isOnDifficulty) {
    leaderboard(
        id = id,
        title = "All Flags " + difficulty,
        description = "Beat the game on " + difficulty + " difficulty with all flags as fast as you can. No game overs allowed.",
        start = unless(AnyCheat()) && never(InDemo()) && InLevel(1) && MusicTrack() == 4 && isOnDifficulty && IsFreshStart(1),
        cancel = AnyCheat() || HasGameOvered() ||
            BeatenLevelWithoutAllFlagsLeaderboard(1) || BeatenLevelWithoutAllFlagsLeaderboard(2) || BeatenLevelWithoutAllFlagsLeaderboard(3) ||
            BeatenLevelWithoutAllFlagsLeaderboard(4) || BeatenLevelWithoutAllFlagsLeaderboard(5) || BeatenLevelWithoutAllFlagsLeaderboard(6) ||
            BeatenLevelWithoutAllFlagsLeaderboard(7) || BeatenLevelWithoutAllFlagsLeaderboard(8) || BeatenLevelWithoutAllFlagsLeaderboard(9) ||
            BeatenLevelWithoutAllFlagsLeaderboard(10) || BeatenLevelWithoutAllFlagsLeaderboard(11),
        submit = InLevel(12) && IsPsycrowTaxied(),
        value = measured(always_true()),
        lower_is_better = true,
        format = "FRAMES"
    )
}

AnyPercentLeaderboard("Normal", OnNormal())
AnyPercentLeaderboard("Difficult", OnDifficult())
AllFlagsLeaderboard(34230, "Normal", OnNormal())
AllFlagsLeaderboard(34231, "Difficult", OnDifficult())

DifficultyToStartingLifeLookup = {
    "Easy": 5,
    "Normal": 3,
    "Difficult": 2
}

function StartingSetup(difficulty) {
    return LifeCount() == DifficultyToStartingLifeLookup[difficulty] && CurrentWeapon() == 0 && CurrentWeaponAmmo() == 1000
}

function FirstIlAnyPercentLeaderboard(difficulty, isOnDifficulty) {
    stageName = LevelNumberToStageName[1]
    indexes = LevelNumberToDict[1]
    first = indexes[0]
    leaderboard(
        title = stageName + " IL Any% " + difficulty,
        description = "Beat " + stageName + " in one life on " + difficulty + " difficulty.",
        start = unless(AnyCheat()) && never(InDemo()) && StartingSetup(difficulty) && InLevel(1) && MusicTrack() == 4  && IsFreshStart(1) && isOnDifficulty &&
            disable_when(prev(LifeCount()) > LifeCount(), until=OutOfLevel(1) || MusicTrack() == 6),
        cancel = AnyCheat() || LifeCount() < prev(LifeCount()) || OutOfLevel(1),
        submit = BeatenLevel(1),
        value = measured(always_true()),
        lower_is_better = true,
        format = "FRAMES"
    )
}

function GeneralIlAnyPercentLeaderboard(levelNumber, difficulty, isOnDifficulty, didWin) {
    stageName = LevelNumberToStageName[levelNumber]
    indexes = LevelNumberToDict[levelNumber]
    first = indexes[0]
    fresh = LevelNotBeaten(12)
    badWarpCheats = WarpToEnd()
    if (levelNumber != 2) {
        badWarpCheats = badWarpCheats || WarpToNext()
    }
    if (levelNumber != 3) {
        badWarpCheats = badWarpCheats || WarpToPuppyLove1()
    }
    if (levelNumber != 4) {
        badWarpCheats = badWarpCheats || WarpToVilliPeople()
    }
    if (levelNumber != 6) {
        badWarpCheats = badWarpCheats || WarpToPuppyLove2()
    }
    if (levelNumber != 7) {
        badWarpCheats = badWarpCheats || WarpToUdderlyAbducted()
    }
    if (levelNumber != 8) {
        badWarpCheats = badWarpCheats || WarpToInflatedHead()
    }
    if (levelNumber != 9) {
        badWarpCheats = badWarpCheats || WarpToIso9000()
    }
    if (levelNumber != 10) {
        badWarpCheats = badWarpCheats || WarpToPuppyLove3()
    }
    if (levelNumber != 11) {
        badWarpCheats = badWarpCheats || WarpToLevelAte()
    }
    if (levelNumber != 12) {
        badWarpCheats = badWarpCheats || WarpToSeeJimRun()
        fresh = IsFreshStart(levelNumber)
    }
    leaderboard(
        title = stageName + " IL Any% " + difficulty,
        description = "Warp immediately to " + stageName + " on starting a game in " + difficulty + " difficulty. In one life, beat the level.",
        start = unless(badWarpCheats || AnyNonWarpCheat()) && never(InDemo()) && CurrentStage() == first && prev(CurrentStage()) == 0 &&
            StartingSetup(difficulty) && MusicTrack() != 0xFF && MusicTrack() != 0x06  && fresh && isOnDifficulty &&
            disable_when(prev(LifeCount()) > LifeCount(), until=OutOfLevel(levelNumber)),
        cancel = badWarpCheats || AnyNonWarpCheat() || LifeCount() < prev(LifeCount()) || OutOfLevel(levelNumber),
        submit = didWin,
        value = measured(always_true()),
        lower_is_better = true,
        format = "FRAMES"
    )
}

function IndividualLevelAnyPercentLeaderboard(levelNumber, difficulty, isOnDifficulty) {
    GeneralIlAnyPercentLeaderboard(levelNumber, difficulty, isOnDifficulty, BeatenLevel(levelNumber))
}

function LastIlAnyPercentLeaderboard(difficulty, isOnDifficulty) {
    GeneralIlAnyPercentLeaderboard(12, difficulty, isOnDifficulty, IsPsycrowTaxied())
}

function FirstIlAllFlagsLeaderboard(difficulty, isOnDifficulty) {
    stageName = LevelNumberToStageName[1]
    indexes = LevelNumberToDict[1]
    first = indexes[0]
    leaderboard(
        title = stageName + " IL All Flags " + difficulty,
        description = "Beat " + stageName + " in one life with all flags on " + difficulty + " difficulty.",
        start = unless(AnyCheat()) && never(InDemo()) && StartingSetup(difficulty) && InLevel(1) && MusicTrack() == 4 && IsFreshStart(1) && isOnDifficulty &&
            disable_when(prev(LifeCount()) > LifeCount(), until=OutOfLevel(1) || MusicTrack() == 6),
        cancel = AnyCheat() || LifeCount() < prev(LifeCount()) || OutOfLevel(1) || BeatenLevelWithoutAllFlagsLeaderboard(1),
        submit = BeatenWithAllFlags(1),
        value = measured(always_true()),
        lower_is_better = true,
        format = "FRAMES"
    )
}

function GeneralIlAllFlagsLeaderboard(levelNumber, difficulty, isOnDifficulty) {
    stageName = LevelNumberToStageName[levelNumber]
    indexes = LevelNumberToDict[levelNumber]
    first = indexes[0]
    badWarpCheats = WarpToEnd()
    if (levelNumber != 2) {
        badWarpCheats = badWarpCheats || WarpToNext()
    }
    if (levelNumber != 3) {
        badWarpCheats = badWarpCheats || WarpToPuppyLove1()
    }
    if (levelNumber != 4) {
        badWarpCheats = badWarpCheats || WarpToVilliPeople()
    }
    if (levelNumber != 6) {
        badWarpCheats = badWarpCheats || WarpToPuppyLove2()
    }
    if (levelNumber != 7) {
        badWarpCheats = badWarpCheats || WarpToUdderlyAbducted()
    }
    if (levelNumber != 8) {
        badWarpCheats = badWarpCheats || WarpToInflatedHead()
    }
    if (levelNumber != 9) {
        badWarpCheats = badWarpCheats || WarpToIso9000()
    }
    if (levelNumber != 10) {
        badWarpCheats = badWarpCheats || WarpToPuppyLove3()
    }
    if (levelNumber != 11) {
        badWarpCheats = badWarpCheats || WarpToLevelAte()
    }
    if (levelNumber != 12) {
        badWarpCheats = badWarpCheats || WarpToSeeJimRun()
        fresh = IsFreshStart(levelNumber)
    }
    leaderboard(
        title = stageName + " IL All Flags " + difficulty,
        description = "Warp immediately to " + stageName + " on starting a game in " + difficulty + " difficulty. In one life, beat the level with all flags.",
        start = unless(badWarpCheats || AnyNonWarpCheat()) && never(InDemo()) && CurrentStage() == first && prev(CurrentStage()) == 0 &&
            StartingSetup(difficulty) && MusicTrack() != 0xFF && MusicTrack() != 0x06 && IsFreshStart(levelNumber) && isOnDifficulty &&
            disable_when(prev(LifeCount()) > LifeCount(), until=OutOfLevel(levelNumber)),
        cancel = badWarpCheats || AnyCheat() || LifeCount() < prev(LifeCount()) || OutOfLevel(levelNumber) || BeatenLevelWithoutAllFlagsLeaderboard(levelNumber),
        submit = BeatenWithAllFlags(levelNumber),
        value = measured(always_true()),
        lower_is_better = true,
        format = "FRAMES"
    )
}

function CreateIlBoards() {
    for index in range(2, 11, 1) {
        IndividualLevelAnyPercentLeaderboard(index, "Normal", OnNormal())
        IndividualLevelAnyPercentLeaderboard(index, "Difficult", OnDifficult())
        GeneralIlAllFlagsLeaderboard(index, "Normal", OnNormal())
        GeneralIlAllFlagsLeaderboard(index, "Difficult", OnDifficult())
    }
}

FirstIlAnyPercentLeaderboard("Normal", OnNormal())
FirstIlAnyPercentLeaderboard("Difficult", OnDifficult())
FirstIlAllFlagsLeaderboard("Normal", OnNormal())
FirstIlAllFlagsLeaderboard("Difficult", OnDifficult())
CreateIlBoards()
LastIlAnyPercentLeaderboard("Normal", OnNormal())
LastIlAnyPercentLeaderboard("Difficult", OnDifficult())


// Below here: RP functions.

rich_presence_conditional_display(
    InDemo(),
    "Jim demoing {0}",
    rich_presence_lookup("StageName", CurrentStage(), BaseStageNameLookup)
)

function CreateRp12() {
    rich_presence_conditional_display(
        InLevel(12) && IsJimAlive(),
        "Jim running through {0} Lives: {1}  ⚛{2}% {3}x{4}",
        rich_presence_lookup("StageName", CurrentStage(), BaseStageNameLookup),
        rich_presence_value("Number", LifeCount()),
        rich_presence_value("Number", CurrentHealth()),
        rich_presence_lookup("WeaponEmoji", low4(0xfad8), WeaponIdLookup),
        rich_presence_value("Number", CurrentWeaponAmmo())
    )
}

function CreateRpPeterPuppy(levelNumber, flagByte) {
    rich_presence_conditional_display(
        InLevel(levelNumber) && IsJimAlive(),
        "Jim saving puppies in {0} 🐶 Round {3} - Lives: {1} - ⚛{2}% Flags: {4}{5}{6}",
        rich_presence_lookup("StageName", CurrentStage(), BaseStageNameLookup),
        rich_presence_value("Number", LifeCount()),
        rich_presence_value("Number", CurrentHealth()),
        rich_presence_value("Number", PeterPuppyRound()),
        rich_presence_lookup("EarthFlag", bit0(flagByte), EarthFlagLookup),
        rich_presence_lookup("WormFlag", bit1(flagByte), WormFlagLookup),
        rich_presence_lookup("JimFlag", bit2(flagByte), JimFlagLookup)
    )
}

function CreateRpPeterPuppies() {
    CreateRpPeterPuppy(3, LevelOrderToByteLookup[3])
    CreateRpPeterPuppy(6, LevelOrderToByteLookup[6])
    CreateRpPeterPuppy(10, LevelOrderToByteLookup[10])
}

function CreateRpNormalLevel(levelNumber, flagByte) {
    rich_presence_conditional_display(
        InLevel(levelNumber) && IsJimAlive(),
        "Jim going through {0} - Lives: {1} - ⚛{2}% {3}x{4} Flags: {5}{6}{7}",
        rich_presence_lookup("StageName", CurrentStage(), BaseStageNameLookup),
        rich_presence_value("Number", LifeCount()),
        rich_presence_value("Number", CurrentHealth()),
        rich_presence_lookup("WeaponEmoji", low4(0xfad8), WeaponIdLookup),
        rich_presence_value("Number", CurrentWeaponAmmo()),
        rich_presence_lookup("EarthFlag", bit0(flagByte), EarthFlagLookup),
        rich_presence_lookup("WormFlag", bit1(flagByte), WormFlagLookup),
        rich_presence_lookup("JimFlag", bit2(flagByte), JimFlagLookup)
    )
}

function CreateGeneralMealWormLevel(levelNumber, flagByte) {
    rich_presence_conditional_display(
        InLevel(levelNumber) && IsJimAlive(),
        "Jim going through {0} - Lives: {1} - ⚛{2}% {3}x{4} 🥫{8} Flags: {5}{6}{7}",
        rich_presence_lookup("StageName", CurrentStage(), BaseStageNameLookup),
        rich_presence_value("Number", LifeCount()),
        rich_presence_value("Number", CurrentHealth()),
        rich_presence_lookup("WeaponEmoji", low4(0xfad8), WeaponIdLookup),
        rich_presence_value("Number", CurrentWeaponAmmo()),
        rich_presence_lookup("EarthFlag", bit0(flagByte), EarthFlagLookup),
        rich_presence_lookup("WormFlag", bit1(flagByte), WormFlagLookup),
        rich_presence_lookup("JimFlag", bit2(flagByte), JimFlagLookup),
        rich_presence_value("Number", CurrentWormCount())
    )
}

rich_presence_conditional_display(
    InLevel(4) && IsJimAlive() && MusicTrack() == 2,
    "Jim is a contestant on a quiz show at {0} - Lives: {1} - ⚛{2}% {3}x{4} 🥫{8} Flags: {5}{6}{7}",
    rich_presence_lookup("StageName", CurrentStage(), BaseStageNameLookup),
        rich_presence_value("Number", LifeCount()),
        rich_presence_value("Number", CurrentHealth()),
        rich_presence_lookup("WeaponEmoji", low4(0xfad8), WeaponIdLookup),
        rich_presence_value("Number", CurrentWeaponAmmo()),
        rich_presence_lookup("EarthFlag", bit0(LevelOrderToByteLookup[4]), EarthFlagLookup),
        rich_presence_lookup("WormFlag", bit1(LevelOrderToByteLookup[4]), WormFlagLookup),
        rich_presence_lookup("JimFlag", bit2(LevelOrderToByteLookup[4]), JimFlagLookup),
        rich_presence_value("Number", CurrentWormCount())
)

rich_presence_conditional_display(
    InLevel(4) && IsJimAlive() && MusicTrack() == 2,
    "Jim is on Round {9} memory game at {0} - Lives: {1} - ⚛{2}% {3}x{4} 🥫{8} Flags: {5}{6}{7}",
    rich_presence_lookup("StageName", CurrentStage(), BaseStageNameLookup),
        rich_presence_value("Number", LifeCount()),
        rich_presence_value("Number", CurrentHealth()),
        rich_presence_lookup("WeaponEmoji", low4(0xfad8), WeaponIdLookup),
        rich_presence_value("Number", CurrentWeaponAmmo()),
        rich_presence_lookup("EarthFlag", bit0(LevelOrderToByteLookup[4]), EarthFlagLookup),
        rich_presence_lookup("WormFlag", bit1(LevelOrderToByteLookup[4]), WormFlagLookup),
        rich_presence_lookup("JimFlag", bit2(LevelOrderToByteLookup[4]), JimFlagLookup),
        rich_presence_value("Number", CurrentWormCount()),
        rich_presence_value("Number", MemoryGameRound())
)

rich_presence_conditional_display(
    IsDeadJim(),
    "Jim preparing to enter {0}",
    rich_presence_lookup("StageName", CurrentStage(), BaseStageNameLookup)
)

rich_presence_conditional_display(
    InLevel(5) && IsJimAlive(),
    "Jim rocketing through {0} - Lives: {1} - {2}% Flags: {3}{4}{5}",
    rich_presence_lookup("StageName", CurrentStage(), BaseStageNameLookup),
    rich_presence_value("Number", LifeCount()),
    rich_presence_value("Number", CurrentHealth()),
    rich_presence_lookup("EarthFlag", bit0(LevelOrderToByteLookup[5]), EarthFlagLookup),
    rich_presence_lookup("WormFlag", bit1(LevelOrderToByteLookup[5]), WormFlagLookup),
    rich_presence_lookup("JimFlag", bit2(LevelOrderToByteLookup[5]), JimFlagLookup)
)

rich_presence_conditional_display(
    InLevel(2) && IsJimAlive(),
    "Jim digging through {0} ⏲{6} Seconds - Lives: {1} - {2}% Flags: {3}{4}{5}",
    rich_presence_lookup("StageName", CurrentStage(), BaseStageNameLookup),
    rich_presence_value("Number", LifeCount()),
    rich_presence_value("Number", CurrentHealth()),
    rich_presence_lookup("EarthFlag", bit0(LevelOrderToByteLookup[2]), EarthFlagLookup),
    rich_presence_lookup("WormFlag", bit1(LevelOrderToByteLookup[2]), WormFlagLookup),
    rich_presence_lookup("JimFlag", bit2(LevelOrderToByteLookup[2]), JimFlagLookup),
    rich_presence_value("Number", InGameTimer())
)

CreateRpPeterPuppies()
CreateRpNormalLevel(1, LevelOrderToByteLookup[1])
CreateRpNormalLevel(7, LevelOrderToByteLookup[7])
CreateRpNormalLevel(9, LevelOrderToByteLookup[9])
CreateRpNormalLevel(11, LevelOrderToByteLookup[11])
CreateGeneralMealWormLevel(4, LevelOrderToByteLookup[4])
CreateGeneralMealWormLevel(8, LevelOrderToByteLookup[8])
CreateRp12()

rich_presence_display("Jim trying to be groovy in Earthworm Jim 2.")

