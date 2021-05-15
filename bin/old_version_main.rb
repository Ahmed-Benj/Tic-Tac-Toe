#!/usr/bin/env ruby
##rubocop:disable all

def querydata(dispmsg)
  puts dispmsg
  gets.chomp.strip
end

def exit_game(reason)
  puts "Exiting the game : #{reason}"
  exit
end

board = %w[1 2 3 4 5 6 7 8 9]
def display_board(board, symbol, position)
  board = board.map do |x|
    x == position ? symbol : x
  end
  puts '+---+---+---+'
  puts "| #{board[0]} | #{board[1]} | #{board[2]} |"
  puts '+---+---+---+'
  puts "| #{board[3]} | #{board[4]} | #{board[5]} |"
  puts '+---+---+---+'
  puts "| #{board[6]} | #{board[7]} | #{board[8]} |"
  puts "+---+---+---+ \n\n"
  board
end

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

board = display_board(board, nil, nil)

game_status = 'not finished'
maximum_number_of_rolls = 9

player1win = nil
player2win = nil
while game_status == 'not finished' and maximum_number_of_rolls.positive?
  player1choice = querydata("It's #{player1name}'s turn!\n\nPlease select an available cell from the board (1-9)")
  timesleft = 3
  until player1choice.to_i.between?(1,
                                    9)
    player1choice = querydata("Invalid move. Please enter a number from 1-9, #{timesleft} times left:")
    timesleft -= 1
    exit('exceeded number of tries!') if timesleft.zero? && !player1choice.to_i.between?(
      1, 9
    )
  end

  board = display_board(board, 'X',
                        player1choice)

  player2choice = querydata("It's #{player2name}'s turn!\n\nPlease select an available cell from the board (1-9)")
  timesleft = 3
  until player2choice.to_i.between?(1,
                                    9)
    player2choice = querydata("Invalid move. Please enter a number from 1-9, #{timesleft} times left:")
    timesleft -= 1
    exit('exceeded number of tries!') if timesleft.zero? && !player2choice.to_i.between?(
      1, 9
    )
  end

  display_board(board, 'O',
                player2choice)

  if player1win
    puts "#{player1name} you WIN the game!"
    game_status = 'finished'
  elsif player2win
    puts "#{player2name} you WIN the game!"
    game_status = 'finished'
  else
    puts "It's a TIE!\n\nGame over"
  end

  maximum_number_of_rolls -= 1
  puts maximum_number_of_rolls
  puts game_status
end
