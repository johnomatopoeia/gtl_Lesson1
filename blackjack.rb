
player_name = "BossMan"
player_hand = []
dealer_hand = []
new_player = 1
bankroll = 0
deck = []

def bankroll(bet,new_player)
  if new_player == 1
    bankroll = 2000
  else
    bankroll += bet
  end
  return bankroll
end


def shuffle_decks(deck)
  suits = ["spades","clubs","diamonds", "hearts"]
  cards = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

  suits.each do |suit|
    cards.each {|c| deck << "#{c.to_s}-#{suit}"}
    end
    return deck
end

def deal_cards()

end




bankroll = bankroll(0,new_player)
deck = shuffle_decks(deck)
p deck
p bankroll





distribute chips

accept bets

shuffle cards

deal cards

evaluate totals
  dealer blackjack = tie or lose
  player blackjack = win

ask player to hit, stand, split, double down

dealer has to hit/stand

payout or take chips

announce winner
