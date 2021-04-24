#!/usr/bin/env ruby

#rubocop:disable all
puts "Welcome to rubys Tic-Tac-Toe !\n\n"


puts "Enter Player1 name:"
player1_name = gets.chomp
puts "Enter Player2 name:"
player2_name = gets.chomp

puts "\n#{player1_name} will play with X and #{player2_name} will play with O\n\n"
puts "Let's start!\n\n"

puts separator="+---+---+---+"
puts row="| 1 | 2 | 3 |"
puts separator
puts row="| 4 | 5 | 6 |"
puts separator
puts row="| 7 | 8 | 9 |"
puts separator + "\n\n"

puts "It's #{player1_name}'s turn!\n\n"
puts "Please select an available cell from the board"
player1_name_choice1= gets