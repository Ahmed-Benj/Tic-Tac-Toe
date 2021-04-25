#!/usr/bin/env ruby
##rubocop:disable all

def queryplayername(displaymessage)
  puts displaymessage
  gets.chomp.strip
end

def exitforspecificreason(reason)
  puts "Exiting the game for #{reason}"
  exit
end

puts "Welcome to rubys Tic-Tac-Toe !\n\n"

player1name = queryplayername("Enter Player 1's name:")
timesleft = 3
while player1name.empty?
  player1name = queryplayername("Player name can not be empty, please enter valid Player1 name, #{timesleft} times left:")
  timesleft -= 1
  exitforspecificreason('Exiting the game : exceeded number of tries!') if timesleft.zero? && player1name.empty?
end

player2name = queryplayername("Enter Player 2's name:")
timesleft = 3
while player2name.empty?
  player2name = queryplayername("Player name can not be empty, please enter valid Player2 name, #{timesleft} times left:")
  timesleft -= 1
  exitforspecificreason('Exiting the game : exceeded number of tries!') if timesleft.zero? && player2name.empty?
end

puts "\n#{player1name} will play with X and #{player2name} will play with O\n\n"
puts "Let's start!\n\n"

puts separator = '+---+---+---+'
# puts row = '| 1 | 2 | 3 |'
puts separator
# puts row = '| 4 | 5 | 6 |'
puts separator
# puts row = '| 7 | 8 | 9 |'
puts "#{separator}\n\n"

puts "It's #{player1name}'s turn!\n\n"
puts 'Please select an available cell from the board'
# player1_name_choice1 = gets
