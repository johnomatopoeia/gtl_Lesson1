def say(msg)
	puts "-------------------- #{msg} --------------------"
end


say("What's the first number?")
num1 = gets.chomp

say("Enter another number:")
num2 = gets.chomp

say("1) add 2)subtract 3)multiply 4)divide 5)exponent 6less than 7)greater than ")
op = gets.chomp


case op.to_i
when 1
  results = num1.to_i + num2.to_i
when 2
  results = num1.to_i - num2.to_i
when 3
  results = num1.to_i * num2.to_i
when 4
  results = num1.to_f / num2.to_f
when 5
  results = num1.to_i ** num2.to_i
when 6
  results = num1.to_i < num2.to_i
when 7
  results = num1.to_i > num2.to_i
else results = "Invalid operation"
end


##
#if op == 1
#	results = num1.to_i + num2.to_i
#elsif op == '2'
#	results = num1.to_i - num2.to_i
#elsif op == '3'
#	results = num1.to_i * num2.to_i
#elsif op == '4'
#	results = num1.to_f / num2.to_f
#end

say "Result is #{results}"
