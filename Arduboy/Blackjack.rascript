// Blackjack
// #ID = 7871

// $0240: Time Since Last Transition [16-bit]
// $0242: Buttons Held This Frame
//        bit2: A (assuming XBox Controller)
//        bit3: B (assuming XBox Controller)
//        bit4: Down
//        bit5: Left
//        bit6: Right
//        bit7: Up
// $0243: Buttons Held 3 Frames Later?
//        See 0x0242 for what this contains.
// $0270: Total Bet [16-bit]
//        This factors in changes in the game such as doubling down and splitting.
// $0296: Time to Next Hand
//        After a hand is concluded, count down to either move to the next hand to be checked, or to the betting screen depending.
// $02A4: Timer to Next Hand (Possible Duplicate of 0x0296)
// $02A8: Betting Screen - Which Option?
//        0x00: Bet 1
//        0x01: Bet 5
//        0x02: Bet 10
//        0x03: Bet 25
//        0x04: Play the Hand
//        0x05: Clear the Bet
// $02DE: Total Bet [16-bit]
//        This factors in changes in the game such as doubling down and splitting.
// $02E0: Possible Initial Bet Value
//        The max possible bet is 200.
// $0AE1: Purse (Ones Digit)
// $0AE2: Purse (Tens Digit)
// $0AE3: Purse (Hundreds Digit)

// Variables & Functions Below

VersionOffset = 0x418

SilentVersion = bit0(0x46) == 0
LoudVersion = bit0(0x46) == 1

function Offset() {
    if bit0(0x46) == 1 {
        return VersionOffset
    }
    return 0
}

// Suit order: more for RP purposes.
HeartSuit = "♥️"
DiamondSuit = "♦️"
SpadeSuit = "♠️"
ClubSuit = "♣️"

PressedA = bit6(0x002c) == 0

SelectedOption = low4(0x02a8)

Message = low4(0x0294)
MessageWelcome = Message == 0
MessageWelcomeSilence = low4(0x0294 + VersionOffset) == 0
MessageDealerBlackjack = Message == 1
MessageDealerBlackjackSilence = low4(0x0294 + VersionOffset) == 1
MessageDealerWin = Message == 2
MessageDealerWinSilence = low4(0x0294 + VersionOffset) == 2
MessagePlayerBlackjack = Message == 4
MessagePlayerBlackjackSilence = low4(0x0294 + VersionOffset) == 4
MessagePlayerWin = Message == 5
MessagePlayerWinSilence = low4(0x0294 + VersionOffset) == 5
MessagePush = Message == 6
MessagePlayerBust = Message == 7
MessagePlayerBustSilence = low4(0x294 + VersionOffset) == 7

AmountWon = word(0x29d)
AmountWonSilence = word(0x29d + VersionOffset)
AmountLost = word(0x29f)
AmountLostSilence = word(0x29f + VersionOffset)

GameState = low4(0x02e9)
GameStateSilence = low4(0x02e9 + VersionOffset)
InitialBetState = GameState == 1
InitialBetStateSilence = GameStateSilence == 1
DealingCards = GameState == 2
DealingCardsSilence = GameStateSilence == 2
Insurance = GameState == 3
InsuranceSilence = GameStateSilence == 3
DealerPeaking = GameState == 4
DealerPeakingSilence = GameStateSilence == 4
InsuranceWasted = GameState == 5
InsuranceWastedSilence = GameStateSilence == 5
SplittingHand = GameState == 6
SplittingHandSilence = GameStateSilence == 6
PlayerTurn = GameState == 8
PlayerTurnSilence = GameStateSilence == 8
DealerTurn = GameState == 9
DealerTurnSilence = GameStateSilence == 9
FinalWinner = GameState == 0x0a
FinalWinnerSilence = GameStateSilence == 0x0a
PayingOut = GameState == 0x0b
PayingOutSilence = GameStateSilence == 0x0b
Continue = GameState == 0x0c
ContinueSilence = GameStateSilence == 0x0c
PlayerBust = GameState == 0x0d
PlayerBustSilence = GameStateSilence == 0x0d

// Player's Money

PlayerPurse = word(0x0284)
PlayerPurseSilence = word(0x0284 + VersionOffset)
InitialBet = byte(0x02e0)
InitialBetSilence = byte(0x02e0 + VersionOffset)
TotalBet = word(0x02de)
TotalBetSilence = word(0x02de + VersionOffset)

// Game Result
GameResult = low4(0x029b)
GameResultSilence = low4(0x029b + VersionOffset)
PlayerWins = GameResult == 1
PlayerWinsSilence = low4(0x029b + VersionOffset) == 1
PlayerLose = GameResult == 2
PlayerLoseSilence = low4(0x029b + VersionOffset) == 2
PlayerPush = GameResult == 3
PlayerPushSilence = low4(0x029b + VersionOffset) == 3

PlayerMainCardCount = low4(0x0263)
PlayerMainCardCountSilence = low4(0x0263 + VersionOffset)
PlayerCardArrayOrigin = 0x0264

PlayerCard1 = byte(PlayerCardArrayOrigin)
PlayerCard1Silence = byte(PlayerCardArrayOrigin + VersionOffset)
PlayerCard2 = byte(PlayerCardArrayOrigin + 1)
PlayerCard2Silence = byte(PlayerCardArrayOrigin + 1 + VersionOffset)

PlayerCard1H = PlayerCard1 != 0 && PlayerCard1 != 13 && PlayerCard1 != 26 && PlayerCard1 != 39
PlayerCard1A = PlayerCard1 == 0 || PlayerCard1 == 13 || PlayerCard1 == 26 || PlayerCard1 == 39
PlayerCard12 = PlayerCard1 == 1 || PlayerCard1 == 14 || PlayerCard1 == 27 || PlayerCard1 == 40
PlayerCard13 = PlayerCard1 == 2 || PlayerCard1 == 15 || PlayerCard1 == 28 || PlayerCard1 == 41
PlayerCard14 = PlayerCard1 == 3 || PlayerCard1 == 16 || PlayerCard1 == 29 || PlayerCard1 == 42
PlayerCard15 = PlayerCard1 == 4 || PlayerCard1 == 17 || PlayerCard1 == 30 || PlayerCard1 == 43
PlayerCard16 = PlayerCard1 == 5 || PlayerCard1 == 18 || PlayerCard1 == 31 || PlayerCard1 == 44
PlayerCard17 = PlayerCard1 == 6 || PlayerCard1 == 19 || PlayerCard1 == 32 || PlayerCard1 == 45
PlayerCard18 = PlayerCard1 == 7 || PlayerCard1 == 20 || PlayerCard1 == 33 || PlayerCard1 == 46
PlayerCard19 = PlayerCard1 == 8 || PlayerCard1 == 21 || PlayerCard1 == 34 || PlayerCard1 == 47
PlayerCard1T = (PlayerCard1 >= 9 && PlayerCard1 <= 12) ||
    (PlayerCard1 >= 22 && PlayerCard1 <= 25) ||
    (PlayerCard1 >= 35 && PlayerCard1 <= 38) ||
    PlayerCard1 >= 48

PlayerCard1AS = PlayerCard1Silence == 0 || PlayerCard1Silence == 13 ||
    PlayerCard1Silence == 26 || PlayerCard1Silence == 39
PlayerCard1TS = (PlayerCard1Silence >= 9 && PlayerCard1Silence <= 12) ||
    (PlayerCard1Silence >= 22 && PlayerCard1Silence <= 25) ||
    (PlayerCard1Silence >= 35 && PlayerCard1Silence <= 38) ||
    PlayerCard1Silence >= 48

PlayerCard2H = PlayerCard2 != 0 && PlayerCard2 != 13 && PlayerCard2 != 26 && PlayerCard2 != 39
PlayerCard2A = PlayerCard2 == 0 || PlayerCard2 == 13 || PlayerCard2 == 26 || PlayerCard2 == 39
PlayerCard22 = PlayerCard2 == 1 || PlayerCard2 == 14 || PlayerCard2 == 27 || PlayerCard2 == 40
PlayerCard23 = PlayerCard2 == 2 || PlayerCard2 == 15 || PlayerCard2 == 28 || PlayerCard2 == 41
PlayerCard24 = PlayerCard2 == 3 || PlayerCard2 == 16 || PlayerCard2 == 29 || PlayerCard2 == 42
PlayerCard25 = PlayerCard2 == 4 || PlayerCard2 == 17 || PlayerCard2 == 30 || PlayerCard2 == 43
PlayerCard26 = PlayerCard2 == 5 || PlayerCard2 == 18 || PlayerCard2 == 31 || PlayerCard2 == 44
PlayerCard27 = PlayerCard2 == 6 || PlayerCard2 == 19 || PlayerCard2 == 32 || PlayerCard2 == 45
PlayerCard28 = PlayerCard2 == 7 || PlayerCard2 == 20 || PlayerCard2 == 33 || PlayerCard2 == 46
PlayerCard29 = PlayerCard2 == 8 || PlayerCard2 == 21 || PlayerCard2 == 34 || PlayerCard2 == 47
PlayerCard2T = (PlayerCard2 >= 9 && PlayerCard2 <= 12) ||
    (PlayerCard2 >= 22 && PlayerCard2 <= 25) ||
    (PlayerCard2 >= 35 && PlayerCard2 <= 38) ||
    PlayerCard2 >= 48

PlayerCard2AS = PlayerCard2Silence == 0 || PlayerCard2Silence == 13 ||
    PlayerCard2Silence == 26 || PlayerCard2Silence == 39
PlayerCard2TS = (PlayerCard2Silence >= 9 && PlayerCard2Silence <= 12) ||
    (PlayerCard2Silence >= 22 && PlayerCard2Silence <= 25) ||
    (PlayerCard2Silence >= 35 && PlayerCard2Silence <= 38) ||
    PlayerCard2Silence >= 48

PlayerSplitCardCount = low4(0x0275)
PlayerSplitCardCountSilence = low4(0x0275 + VersionOffset)
PlayerSplitArrayOrigin = 0x0276
PlayerSplitArrayOriginSilence = PlayerSplitArrayOrigin + VersionOffset

DealerMainCardCount = low4(0x0287)
DealerMainCardCountSilence = low4(0x0287 + VersionOffset)
DealerCardArrayOrigin = 0x0288 // This one at 0 is the hole card!
DealerCardArrayOriginSilence = DealerCardArrayOrigin + VersionOffset

DidPlayerDoubleDown = bit0(0x0261) == 1
DidPlayerDoubleDownSilence = bit0(0x0261 + VersionOffset) == 1
IsPlayerDone = bit0(0x0260) == 1
IsPlayerDoneSilence = bit0(0x0260 + VersionOffset) == 1


// General Challenge Function: useful for Cheevos.
// The first three parameters are arrays.
// The fourth is an optional one to change trigger behavior.

function Challenge(start, cancel, submit, triggerAll = false) {
    anyStart = any_of(start, s => once(s))
    allCancel = all_of(cancel, c => never(c))
    if (triggerAll == true) {
        return anyStart && allCancel && all_of(submit, s => trigger_when(s))
    }
    return anyStart && allCancel && all_of(submit, s => s)
}

// Cheevos Below


achievement(
    title = "Min-Maxing",
    id=215164,
    points = 5,
    description = "Wager the max possible and win the hand. If a split, win both!",
    trigger = (LoudVersion && InitialBet == 200 &&
    ((PlayerSplitCardCount == 0 && PlayerWins) ||
    (disable_when(PlayerLose || PlayerPush, until=InitialBetState) &&
        PlayerSplitCardCount > 0 && once(Continue)))) ||
    (SilentVersion && InitialBetSilence == 200 &&
    ((PlayerSplitCardCountSilence == 0 && PlayerWinsSilence) ||
    (disable_when(PlayerLoseSilence || PlayerPushSilence, until=InitialBetStateSilence) &&
        PlayerSplitCardCountSilence > 0 && once(ContinueSilence))))
)

cardCountStart = [
    LoudVersion && InitialBetState,
    SilentVersion && InitialBetStateSilence
]

cardCountCancel = [
    LoudVersion && prev(AmountLost) == 0 && AmountLost > 0 && (
        MessageDealerWin || MessageDealerBlackjack || MessagePlayerBust
    ),
    SilentVersion && prev(AmountLostSilence) == 0 && AmountLostSilence > 0 && (
        MessageDealerWinSilence || MessageDealerBlackjackSilence || MessagePlayerBustSilence
    ),
    LoudVersion && MessageWelcome,
    SilentVersion && MessageWelcomeSilence
]

cardCountSubmit = [
    (LoudVersion && repeated(5,
        measured(prev(AmountWon) == 0 && AmountWon > 0 && 
        (MessagePlayerWin || MessagePlayerBlackjack)))) ||
    (SilentVersion && repeated(5,
        measured(prev(AmountWonSilence) == 0 && AmountWonSilence > 0 &&
        (MessagePlayerWinSilence || MessagePlayerBlackjackSilence))))
]

achievement(
    title = "Card Counter",
    id=215165,
    points = 10,
    description = "Win five hands in a row. Pushes maintain the streak.",
    trigger = Challenge(cardCountStart, cardCountCancel, cardCountSubmit)
)

BankBrokeYou = (LoudVersion && PlayerPurse == 0 && PayingOut) ||
        (SilentVersion && PlayerPurseSilence == 0 && PayingOutSilence)
BrokeBank = (LoudVersion && PlayerPurse >= 1000 && PayingOut) ||
        (SilentVersion && PlayerPurseSilence >= 1000 && PayingOutSilence)

achievement(
    title = "You Broke The Bank",
    id=215166,
    points = 10,
    description = "Break the bank by having $1000 in your purse.",
    trigger = BrokeBank
)

achievement(
    title = "Splitting Hairs",
    id=215167,
    points = 10,
    description = "Split a hand. Win both of them.",
    trigger = (LoudVersion && never(LoudVersion && InitialBetState) &&
        PlayerSplitCardCount > 0 && once(Continue) &&
        disable_when(LoudVersion && (PlayerLose || PlayerPush), until=InitialBetState)) ||
        (SilentVersion && never(SilentVersion && InitialBetStateSilence) &&
        PlayerSplitCardCountSilence > 0 && once(ContinueSilence) &&
        disable_when(SilentVersion && (PlayerLoseSilence || PlayerPushSilence), until=InitialBetStateSilence))
)

achievement(
    title = "Robbie Rotten Is Concerned",
    id=215168,
    points = 5,
    description = "Waste a Blackjack by asking for another card.",
    trigger = (LoudVersion && ((PlayerCard1A && PlayerCard2T) ||
        (PlayerCard1T && PlayerCard2A)) &&
        prev(GameState) == 8 && PlayerMainCardCount == 3) ||
        (SilentVersion && ((PlayerCard1AS && PlayerCard2TS) ||
        (PlayerCard1TS && PlayerCard2AS)) &&
        prev(GameStateSilence) == 8 && PlayerMainCardCountSilence == 3)
)

achievement(
    title = "Are They Cheating?",
    id=215169,
    points = 10,
    description = "Stay on your initial 20 hand, and still lose to a non-Blackjack 21.",
    trigger = (LoudVersion && PlayerCard1T && PlayerCard2T &&
        FinalWinner && MessageDealerWin && prev(AmountLost) == 0 && AmountLost > 0) ||
        (SilentVersion && PlayerCard1TS && PlayerCard2TS
            && FinalWinnerSilence && MessageDealerWinSilence &&
            prev(AmountLostSilence) == 0 && AmountLostSilence > 0)
)

// Leaderboard Below



leaderboard(
    title = "Break The Bank Time Attack",
    id = 33785,
    description = "Get 1000 in your purse as fast as you can. Time ends on celebration.",
    start = (LoudVersion && DealingCards) || (SilentVersion && DealingCardsSilence),
    cancel = BankBrokeYou,
    submit = BrokeBank,
    value = always_true(),
    lower_is_better = true,
    format = "FRAMES"
)

// Rich Presence Below

CardLookup = {
    0: ("A" + HeartSuit),
    1: ("2" + HeartSuit),
    2: ("3" + HeartSuit),
    3: ("4" + HeartSuit),
    4: ("5" + HeartSuit),
    5: ("6" + HeartSuit),
    6: ("7" + HeartSuit),
    7: ("8" + HeartSuit),
    8: ("9" + HeartSuit),
    9: ("T" + HeartSuit),
    10: ("J" + HeartSuit),
    11: ("Q" + HeartSuit),
    12: ("K" + HeartSuit),
    13: ("A" + DiamondSuit),
    14: ("2" + DiamondSuit),
    15: ("3" + DiamondSuit),
    16: ("4" + DiamondSuit),
    17: ("5" + DiamondSuit),
    18: ("6" + DiamondSuit),
    19: ("7" + DiamondSuit),
    20: ("8" + DiamondSuit),
    21: ("9" + DiamondSuit),
    22: ("T" + DiamondSuit),
    23: ("J" + DiamondSuit),
    24: ("Q" + DiamondSuit),
    25: ("K" + DiamondSuit),
    26: ("A" + SpadeSuit),
    27: ("2" + SpadeSuit),
    28: ("3" + SpadeSuit),
    29: ("4" + SpadeSuit),
    30: ("5" + SpadeSuit),
    31: ("6" + SpadeSuit),
    32: ("7" + SpadeSuit),
    33: ("8" + SpadeSuit),
    34: ("9" + SpadeSuit),
    35: ("T" + SpadeSuit),
    36: ("J" + SpadeSuit),
    37: ("Q" + SpadeSuit),
    38: ("K" + SpadeSuit),
    39: ("A" + ClubSuit),
    40: ("2" + ClubSuit),
    41: ("3" + ClubSuit),
    42: ("4" + ClubSuit),
    43: ("5" + ClubSuit),
    44: ("6" + ClubSuit),
    45: ("7" + ClubSuit),
    46: ("8" + ClubSuit),
    47: ("9" + ClubSuit),
    48: ("T" + ClubSuit),
    49: ("J" + ClubSuit),
    50: ("Q" + ClubSuit),
    51: ("K" + ClubSuit),
}

RpPlayerPurse = rich_presence_macro("Number", PlayerPurse)
RpPlayerPurseS = rich_presence_macro("Number", PlayerPurseSilence)
RpInitialBet = rich_presence_macro("Number", InitialBet)
RpInitialBetS = rich_presence_macro("Number", InitialBetSilence)
RpTotalBet = rich_presence_macro("Number", TotalBet)
RpTotalBetS = rich_presence_macro("Number", TotalBetSilence)

RpPlayerCard1 = rich_presence_lookup("Card", byte(PlayerCardArrayOrigin), CardLookup)
RpPlayerCard2 = rich_presence_lookup("Card", byte(PlayerCardArrayOrigin + 1), CardLookup)
RpPlayerCard3 = rich_presence_lookup("Card", byte(PlayerCardArrayOrigin + 2), CardLookup)
RpPlayerCard4 = rich_presence_lookup("Card", byte(PlayerCardArrayOrigin + 3), CardLookup)
RpPlayerCard5 = rich_presence_lookup("Card", byte(PlayerCardArrayOrigin + 4), CardLookup)

RpSplitCard1 = rich_presence_lookup("Card", byte(PlayerSplitArrayOrigin), CardLookup)
RpSplitCard2 = rich_presence_lookup("Card", byte(PlayerSplitArrayOrigin + 1), CardLookup)
RpSplitCard3 = rich_presence_lookup("Card", byte(PlayerSplitArrayOrigin + 2), CardLookup)
RpSplitCard4 = rich_presence_lookup("Card", byte(PlayerSplitArrayOrigin + 3), CardLookup)
RpSplitCard5 = rich_presence_lookup("Card", byte(PlayerSplitArrayOrigin + 4), CardLookup)

RpDealerCard1 = rich_presence_lookup("Card", byte(DealerCardArrayOrigin), CardLookup)
RpDealerCard2 = rich_presence_lookup("Card", byte(DealerCardArrayOrigin + 1), CardLookup)
RpDealerCard3 = rich_presence_lookup("Card", byte(DealerCardArrayOrigin + 2), CardLookup)
RpDealerCard4 = rich_presence_lookup("Card", byte(DealerCardArrayOrigin + 3), CardLookup)
RpDealerCard5 = rich_presence_lookup("Card", byte(DealerCardArrayOrigin + 4), CardLookup)

RpPlayerCard1S = rich_presence_lookup("Card", byte(PlayerCardArrayOrigin + VersionOffset), CardLookup)
RpPlayerCard2S = rich_presence_lookup("Card", byte(PlayerCardArrayOrigin + VersionOffset + 1), CardLookup)
RpPlayerCard3S = rich_presence_lookup("Card", byte(PlayerCardArrayOrigin + VersionOffset + 2), CardLookup)
RpPlayerCard4S = rich_presence_lookup("Card", byte(PlayerCardArrayOrigin + VersionOffset + 3), CardLookup)
RpPlayerCard5S = rich_presence_lookup("Card", byte(PlayerCardArrayOrigin + VersionOffset + 4), CardLookup)

RpSplitCard1S = rich_presence_lookup("Card", byte(PlayerSplitArrayOrigin + VersionOffset), CardLookup)
RpSplitCard2S = rich_presence_lookup("Card", byte(PlayerSplitArrayOrigin + VersionOffset + 1), CardLookup)
RpSplitCard3S = rich_presence_lookup("Card", byte(PlayerSplitArrayOrigin + VersionOffset + 2), CardLookup)
RpSplitCard4S = rich_presence_lookup("Card", byte(PlayerSplitArrayOrigin + VersionOffset + 3), CardLookup)
RpSplitCard5S = rich_presence_lookup("Card", byte(PlayerSplitArrayOrigin + VersionOffset + 4), CardLookup)

RpDealerCard1S = rich_presence_lookup("Card", byte(DealerCardArrayOrigin + VersionOffset), CardLookup)
RpDealerCard2S = rich_presence_lookup("Card", byte(DealerCardArrayOrigin + VersionOffset + 1), CardLookup)
RpDealerCard3S = rich_presence_lookup("Card", byte(DealerCardArrayOrigin + VersionOffset + 2), CardLookup)
RpDealerCard4S = rich_presence_lookup("Card", byte(DealerCardArrayOrigin + VersionOffset + 3), CardLookup)
RpDealerCard5S = rich_presence_lookup("Card", byte(DealerCardArrayOrigin + VersionOffset + 4), CardLookup)

rich_presence_conditional_display(
    BrokeBank,
    "You Broke The Bank"
)

rich_presence_conditional_display(
    BankBrokeYou,
    "You Are Broke"
)

rich_presence_conditional_display(
    LoudVersion && (Continue || (InsuranceWasted && MessageDealerBlackjack)),
    "👛{0} On Hand: Time To Stop?",
    RpPlayerPurse
)

rich_presence_conditional_display(
    SilentVersion && (ContinueSilence || (InsuranceWastedSilence && MessageDealerBlackjackSilence)),
    "👛{0} On Hand: Time To Stop?",
    RpPlayerPurseS
)

rich_presence_conditional_display(
    LoudVersion && (Insurance || DealerPeaking || InsuranceWasted),
    "{0} on the line: {1}{2} vs Insurance",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2
)

rich_presence_conditional_display(
    SilentVersion && (InsuranceSilence || DealerPeakingSilence || InsuranceWastedSilence),
    "{0} on the line: {1}{2} vs Insurance",
    RpTotalBetS,
    RpPlayerCard1S,
    RpPlayerCard2S
)

rich_presence_conditional_display(
    LoudVersion && ((PlayerTurn || PlayerBust) && PlayerMainCardCount == 5),
    "{0} on the line: {1}{2}{3}{4}{5} vs XX{6}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpPlayerCard3,
    RpPlayerCard4,
    RpPlayerCard5,
    RpDealerCard2
)

rich_presence_conditional_display(
    SilentVersion && ((PlayerTurnSilence || PlayerBustSilence) && PlayerMainCardCountSilence == 5),
    "{0} on the line: {1}{2}{3}{4}{5} vs XX{6}",
    RpTotalBetS,
    RpPlayerCard1S,
    RpPlayerCard2S,
    RpPlayerCard3S,
    RpPlayerCard4S,
    RpPlayerCard5S,
    RpDealerCard2S
)

rich_presence_conditional_display(
    LoudVersion && ((PlayerTurn || PlayerBust) && PlayerMainCardCount == 4),
    "{0} on the line: {1}{2}{3}{4} vs XX{5}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpPlayerCard3,
    RpPlayerCard4,
    RpDealerCard2
)

rich_presence_conditional_display(
    SilentVersion && ((PlayerTurnSilence || PlayerBustSilence) && PlayerMainCardCountSilence == 4),
    "{0} on the line: {1}{2}{3}{4} vs XX{5}",
    RpTotalBetS,
    RpPlayerCard1S,
    RpPlayerCard2S,
    RpPlayerCard3S,
    RpPlayerCard4S,
    RpDealerCard2S
)

rich_presence_conditional_display(
    LoudVersion && ((PlayerTurn || PlayerBust) && PlayerMainCardCount == 3),
    "{0} on the line: {1}{2}{3} vs XX{4}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpPlayerCard3,
    RpDealerCard2
)

rich_presence_conditional_display(
    SilentVersion && ((PlayerTurnSilence || PlayerBustSilence) && PlayerMainCardCountSilence == 3),
    "{0} on the line: {1}{2}{3} vs XX{4}",
    RpTotalBetS,
    RpPlayerCard1S,
    RpPlayerCard2S,
    RpPlayerCard3S,
    RpDealerCard2S
)

rich_presence_conditional_display(
    LoudVersion && ((DealerTurn || FinalWinner) &&
        PlayerMainCardCount == 5 && DealerMainCardCount == 5),
    "{0} on the line: {1}{2}{3}{4}{5} vs {6}{7}{8}{9}{10}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpPlayerCard3,
    RpPlayerCard4,
    RpPlayerCard5,
    RpDealerCard1,
    RpDealerCard2,
    RpDealerCard3,
    RpDealerCard4,
    RpDealerCard5
)

rich_presence_conditional_display(
    SilentVersion && ((DealerTurnSilence || FinalWinnerSilence) &&
        PlayerMainCardCountSilence == 5 && DealerMainCardCountSilence == 5),
    "{0} on the line: {1}{2}{3}{4}{5} vs {6}{7}{8}{9}{10}",
    RpTotalBetS,
    RpPlayerCard1S,
    RpPlayerCard2S,
    RpPlayerCard3S,
    RpPlayerCard4S,
    RpPlayerCard5S,
    RpDealerCard1S,
    RpDealerCard2S,
    RpDealerCard3S,
    RpDealerCard4S,
    RpDealerCard5S
)

rich_presence_conditional_display(
    LoudVersion && ((DealerTurn || FinalWinner) &&
        PlayerMainCardCount == 5 && DealerMainCardCount == 4),
    "{0} on the line: {1}{2}{3}{4}{5} vs {6}{7}{8}{9}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpPlayerCard3,
    RpPlayerCard4,
    RpPlayerCard5,
    RpDealerCard1,
    RpDealerCard2,
    RpDealerCard3,
    RpDealerCard4
)

rich_presence_conditional_display(
    SilentVersion && ((DealerTurnSilence || FinalWinnerSilence) &&
        PlayerMainCardCountSilence == 5 && DealerMainCardCountSilence == 4),
    "{0} on the line: {1}{2}{3}{4}{5} vs {6}{7}{8}{9}",
    RpTotalBetS,
    RpPlayerCard1S,
    RpPlayerCard2S,
    RpPlayerCard3S,
    RpPlayerCard4S,
    RpPlayerCard5S,
    RpDealerCard1S,
    RpDealerCard2S,
    RpDealerCard3S,
    RpDealerCard4S
)

rich_presence_conditional_display(
    LoudVersion && ((DealerTurn || FinalWinner) &&
        PlayerMainCardCount == 5 && DealerMainCardCount == 3),
    "{0} on the line: {1}{2}{3}{4}{5} vs {6}{7}{8}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpPlayerCard3,
    RpPlayerCard4,
    RpPlayerCard5,
    RpDealerCard1,
    RpDealerCard2,
    RpDealerCard3
)

rich_presence_conditional_display(
    SilentVersion && ((DealerTurnSilence || FinalWinnerSilence) &&
        PlayerMainCardCountSilence == 5 && DealerMainCardCountSilence == 3),
    "{0} on the line: {1}{2}{3}{4}{5} vs {6}{7}{8}",
    RpTotalBetS,
    RpPlayerCard1S,
    RpPlayerCard2S,
    RpPlayerCard3S,
    RpPlayerCard4S,
    RpPlayerCard5S,
    RpDealerCard1S,
    RpDealerCard2S,
    RpDealerCard3S
)

rich_presence_conditional_display(
    LoudVersion && ((DealerTurn || FinalWinner) && PlayerMainCardCount == 5),
    "{0} on the line: {1}{2}{3}{4}{5} vs {6}{7}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpPlayerCard3,
    RpPlayerCard4,
    RpPlayerCard5,
    RpDealerCard1,
    RpDealerCard2
)

rich_presence_conditional_display(
    SilentVersion && ((DealerTurnSilence || FinalWinnerSilence) && PlayerMainCardCountSilence == 5),
    "{0} on the line: {1}{2}{3}{4}{5} vs {6}{7}",
    RpTotalBetS,
    RpPlayerCard1S,
    RpPlayerCard2S,
    RpPlayerCard3S,
    RpPlayerCard4S,
    RpPlayerCard5S,
    RpDealerCard1S,
    RpDealerCard2S
)

rich_presence_conditional_display(
    LoudVersion && ((DealerTurn || FinalWinner) &&
        PlayerMainCardCount == 4 && DealerMainCardCount == 5),
    "{0} on the line: {1}{2}{3}{4} vs {5}{6}{7}{8}{9}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpPlayerCard3,
    RpPlayerCard4,
    RpDealerCard1,
    RpDealerCard2,
    RpDealerCard3,
    RpDealerCard4,
    RpDealerCard5
)

rich_presence_conditional_display(
    SilentVersion && ((DealerTurnSilence || FinalWinnerSilence) &&
        PlayerMainCardCountSilence == 4 && DealerMainCardCountSilence == 5),
    "{0} on the line: {1}{2}{3}{4} vs {5}{6}{7}{8}{9}",
    RpTotalBetS,
    RpPlayerCard1S,
    RpPlayerCard2S,
    RpPlayerCard3S,
    RpPlayerCard4S,
    RpDealerCard1S,
    RpDealerCard2S,
    RpDealerCard3S,
    RpDealerCard4S,
    RpDealerCard5S
)

rich_presence_conditional_display(
    LoudVersion && ((DealerTurn || FinalWinner) &&
        PlayerMainCardCount == 4 && DealerMainCardCount == 4),
    "{0} on the line: {1}{2}{3}{4} vs {5}{6}{7}{8}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpPlayerCard3,
    RpPlayerCard4,
    RpDealerCard1,
    RpDealerCard2,
    RpDealerCard3,
    RpDealerCard4
)

rich_presence_conditional_display(
    SilentVersion && ((DealerTurnSilence || FinalWinnerSilence) &&
        PlayerMainCardCountSilence == 4 && DealerMainCardCountSilence == 4),
    "{0} on the line: {1}{2}{3}{4} vs {5}{6}{7}{8}",
    RpTotalBetS,
    RpPlayerCard1S,
    RpPlayerCard2S,
    RpPlayerCard3S,
    RpPlayerCard4S,
    RpDealerCard1S,
    RpDealerCard2S,
    RpDealerCard3S,
    RpDealerCard4S
)

rich_presence_conditional_display(
    LoudVersion && ((DealerTurn || FinalWinner) &&
        PlayerMainCardCount == 4 && DealerMainCardCount == 3),
    "{0} on the line: {1}{2}{3}{4} vs {5}{6}{7}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpPlayerCard3,
    RpPlayerCard4,
    RpDealerCard1,
    RpDealerCard2,
    RpDealerCard3
)

rich_presence_conditional_display(
    SilentVersion && ((DealerTurnSilence || FinalWinnerSilence) &&
        PlayerMainCardCountSilence == 4 && DealerMainCardCountSilence == 3),
    "{0} on the line: {1}{2}{3}{4} vs {5}{6}{7}",
    RpTotalBetS,
    RpPlayerCard1S,
    RpPlayerCard2S,
    RpPlayerCard3S,
    RpPlayerCard4S,
    RpDealerCard1S,
    RpDealerCard2S,
    RpDealerCard3S
)

rich_presence_conditional_display(
    LoudVersion && ((DealerTurn || FinalWinner) && PlayerMainCardCount == 4),
    "{0} on the line: {1}{2}{3}{4} vs {5}{6}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpPlayerCard3,
    RpPlayerCard4,
    RpDealerCard1,
    RpDealerCard2
)

rich_presence_conditional_display(
    SilentVersion && ((DealerTurnSilence || FinalWinnerSilence) && PlayerMainCardCountSilence == 4),
    "{0} on the line: {1}{2}{3}{4} vs {5}{6}",
    RpTotalBetS,
    RpPlayerCard1S,
    RpPlayerCard2S,
    RpPlayerCard3S,
    RpPlayerCard4S,
    RpDealerCard1S,
    RpDealerCard2S
)

rich_presence_conditional_display(
    LoudVersion && ((DealerTurn || FinalWinner) &&
        PlayerMainCardCount == 3 && DealerMainCardCount == 5),
    "{0} on the line: {1}{2}{3} vs {4}{5}{6}{7}{8}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpPlayerCard3,
    RpDealerCard1,
    RpDealerCard2,
    RpDealerCard3,
    RpDealerCard4,
    RpDealerCard5
)

rich_presence_conditional_display(
    SilentVersion && ((DealerTurnSilence || FinalWinnerSilence) &&
        PlayerMainCardCountSilence == 3 && DealerMainCardCountSilence == 5),
    "{0} on the line: {1}{2}{3} vs {4}{5}{6}{7}{8}",
    RpTotalBetS,
    RpPlayerCard1S,
    RpPlayerCard2S,
    RpPlayerCard3S,
    RpDealerCard1S,
    RpDealerCard2S,
    RpDealerCard3S,
    RpDealerCard4S,
    RpDealerCard5S
)

rich_presence_conditional_display(
    LoudVersion && ((DealerTurn || FinalWinner) &&
        PlayerMainCardCount == 3 && DealerMainCardCount == 4),
    "{0} on the line: {1}{2}{3} vs {4}{5}{6}{7}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpPlayerCard3,
    RpDealerCard1,
    RpDealerCard2,
    RpDealerCard3,
    RpDealerCard4
)

rich_presence_conditional_display(
    SilentVersion && ((DealerTurnSilence || FinalWinnerSilence) &&
        PlayerMainCardCountSilence == 3 && DealerMainCardCountSilence == 4),
    "{0} on the line: {1}{2}{3} vs {4}{5}{6}{7}",
    RpTotalBetS,
    RpPlayerCard1S,
    RpPlayerCard2S,
    RpPlayerCard3S,
    RpDealerCard1S,
    RpDealerCard2S,
    RpDealerCard3S,
    RpDealerCard4S
)

rich_presence_conditional_display(
    LoudVersion && ((DealerTurn || FinalWinner) &&
        PlayerMainCardCount == 3 && DealerMainCardCount == 3),
    "{0} on the line: {1}{2}{3} vs {4}{5}{6}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpPlayerCard3,
    RpDealerCard1,
    RpDealerCard2,
    RpDealerCard3
)

rich_presence_conditional_display(
    SilentVersion && ((DealerTurnSilence || FinalWinnerSilence) &&
        PlayerMainCardCountSilence == 3 && DealerMainCardCountSilence == 3),
    "{0} on the line: {1}{2}{3} vs {4}{5}{6}",
    RpTotalBetS,
    RpPlayerCard1S,
    RpPlayerCard2S,
    RpPlayerCard3S,
    RpDealerCard1S,
    RpDealerCard2S,
    RpDealerCard3S
)

rich_presence_conditional_display(
    LoudVersion && (DealerTurn || FinalWinner) && PlayerMainCardCount == 3,
    "{0} on the line: {1}{2}{3} vs {4}{5}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpPlayerCard3,
    RpDealerCard1,
    RpDealerCard2
)

rich_presence_conditional_display(
    SilentVersion && (DealerTurnSilence || FinalWinnerSilence) && PlayerMainCardCountSilence == 3,
    "{0} on the line: {1}{2}{3} vs {4}{5}",
    RpTotalBetS,
    RpPlayerCard1S,
    RpPlayerCard2S,
    RpPlayerCard3S,
    RpDealerCard1S,
    RpDealerCard2S
)

rich_presence_conditional_display(
    LoudVersion && (DealerTurn || FinalWinner) && DealerMainCardCount == 5,
    "{0} on the line: {1}{2} vs {3}{4}{5}{6}{7}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpDealerCard1,
    RpDealerCard2,
    RpDealerCard3,
    RpDealerCard4,
    RpDealerCard5
)

rich_presence_conditional_display(
    SilentVersion && (DealerTurnSilence || FinalWinnerSilence) && DealerMainCardCountSilence == 5,
    "{0} on the line: {1}{2} vs {3}{4}{5}{6}{7}",
    RpTotalBetS,
    RpPlayerCard1S,
    RpPlayerCard2S,
    RpDealerCard1S,
    RpDealerCard2S,
    RpDealerCard3S,
    RpDealerCard4S,
    RpDealerCard5S
)

rich_presence_conditional_display(
    LoudVersion && (DealerTurn || FinalWinner) && DealerMainCardCount == 4,
    "{0} on the line: {1}{2} vs {3}{4}{5}{6}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpDealerCard1,
    RpDealerCard2,
    RpDealerCard3,
    RpDealerCard4
)

rich_presence_conditional_display(
    SilentVersion && (DealerTurnSilence || FinalWinnerSilence) && DealerMainCardCountSilence == 4,
    "{0} on the line: {1}{2} vs {3}{4}{5}{6}",
    RpTotalBetS,
    RpPlayerCard1S,
    RpPlayerCard2S,
    RpDealerCard1S,
    RpDealerCard2S,
    RpDealerCard3S,
    RpDealerCard4S
)

rich_presence_conditional_display(
    LoudVersion && (DealerTurn || FinalWinner) && DealerMainCardCount == 3,
    "{0} on the line: {1}{2} vs {3}{4}{5}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpDealerCard1,
    RpDealerCard2,
    RpDealerCard3
)

rich_presence_conditional_display(
    SilentVersion && (DealerTurnSilence || FinalWinnerSilence) && DealerMainCardCountSilence == 3,
    "{0} on the line: {1}{2} vs {3}{4}{5}",
    RpTotalBetS,
    RpPlayerCard1S,
    RpPlayerCard2S,
    RpDealerCard1S,
    RpDealerCard2S,
    RpDealerCard3S
)

rich_presence_conditional_display(
    LoudVersion && (DealerTurn || FinalWinner),
    "{0} on the line: {1}{2} vs {3}{4}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpDealerCard1,
    RpDealerCard2
)

rich_presence_conditional_display(
    SilentVersion && (DealerTurnSilence || FinalWinnerSilence),
    "{0} on the line: {1}{2} vs {3}{4}",
    RpTotalBetS,
    RpPlayerCard1S,
    RpPlayerCard2S,
    RpDealerCard1S,
    RpDealerCard2S
)

rich_presence_conditional_display(
    LoudVersion && (PlayerTurn || DealerTurn || FinalWinner || PlayerBust),
    "{0} on the line: {1}{2} vs XX{3}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpDealerCard2
)

rich_presence_conditional_display(
    SilentVersion && (PlayerTurnSilence || DealerTurnSilence || FinalWinnerSilence || PlayerBustSilence),
    "{0} on the line: {1}{2} vs XX{3}",
    RpTotalBetS,
    RpPlayerCard1S,
    RpPlayerCard2S,
    RpDealerCard2S
)

rich_presence_conditional_display(
    LoudVersion && (DealingCards || (InitialBetState && InitialBet > 0)),
    "👛{0} To Gamble Away At Blackjack: Betting {1}",
    RpPlayerPurse,
    RpInitialBet
)

rich_presence_conditional_display(
    SilentVersion && (DealingCardsSilence || (InitialBetStateSilence && InitialBetSilence > 0)),
    "👛{0} To Gamble Away At Blackjack: Betting {1}",
    RpPlayerPurseS,
    RpInitialBetS
)

rich_presence_conditional_display(
    LoudVersion && InitialBetState,
    "👛{0} To Gamble Away At Blackjack",
    RpPlayerPurse
)

rich_presence_conditional_display(
    SilentVersion && InitialBetStateSilence,
    "👛{0} To Gamble Away At Blackjack",
    RpPlayerPurseS
)

rich_presence_display("Playing Blackjack")
