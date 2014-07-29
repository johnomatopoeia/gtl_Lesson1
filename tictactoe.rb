## Steps:
system "clear"
# create output method
def say(msg)
  puts "#{msg}"
end

# Create board method
def crt_board(board_hsh)

  system "clear"
  # system "cls"

  std_ln = "     |     |     "
  div_ln = "-----|-----|-----"
  play_ln = "  #{board_hsh.fetch("1")}  |  #{board_hsh.fetch("2")}  |  #{board_hsh.fetch("3")}  "
  space_ht = 3
  row_cnt = 3

  #create board loop
  while row_cnt > 0

    ##spaces loop
    while space_ht >0

      if space_ht == 2
        # replace characters positions 2, 6, and 10 with space values from board hash
        puts play_ln
      else

        puts std_ln
      end

      space_ht -= 1

      if space_ht == 0 && row_cnt > 1
        puts div_ln
      end

    end #end board spaces loop

    #reset space_ht
    space_ht = 3
    row_cnt -= 1

    if row_cnt == 2
      play_ln = "  #{board_hsh.fetch("#{row_cnt+2}")}  |  #{board_hsh.fetch("#{row_cnt+3}")}  |  #{board_hsh.fetch("#{row_cnt+4}")}  "
    else
      play_ln = "  #{board_hsh.fetch("#{row_cnt+6}")}  |  #{board_hsh.fetch("#{row_cnt+7}")}  |  #{board_hsh.fetch("#{row_cnt+8}")}  "
    end
  end #end create board loop
end



# Establish player name
say "Welcome to JZ's Super Happy Funtime Tic Tac Toe!!!"
say "What is your name amigo?"

player_nm = gets.chomp

say "Thanks for stopping #{player_nm}, and good luck!"
say "\n ** press enter to continue **"
gets

play = "Y"



# Start game play loop
while play == "Y"

  board_hsh = {"1" => " ", "2" => " ", "3" => " ", "4" => " ", "5" => " ", "6" => " ", "7" => " ", "8" => " ", "9" => " "}

  # limit nbr of turns for nbr of board spaces
  turn_cnt = 5

  #begin turns
  while  board_hsh.has_value?(" ") == true

    crt_board(board_hsh)

    # Request Player Move

    player1_mv = "0"
    #validate move
    while board_hsh.has_key?(player1_mv) == false

      say "Choose your space, (1 - 9)."
      player1_mv = gets.chomp

      if board_hsh.fetch(player1_mv) == " "
        board_hsh[player1_mv] = "X"
      else
        player1_mv = 0
      end

    end #end player move validation

    comp_mv = "0"

    #generate & validate computer move
    while board_hsh.has_key?(comp_mv) == false && board_hsh.has_value?(" ") == true
      comp_mv = (1 + rand(9)).to_s
      if board_hsh.fetch(comp_mv) == " "
        board_hsh[comp_mv] = "O"
      else
        comp_mv = 0
      end
    end #end computer move validation

  end #end of turns loop

  #Create final board
  crt_board(board_hsh)

  #player wins
  #1 2 3
  #4 5 6
  #7 8 9
board_hsh.each {|k,v| puts k if v == "X"}

  #computer wins

  say "\n\nWould you lke to play again?(Y/N)"
  play = gets.chomp


end #end play loop




