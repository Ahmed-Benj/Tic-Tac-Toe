#!/usr/bin/env ruby

require_relative '../lib/tic_tac_toe'
require_relative '../lib/player'
require_relative '../lib/game'

game = Game.new

puts "Welcome to rubys Tic-Tac-Toe !\n\n"
player1 = Player.new('Player 1', 'X')
player1.getname
puts game.welcome_player(player1.name, player1.symbol)
player2 = Player.new('Player 2', 'O')
player2.getname
puts game.welcome_player(player2.name, player2.symbol)

puts "Let's start!\n\n"
board = Board.new

puts game.display_board(board.board)

while board.full == false
  player1_move = game.get_playermove(player1.name, board)
  board.update_board(player1.symbol, player1_move.to_i - 1)
  puts game.display_board(board.board)
  break if game.won_draw(board, player1)

  player2_move = game.get_playermove(player2.name, board)
  board.update_board(player2.symbol, player2_move.to_i - 1)
  puts game.display_board(board.board)
  break if game.won_draw(board, player2)
end
