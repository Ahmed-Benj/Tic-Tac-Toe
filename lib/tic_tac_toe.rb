##rubocop:disable all

class Board
  attr_accessor :board

  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @display_board = %w[1 2 3 4 5 6 7 8 9]
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].freeze

  def won(symbol)
    WIN_COMBINATIONS.each do |win_combination|
      board_index0 = @board[win_combination[0]]
      board_index1 = @board[win_combination[1]]
      board_index2 = @board[win_combination[2]]
      return true if board_index0 == symbol && board_index1 == symbol && board_index2 == symbol
    end
    false
  end

  def full
    @board.all? { |e| e != ' ' }
  end

  def position_taken(position)
    @board[position] != ' '


  def update_board(symbol, position)
    @board = @board.map.with_index { |x, i| i == position ? symbol : x }
  end
end
