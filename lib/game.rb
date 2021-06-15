class Game
  def initialize; end

  def welcome_player(name, symbol)
    "\n#{name} will play with #{symbol}\n\n"
  end

  def display_board(board)
    dis_board = separator = '+---+---+---+'
    i = 0
    3.times do
      dis_board = dis_board + "\n| #{board[i]} | #{board[i + 1]} | #{board[i + 2]} |\n" + separator
      i += 3
    end
    "#{dis_board}\n\n"
  end

  def exit_game(reason)
    puts "Exiting the game : #{reason}"
    exit
  end

  def querydata(msg)
    puts msg
    gets.chomp.strip
  end

  def get_playermove(playername, board)
    playermove = querydata("It's #{playername}'s turn!\n\nPlease select an available cell from the board (1-9)")
    while board.position_taken(playermove.to_i - 1) or !(1..9).to_a.include? playermove.to_i or playermove == ''
      puts 'this position is taken/not in range, please choose another one'
      playermove = querydata('')
    end
    playermove
  end

  def won_draw(board, player)
    # check if player has won ==> If yes break declaring winner
    if board.won(player.symbol)
      puts "Congratulations ! #{player.name} (#{player.symbol}) has won the game !!"
      return true
      # check if full(board) ==> If yes break declaring tie
    elsif board.full
      puts 'Break Tie'
      return true
    end
    false
  end
end
