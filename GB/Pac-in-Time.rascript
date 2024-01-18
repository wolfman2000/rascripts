// Pac-in-Time
// #ID = 4589

// $C100: Main Menu: Which Option?
//        0x8d: New Game
//        0x95: Password
//        Mainly bits 3 vs 4 here.
// $D52A: Camera Y-Position [16-bit]
// $D530: Camera X-Position [16-bit]
// $D5E4: stage value
// $D5E5: area value
// $D5E6: 01 - Stage finished
// $D5FB: timer
// $D5FC: Frame Counter for Stage Timer [8-bit]: Loop back to decrement 0xd5fb by one.
//        Continue Timer
// $D5FD: Lives
//        0 Counts as a life. A different variable determines if we've lost a life and are going through a death animation.
// $D600: Item selected
//        00 - Gun
//        01 - Hammer
//        02 - Spring
//        03 - Bubbles
// $D60C: Pac-Man died (set bit7)
// $D680: Fireball Enabled?
//        0x00: Off
//        0xff: On
// $D681: Hammer Enabled?
//        0x00: Off
//        0xff: On
// $D682: Grapple Enabled?
//        0x00: Off
//        0xff: On
// $D683: Bubbles Enabled?
//        0x00: Off
//        0xff: On
// $D6C2: Password Entry [5 bytes]
//        Consonant Letters only, but not all are included.
// $D6CD: number of pellets collected
// $D840: Backup State: Playing the Level?
//        0x00: Playing
//        0x02: Either dying OR finishing a level.
// $D944: 00 - In game

// Variables
StageId = byte(0xd5e4)
AreaId = byte(0xd5e5)
StageBeaten = byte(0xd5e6) - 1 == prev(byte(0xd5e6))
TimerSeconds = byte(0xd5fb)
TimerFrames = byte(0xd5fc)
Lives = byte(0xd5fd)

DeathAnimation = bit7(0xd60c)
PacDiedAnimation = DeathAnimation == 1

ItemLookup = {
    0x00: "Gun",
    0x01: "Hammer",
    0x02: "Spring",
    0x03: "Bubbles",
}

achievement(
    title = "Beat Stage 1-5", description = "Beat Stage 1-5", points = 10,
    trigger = AreaId == 0x00 && StageId == 0x04 && StageBeaten
)

achievement(
    title = "Beat Area 1", description = "Beat Area 1", points = 10,
    trigger = AreaId == 0x00 && StageId == 0x09 && StageBeaten
)

achievement(
    title = "Beat Stage 2-5", description = "Beat Stage 2-5", points = 10,
    trigger = AreaId == 0x01 && StageId == 0x04 && StageBeaten
)

achievement(
    title = "Beat Area 2", description = "Beat Area 2", points = 10,
    trigger = AreaId == 0x01 && StageId == 0x09 && StageBeaten
)

achievement(
    title = "Beat Stage 3-5", description = "Beat Stage 3-5", points = 10,
    trigger = AreaId == 0x02 && StageId == 0x04 && StageBeaten
)

achievement(
    title = "Beat Area 3", description = "Beat Area 3", points = 10,
    trigger = AreaId == 0x02 && StageId == 0x09 && StageBeaten
)

achievement(
    title = "Beat Stage 4-5", description = "Beat Stage 4-5", points = 10,
    trigger = AreaId == 0x03 && StageId == 0x04 && StageBeaten
)

achievement(
    title = "Beat Area 4", description = "Beat Area 4", points = 10,
    trigger = AreaId == 0x03 && StageId == 0x09 && StageBeaten
)

achievement(
    title = "Beat Stage 5-5", description = "Beat Stage 5-5", points = 10,
    trigger = AreaId == 0x04 && StageId == 0x04 && StageBeaten
)

achievement(
    title = "Beat Area 5", description = "Beat Area 5", points = 10,
    trigger = AreaId == 0x04 && StageId == 0x09 && StageBeaten
)

achievement(
    title = "Beat Stage 6-5", description = "Beat Stage 6-5", points = 10,
    trigger = AreaId == 0x05 && StageId == 0x04 && StageBeaten
)

achievement(
    title = "Beat Area 6", description = "Beat Area 6", points = 10,
    trigger = AreaId == 0x05 && StageId == 0x09 && StageBeaten
)

achievement(
    title = "Beat Stage 7-5", description = "Beat Stage 7-5", points = 10,
    trigger = AreaId == 0x06 && StageId == 0x04 && StageBeaten
)

achievement(
    title = "Beat The Game", description = "Beat The Game", points = 10,
    trigger = AreaId == 0x06 && StageId == 0x09 && repeated(2, StageBeaten)
)

SurvivorPoints = [
    10,
    10,
    10,
    25,
    25,
    25,
    50
]

SurvivorInitialTimer = [
    0x4b,
    0x63,
    0x63,
    0x63,
    0x4f,
    0x63,
    0x63
]

function SurvivorCheevo(areaId) {
    points = SurvivorPoints[areaId]
    time = SurvivorInitialTimer[areaId]
    
    achievement(
        title = format("Survivor of Area {0}", areaId + 1),
        description = format(
            "Beat all ten stages of Area {0} in a row without taking a death in between.",
            areaId + 1
        ),
        points = points,
        trigger = once(StageId == 0 && TimerSeconds == time) && never(AreaId != areaId) &&
        never(PacDiedAnimation) && trigger_when((StageId == 9 && StageBeaten))
    )
}

for i in range(0, 6, 1) {
    SurvivorCheevo(i)
}

achievement(
    title = "Satiated in Area 1 Part 1",
    description = "Beat the first five stages in Area 1 with all dots eaten.", points = 0,
    trigger = never(AreaId != 0x00) && never((StageId == 0x00 && Lives == 0x05 && TimerSeconds
               == 0x4B)) && tally(14, 
                  (StageId == 0x00 && (byte(0x00D6CD) - prev(byte(0x00D6CD))) == 0x02), 
                  (StageId == 0x00 && (byte(0x00D6CD) - prev(byte(0x00D6CD))) == 0xFFFFFF9E), 
              StageId == 0x00 && byte(0x00D6CD) != prev(byte(0x00D6CD)) &&
               never(StageId == 0x00 && PacDiedAnimation)) && 
              once(StageId == 0x00 && StageBeaten) && tally(34, 
                  (StageId == 0x01 && (byte(0x00D6CD) - prev(byte(0x00D6CD))) == 0x02), 
                  (StageId == 0x01 && (byte(0x00D6CD) - prev(byte(0x00D6CD))) == 0xFFFFFF9E), 
              StageId ==
               0x01 && byte(0x00D6CD) != prev(byte(0x00D6CD)) && never(StageId == 0x01 && bit7(0x00D60C) ==
               0x01)) && 
              once(StageId == 0x01 && StageBeaten) && tally(8, 
                  (StageId == 0x02 && (byte(0x00D6CD) - prev(byte(0x00D6CD))) == 0x02), 
                  (StageId == 0x02 && (byte(0x00D6CD) - prev(byte(0x00D6CD))) == 0xFFFFFF9E), 
              StageId ==
               0x02 && byte(0x00D6CD) != prev(byte(0x00D6CD)) && never(StageId == 0x02 && bit7(0x00D60C) ==
               0x01)) && 
              once(StageId == 0x02 && StageBeaten) && tally(15, 
                  (StageId == 0x03 && (byte(0x00D6CD) - prev(byte(0x00D6CD))) == 0x02), 
                  (StageId == 0x03 && (byte(0x00D6CD) - prev(byte(0x00D6CD))) == 0xFFFFFF9E), 
              StageId ==
               0x03 && byte(0x00D6CD) != prev(byte(0x00D6CD)) && never(StageId == 0x03 && bit7(0x00D60C) ==
               0x01)) && 
              once(StageId == 0x03 && StageBeaten) && once(StageId == 0x04 &&
               StageBeaten)
)

leaderboard(
    id = 32015, title = "Best Time - Full Game",
    description = "Get the best time starting from the beginning.  Continues OK but will keep adding to the time.",
    start  = StageId == 0x00 && TimerSeconds == 0x4B,
    cancel = Lives == 0x00 && TimerSeconds == 0x3C && TimerFrames == 0x00,
    submit = AreaId == 0x06 && StageId == 0x09 && never(StageId < 0x08) &&
        repeated(2, StageBeaten),
    value = measured(TimerSeconds < prev(TimerSeconds)),
    format = "SECS", lower_is_better = true
)

rich_presence_conditional_display(byte(0x00D944) == 0x00, "🚩 {0}-{1} • 🕒 {2} • {3} Dots • Using the {4} • {5} Lives",
    rich_presence_value("Value", AreaId + 1),
    rich_presence_value("Value", StageId + 1),
    rich_presence_value("Value", TimerSeconds),
    rich_presence_value("Value", byte(0x00D6CD)),
    rich_presence_lookup("Item", byte(0x00D600), ItemLookup),
    rich_presence_value("Value", byte(0x00D5FD))
)

rich_presence_display("Getting ready to travel through time!")
