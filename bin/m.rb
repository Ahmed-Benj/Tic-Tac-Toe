
board = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
def display_board(board,position,symbol)
  board = board.map {|x| x==position ? symbol : x}
  puts '+---+---+---+'
  puts "| #{board[0]} | #{board[1]} | #{board[2]} |"
  puts '+---+---+---+'
  puts "| #{board[3]} | #{board[4]} | #{board[5]} |"
  puts '+---+---+---+'
  puts "| #{board[6]} | #{board[7]} | #{board[8]} |"
  puts '+---+---+---+'
end
 puts (display_board(board,'2','O')).class
 display_board(board,'2','O') 
 
 board = display_board(board,'3','X') 