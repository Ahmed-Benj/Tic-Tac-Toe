require_relative '../lib/tic_tac_toe'
require_relative '../lib/player'
require_relative '../lib/game'

describe Game do
  let(:game) { Game.new }
  let(:board) { Board.new }
  let(:playerx) { Player.new('Player 1', 'X') }

  describe '#welcome_player' do
    it 'welcomes player' do
      expect(game.welcome_player('A', 'X')).to eq("\nA will play with X\n\n")
    end
  end

  describe '#display_board' do
    it 'displays board' do
      expect(game.display_board(board.board)).to eq("+---+---+---+\n|\
   |   |   |\n+---+---+---+\n|   |   |   |\n+---+---+---+\n|   |\
   |   |\n+---+---+---+\n\n")
    end
  end

  # DRAW_board board = ['X','O','O','O','X','X','X','X','O']
  # WIN_board_X board = ['X','O',' ',' ','X','O',' ',' ','X']
  # WIN_board_X board = ['O','O','X',' ','X','O','X',' ',' ']
  # WIN_board_O board = [' ',' ','X','O','O','O',' ',' ','X']
  # NoWIN_NoDRAW_board_X board = [' ',' ',' ','X',' ',' ',' ',' ',' ']

  describe '#won_draw' do
    it 'defines draw' do
      board.board = %w[X O O O X X X X O]
      expect(game.won_draw(board, playerx)).to eq(true)
    end
    it 'defines win' do
      board.board = ['X', 'O', ' ', ' ', 'X', 'O', ' ', ' ', 'X']
      expect(game.won_draw(board, playerx)).to eq(true)
    end
    it 'defines neither win nor draw' do
      board.board = [' ', ' ', ' ', 'X', ' ', ' ', ' ', ' ', ' ']
      expect(game.won_draw(board, playerx)).to eq(false)
    end
  end
end

describe Board do
  let(:board) { Board.new }

  describe '#won' do
    it 'checks winner X' do
      board.board = ['O', 'O', 'X', ' ', 'X', 'O', 'X', ' ', ' ']
      expect(board.won('X')).to eq(true)
    end
    it 'checks winner O' do
      board.board = [' ',' ','X','O','O','O',' ',' ','X']
      expect(board.won('O')).to eq(true)
    end
  end

  describe '#full' do
    it 'checks if board is full' do
      board.board = [' ', 'X', 'O', 'X', 'X', 'O', 'O', 'X', 'X']
      expect(board.full).to eq(false)
    end
    it 'checks if board is full' do
      board.board = ['O', 'X', 'O', 'X', 'X', 'O', 'O', 'X', 'X']
      expect(board.full).to eq(true)
    end
  end

end
