#!/usr/bin/env ruby
##rubocop:disable all

def exit_game(reason)
  puts "Exiting the game : #{reason}"
  exit
end

class Player
  attr_accessor :name, :player

  def initialize(player)
    @player = player
    getname
  end

  def prompt
    print "Enter #{@player}'s name: "
    @name = gets.chomp
    warn "Name can't be empty.#{@display_tries} time(s) left" if @name.empty?
  end

  def getname
    max_tries = 3
    @display_tries = max_tries - 1
    max_tries.times do
      prompt
      @display_tries -= 1
      return unless @name.empty?
    end
    exit_game("exceeded #{max_tries} tries")
  end
end

class Board
  winning_cases =
    [[1 2 3] [4 5 6] [7 8 9]
  [1 4 7] [2 5 8] [3 6 9]
  [1 5 9] [3 5 7]
  ]
  def initialize
    @board = %w[1 2 3 4 5 6 7 8 9]
    display_board
  end

  def display_board(symbol = nil, position = nil)
    @board = @board.map do |x|
      x == position ? symbol : x
    end
    puts '+---+---+---+'
    puts "| #{@board[0]} | #{@board[1]} | #{@board[2]} |"
    puts '+---+---+---+'
    puts "| #{@board[3]} | #{@board[4]} | #{@board[5]} |"
    puts '+---+---+---+'
    puts "| #{@board[6]} | #{@board[7]} | #{@board[8]} |"
    puts "+---+---+---+ \n\n"
    @board
  end
end

puts "Welcome to rubys Tic-Tac-Toe !\n\n"
player1 = Player.new('Player 1')
player2 = Player.new('Player 2')

puts "\n#{player1.name} will play with X and #{player2.name} will play with O\n\n"
puts "Let's start!\n\n"

board = Board.new
puts 'choose number from : ' #+ class(board).to_s

board.class
