## Steps:
system "clear"

# create output method
def say(msg)
  puts "#{msg}"
end


def create_board(board_hash)

  system "clear"
  system "cls"

  standard_line = "     |     |     "
  divider_line = "-----|-----|-----"
  play_line = "  #{board_hsh.fetch("1")}  |  #{board_hsh.fetch("2")}  |  #{board_hsh.fetch("3")}  "
  space_height = 3
  row_cnt = 3

  #create board loop
  while row_cnt > 0

    ##spaces loop
    while space_height > 0

      if space_height == 2
        # replace characters positions 2, 6, and 10 with space values from board hash
        puts play_line
      else

        puts standard_line
      end

      space_height -= 1

      if space_height == 0 && row_cnt > 1
        puts divider_line
      end

    end #end board spaces loop

    #reset space_ht
    space_height = 3
    row_cnt -= 1

    if row_cnt == 2
      play_line = "  #{board_hsh.fetch("#{row_cnt+2}")}  |  #{board_hsh.fetch("#{row_cnt+3}")}  |  #{board_hsh.fetch("#{row_cnt+4}")}  "
    else
      play_line = "  #{board_hsh.fetch("#{row_cnt+6}")}  |  #{board_hsh.fetch("#{row_cnt+7}")}  |  #{board_hsh.fetch("#{row_cnt+8}")}  "
    end
  end #end create board loop
end

def winner_check(ply_arry, contestant)
  win_combos_arr = [["1", "2", "3"],["4", "5", "6"],["7", "8", "9"],["1", "4", "7"], ["2","5", "8"], ["3", "6", "9"], ["1", "5", "9"], ["3", "5", "7"]]
  
  win_combos_arr.each do |v|
      if (v & ply_arry).count == 3
        p v & ply_arry
        return "#{contestant}"
      else 
        return ""
      end
    end  
end

# Establish player name
say "Welcome to JZ's Super Happy Funtime Tic Tac Toe!!!"
say "What is your name amigo?"

player_name = gets.chomp

say "Thanks for stopping #{player_name}, and good luck!"
say "\n ** press enter to continue **"
gets

play = "Y"

wins = 0
loss = 0
draw = 0


# Start game play loop
while play == "Y"

  board_hsh = {"1" => " ", "2" => " ", "3" => " ", "4" => " ", "5" => " ", "6" => " ", "7" => " ", "8" => " ", "9" => " "}
  
  player_arr = board_hsh.keys.select { |key| board_hsh[key] == "X"}
  comp_arr = board_hsh.keys.select { |key| board_hsh[key] == "O"}
  

  winner = ""
  
  # limit nbr of turns for nbr of board spaces
  turn_cnt = 5

  #begin turns
  catch :win do
    while  board_hsh.has_value?(" ") == true
  
      create_board(board_hsh)
  
      # Request Player Move  
      player1_move = "0"
      #validate move
      while board_hsh.has_key?(player1_move) == false
  
        say "Choose your space, (1 - 9)."
        player1_move = gets.chomp
  
        if board_hsh.fetch(player1_move) == " "
          board_hsh[player1_move] = "X"
        else
          player1_move = 0
        end
        
      end #end player move validation
      
      #update players array
      player_arr = board_hsh.map{ |k,v| v=='X' ? k : nil }.compact
      
      #check for winner
      winner = winner_check(player_arr, player_name)
      
      #throw up the win to exit turns loop
      if winner != ""
        throw :win
      end
      
      comp_move = "0"
  
      #generate & validate computer move
      while board_hsh.has_key?(comp_move) == false && board_hsh.has_value?(" ") == true
        comp_move = (1 + rand(9)).to_s
        if board_hsh.fetch(comp_move) == " "
          board_hsh[comp_move] = "O"
        else
          comp_move = 0
        end
      end #end computer move validation
      
      #update comps array
      comp_arr = board_hsh.keys.select { |key| board_hsh[key] == "O"}
      
      # Check for winner
      winner = winner_check(comp_arr, "Computer")
      
      #throw up the win to exit turns loop
      if winner != ""
        throw :win
      end
      
    end #end of turns loop
  end #end of catch when there is a winner
  
  #Create final board
  create_board(board_hsh)

  #Announce Winner
  case winner
    when "Computer"
      say "\n Better luck next time, #{winner} wins"
    when player_name
      say "\n Way to go #{player_name} you beat the computer!"
    else
      say "\ Tic Tac Toe should always end in a draw with two competent opponents."
  end
  
  #Display player stats
  say "\n Your current record is #{wins} wins, #{loss} losses, and #{draw} draws."
  
  #Ask to play again
  say "\n\nWould you lke to play again?(Y/N)"
  play = gets.chomp.upcase


end #end play loop
