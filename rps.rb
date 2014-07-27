def say(msg)
  puts "-------------------- #{msg}"
end


say "Welcome, tell us your name, warrior."
player1 = gets.chomp

say "#{player1}, you are now entering the Rock, Paper, Scissors Arena"

play = "Y"

wins = 0
loss = 0
draw = 0

weapon1 = 0
cpuweapon = 0


while play == "Y"

  until weapon1.to_i == 1 || weapon1.to_i == 2 || weapon1.to_i == 3 || weapon1.to_i == 666

    cnt = 0

    if cnt = 0
      say "Prepare for battle, and select your weapon!"
      say "1) Rock, 2)Paper, 3)Scissors"
      weapon1 = gets.chomp
      cpuweapon = 1 + rand(3)
      cnt += 1
    else
      say "Choose a real weapon you fool!"

      say "1) Rock, 2)Paper, 3)Scissors"
      weapon1 = gets.chomp
    end
  end

  case weapon1.to_i
  when 1
      case cpuweapon.to_i
      when 1
        say "#{player1}, both you and the arena's gladiator have lugged your rocks to the ring for nothing."
        draw += 1
      when 2
        say "#{player1}, your rock has has been wrapped to oblivion by our gladiator's paper. You chose poorly."
        loss +=1
      else
        say "#{player1}, your rock has crushed the gladiator's safety scissors. You chose wisely"
        wins +=1
      end
  when 2
      case cpuweapon.to_i
      when 1
        say "#{player1}, your paper has wrapped up a win! You chose wisely."
        wins +=1
      when 2
        say "#{player1}, your paper cuts are deep, but no deeper than the paper cuts you gave the arena's gladiator."
        draw += 1
      else
        say "#{player1}, your paper is cut up, better luck next time. You chose poorly."
        loss +=1
      end
  when 3
      case cpuweapon.to_i
      when 1
        say "#{player1}, your saftery scissors are no match for the rock of gibraltar. You chose poorly."
        loss +=1
      when 2
        say "#{player1}, you have snipped your way to victory! You chose wisely."
        wins += 1
      else
        say "#{player1}, double safety scissors is always a funny match."
        draw += 1
      end
  else
    say "#{player1}, you devil! You've blown us all to pieces with your nuclear destruction."
    say "game over"
    play = "N"
  end

  if play != "N"
  say "#{player1}, Your record is #{wins} wins, #{loss} losses, and #{draw} draws."
  say "Would you like to play again? (Y/N)"
  play = gets.chomp.upcase
  weapon1 = 0
  cpuweapon = 0
end
end
