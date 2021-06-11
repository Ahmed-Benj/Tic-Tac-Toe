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

  describe '#display_board' do
    it 'displays board' do
      expect(game.display_board(board.board)).to eq("+---+---+---+\n|\
   |   |   |\n+---+---+---+\n|   |   |   |\n+---+---+---+\n|   |\
   |   |\n+---+---+---+\n\n")
    end
  end

  describe '#won_draw' do
    
  let(:playerx) { Player.new('Player 1', 'X') }
    #playerx.name = 'Player X'
    let(:board) { Board.new }
    board.board = ['X','O','X','X','O','O','O','X','X']
        it 'defines winning or drawing' do
      expect(game.won_draw(['X','O','X','X','O','O','O','X','X'],playerx)).to eq(false)
    end
  end
end
