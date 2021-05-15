class TicTacToe

  def initialize
  end
  @@board = %w[1 2 3 4 5 6 7 8 9]
  def display_board

    puts @@board
  end
end

a =  TicTacToe.new
a.display_board
