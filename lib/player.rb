##rubocop:disable all

require 'colorize'

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
