# require_relative '../bin/main'
require_relative '../lib/tic_tac_toe'
require_relative '../lib/player'
require_relative '../lib/game'

describe Game do
  let(:game) { Game.new }

  describe '#welcome_player' do
    it 'welcomes player' do
      expect(game.welcome_player('A', 'X')).to eq("\nA will play with X\n\n")
    end
  end
  let(:board) { Board.new }
  describe '#display_board' do
    it 'displays board' do
      expect(game.display_board(board.board)).to eq("+---+---+---+\n|   |   |   |\n+---+---+---+\n|   |   |   |\n+---+---+---+\n|   |   |   |\n+---+---+---+\n\n")
    end
  end
end
