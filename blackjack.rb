#Variables:
player_name = "BossMan"
player_total = 0
player_cards = []
dealer_cards = []
dealer_total = 0
new_player = 1
bankroll = 0
bet = 0
deck = []

def bankroll_calc(bankroll, bet,new_player)
  if new_player == 1
    bankroll = 2000
  else
    bankroll += bet
  end
  return bankroll
end

def place_bet(bankroll, bet)
  bankroll -= bet
  return bankroll
end


def shuffle_decks(deck)
  suits = ["spades","clubs","diamonds", "hearts"]
  cards = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

  #combine suits and cards 4 times to create 4 decks
  suits.each do |suit|
  4.times do cards.each {|c| deck << "#{c.to_s}-#{suit}"} end
    end
  4.times do deck.shuffle! end #might as well make sure they're shuffled :)
  return deck
end


def deal_cards(player_cards, dealer_cards, deck)
  player_cards << deck.shift
  dealer_cards << deck.shift
end

def show_table(bankroll, bet, dealer_cards,player_cards, player_name)
  puts "Bankroll = #{bankroll}  Bet = #{bet}"
  puts "\n\n\n Dealer: \n #{dealer_cards}"
  puts "\n\n\n #{player_name}: \n #{player_cards}"
  
end

bankroll = bankroll_calc(bankroll, bet,new_player)
shuffle_decks(deck)

puts "Place your bet."
bet = 100 #gets.chomp.to_i

bankroll = place_bet(bankroll, bet)

2.times do deal_cards(player_cards, dealer_cards, deck) end

puts player_cards
puts dealer_cards
puts deck.count

show_table(bankroll, bet, dealer_cards,player_cards, player_name)




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
