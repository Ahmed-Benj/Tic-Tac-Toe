#!/usr/bin/env ruby
##rubocop:disable all

class Player
  attr_accessor :name
  attr_accessor :player

  def initialize(player)
    @player = player
    get_name
  end

  def prompt
    print "Enter #{@player}'s name: "
    @name = gets.chomp
    STDERR.puts "Name can't be empty.#{@display_tries} time(s) left" if @name.empty?
  end

  def get_name
    max_tries = 3
    @display_tries = max_tries-1
    max_tries.times do
      prompt
      @display_tries-=1
      return if !@name.empty?
    end
    exit_game("exceeded #{max_tries} tries")
  end
end

def exit_game(reason)
  puts "Exiting the game : #{reason}"
  exit
end

puts "Welcome to rubys Tic-Tac-Toe !\n\n"
  player1 = Player.new("Player 1")
  player2 = Player.new("Player 2")
