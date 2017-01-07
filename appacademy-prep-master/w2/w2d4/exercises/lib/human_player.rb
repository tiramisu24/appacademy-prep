require "byebug"
class HumanPlayer
  attr_reader :name
  attr_accessor :mark

  def initialize(name, mark= :X)
    @name = name
    @mark = mark
  end

  def get_move
    puts "/where/"
    move = gets.chomp.split(", ").map(&:to_i)
  end

  def display(board)
    # debugger
    # @board = board
    board.display
    puts "/X/"
  end
end
