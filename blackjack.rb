#Variables:
puts "Welcome to Casino Royale Black Jack.  Tell us your name, \nand let's hope you see some aces."
player_name = gets.chomp  #"BossMan"
player_total = 0
player_cards = []
player_move = ""
dealer_cards = []
dealer_total = 0
dealer_move = ""
new_player = 1
blackjack_indicator = 0
player_bust = 0
dealer_bust = 0
bankroll = 0
play_again = "Y"
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

  suits = ['♦','♣','♠', '♥']
  cards = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

  #combine suits and cards 4 times to create 4 decks
  suits.each do |suit|
  6.times do cards.each {|c| deck << "#{c.to_s}-#{suit}"} end
    end
  4.times do deck.shuffle! end #might as well make sure they're shuffled :)
  return deck
end


def deal_cards(player_cards, dealer_cards, deck)
  player_cards << deck.shift
  dealer_cards << deck.shift
end

def show_table(bankroll, bet, dealer_cards,player_cards, player_name, dealer_hide)
  system "clear"

  puts "Bankroll = $#{bankroll}  Bet = $#{bet}"
  if dealer_hide == 0
    puts "\n\n\n Dealer: \n #{dealer_cards}"
  else
    puts "\n\n\n Dealer: \n [XXXXXXX, #{dealer_cards[1]}]"
  end
  puts "\n\n\n #{player_name}: \n #{player_cards}"
end

def hand_eval(cards)
  ace_count = 0
  total = 0
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
      if total > 10 or total + ace_count > 10
        total += ace_count
      else
        total += 11
      end
    end
  end

  return total
end

def player_options(player_cards, player_move, deck)
  case player_move
  when "H" #hit
    player_cards << deck.shift
  when "S" #stand

  when "D" #double down
    player_cards << deck.shift
  end
end

bankroll = bankroll_calc(bankroll, bet,new_player)
shuffle_decks(deck)
new_player = 0

while play_again == "Y" do
  catch :end_hand do # :end_hand is also thrown for busts to got to bet processing
    player_bust = 0
    dealer_bust = 0
    player_move = ""
    dealer_move = ""
    player_cards = []
    dealer_cards = []
    dealer_hide = 1
    blackjack_indicator = 0
    bet = 0

    system "clear"

    puts "#{player_name}, you have $#{bankroll}. Place your bet."
    until bet > 0 && bet <= bankroll do
      bet = gets.chomp.to_i
      if bet > bankroll
        puts "You don't have have that much money, place another bet."
      end
    end

    bankroll = place_bet(bankroll, bet)

    2.times do deal_cards(player_cards, dealer_cards, deck) end

    show_table(bankroll, bet, dealer_cards,player_cards, player_name,dealer_hide)

    player_total = hand_eval(player_cards)
    dealer_total = hand_eval(dealer_cards)

    if dealer_total == 21 || player_total == 21
      blackjack_indicator = 1
      dealer_bustst = 0
      player_bust = 0

      throw :end_hand
    end

    #catch :player_bust do
      while ["D","S"].include?(player_move) == false do

        if bankroll >=  bet && player_cards.count == 2
          puts "Hit (H), Stand (S), or Double Down (D)?"
          play_array = ["H","S","D"]
        else
          puts "Hit (H) or Stand (S)?"
          play_array = ["H","S"]
        end

        until play_array.include?(player_move) == true do player_move = gets.chomp.upcase end

        player_options(player_cards, player_move, deck)

        case player_move
        when "D"
          bet *= 2
        when "H"
          player_move = ""
        end
        player_total = hand_eval(player_cards)

        show_table(bankroll, bet, dealer_cards,player_cards, player_name, dealer_hide)

        if player_total > 21
          puts "#{player_name}, you busted!"
          player_bust = 1
          throw :end_hand
        end
      end
    #end #catch player_bust

    #catch :dealer_bust do
      while dealer_total < 17 do
        dealer_hide = 0
        dealer_cards << deck.shift
        dealer_total = hand_eval(dealer_cards)
        show_table(bankroll, bet, dealer_cards,player_cards, player_name,dealer_hide)
        if dealer_total < 17
          puts "Dealer has to hit again."
          sleep 2
        elsif dealer_total > 21
          puts "Dealer busts!"
          dealer_bust = 1
          throw :end_hand
        end
      end #dealer must hit under 17
    #end #catch dealer_bust

  end # catch end_hand
  if blackjack_indicator == 1
    dealer_hide = 0
    show_table(bankroll, bet, dealer_cards,player_cards, player_name, dealer_hide)
    if dealer_total == 21 && player_total == 21
      puts "It's a double blackjack! Impressive, but still a push."
    elsif dealer_total == 21
      puts "Dealer has blackjack.  You lose #{bet}"
      bet = 0
    else
      puts "#{player_name}, you have blackjack! You win $#{(bet*1.5).to_i}, congratulations!"
      bet += (1.5*bet).to_i
    end
  elsif dealer_bust == 1
      puts "#{player_name}, you win $#{bet}."
      bet *= 2
  elsif player_bust == 1
      puts "You lose $#{bet}."
      bet = 0
  else
     if dealer_total == player_total
      puts "Push"
    elsif dealer_total > player_total
      puts "Sorry #{player_name}, the dealer's #{dealer_total} beats your #{player_total}, better luck next time."
      bet = 0
    else
      puts "Congratulations #{player_name}, your #{player_total} beats the dealer's #{dealer_total}! You won $#{bet}."
      bet *= 2
    end
  end

  bankroll = bankroll_calc(bankroll, bet, new_player)
  if bankroll > 0
    puts " Would you like to play another hand? (Y/N)"
    play_again = gets.chomp.upcase
  else
    puts "It looks like you're out of money."
    play_again = "N"
  end
  if deck.count < 52
    deck = []
    system "clear"
    puts "The deck is low, time to shuffle."
    sleep 4
    shuffle_decks(deck)
  end

  puts "Thanks for playing, #{player_name}.  You walk away with $#{bankroll}"
  end
