require "byebug"
class BattleshipGame
  attr_reader :board, :player
  def initialize (player, board)
    @board = board
    @player = player
  end

  def attack (arr)
    if @board.empty?(arr)
      debugger
      @board.grid[arr[0]][arr[1]] = :x
    end
    debugger
  end
end
