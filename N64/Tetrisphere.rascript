// Tetrisphere
// #ID = 10172

// $0DF710: Mostly Number of Frames since Power On/Reset [32-bit]
//          This pauses when lag frames happen, but otherwise keeps going up.
// $0DF714: Mostly Number of Frames since Power On/Reset [32-bit]
//          This appears to be a duplicate of 0x0df710
// $0DF718: Mostly Number of Frames since Power On/Reset [32-bit]
//          This appears to be a duplicate of 0x0df710
// $0DF71C: Lag Counter
//          This resets to 0 when there is no lag, and increases by one for each frame where there is lag.
//          Lag often results from pausing, then resuming, a game.
//          Do not be surprised if, during gameplay, this oscinates between 0, 1, and rarely 2. This is not the most optimized game.

// $0DFD7A: Player 1 Input Part 1
//          [Bit0] C-Right
//          [Bit1] C-Left
//          [Bit2] C-Down
//          [Bit3] C-Up
//          [Bit4] R-Trigger
//          [Bit5] L-Trigger
function Player1PressedCDown() => bit2(0x0DFD7A)

// $0DFD7B: Player 1 Input Part 2
//          [Bit0] D-Pad Right
//          [Bit1] D-Pad Left
//          [Bit2] D-Pad Down
//          [Bit3] D-Pad Up
//          [Bit4] Start
//          [Bit5] Z-Trigger
//          [Bit6] B
//          [Bit7] A
function Player1PressedA() => bit7(0x0DFD7B)

// $0DFD8A: Confusing Counter [16-bit]
//          When a mode starts, this goes up to 0x04ff before looping back to 0x0000. It's not clear what this is used for.
// $0DFEE0: Unknown Confusing Big Counter? [64-bit]
//          The first half counts down from 0x013f or thereabouts to 0x00. When the second half hits 6, the next attempt that normally goes to 7 goes to 0 and the process repeats.
//          This may not be required for anything.
// $0DFEE8: Mostly Number of Frames since Power On/Reset [32-bit]
//          This one pauses its counter during occasional loads, but otherwise stays continuing.
// $0DFEEC: Inconsistent Counter since Power On [32-bit]
//          This counter has strange behavior. It pauses on some things while loading. It pauses during demoes, but then resumes when the demo finishes. When you enter gameplay, it pauses. When you are done playing a sphere, the value gets set to 0x0dfee8.
//          It is not recommended to rely on this counter.
// $0DFF04: Unknown Slow Counter [32-bit]
//          This one doesn't go as fast as some of the other counters. It's not clear why.
// $0DFF14: Unknown Counter [32-bit]
//          This counter will increment each frame as long as you are NOT in gameplay. When you are in gameplay, the counter freezes until you get into a menu, when the counter resets to 0.
// $0DFF18: Unknown Counter [32-bit]
//          Unlike 0x0dff14, this one will continue to increment when you return to gameplay. However, this counter still resets upon entering a menu.
//          Unless forcing cheevos with no pause requirements, this should not be used.
// $0DFF1C: Unknown Counter [32-bit]
//          Seems to match up with 0x0dff14

// $0E0754: Selected 1P Game Mode
//          0x00 - Rescue
//          0x01 - Hide & Seek
//          0x02 - Puzzle
//          0x03 - Time Trial
//          0x04 - VS CPU
//          0x05 - Lines (Secret Mode)
function SelectedMode1P() => byte(0x0E0754)
function SelectedVsCpu() => SelectedMode1P() == 4

// $0E0756: Main Menu Selection
//          0x00 - Single
//          0x01 - VS
//          0x02 - Practice
//          0x03 - Options
//          0x04 - Training
// $0E075A: VS Menu Selection
//          0x00 - Battle
//          0x01 - Rules
//          0x02 - Lines (Secret Mode)
// $0E075E: Options Menu Selection
//          0x00 - Audio
//          0x01 - Data Edit
//          0x02 - Scores
//          0x03 - Controls
// $0E07D7: Player-Selected Bot
//          See 0x0e123c for the Bot Selection.
// $0E088C: Confusing Level Counter - DO NOT USE!
//          This counter increments by one each time you beat a level in a mode. Leaving and re-entering the same mode does NOT reset this value!

// $0E0890: Practice Mode - L (Purple) Enabled?
function PracticeModePieceL() => byte(0x0E0890)

TrainingLLookup = {
    0x00: "❌",
    0x01: "ட",
}

// $0E0891: Practice Mode - I (Green) Enabled?
function PracticeModePieceI() => byte(0x0E0891)

TrainingHoriLookup = {
    0x00: "❌",
    0x01: "‒",
}

// $0E0892: Practice Mode - ‐ (Yellow) Enabled?
function PracticeModePieceLine() => byte(0x0E0892)

TrainingVertLookup = {
    0x00: "❌",
    0x01: "|",
}

// $0E0893: Practice Mode - Square (Blue) Enabled?
function PracticeModePieceSquare() => byte(0x0E0893)

TrainingSquareLookup = {
    0x00: "❌",
    0x01: "□",
}

// $0E0896: Practice Mode - T (Red) Enabled?
function PracticeModePieceT() => byte(0x0E0896)

TrainingTLookup = {
    0x00: "❌",
    0x01: "T",
}

// $0E0897: Practice Mode - Zig-Zag (Navy?) Enabled?
function PracticeModePieceZ() => byte(0x0E0897)

TrainingZigLookup = {
    0x00: "❌",
    0x01: "ᓱ",
}

// $0E089B: Practice Mode - How many layers to dig through?
//          This goes from 1 to 5.
function PracticeModeLayerCount() => byte(0x0E089B)

// $0E089E: Practice Mode - Core Area pieces to free
//          This goes from 3 - 99.
function PracticeModeCoreCount() => byte(0x0E089E)

// $0E0B1C: Music / SFX Balance
//          The range is from 0x00 - 0x0c. At 0x00, the music is at full blast and no sound effects play. At 0x06, both music and sound effects are heard relatively equally. At 0x0c, no music plays and the sound effects are heard fully.
//          To actually reduce the volume of both, use your external volume controls.
// $0E0B20: Audio Menu - Music Selection Mode
//          0x00 - The game decides the specific track.
//          0x01 - The game randomly decides the track.
//          0x02 - You select the next track.
// $0E0B24: Audio Menu - Specific Track Selection
//          0x00 - Prophetic - Title
//          0x01 = Azule Lux
//          0x02 = Martist
//          0x03 = Compliant Confuse
//          0x04 = Faze
//          0x05 = Flim Flam
//          0x06 = ManicDrumMix
//          0x07 = Hallucid
//          0x08 = Perpetuate303
//          0x09 = Phony
//          0x0a = T. Grey
//          0x0b = Learn
//          0x0c = Zyp Zyp
//          0x0d = Extol

// $0E1050: Flag to Indicate Time Trial is Over.
//          When 0x70, Time Trial has started. When 0x10, the mode has stopped.
function TimeTrialStatus() => byte(0x0E1050)

// $0E1208: Controllable Time Elapsed in Menus [32-bit]
//          This value resets to 0 whenever the game loads a new menu (the wooshes), and pauses whenever you are in gameplay.
//          Leaving the controller alone on some menus loads up the demo.
// $0E120C: Time since Entering a Menu [32-bit]
//          This timer acts similar to 0x0e1208, though it has differences.
//          If the demo were to play, this timer would continue.
//          If you pause the game, the pause menu shows up, but exiting the pause menu does not reset or pause this timer.
// $0E1210: Controllable Time Elapsed in Menus Duplicate? [32-bit]
//          This appears to follow the logic of 0x0e1208, but it sometimes stops a frame late.
// $0E121E: Main Menu Selection Duplicate?
//          This appears to duplicate 0x0e0756.
// $0E122A: Pause Menu [8-bit]
//          While in gameplay, this value is 0xFF. While paused during gameplay, this value represents different options depending on mode.
//          In almost all modes, 0x00 represents continuing and 0x03 represents exiting. 0x01 and 0x02, if they are relevant, are mode dependent.
// $0E122E: High Score Mode Selection
//          0x00 - Rescue
//          0x01 - Hide & Seek
//          0x02 - Puzzle
//          0x03 - Time Trial
//          0xff - In-game
// $0E1232: Load / Erase Player?
//          There are 8 slots to select from.
// $0E123C: Player Bot Selection
//          There are seven characters (or bots) to play as, each with different attributes in speed and power.
//          0x00 = Rocket
//          0x01 = Gear
//          0x02 = Gyro
//          0x03 = Stomp
//          0x04 = Wheels
//          0x05 = Turbine
//          0x06 = Jak
// $0E1240: Bot Selection - Model to Display
//          This always gets set after 0x0e123c.
// $0E1246: Main Menu Selection Duplicate?
//          This appears to duplicate 0x0e0756.

// $0E12DE: BAD CHEAT - Level Select Active!
//          Level Select was turned on for this slot.
//          TODO: Investigate whether this persists between save slots.
//          TODO: Investigate whether erasing the slot removes the cheat.
function LevelSelect() => byte(0x0E12DE)
function LevelSelectActive() => LevelSelect() == 1
function LevelSelectOff() => LevelSelect() == 0

// $0E12E5: GOOD CHEAT - Lines Mode Active!
//          Instead of dropping pieces, drag to line them up! It also has its own episode list.
// $0E13C0: Offset for Filename Entry
//          This value determines how many rows to offset for filename entry. This value should either be 0x00 for no change or 0x09 if inputting a cheat.
//          Due to misinformation on GameFAQs, one hint is provided for activating this menu. Use the L-Trigger instead of the R-Trigger.
//          Some cheats are allowed to be put in as they unlock new content. Others, however, should pause all achievement progress.
//          DO NOT set this value above 0x09! You risk hard-locking the game!
// $0E13C8: Player Name Part 1
//          The following 8 bytes are all used for the player's name. Interestingly, only 7 bytes are allowed to be put in by the player.
// $0E13CC: Player Name Part 2
//          This is the other half of 0x0e13c0.
// $0E15B8: Hide & Seek 1st Place Score [32-bit]
// $0E15BC: Hide & Seek 2nd Place Score [32-bit]
// $0E15C0: Hide & Seek 3rd Place Score [32-bit]
// $0E15C4: Hide & Seek 4th Place Score [32-bit]
// $0E15C8: Hide & Seek 5th Place Score [32-bit]
// $0E15CC: Rescue 1st Place Score [32-bit]
// $0E15D0: Rescue 2nd Place Score [32-bit]
// $0E15D4: Rescue 3rd Place Score [32-bit]
// $0E15D8: Rescue 4th Place Score [32-bit]
// $0E15DC: Rescue 5th Place Score [32-bit]
// $0E15E0: Puzzle Mode 1st Place Time [32-bit]
//          For all of this batch of entries, only seconds are captured.
// $0E15E4: Puzzle Mode 2nd Place Time [32-bit]
// $0E15E8: Puzzle Mode 3rd Place Time [32-bit]
// $0E15EC: Puzzle Mode 4th Place Time [32-bit]
// $0E15F0: Puzzle Mode 5th Place Time [32-bit]
// $0E15F4: Time Trial 1st Place Score [32-bit]
// $0E15F8: Time Trial 2nd Place Score [32-bit]
// $0E15FC: Time Trial 3rd Place Score [32-bit]
// $0E1600: Time Trial 4th Place Score [32-bit]
// $0E1604: Time Trial 5th Place Score [32-bit]

// $0E241C: Displayed UI Score for the current game [32-bit]
//          The UI multiplies this score by 10.
function CurrentScoreUi() => dword(0x0E241C)

// $0E2420: Score of Last Combo [32-bit]
//          The UI multiplies this score by 10.

// $0E449A: Current Level Counter - 0-Index
//          This value increments when you enter the next level. Menu transitions do NOT count as the next level: selecting Continue is a requirement.
function CurrentLevelInternal() => byte(0x0E449A)

HSEarlyLookup = {
    0x00: "1:1 (Multi)",
    0x01: "1:2 (Drill)",
    0x02: "1:3 (Brick)",
    0x03: "1:4 (Tower)",
    0x04: "1:5 (Hide & Seek)",
    0x05: "2:1 (Multi)",
    0x06: "2:2 (Drill)",
    0x07: "2:3 (Unique)",
    0x08: "2:4 (Shift)",
    0x09: "2:5 (Hide & Seek)",
    0x0a: "3:1 (Multi)",
    0x0b: "3:2 (Drill)",
    0x0c: "3:3 (Connect)",
    0x0d: "3:4 (Brick)",
    0x0e: "3:5 (Hide & Seek)",
    0x0f: "4:1 (Multi)",
    0x10: "4:2 (Shift)",
    0x11: "4:3 (Unique)",
    0x12: "4:4 (Tower)",
    0x13: "4:5 (Hide & Seek)",
    0x14: "5:1 (Multi)",
    0x15: "5:2 (Drill)",
    0x16: "5:3 (Connect)",
    0x17: "5:4 (Brick)",
    0x18: "5:5 (Hide & Seek)",
    0x19: "6:1 (Multi)",
    0x1a: "6:2 (Drill)",
    0x1b: "6:3 (Unique)",
    0x1c: "6:4 (Crystal Tower)",
    0x1d: "6:5 (Hide & Seek)",
}

// $0E449E: Current Level (UI)
//          This gets set to 0 any time you are in a menu selection.
//          The game mode itself will translate this value into an appropriate value, so no need to worry about Hide & Seek with its colon formatting.
function CurrentLevelUi() => byte(0x0E449E)

// $0E44A2: Episode Number Menu Selection
//          This goes from 0x00 to the max number of episodes available in that mode.
//          Unlike other menu selections, this one holds up during gameplay.
function EpisodeMenuSelection() => low4(0x0E44A2)
function EpisodeMenuRp() => EpisodeMenuSelection() + 1

// $0ECA80: Filename Entry - Normal
//          The following 0x48 bytes are used to represent the filename for the bot. 0x00 represents a blank space on the table. The ASCII codes match with a few exceptions noted here:
//          0x22 - _
//          0x5c - _ (pound sign)
//          0x28 - =
//          0x26 - +
//          0x29 - Backspace
//          0x2f - Cancel Button
//          0x5f - OK Button
// $0ECAC8: Filename Entry - Cheat Mode
//          The following 0x48 bytes are used to represent the cheat mode table for inputting cheats. Due to misinformation on GameFAQs, one hint is provided for activating this cheat. Use the L-Trigger instead of the R-Trigger.
//          Some cheats are allowed to be put in as they unlock new content. Others, however, should pause all achievement progress.
//          Instead of the numbers, various symbols are used. Going in UI order, they are:
//          0x23 - Gear
//          0x24 - Molecule
//          0x27 - Alien Head
//          0x3d - Star
//          0x2a - Smiley Face
//          0x2b - Saturn
//          0x3b - UFO
//          0x3c - Rocket Ship
//          0x3e - Heart
//          0x5e - Skull
// $0ED8F8: Hide & Seek 1st Place Name [8 bytes] [32-bit]
// $0ED900: Hide & Seek 2nd Place Name [8 bytes] [32-bit]
// $0ED908: Hide & Seek 3rd Place Name [8 bytes] [32-bit]
// $0ED910: Hide & Seek 4th Place Name [8 bytes] [32-bit]
// $0ED918: Hide & Seek 5th Place Name [8 bytes] [32-bit]
// $0ED920: Rescue 1st Place Name [8 bytes] [32-bit]
// $0ED928: Rescue 2nd Place Name [8 bytes] [32-bit]
// $0ED930: Rescue 3rd Place Name [8 bytes] [32-bit]
// $0ED938: Rescue 4th Place Name [8 bytes] [32-bit]
// $0ED940: Rescue 5th Place Name [8 bytes] [32-bit]
// $0ED948: Puzzle 1st Place Name [8 bytes] [32-bit]
// $0ED950: Puzzle 2nd Place Name [8 bytes] [32-bit]
// $0ED958: Puzzle 3rd Place Name [8 bytes] [32-bit]
// $0ED960: Puzzle 4th Place Name [8 bytes] [32-bit]
// $0ED968: Puzzle 5th Place Name [8 bytes] [32-bit]
// $0ED970: Time Trial 1st Place Name [32-bit]
//          Unlike other leaderboard positions, this one does not take the entire 8 bytes.
// $0ED974: Time Trial 2nd Place Name [32-bit]
//          Unlike other leaderboard positions, this one does not take the entire 8 bytes.
// $0ED978: Time Trial 3rd Place Name [8 bytes] [32-bit]
// $0ED980: Time Trial 4th Place Name [8 bytes] [32-bit]
// $0ED988: Time Trial 5th Place Name [8 bytes] [32-bit]
// $0F211C: Slot 1 Save Information [20 bytes]
//          If this slot is unused, all bytes will be ff. Specific offsets are as follows:
//          * Offsets 0-3 appear to always be zero.
//          * Offsets 4-7 are a randomly generated value for the save slot. If the last of this batch of four is changed to 0xff, The slot is scheduled to be deleted.
//          * Offset 8 is the highest level completed in Rescue Mode.
//          * Offset 9 is the highest level completed in Hide & Seek Mode.
//          * Offsets A-C are unclear at this point.
//          * Offset D is the highest level completed in Lines Mode.
//          * Offset E is the highest level completed in Vs. CPU Mode.
//          * Offset F is the highest level completed in Puzzle Mode.
//          * Offsets 10-13 are unclear at this point.
// $0F2120: Slot 1 - Checksum [32-bit]
//          This value is 0xffffffff if the save file is not in use.
//          If only the upper byte is 0xff, then the save file is marked for deletion and will wipe all data in the slot upon clearing a level.
// $0F2123: Suspected Deletion Flag?
//          If 0xff, assume the slots are erased and start again.
//          This may not be the right value.
// $0F2124: Slot 1 - Highest Achieved Level in Rescue Mode
// $0F2125: Slot 1 - Highest Achieved Level in Hide & Seek Mode
// $0F2129: Slot 1 - Highest Level Achieved in Lines Mode
// $0F212A: Slot 1 - Highest Level Achieved in Vs. CPU Mode
// $0F212B: Slot 1 - Highest Achieved Level in Puzzle Mode
// $0F2130: Slot 2 Save Information [20 bytes]
//          See 0x0f211c for more information.
// $0F2134: Slot 2 - Checksum [32-bit]
//          See 0x0f211c for additional information.
// $0F2138: Slot 2 - Highest Achieved Level in Rescue Mode
// $0F2139: Slot 2 - Highest Achieved Level in Hide & Seek Mode
// $0F213E: Slot 2 - Highest Level Achieved in Vs. CPU Mode
// $0F2144: Slot 3 Save Information [20 bytes]
//          See 0x0f211c for more information.
// $0F2148: Slot 3 - Checksum [32-bit]
//          See 0x0f211c for additional information.
// $0F214C: Slot 3 - Highest Achieved Level in Rescue Mode
// $0F214D: Slot 3 - Highest Achieved Level in Hide & Seek Mode
// $0F2152: Slot 3 - Highest Level Achieved in Vs. CPU Mode
// $0F2158: Slot 4 Save Information [20 bytes]
//          See 0x0f211c for more information.
// $0F215C: Slot 4 - Checksum [32-bit]
//          See 0x0f211c for additional information.
// $0F2160: Slot 4 - Highest Achieved Level in Rescue Mode
// $0F2161: Slot 4 - Highest Achieved Level in Hide & Seek Mode
// $0F2166: Slot 4 - Highest Level Achieved in Vs. CPU Mode
// $0F216C: Slot 5 Save Information [20 bytes]
//          See 0x0f211c for more information.
// $0F2170: Slot 5 - Checksum [32-bit]
//          See 0x0f211c for additional information.
// $0F2174: Slot 5 - Highest Achieved Level in Rescue Mode
// $0F2175: Slot 5 - Highest Achieved Level in Hide & Seek Mode
// $0F217A: Slot 5 - Highest Level Achieved in Vs. CPU Mode
// $0F2180: Slot 6 Save Information [20 bytes]
//          See 0x0f211c for more information.
// $0F2184: Slot 6 - Checksum [32-bit]
//          See 0x0f211c for additional information.
// $0F2188: Slot 6 - Highest Achieved Level in Rescue Mode
// $0F2189: Slot 6 - Highest Achieved Level in Hide & Seek Mode
// $0F218E: Slot 6 - Highest Level Achieved in Vs. CPU Mode
// $0F2194: Slot 7 Save Information [20 bytes]
//          See 0x0f211c for more information.
// $0F2198: Slot 7 - Checksum [32-bit]
//          See 0x0f211c for additional information.
// $0F219C: Slot 7 - Highest Achieved Level in Rescue Mode
// $0F219D: Slot 7 - Highest Achieved Level in Hide & Seek Mode
// $0F21A2: Slot 7 - Highest Level Achieved in Vs. CPU Mode
// $0F21A8: Slot 8 Save Information [20 bytes]
//          See 0x0f211c for more information.
// $0F21AC: Slot 8 - Checksum [32-bit]
//          See 0x0f211c for additional information.
// $0F21B0: Slot 8 - Highest Achieved Level in Rescue Mode
// $0F21B1: Slot 8 - Highest Achieved Level in Hide & Seek Mode
// $0F21B6: Slot 8 - Highest Level Achieved in Vs. CPU Mode
// $0F21F4: Currently Loaded Save File [4 bytes]
//          This appears to match the data in save slot offsets 4-7.
// $0F61D0: BAD - Current Save Slot
//          When the save slot is changed, this value changes multiple times before settling into its intented value. This could be part of the loading mechanism.

function AllSaveFilesErased() => byte(0x0F2123) == 255 && byte(0x0F2137) == 255 && byte(0x0F214B) == 255 &&
  byte(0x0F215F) == 255 && byte(0x0F2173) == 255 && byte(0x0F2187) == 255 && byte(0x0F219B) == 255 && byte(0x0F21AF) == 255

// $0FE16C: Number of Frames since Power On/Reset [32-bit]
// $1029F3: Highest Achieved Level in Puzzle Mode (Duplicate?)
//          Investigate against 0x0f212b
// $102CB6: Current Combo Number
//          Note that this does work during the demo. Guard against that.
// $1039EE: Fuse Combos Earned This Round
//          This is mainly for statistical purposes.
// $10880C: Currently Playing Music Track
//          See 0x0e0b24 for track listings.
// $10880E: Currently Playing Music Track (Duplicate?)
//          See 0x0e0b24 for track listings.
// $10D8AC: Cursor Shadow Movement
//          This pulses to 1 during movement, and resets to 0 when done moving.
// $1103DC: Sphere Playfield Check
//          Either 0x00 if no field to play on or 0x01 if there is.
//          Note that this includes demo play. Note that if on the demo, the value is reset to 0 AFTER the title screen.

// $110921: Magic Slot
//          If in the menu, this should always be 0x00.
//          0xFF: No power-up.
//          0x00-05: the specific magic spell on hand.
function Player1MagicSlot() => byte(0x110921)

// $110922: Misdrop Took Place for P1?
//          This value stays 1 as long as a life heart is being turned into a skull.
// $112596: Current Shadow Piece
//          If the shadow is a wildcard, then the value is 0x16. Otherwise, the value goes from 0x00 to (number of pieces on the board - 1). The specific mapping is undetermined.
// $1125CC: Piece Shadow Turned Off?
//          When a life is taken away, this is set to 1. When reset to 0, the shadow is back and control is resumed.
// $1125D2: Piece Shadow Turned Off? (Possible Duplicate of 0x1125d2)
// $1125F4: Game Victorious Flag (duplicate of 0x113486?)
// $1125F8: Rescue Game Over Flag?
//          Need to check if this is different for each mode.

// $112600: Number of Core Pieces/Sizes Left
//          * In Practice or VS Modes, this value represents the number of core pieces to remove to win. This underflows if you remove more than necessary, but doesn't cuase problems if you do.
//          * In Rescue Mode, the initial value represents the size x size box of core pieces you must free in order to rescue the creature inside. This value _will_ underflow no matter what.
function Player1CorePiecesLeft() => byte(0x112600)

// $11262A: Single player drop timer
// $1127E4: Puzzle Mode - Number of Drops Left [16-bit]
//          With other modes, the inverse will tell you how many drops performed.
// $1127E6: Puzzle Mode - Total Pieces on the Sphere [16-bit]
//          This counts the main shapes, the individual crystal pieces, and the magic pieces.
//          In non-puzzle modes, this only counts the main shapes in an inverse that get destroyed. Dropping a piece temporarily adds one back.
// $1127E8: Number of Pieces to Resolve Interactions
//          This increments to one on a drop. If pieces will be removed via this, they get added to the total before they get subtracted via disappearing.
//          When dropping on power pieces, this number cannot go as high since the combos are intentionally slower.
//          Causing gravity combos will also increase this value.
// $1127EA: Puzzle Mode - Number of Slides Left [16-bit]
//          This can apparently go negative in other modes. It is not clear if this is meant to represent some hidden rank or not.

// $112D04: Gravity Combo Multiplier Limit
//          This value can go up to 9, where it's capped. To increase the multiplier even more, perform Fuse Combos.
function Player1GravityComboLimit() => byte(0x112D04)

// $112D0A: Fuse Combo Multiplier Limit
//          This goes up to 10, where it's capped. To increase the multiplier even more, perform Gravity Combos.
function Player1FuseComboLimit() => byte(0x112D0A)

// $112D18: Calculated Score for Current Game [32-bit]
//          The UI multiplies this score by 10.
//          This one should be used for any modes that are strict on time limits.
// $112D34: Timer to Display Recent Combo Score [16-bit]
//          Once this value hits 0x00, 0xffff, or 0xfffe (hard to tell), remove the score from the UI.
// $112D36: Current Combo Number (Duplicate?)
//          Double check against 0x102cb6
// $112D38: X-Coordinate on Sphere
//          All spheres have an x coordinate of 0x00-0x1f. Moving right subtracts, moving left adds.
// $112D3C: Y-Coordinate on Sphere
//          All spheres have an y coordinate of 0x00-0x1f. Moving down subtracts, moving up adds.
// $112D40: X-Coordinate on Sphere (Duplicate?)
//          See 0x112d38.
// $112D44: Y-Coordinate on Sphere (Duplicate?)
//          See 0x112d3c.
// $112E94: Number of Gravity Combos Performed This Round
//          This is mainly for statistical purposes.
// $112EA0: Total Pieces Dropped This Run [16-bit]?
//          This only includes pieces you place on the sphere.
// $112EAA: Multiplier Increases This Round
//          This goes up by one each time a Gravity Combo or Fuse Combo is performed. Note that this does is NOT used for the UI: this value easily exceeds 20 decimal.

// $112F9C: Miss Counter (Normal mode?) ff on death, starts at 03
function Player1LifeCount() => byte(0x112F9C)
function IsPlayer1Dead() => Player1LifeCount() == 0 || Player1LifeCount() == 0xFF

// $11345C: Puzzle Mode Reset Flag
//          When set to 1, the puzzle is being reloaded.
function PuzzleModeReset() => byte(0x11345C)
function PuzzleVictoryJingle() => EarnedVictoryJingle() && PuzzleModeReset() == 0

// $113480: Puzzle Mode Reset Flag (Duplicate of 0x11345c?)

// $113486: Game Victorious Flag (Possible Puzzle Exception)
//          Set to 1 when the player completes a goal. Check this with 0x115834 to ensure a pass.
//          Note that Puzle Mode also requires 0x11345c to be 0 in order to show it's not a reset.
function VictoryJingle() => byte(0x113486)
function EarnedVictoryJingle() => VictoryJingle() > prev(VictoryJingle())

// $114C89: Piece Preview [24-bit]
//          The three bytes represent the three pieces that are to be dropped. 89 is third to drop, 8a is second to drop, and 8b is current to drop.
//          0x00: Wild Card
//          0x20: Horizontal (Yellow)
//          0x21: Square (Blue)
//          0x22: Vertical (Green)
//          0x23: L (Purple)
//          0x24: Zig Zag (Navy?)
//          0x25: T (Red)
// $115834: Game End Flag
//          This is set to 1 whenever the current game is over, whether in victory or defeat.
// $11583A: Game End Flag (duplicate of 0x115834?)
// $115868: Number of Core Pieces Left (CPU or 2P)
//          This value sometimes turns to FF on winning in a VS battle.
// $115FE6: Game End Flag (duplicate of 0x115834?)
// $116586: Player 2's Life Count (Also includes CPU)
//          This starts at 3, and they lose if it hits 0.
function IsPlayer2Dead() => byte(0x116586) == 0 || byte(0x116586) == 0xFF
// $116588: Vs CPU Mode Indicator
//          Unlike the other game state flags, this one appears to be consistent for this particular mode.
function VsCpuActive() => byte(0x116588)

// $116589: Vs Preview Screen Opponent Bot
function SeenVsOpponent() => byte(0x116589)

// $1BF94C: Game State Potential?
//          0x00 = Single Player Menu Selection (Also Puzzle)
//          0x01 = Main Menus
//          0x0f = Title Screen
//          0x14 = Hide & Seek (All Modes)
//          0x16 = Demo
//          0x1b = Rescue Mode
//          0x02 = Practice Menu
//          0x25 = Practice -> Game
//          0x27 = Time Trial Pause
//          0x70 = Time Trial Main
//          0x97 = Hide & Seek Initial Cutscene
//          0xff = Cutscenes, Level Select
function GameStateA() => byte(0x1BF94C)
function OnDemo() => GameStateA() == 0x16
function OnInitialMenu() => GameStateA() == 1
function InRescueMode() => GameStateA() == 0x1b
function InHideAndSeek() => GameStateA() == 0x14
function NotOnHideAndSeek() => GameStateA() != 0x14

// $1C0420: Alternate Game State Flags [16-bit]
//          0x0000 = Single Player Menu
//          0x00ff = Training (Puzzle)
//          0xff01 = Menus
//          0xff07 = Demo
//          0xff0e = Rescue
//          0x0f0f = Title
//          0xff14 = Hide & Seek (All Modes)
//          0x15 = Lines
//          0xff37 = Time Trial
//          0xff39 = Practice Game
//          0x3b = Vs CPU: 1st Opponent Defeated
//          0x4a53 = Controls
//          0xff75 = Hide & Seek Cutscene
//          0xfea4 = Loading
//          0xffba = Training (Basic and Advanced)
//          0xf5c3 = Puzzle
//          0xd2 = Vs CPU (1st opponent)
//          0xdb = Vs CPU (2nd opponent)
//          0xce = Vs CPU (3rd opponent)
//          0xffff = Practice Menu
function GameStateB() => byte(0x1C0420)
function OutOfDemo() => GameStateB() != 7
function InPuzzleMode() => GameStateB() == 195
function InLinesMode() => GameStateB() == 0x15
function OutOfPuzzleMode() => GameStateB() != 195

// Hopefully this holds up.
function OnMainMenu() => GameStateA() == 1 && GameStateB() == 1

// $1E412B: Mis-drop Pulse Effect?
//          This appears to be set to non 0 whenever a mis-drop occurs. After one miss, it settles to 1. After two, it settles to 5.
// $246000: Graphical Calculations on Sphere Move [14656 bytes]
//          Every time you move the sphere, these numbers get updated untilt hey settle down. The numbers seem consistent based on the coordinates.
// $254000: Mirror of 0x246000? [14656 bytes]
//          Eerie coincidence if it is. Could potentially be used for VS Battles too.
// $262B00: Possible Location of Raw Sphere Data? [27040 bytes]
//          This area REALLY needs more testing.
// $26949F: End of Suspected Raw Sphere Data.

function NotCheating() => disable_when(LevelSelectActive(), until=(AllSaveFilesErased() && LevelSelectOff()))

BotNameLookup = {
    0: "Rocket",
    1: "Gear",
    2: "Gyro",
    3: "Stomp",
    4: "Wheels",
    5: "Turbine",
    6: "Jak",
}

TextLookup = {
    0: "",
    0x20: " ",
    0x22: "_",
    0x26: "+",
    0x28: "=",
    0x30: "0",
    0x31: "1",
    0x32: "2",
    0x33: "3",
    0x34: "4",
    0x35: "5",
    0x36: "6",
    0x37: "7",
    0x38: "8",
    0x39: "9",
    0x41: "A",
    0x42: "B",
    0x43: "C",
    0x44: "D",
    0x45: "E",
    0x46: "F",
    0x47: "G",
    0x48: "H",
    0x49: "I",
    0x4A: "J",
    0x4B: "K",
    0x4C: "L",
    0x4D: "M",
    0x4E: "N",
    0x4F: "O",
    0x50: "P",
    0x51: "Q",
    0x52: "R",
    0x53: "S",
    0x54: "T",
    0x55: "U",
    0x56: "V",
    0x57: "W",
    0x58: "X",
    0x59: "Y",
    0x5A: "Z",
    0x5C: "#",
}

HSLateLookup = {
    0x00: "1:1 (Drill)",
    0x01: "1:2 (Unique)",
    0x02: "1:3 (Shift)",
    0x03: "1:4 (Tower)",
    0x04: "1:5 (Hide & Seek)",
    0x05: "2:1 (Drill)",
    0x06: "2:2 (Connect)",
    0x07: "2:3 (Brick)",
    0x08: "2:4 (Crystal Tower)",
    0x09: "2:5 (Hide & Seek)",
    0x0a: "3:1 (Drill)",
    0x0b: "3:2 (Unique)",
    0x0c: "3:3 (Shift)",
    0x0d: "3:4 (Tower)",
    0x0e: "3:5 (Hide & Seek)",
    0x0f: "4:1 (Drill)",
    0x10: "4:2 (Connect)",
    0x11: "4:3 (Brick)",
    0x12: "4:4 (Crystal Tower)",
    0x13: "4:5 (Hide & Seek)",
    0x14: "5:1 (Drill)",
    0x15: "5:2 (Unique)",
    0x16: "5:3 (Shift)",
    0x17: "5:4 (Towre)",
    0x18: "5:5 (Hide & Seek)",
    0x19: "6:1 (Drill)",
    0x1a: "6:2 (Connect)",
    0x1b: "6:3 (Brick)",
    0x1c: "6:4 (Crystal Tower)",
    0x1d: "6:5 (Hide & Seek)",
}

// Reusable code for puzzle mode session cheevos.
function TriggerPuzzleMode(startLevel) {
    outsideRange = CurrentLevelUi() < startLevel || CurrentLevelUi() > startLevel + 9
    if (startLevel == 1) {
        outsideRange = CurrentLevelUi() > startLevel + 9
    }
    else if (startLevel == 91) {
        outsideRange = CurrentLevelUi() < startLevel
    }
    return NotCheating() && never(OutOfPuzzleMode()) && once(CurrentLevelUi() == startLevel) && never(outsideRange) && repeated(10, PuzzleVictoryJingle())
}

function CreatePuzzleAchievement(title, startLevel, points) {
    achievement(
        title = title,
        description = "In one session, complete levels " + startLevel + "-" + (startLevel + 9) + " of Puzzle Mode.",
        points = points,
        trigger = TriggerPuzzleMode(startLevel)
    )
}

CreatePuzzleAchievement("Professor E. Gadd", 1, 5)
CreatePuzzleAchievement("Phoenix Wright", 11, 5)
CreatePuzzleAchievement("Mordin Solus", 21, 10)
CreatePuzzleAchievement("Dr. Thomas Light", 31, 10)
CreatePuzzleAchievement("Deckard Cain", 41, 10)
CreatePuzzleAchievement("Miles \"Tails\" Prower", 51, 10)
CreatePuzzleAchievement("Bentley Wiseturtle", 61, 25)
CreatePuzzleAchievement("Charles Xavier", 71, 25)
CreatePuzzleAchievement("Bruce Wayne", 81, 25)
CreatePuzzleAchievement("Professor Layton", 91, 25)

function VsModeTally(target) {
    coreTarget = Player1CorePiecesLeft() == 0 || Player1CorePiecesLeft() > 128
    lifeTarget = !IsPlayer1Dead() && IsPlayer2Dead()
    return tally(target, coreTarget && EarnedVictoryJingle(), lifeTarget && EarnedVictoryJingle())
}

// Reusable code for Vs. CPU session cheevos.
function TriggerVsMode(episodeNumber) {
    coreTarget = Player1CorePiecesLeft() == 0 || Player1CorePiecesLeft() > 128
    lifeTarget = !IsPlayer1Dead() && IsPlayer2Dead()
    return NotCheating() && never(VsCpuActive() == 0) && !OnDemo() && never(EpisodeMenuSelection() != episodeNumber) &&
      once(SelectedVsCpu() && SeenVsOpponent() == 0 && CurrentLevelUi() == 1) &&
      // Verify the win condition. Concerned about ties or close calls.
      measured(VsModeTally(7))
}

function CreateVsModeAchievement(title, episode, points) {
    achievement(
        title = title,
        description = "Complete Episode " + (episode + 1) + " of Vs. Mode.",
        points = points,
        trigger = TriggerVsMode(episode)
    )
}

CreateVsModeAchievement("Dr. Fill", 0, 10)
CreateVsModeAchievement("DeepMind", 1, 10)
CreateVsModeAchievement("Deep Blue", 2, 25)
CreateVsModeAchievement("AlphaGo", 3, 50)
CreateVsModeAchievement("Watson", 4, 50)

// Reusable code for Lines Mode
function TriggerLinesMode(episodeNumber) {
    return NotCheating() && never(OnInitialMenu()) && 
      once(InLinesMode() && EpisodeMenuSelection() == episodeNumber && CurrentLevelUi() == 1) && measured(repeated(10, EarnedVictoryJingle()))
}

function CreateLinesModeAchievement(title, episode, points) {
    achievement(
        title = title,
        description = "In one session, complete Episode " + (episode + 1) + " of Lines Mode.",
        points = points,
        trigger = TriggerLinesMode(episode)
    )
}

CreateLinesModeAchievement("Vertical Lines", 0, 10)
CreateLinesModeAchievement("Horizontal Lines", 1, 10)
CreateLinesModeAchievement("Diagonal Lines", 2, 25)
CreateLinesModeAchievement("Zig-Zag Lines", 3, 50)
CreateLinesModeAchievement("Curved Lines", 4, 50)

// Reusable function for Rescue Mode.
function TriggerRescueMode(episodeNumber) {
    return NotCheating() && never(OnInitialMenu()) && 
      once(InRescueMode() && EpisodeMenuSelection() == episodeNumber && CurrentLevelUi() == 1) && measured(repeated(10, EarnedVictoryJingle()))
}

function CreateRescueModeAchievement(title, episode, points) {
    achievement(
        title = title,
        description = "In one session, complete Episode " + (episode + 1) + " of Rescue Mode.",
        points = points,
        trigger = TriggerRescueMode(episode)
    )
}

CreateRescueModeAchievement("Janesville, PA", 0, 5)
CreateRescueModeAchievement("Quecreek Mine", 1, 5)
CreateRescueModeAchievement("Moko and the Whales", 2, 10)
CreateRescueModeAchievement("Copiapo", 3, 10)
CreateRescueModeAchievement("Hudson Miracle", 4, 10)
CreateRescueModeAchievement("SS Andrea Doria", 5, 25)
CreateRescueModeAchievement("Thailand Soccer", 6, 25)
CreateRescueModeAchievement("SS Pendleton", 7, 25)
CreateRescueModeAchievement("Ingrid Betancourt", 8, 50)
CreateRescueModeAchievement("Apollo 13", 9, 50)

// Reusable function for Hide & Seek Mode.
function TriggerHideAndSeek(episodeNumber) {
    return NotCheating() && never(OnInitialMenu()) && 
      once(InHideAndSeek() && EpisodeMenuSelection() == episodeNumber && CurrentLevelUi() == 1) && measured(EpisodeMenuSelection() == episodeNumber && repeated(30, EarnedVictoryJingle()))
}

function CreateHideAndSeekAchievement(title, episode, points) {
    achievement(
        title = title,
        points = points,
        description = "In one session, complete Episode " + (episode + 1) + " of Hide & Seek.",
        trigger = TriggerHideAndSeek(episode)
    )
}

CreateHideAndSeekAchievement("Sardines", 0, 10)
CreateHideAndSeekAchievement("Secret Wave", 1, 10)
CreateHideAndSeekAchievement("Blocko", 2, 25)
CreateHideAndSeekAchievement("Kick the Can", 3, 50)
CreateHideAndSeekAchievement("Hide the Teddy", 4, 50)

achievement(
    title = "One-Hit Wonder", description = "Clear Practice Mode in ONE piece drop.", points = 5,
    id = 196554, badge = "228089", published = "2/6/2022 7:31:02 PM", modified = "3/19/2022 6:37:14 PM",
    trigger = NotCheating() && disable_when(repeated(2,
               Player1PressedA() > prev(Player1PressedA())), until=GameStateA() != 37) && once(once(Player1PressedA() >
               prev(Player1PressedA())) && VictoryJingle() == 1 && never(GameStateA() != 37))
)

achievement(
    title = "And Now, Your Moment of Zen", description = "Clear Practice Mode with all shapes, 5 layers, and 99 core pieces to remove.", points = 10,
    id = 196555, badge = "228090", published = "2/6/2022 7:31:03 PM", modified = "3/27/2022 2:32:07 AM",
    trigger = NotCheating() && PracticeModeLayerCount() == 5 && 
              PracticeModeCoreCount() == 99 && (PracticeModePieceL() + PracticeModePieceI() + PracticeModePieceLine() + PracticeModePieceSquare() +
               PracticeModePieceT() + PracticeModePieceZ()) == 6 && EarnedVictoryJingle()
)

achievement(
    title = "Max Multiplier", description = "Get a 20x multiplier. No demo mode allowed.", points = 25,
    id = 196556, badge = "228091", published = "2/6/2022 7:31:03 PM", modified = "3/19/2022 6:37:15 PM",
    trigger = NotCheating() && OutOfDemo() && Player1GravityComboLimit() == 9 && Player1FuseComboLimit() == 10
)

achievement(
    title = "A Spherical Wizard", description = "Unleash the most powerful magic available against the sphere.", points = 10,
    id = 196553, badge = "228088", published = "2/6/2022 7:31:02 PM", modified = "3/27/2022 10:03:18 PM",
    trigger = NotCheating() && (once(Player1MagicSlot() == 5))
               && prior(Player1MagicSlot()) == 5 && Player1MagicSlot() == 255 && Player1PressedCDown() == 1
)

// Leaderboards Below

// Common functionality for Rescue Score Attack leaderboards.
function RescueScoreLeaderboard(lid, episode, desc) {
    
    leaderboard(
        id = lid, title = "Rescue Episode " + episode + " Score Attack", description = desc,
        start = NotCheating() && (GameStateA() == 27 && EpisodeMenuSelection() == 0 && CurrentLevelUi() == 1),
        cancel = OnInitialMenu() || EpisodeMenuSelection() >= episode,
        submit = repeated(episode * 10, EarnedVictoryJingle()) && never(OnInitialMenu()),
        value = measured((CurrentScoreUi() * 10 + 0)),
        format = "VALUE"
    )
}

RescueScoreLeaderboard(30316, 1, "Get the highest score you can completing Episode 1 of Rescue.")
RescueScoreLeaderboard(30318, 5, "Get the highest score you can completing the first 5 episodes of Rescue.")
RescueScoreLeaderboard(30320, 8, "Get the highest score you can completing the first 8 episodes of Rescue.")
RescueScoreLeaderboard(30322, 10, "Get the highest score you can completing all 10 episodes of Rescue.")

function RescueTimeLeaderboard(lid, episode, desc) {
    leaderboard(
        id = lid, title = "Rescue Episode " + episode + " Time Attack", description = desc,
        start  = NotCheating() && (GameStateA() == 27 && EpisodeMenuSelection() == 0 && CurrentLevelUi() == 1),
        cancel = OnInitialMenu() || EpisodeMenuSelection() >= episode,
        submit = repeated(episode * 10, EarnedVictoryJingle()) && never(OnInitialMenu()),
        value = measured(always_true()),
        lower_is_better = true,
        format = "FRAMES"
    )
}

RescueTimeLeaderboard(30317, 1, "Get the fastest time you can completing Episode 1 of Rescue.")
RescueTimeLeaderboard(30319, 5, "Get the fastest time you can completing the first 5 episodes of Rescue.")
RescueTimeLeaderboard(30321, 8, "Get the fastest time you can completing the first 8 episodes of Rescue.")
RescueTimeLeaderboard(30323, 10, "Get the fastest time you can completing all 10 episodes of Rescue.")

function HideAndSeekScoreLeaderboard(lid, episode, desc) {
    leaderboard(
        id = lid, title = "Hide & Seek Episode " + episode + " Score Attack", description = desc,
        start  = NotCheating() && (GameStateA() == 20 && EpisodeMenuSelection() == 0 && CurrentLevelUi() == 1),
        cancel = OnInitialMenu() || EpisodeMenuSelection() >= episode,
        submit = repeated(episode * 30, EarnedVictoryJingle()) && never(OnInitialMenu()),
        value = measured((CurrentScoreUi() * 10 + 0)),
        format = "VALUE"
    )
}

HideAndSeekScoreLeaderboard(30324, 1, "Get the highest score you can completing Episode 1 of Hide & Seek.")
HideAndSeekScoreLeaderboard(30326, 3, "Get the highest score you can completing the first 3 episodes of Hide & Seek.")
HideAndSeekScoreLeaderboard(30328, 5, "Get the highest score you can completing all 5 episodes of Hide & Seek.")

function HideAndSeekTimeLeaderboard(lid, episode, desc) {
    leaderboard(
        id = lid, title = "Hide & Seek Episode " + episode + " Time Attack", description = desc,
        start  = NotCheating() && (GameStateA() == 20 && EpisodeMenuSelection() == 0 && CurrentLevelUi() == 1),
        cancel = OnInitialMenu() || EpisodeMenuSelection() >= episode,
        submit = repeated(episode * 30, EarnedVictoryJingle()) && never(OnInitialMenu()),
        value = measured(always_true()),
        lower_is_better = true,
        format = "FRAMES"
    )
}

HideAndSeekTimeLeaderboard(30325, 1, "Get the fastest time you can completing Episode 1 of Hide & Seek.")
HideAndSeekTimeLeaderboard(30327, 3, "Get the fastest time you can completing the first 3 episodes of Hide & Seek.")
HideAndSeekTimeLeaderboard(30329, 5, "Get the fastest time you can completing all 5 episodes of Hide & Seek.")

leaderboard(
    id = 30330, title = "Puzzle Mode Time Attack",
    description = "Get the fastest time you can completing all 100 levels of Puzzle Mode.",
    start  = NotCheating() && (InPuzzleMode() &&
              CurrentLevelUi() == 1),
    cancel = OutOfPuzzleMode(),
    submit = repeated(100, EarnedVictoryJingle() && PuzzleModeReset() == 0 && never(OutOfPuzzleMode())),
    value = measured(always_true()),
    format = "FRAMES"
)

function VsCpuTimeLeaderboard(lid, episode, desc) {
    leaderboard(
        id = lid, title = "Vs. CPU Episode " + episode + " Time Attack", description = desc,
        start = NotCheating() && never(VsCpuActive() == 0) && !OnDemo() && once(SelectedVsCpu() && SeenVsOpponent() == 0 && EpisodeMenuSelection() == 0 && CurrentLevelUi() == 1),
        cancel = OnMainMenu() || EpisodeMenuSelection() >= episode,
        submit = never(OnMainMenu()) && VsModeTally(episode * 7),
        value = measured(always_true()),
        lower_is_better = true,
        format = "FRAMES"
    )
}

VsCpuTimeLeaderboard(30331, 1, "Get the fastest time you can on Episode 1 of Vs. CPU.")
VsCpuTimeLeaderboard(30332, 3, "Get the fastest time you can on Episodes 1-3 of Vs. CPU.")
VsCpuTimeLeaderboard(30333, 5, "Get the fastest time you can on Episodes 1-5 of Vs. CPU.")

leaderboard(
    id = 30334, title = "Time Trial Score Attack",
    description = "Get the highest score you can after 5 minutes of Time Trial.",
    start  = NotCheating() && (GameStateA() == 112 &&
              EpisodeMenuSelection() == 0 && CurrentLevelUi() == 1),
    cancel = GameStateA() != 112,
    submit = TimeTrialStatus() == 16,
    value = measured((dword(0x112D18) * 10 + 0)),
    format = "SCORE"
)

function LinesScoreLeaderboard(lid, episode, desc) {
    leaderboard(
        id = lid, title = "Lines Episode " + episode + " Score Attack", description = desc,
        start  = NotCheating() && (GameStateB() == 21 && EpisodeMenuSelection() == 0 && CurrentLevelUi() == 1),
        cancel = OnInitialMenu() || EpisodeMenuSelection() >= episode,
        submit = repeated(episode * 10, EarnedVictoryJingle()) && never(OnInitialMenu()),
        value = measured((CurrentScoreUi() * 10 + 0)),
        format = "VALUE"
    )
}

LinesScoreLeaderboard(30335, 1, "Get the highest score you can completing Episode 1 of Lines.")
LinesScoreLeaderboard(30337, 3, "Get the highest score you can completing Episodes 1-3 of Lines.")
LinesScoreLeaderboard(30339, 5, "Get the highest score you can completing Episodes 1-5 of Lines.")

function LinesTimeLeaderboard(lid, episode, desc) {
    leaderboard(
        id = lid, title = "Lines Episode " + episode + " Time Attack", description = desc,
        start  = NotCheating() && (GameStateB() == 21 && EpisodeMenuSelection() == 0 && CurrentLevelUi() == 1),
        cancel = OnInitialMenu() || EpisodeMenuSelection() >= episode,
        submit = repeated(10, EarnedVictoryJingle()) && never(OnInitialMenu()),
        value = measured(always_true()),
        lower_is_better = true,
        format = "FRAMES"
    )
}

LinesTimeLeaderboard(30336, 1, "Get the fastest time you can completing Episode 1 of Lines.")
LinesTimeLeaderboard(30338, 3, "Get the fastest time you can completing Episode 1-3 of Lines.")
LinesTimeLeaderboard(30340, 5, "Get the fastest time you can completing Episode 1-5 of Lines.")

// Rich Presence Below

rich_presence_conditional_display(byte(0x1C0420) == 0x00, "{0}{1}{2}{3}{4}{5}{6}{7} 🤖 {8} Selecting a Mode",
    rich_presence_lookup("Text", byte(0x0E13CB), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CA), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C9), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C8), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CF), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CE), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CD), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CC), TextLookup),
    rich_presence_lookup("BotName", byte(0x0E07D7), BotNameLookup)
)

rich_presence_conditional_display(byte(0x1BF94C) == 0x02, "{0}{1}{2}{3}{4}{5}{6}{7} 🤖 {8} Preparing for Practice",
    rich_presence_lookup("Text", byte(0x0E13CB), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CA), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C9), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C8), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CF), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CE), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CD), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CC), TextLookup),
    rich_presence_lookup("BotName", byte(0x0E07D7), BotNameLookup)
)

rich_presence_conditional_display(byte(0x1BF94C) == 0x25, "{0}{1}{2}{3}{4}{5}{6}{7} 🤖 {8} In Practice - Score: {9} Pieces: {10}{11}{12}{13}{14}{15} 🧱: {16} Core Pieces: {17}",
    rich_presence_lookup("Text", byte(0x0E13CB), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CA), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C9), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C8), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CF), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CE), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CD), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CC), TextLookup),
    rich_presence_lookup("BotName", byte(0x0E07D7), BotNameLookup),
    rich_presence_value("Number", dword(0x0E241C) * 10),
    rich_presence_lookup("TrainingSquare", byte(0x0E0893), TrainingSquareLookup),
    rich_presence_lookup("TrainingHori", byte(0x0E0891), TrainingHoriLookup),
    rich_presence_lookup("TrainingVert", byte(0x0E0892), TrainingVertLookup),
    rich_presence_lookup("TrainingL", byte(0x0E0890), TrainingLLookup),
    rich_presence_lookup("TrainingZig", byte(0x0E0897), TrainingZigLookup),
    rich_presence_lookup("TrainingT", byte(0x0E0896), TrainingTLookup),
    rich_presence_value("Number", byte(0x0E089B)),
    rich_presence_value("Number", byte(0x0E089E))
)

rich_presence_conditional_display(byte(0x1C0420) == 0x0E, "{0}{1}{2}{3}{4}{5}{6}{7} 🤖 {8} In Rescue Mode Level {9}:{10} - Score: {11}",
    rich_presence_lookup("Text", byte(0x0E13CB), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CA), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C9), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C8), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CF), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CE), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CD), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CC), TextLookup),
    rich_presence_lookup("BotName", byte(0x0E07D7), BotNameLookup),
    rich_presence_value("Number", EpisodeMenuRp()),
    rich_presence_value("Number", byte(0x0E449A) + 1),
    rich_presence_value("Number", dword(0x0E241C) * 10)
)

rich_presence_conditional_display(byte(0x1C0420) == 0x14 && EpisodeMenuSelection() <= 0x02, "{0}{1}{2}{3}{4}{5}{6}{7} 🤖 {8} In Hide & Seek Mode Episode {9} Level {10} - Score: {11}",
    rich_presence_lookup("Text", byte(0x0E13CB), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CA), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C9), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C8), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CF), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CE), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CD), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CC), TextLookup),
    rich_presence_lookup("BotName", byte(0x0E07D7), BotNameLookup),
    rich_presence_value("Number", EpisodeMenuRp()),
    rich_presence_lookup("HSEarly", byte(0x0E449A), HSEarlyLookup),
    rich_presence_value("Number", dword(0x0E241C) * 10)
)

rich_presence_conditional_display(byte(0x1C0420) == 0x14 && EpisodeMenuSelection() >= 0x03, "{0}{1}{2}{3}{4}{5}{6}{7} 🤖 {8} In Hide & Seek Mode Episode {9} Level {10} - Score: {11}",
    rich_presence_lookup("Text", byte(0x0E13CB), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CA), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C9), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C8), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CF), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CE), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CD), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CC), TextLookup),
    rich_presence_lookup("BotName", byte(0x0E07D7), BotNameLookup),
    rich_presence_value("Number", EpisodeMenuRp()),
    rich_presence_lookup("HSLate", byte(0x0E449A), HSLateLookup),
    rich_presence_value("Number", dword(0x0E241C) * 10)
)

rich_presence_conditional_display(byte(0x1C0420) == 0xC3, "{0}{1}{2}{3}{4}{5}{6}{7} 🤖 {8} In Puzzle Mode Level {9}",
    rich_presence_lookup("Text", byte(0x0E13CB), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CA), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C9), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C8), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CF), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CE), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CD), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CC), TextLookup),
    rich_presence_lookup("BotName", byte(0x0E07D7), BotNameLookup),
    rich_presence_value("Number", byte(0x0E449E))
)

rich_presence_conditional_display(byte(0x1C0420) == 0x37 && byte(0x0E1050) == 0x70, "{0}{1}{2}{3}{4}{5}{6}{7} 🤖 {8} In Time Trial Mode Level {9}",
    rich_presence_lookup("Text", byte(0x0E13CB), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CA), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C9), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C8), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CF), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CE), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CD), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CC), TextLookup),
    rich_presence_lookup("BotName", byte(0x0E07D7), BotNameLookup),
    rich_presence_value("Number", byte(0x0E449A) + 1)
)

rich_presence_conditional_display(byte(0x1C0420) == 0x37 && byte(0x0E1050) == 0x10, "{0}{1}{2}{3}{4}{5}{6}{7} 🤖 {8} Reviewing the Time Trial Results",
    rich_presence_lookup("Text", byte(0x0E13CB), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CA), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C9), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C8), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CF), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CE), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CD), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CC), TextLookup),
    rich_presence_lookup("BotName", byte(0x0E07D7), BotNameLookup)
)

rich_presence_conditional_display(byte(0x0E0756) == 0x00 && byte(0x0E0754) == 0x04 && byte(0x116588) == 0x01, "{0}{1}{2}{3}{4}{5}{6}{7} 🤖 {8} VS CPU 🤖 {9} Level {10}:{11}",
    rich_presence_lookup("Text", byte(0x0E13CB), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CA), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C9), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C8), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CF), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CE), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CD), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CC), TextLookup),
    rich_presence_lookup("BotName", byte(0x0E07D7), BotNameLookup),
    rich_presence_lookup("BotName", byte(0x116589), BotNameLookup),
    rich_presence_value("Number", EpisodeMenuRp()),
    rich_presence_value("Number", byte(0x0E449A) + 1)
)

rich_presence_conditional_display(byte(0x1C0420) == 0x15, "{0}{1}{2}{3}{4}{5}{6}{7} 🤖 {8} In Lines Mode Level {9}:{10} - Score: {11}",
    rich_presence_lookup("Text", byte(0x0E13CB), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CA), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C9), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C8), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CF), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CE), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CD), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CC), TextLookup),
    rich_presence_lookup("BotName", byte(0x0E07D7), BotNameLookup),
    rich_presence_value("Number", EpisodeMenuRp()),
    rich_presence_value("Number", byte(0x0E449A) + 1),
    rich_presence_value("Number", dword(0x0E241C) * 10)
)

rich_presence_conditional_display(byte(0x1C0420) == 0x75, "{0}{1}{2}{3}{4}{5}{6}{7} 🤖 {8} Watching a Cutscene",
    rich_presence_lookup("Text", byte(0x0E13CB), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CA), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C9), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C8), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CF), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CE), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CD), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CC), TextLookup),
    rich_presence_lookup("BotName", byte(0x0E07D7), BotNameLookup)
)

rich_presence_display("{0}{1}{2}{3}{4}{5}{6}{7} 🤖 {8} Navigating the Menus",
    rich_presence_lookup("Text", byte(0x0E13CB), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CA), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C9), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13C8), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CF), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CE), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CD), TextLookup),
    rich_presence_lookup("Text", byte(0x0E13CC), TextLookup),
    rich_presence_lookup("BotName", byte(0x0E07D7), BotNameLookup)
)
