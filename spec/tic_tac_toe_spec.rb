require('./bin/main')
require('./lib/tic_tac_toe')

board = Board.new

describe '#welcome_player' do
  it 'welcomes player' do
    expect(welcome_player('A', 'X')).to eq("\nA will play with X\n\n")
  end
end

describe '#display_board' do
  it 'displays board' do
    expect(display_board(board.board)).to eq("+---+---+---+\n|   |   |   |\n+---+---+---+\n|   |   |   |\n+---+---+---+\n|   |   |   |\n+---+---+---+\n\n")
  end
end
