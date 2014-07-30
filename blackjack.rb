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
  if dealer_cards.count > 2
    puts "\n\n\n Dealer: \n #{dealer_cards}"
  else 
    puts "\n\n\n Dealer: \n [XXXXXXX, #{dealer_cards[1]}]"
  end
  puts "\n\n\n #{player_name}: \n #{player_cards}"
end

def hand_eval(cards, total)
  ace_count = 0
  
  #iterate through cards to check for face cards and calculate total
  cards.each do |c| 
    if c.partition('-').first.to_i > 0
      total += c.partition('-').first.to_i if c != 'A' 
    else
      if c.partition('-').first == 'A'
        #checking for aces to evaluate after all other cards totaled b/c they can be 1 or 11
        ace_count += 1   
      else
        total += 10
      end
    end
  end
  
  #ace handling
  if total > 10
    total += ace_count
  else
    ace_count.times do
      if total > 10
        total += ace_count
      else
        total += 11
      end
    end
  end
  
  return total
end



bankroll = bankroll_calc(bankroll, bet,new_player)
shuffle_decks(deck)

puts "#{player_name}, place your bet."
until bet > 0 && bet <= bankroll do bet = 100 #gets.chomp.to_i 
end

bankroll = place_bet(bankroll, bet)

2.times do deal_cards(player_cards, dealer_cards, deck) end

puts player_cards
puts dealer_cards
puts deck.count

show_table(bankroll, bet, dealer_cards,player_cards, player_name)

player_total = hand_eval(player_cards, player_total)
dealer_total = hand_eval(dealer_cards, dealer_total)

p player_total
p dealer_total



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
