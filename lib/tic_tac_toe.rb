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

def display_board(board, symbol, position)
  board = board.map.with_index { |x, i| i == position ? symbol : x }
  puts '+---+---+---+'
  puts "| #{board[0]} | #{board[1]} | #{board[2]} |"
  puts '+---+---+---+'
  puts "| #{board[3]} | #{board[4]} | #{board[5]} |"
  puts '+---+---+---+'
  puts "| #{board[6]} | #{board[7]} | #{board[8]} |"
  puts "+---+---+---+ \n\n"
  board
end

def won(board, symbol)
  WIN_COMBINATIONS.each do |win_combination|
    board_index_0 = board[win_combination[0]]
    board_index_1 = board[win_combination[1]]
    board_index_2 = board[win_combination[2]]
    return true if board_index_0 == symbol && board_index_1 == symbol && board_index_2 == symbol
  end
  false
end

def full(board)
  board.all? { |e| e != '' }
end

def position_taken(board, position)
  board[position] != ''
end
