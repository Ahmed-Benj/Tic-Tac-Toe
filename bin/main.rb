#!/usr/bin/env ruby
##rubocop:disable all

def querydata(dispmsg)
  puts dispmsg
  gets.chomp.strip
end

def exit(reason)
  puts "Exiting the game : #{reason}"
  exit
end

def display_board(sym, pos)
  puts separator = '+---+---+---+'
  # puts row = '| 1 | 2 | 3 |'
  puts separator
  # puts row = '| 4 | 5 | 6 |'
  puts separator
  # puts row = '| 7 | 8 | 9 |'
  puts "#{separator}\n\n"
end

# initializers_(tobe_deleted)
player1name = 'x'

puts "Welcome to rubys Tic-Tac-Toe !\n\n"

player1name = querydata("Enter Player 1's name:")
timesleft = 3
while player1name.empty?
  player1name = querydata("Player name can not be empty, please enter valid Player1 name, #{timesleft} times left:")
  timesleft -= 1
  exit('exceeded number of tries!') if timesleft.zero? && player1name.empty?
end

player2name = querydata("Enter Player 2's name:")
timesleft = 3
while player2name.empty?
  player2name = querydata("Player name can not be empty, please enter valid Player2 name, #{timesleft} times left:")
  timesleft -= 1
  exit('exceeded number of tries!') if timesleft.zero? && player2name.empty?
end

puts "\n#{player1name} will play with X and #{player2name} will play with O\n\n"
puts "Let's start!\n\n"

display_board(0,0)

player1choice = querydata("It's #{player1name}'s turn!\n\nPlease select an available cell from the board (1-9)")
timesleft = 3
until player1choice.to_i.between?(1, 9)
  player1choice = querydata("Invalid move. Please enter a number from 1-9, #{timesleft} times left:")
  timesleft -= 1
  exit('exceeded number of tries!') if timesleft.zero? && !player1choice.to_i.between?(1, 9)
end

player2choice = querydata("It's #{player2name}'s turn!\n\nPlease select an available cell from the board (1-9)")
timesleft = 3
until player2choice.to_i.between?(1, 9)
  player2choice = querydata("Invalid move. Please enter a number from 1-9, #{timesleft} times left:")
  timesleft -= 1
  exit('exceeded number of tries!') if timesleft.zero? && !player2choice.to_i.between?(1, 9)
end
