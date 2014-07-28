## Steps:

# create output method
def say(msg)
  puts "-----------#{msg}"
end

# Create board method
def crt_board
  system "clear" 
  system "cls"
  
  std_ln = "     |     |     "
  div_ln = "-----|-----|-----"
  space_ht = 3
  row_cnt = 3
  
  #create board loop
  while row_cnt > 0
    
    ##spaces loop
    while space_ht >0
      puts std_ln
      
      space_ht -= 1
      if space_ht == 0 && row_cnt > 1
        puts div_ln
      end
      
    end #end board spaces loop
    
    #reset space_ht
    space_ht = 3 
    row_cnt -= 1
  end #end create board loop
end



# Establish player name
say "Welcome to JZ's Super Happy Funtime Tic Tac Toe!!!"
say "What is your name amigo?"

player_nm = "JZ"  #gets.chomp
play = "Y"

# Start game play loop
while play == "Y"
  
    crt_board()
  
  # limit nbr of turns to nbr of board spaces   
    # Request Player Move
    # Generate Computer move
    # Output moves to the board
  
  # Display game outcome message
  
  # Ask if player wants to play again
   play = "N"
   puts play
end #end play loop  




