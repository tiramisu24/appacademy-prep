require "byebug"
class ComputerPlayer
  attr_reader :name, :board
  attr_accessor :mark
  def initialize(name, mark = :O)
    @name = name
    @mark = mark
  end

  def display(board)
    @board = board
  end
  #
  def get_move
    #if winning move, return winning move
    move = win_move
    if move == nil
      row = rand(0...2)
      col = rand(0...2)#random
      move = [row, col]
    end
    move

  end
  #
  def win_move
    # debugger
    grid = @board.grid
    move = nil
    grid.each_with_index do |row, row_idx|
      # debugger
      row.each_with_index do |col, col_idx|
        if grid[row_idx][col_idx] != nil
          next
        end
        move = [row_idx, col_idx]

        @board.place_mark(move, @mark)
        if @board.winner != nil
          # debugger
          return move
        end
        @board.unplace_mark(move)
      end
    end
    move

  end
end
