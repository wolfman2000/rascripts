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

VersionPtr = ~bit0(0x46) * VersionOffset

// Suit order: more for RP purposes.
HeartSuit = "♥️"
DiamondSuit = "♦️"
SpadeSuit = "♠️"
ClubSuit = "♣️"

PressedA = bit6(0x002c) == 0

SelectedOption = low4(0x02a8)

MessagePtr = low4(0x294 + VersionPtr)
MessagePtrWelcome = MessagePtr == 0
MessagePtrDealerBlackjack = MessagePtr == 1
MessagePtrDealerWin = MessagePtr == 2
MessagePtrPlayerBlackjack = MessagePtr == 4
MessagePtrPlayerWin = MessagePtr == 5
MessagePtrPush = MessagePtr == 6
MessagePtrPlayerBust = MessagePtr == 7

AmountWonPtr = word(0x29d + VersionPtr)
AmountLostPtr = word(0x29f + VersionPtr)

GameStatePtr = low4(0x2e9 + VersionPtr)
InitialBetStatePtr = GameStatePtr == 1
DealingCardsPtr = GameStatePtr == 2
InsurancePtr = GameStatePtr == 3
DealerPeakingPtr = GameStatePtr == 4
InsuranceWastedPtr = GameStatePtr == 5
SplittingHandPtr = GameStatePtr == 6
PlayerTurnPtr = GameStatePtr == 8
DealerTurnPtr = GameStatePtr == 9
FinalWinnerPtr = GameStatePtr == 10
PayingOutPtr = GameStatePtr == 11
ContinuePtr = GameStatePtr == 12
PlayerBustPtr = GameStatePtr == 13


// Player's Money

PlayerPursePtr = word(0x284 + VersionPtr)
InitialBetPtr = byte(0x2e0 + VersionPtr)
TotalBetPtr = word(0x2de + VersionPtr)

// Game Result
GameResult = low4(0x29b + VersionPtr)

PlayerWins = GameResult == 1
PlayerLose = GameResult == 2
PlayerPush = GameResult == 3

PlayerMainCardCountPtr = low4(0x263 + VersionPtr)

PlayerCardArrayOrigin = 0x0264

PlayerCard1 = byte(PlayerCardArrayOrigin + VersionPtr)
PlayerCard2 = byte(PlayerCardArrayOrigin + 1 + VersionPtr)

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

PlayerSplitCardCount = low4(0x0275 + VersionPtr)
PlayerSplitArrayOrigin = 0x0276 + VersionPtr

DealerMainCardCount = low4(0x0287 + VersionPtr)
DealerCardArrayOrigin = 0x0288 + VersionPtr // This one at 0 is the hole card!

DidPlayerDoubleDown = bit0(0x0261 + VersionPtr) == 1
IsPlayerDone = bit0(0x0260 + VersionPtr) == 1


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
    trigger = (InitialBetPtr == 200 &&
    ((PlayerSplitCardCount == 0 && PlayerWins) ||
    (disable_when(PlayerLose || PlayerPush, until=InitialBetStatePtr) &&
        PlayerSplitCardCount > 0 && once(ContinuePtr))))
)

cardCountStart = [
   InitialBetStatePtr,
]

cardCountCancel = [
    prev(AmountLostPtr) == 0 && AmountLostPtr > 0 && (
        MessagePtrDealerWin || MessagePtrDealerBlackjack || MessagePtrPlayerBust
    ),
    MessagePtrWelcome
]

cardCountSubmit = [
    (measured(repeated(5,
        prev(AmountWonPtr) == 0 && AmountWonPtr > 0 && 
        (MessagePtrPlayerWin || MessagePtrPlayerBlackjack))))
]

achievement(
    title = "Card Counter",
    id=215165,
    points = 10,
    description = "Win five hands without losing one. Pushes do not affect the count.",
    trigger = Challenge(cardCountStart, cardCountCancel, cardCountSubmit)
)

BankBrokeYou = (PlayerPursePtr == 0 && PayingOutPtr)
BrokeBank = (PlayerPursePtr >= 1000 && PayingOutPtr)

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
    description = "Split a hand. Win both of them. This pops after all dealer messages.",
    trigger = (
        PlayerSplitCardCount > 0 && ContinuePtr &&
        disable_when((PlayerLose || PlayerPush), until=InitialBetStatePtr))
)

achievement(
    title = "Robbie Rotten Is Concerned",
    id=215168,
    points = 5,
    description = "Waste a Blackjack by asking for another card.",
    trigger = (((PlayerCard1A && PlayerCard2T) ||
        (PlayerCard1T && PlayerCard2A)) &&
        prev(GameStatePtr) == 8 && PlayerMainCardCountPtr == 3)
)

achievement(
    title = "Are They Cheating?",
    id=215169,
    points = 10,
    description = "Stay on your initial 20 hand, and still lose to a non-Blackjack 21.",
    trigger = (PlayerCard1T && PlayerCard2T && DealerMainCardCount > 2 &&
        FinalWinnerPtr && MessagePtrDealerWin && prev(AmountLostPtr) == 0 && AmountLostPtr > 0)
)

// Leaderboard Below



leaderboard(
    title = "Break The Bank Time Attack",
    id = 33785,
    description = "Get 1000 in your purse as fast as you can. Time ends on celebration.",
    start = DealingCardsPtr,
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

RpPlayerPurse = rich_presence_macro("Number", PlayerPursePtr)
RpInitialBet = rich_presence_macro("Number", InitialBetPtr)
RpTotalBet = rich_presence_macro("Number", TotalBetPtr)

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

rich_presence_conditional_display(
    BrokeBank,
    "You Broke The Bank"
)

rich_presence_conditional_display(
    BankBrokeYou,
    "You Are Broke"
)

rich_presence_conditional_display(
    (ContinuePtr || (InsuranceWastedPtr && MessagePtrDealerBlackjack)),
    "👛{0} On Hand: Time To Stop?",
    RpPlayerPurse
)

rich_presence_conditional_display(
    (InsurancePtr || DealerPeakingPtr || InsuranceWastedPtr),
    "{0} on the line: {1}{2} vs Insurance",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2
)

rich_presence_conditional_display(
    ((PlayerTurnPtr || PlayerBustPtr) && PlayerMainCardCountPtr == 5),
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
    ((PlayerTurnPtr || PlayerBustPtr) && PlayerMainCardCountPtr == 4),
    "{0} on the line: {1}{2}{3}{4} vs XX{5}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpPlayerCard3,
    RpPlayerCard4,
    RpDealerCard2
)

rich_presence_conditional_display(
    ((PlayerTurnPtr || PlayerBustPtr) && PlayerMainCardCountPtr == 3),
    "{0} on the line: {1}{2}{3} vs XX{4}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpPlayerCard3,
    RpDealerCard2
)

rich_presence_conditional_display(
    ((DealerTurnPtr || FinalWinnerPtr) &&
        PlayerMainCardCountPtr == 5 && DealerMainCardCount == 5),
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
    ((DealerTurnPtr || FinalWinnerPtr) &&
        PlayerMainCardCountPtr == 5 && DealerMainCardCount == 4),
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
    ((DealerTurnPtr || FinalWinnerPtr) &&
        PlayerMainCardCountPtr == 5 && DealerMainCardCount == 3),
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
    ((DealerTurnPtr || FinalWinnerPtr) && PlayerMainCardCountPtr == 5),
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
    ((DealerTurnPtr || FinalWinnerPtr) &&
        PlayerMainCardCountPtr == 4 && DealerMainCardCount == 5),
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
    ((DealerTurnPtr || FinalWinnerPtr) &&
        PlayerMainCardCountPtr == 4 && DealerMainCardCount == 4),
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
    ((DealerTurnPtr || FinalWinnerPtr) &&
        PlayerMainCardCountPtr == 4 && DealerMainCardCount == 3),
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
    ((DealerTurnPtr || FinalWinnerPtr) && PlayerMainCardCountPtr == 4),
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
    ((DealerTurnPtr || FinalWinnerPtr) &&
        PlayerMainCardCountPtr == 3 && DealerMainCardCount == 5),
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
    ((DealerTurnPtr || FinalWinnerPtr) &&
        PlayerMainCardCountPtr == 3 && DealerMainCardCount == 4),
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
    ((DealerTurnPtr || FinalWinnerPtr) &&
        PlayerMainCardCountPtr == 3 && DealerMainCardCount == 3),
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
    (DealerTurnPtr || FinalWinnerPtr) && PlayerMainCardCountPtr == 3,
    "{0} on the line: {1}{2}{3} vs {4}{5}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpPlayerCard3,
    RpDealerCard1,
    RpDealerCard2
)

rich_presence_conditional_display(
    (DealerTurnPtr || FinalWinnerPtr) && DealerMainCardCount == 5,
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
    (DealerTurnPtr || FinalWinnerPtr) && DealerMainCardCount == 4,
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
    (DealerTurnPtr || FinalWinnerPtr) && DealerMainCardCount == 3,
    "{0} on the line: {1}{2} vs {3}{4}{5}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpDealerCard1,
    RpDealerCard2,
    RpDealerCard3
)

rich_presence_conditional_display(
    (DealerTurnPtr || FinalWinnerPtr),
    "{0} on the line: {1}{2} vs {3}{4}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpDealerCard1,
    RpDealerCard2
)

rich_presence_conditional_display(
    (PlayerTurnPtr || DealerTurnPtr || FinalWinnerPtr || PlayerBustPtr),
    "{0} on the line: {1}{2} vs XX{3}",
    RpTotalBet,
    RpPlayerCard1,
    RpPlayerCard2,
    RpDealerCard2
)

rich_presence_conditional_display(
    (DealingCardsPtr || (InitialBetStatePtr && InitialBetPtr > 0)),
    "👛{0} To Gamble Away At Blackjack: Betting {1}",
    RpPlayerPurse,
    RpInitialBet
)

rich_presence_conditional_display(
    InitialBetStatePtr,
    "👛{0} To Gamble Away At Blackjack",
    RpPlayerPurse
)

rich_presence_display("Playing Blackjack")
