require_relative "board"
require_relative "player"

class BattleshipGame
  attr_reader :board, :player
  def initialize (player = HumanPlayer.new, board = Board.random)
    @board = board
    @player = player
  end

  def attack (arr)
    if @board.empty?(arr)
      @board[arr] = :x
    end
  end

  def play_turn
    attack(player.get_play)
  end

  def count
    @board.count
  end

  def game_over?
    @board.won?
  end

end
