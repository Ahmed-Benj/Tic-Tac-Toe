require_relative '../lib/board'
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
  let(:board1) { Board.new }

  describe '#won' do
    it 'checks winner X' do
      board.board = ['O', 'O', 'X', ' ', 'X', 'O', 'X', ' ', ' ']
      expect(board.won('X')).to eq(true)
    end
    it 'checks winner O' do
      board.board = [' ', ' ', 'X', 'O', 'O', 'O', ' ', ' ', 'X']
      expect(board.won('O')).to eq(true)
    end
  end

  describe '#full' do
    it 'checks if board is full' do
      board.board = [' ', 'X', 'O', 'X', 'X', 'O', 'O', 'X', 'X']
      expect(board.full).to eq(false)
    end
    it 'checks if board is full' do
      board.board = %w[O X O X X O O X X]
      expect(board.full).to eq(true)
    end
  end

  describe '#position_taken' do
    it 'checks if position 0 is taken' do
      board.board = ['X', ' ', ' ', ' ', ' ', ' ', 'O', ' ', ' ']
      expect(board.position_taken(0)).to eq(true)
    end
    it 'checks if position 4 is taken' do
      board.board = [' ', ' ', ' ', ' ', ' ', ' ', 'X', ' ', ' ']
      expect(board.position_taken(4)).not_to eq(true)
    end
  end

  describe '#update_board' do
    it 'checks if it updates board correctly' do
      board.board = ['X', ' ', ' ', ' ', ' ', ' ', 'O', ' ', ' ']
      board1.board = ['X', ' ', ' ', ' ', 'X', ' ', 'O', ' ', ' ']
      expect(board.update_board('X', 4)).to eq(board1.board)
    end
    it 'checks if it updates board correctly' do
      board.board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
      board1.board = [' ', ' ', ' ', ' ', ' ', ' ', 'O', ' ', ' ']
      expect(board.update_board('O', 5)).not_to eq(board1.board)
    end
  end
end
