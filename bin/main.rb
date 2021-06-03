#!/usr/bin/env ruby
##rubocop:disable all

require_relative '../lib/tic_tac_toe'
#require 'colorize'

def welcome_player(name, symbol)
  puts "\n#{name} will play with #{symbol}\n\n"
end

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

def querydata(msg)
  puts msg
  gets.chomp.strip
end

def get_playermove(playername, board)
  playermove = querydata("It's #{playername}'s turn!\n\nPlease select an available cell from the board (1-9)")
  while board.position_taken(playermove.to_i - 1) or !(1..9).to_a.include? playermove.to_i or playermove == ''
    puts 'this position is taken/not in range, please choose another one'.colorize(:red)
    playermove = querydata('')
  end
  playermove
end

def won_draw(board, player)
  # check if player has won ==> If yes break declaring winner
  if board.won(player.symbol)
    puts "Congratulations ! #{player.name} (#{player.symbol}) has won the game !!"
    return true
    # check if full(board) ==> If yes break declaring tie
  elsif board.full
    puts 'Break Tie'.colorize(:red)
    return true
  end
  false
end

class Player
  attr_accessor :name, :symbol

  def initialize(player, symbol)
    @player = player
    @symbol = symbol
    getname
  end

  def prompt
    puts "Enter #{@player}'s name: "
    @name = gets.chomp.strip
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
    exit_game("exceeded #{max_tries} tries").colorize(:red)
  end
end

puts "Welcome to rubys Tic-Tac-Toe !\n\n"
player1 = Player.new('Player 1', 'X')
welcome_player(player1.name, player1.symbol)
player2 = Player.new('Player 2', 'O')
welcome_player(player2.name, player2.symbol)

puts "Let's start!\n\n"
board = Board.new
display_board(board.board)

while board.full == false
  player1_move = get_playermove(player1.name, board)
  board.update_board(player1.symbol, player1_move.to_i - 1)
  display_board(board.board)
  break if won_draw(board, player1)

  player2_move = get_playermove(player2.name, board)
  board.update_board(player2.symbol, player2_move.to_i - 1)
  display_board(board.board)
  break if won_draw(board, player2)
end
