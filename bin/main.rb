#!/usr/bin/env ruby
##rubocop:disable all

require_relative '../lib/tic_tac_toe'
require 'colorize'

def display_board(board)
  separator = '+---+---+---+'
  puts separator
  puts "| #{board[0]} | #{board[1]} | #{board[2]} |"
  puts separator
  puts "| #{board[3]} | #{board[4]} | #{board[5]} |"
  puts separator
  puts "| #{board[6]} | #{board[7]} | #{board[8]} |"
  puts "#{separator}\n\n"
end

def exit_game(reason)
  puts "Exiting the game : #{reason}"
  exit
end

def querydata(dispmsg)
  puts dispmsg
  gets.chomp.strip
end

class Player
  attr_accessor :name, :player

  def initialize(player)
    @player = player
    getname
  end

  def prompt
    puts "Enter #{@player}'s name: "
    @name = gets.chomp
  end

  def getname
    max_tries = 3
    @display_tries = max_tries - 1
    max_tries.times do
      prompt
      return @name unless @name.empty? or @name.match?(/^[A-Za-z ]*$/) == false
      puts "Name can't be empty or containing numbers.#{@display_tries} time(s) left".colorize(:red)
      @display_tries -= 1
    end
    exit_game("exceeded #{max_tries} tries")
  end
end

puts "Welcome to rubys Tic-Tac-Toe !\n\n"
player1 = Player.new('Player 1')
player2 = Player.new('Player 2')

puts "\n#{player1.name} will play with X and #{player2.name} will play with O\n\n"
puts "Let's start!\n\n"
board = Board.new
display_board(board.board)

while board.full == false
  # query players for moves
  player1_move = querydata("It's #{player1.name}'s turn!\n\nPlease select an available cell from the board (1-9)")
  while board.position_taken(player1_move.to_i - 1)
    puts 'this position is taken, please choose another one'
    player1_move = querydata('')
  end
  board.update_board('X', player1_move.to_i - 1)
  display_board(board.board)

  # check if anyone has won ==> If yes break declaring the winner of the game
  if board.won('X')
    puts "Congratulations ! #{player1.name} (X) has won the game !!"
    break
    # check if full(board) ==> If yes break declaring tie
  elsif board.full
    puts 'Break Tie'
    break
  end

  player2_move = querydata("It's #{player2.name}'s turn!\n\nPlease select an available cell from the board (1-9)")
  while board.position_taken(player2_move.to_i - 1)
    puts 'this position is taken, please choose another one'
    player2_move = querydata('')
  end
  board.update_board('O', player2_move.to_i - 1)
  display_board(board.board)
  if board.won('O')
    puts "Congratulations ! #{player2.name} (O) has won the game !!"
    break
  elsif board.full
    puts 'Break Tie'
    break
  end
end
