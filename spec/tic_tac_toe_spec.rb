require('./bin/main')
require('./lib/tic_tac_toe')

# let(:board) { Board.new(' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ') }

describe '#welcome_player' do
  it 'welcomes player' do
    expect(welcome_player('A', 'X')).to eq("\nA will play with X\n\n")
  end
end
