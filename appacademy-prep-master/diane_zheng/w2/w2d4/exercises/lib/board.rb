class Board
  attr_reader :grid
  def initialize(grid = [Array.new(3),Array.new(3),Array.new(3)] )
    @grid = grid
  end

  def place_mark(pos, mark)
    row = pos[0]
    col = pos[1]
    if empty?(pos)
      @grid[row][col] = mark
    end
  end

  #helper for ComputerPlayer
  def unplace_mark(pos)
    @grid[pos[0]][pos[1]] = nil
  end

  def empty?(pos)
    row = pos[0]
    col = pos[1]
    @grid[row][col] == nil
  end

  def winner
    center = @grid[1][1]
    top_right = @grid[0][2]
    bottom_left = @grid[2][0]
    win = nil

    #center
    if center != nil
      if [center, @grid[0][0], @grid[2][2]].uniq.length == 1
        win = center
      elsif [center, @grid[0][1], @grid[2][1]].uniq.length == 1
        win = center
      elsif [center, top_right, bottom_left].uniq.length == 1
        win = center
      elsif [center, @grid[1][0], @grid[1][2]].uniq.length == 1
        win = center
      end
    end
    #top_right
    if top_right != nil
      if [top_right, @grid[0][0], @grid[0][1]].uniq.length == 1
        win = top_right
      elsif [top_right, @grid[1][2], @grid[2][2]].uniq.length == 1
        win = top_right
      end
    end
    #bottom_left
    if bottom_left != nil
      if [bottom_left, @grid[0][0], @grid[1][0]].uniq.length == 1
        win = bottom_left
      elsif [bottom_left, @grid[2][1], @grid[2][2]].uniq.length == 1
        win = bottom_left
      end
    end
    win
  end

  def over?
    over = true
    @grid.each do |row|
      if row.include?(nil) && !winner
        over = false
      end
    end
    over
  end

  def display
    str = ""
    @grid.each do |row|
      row.each do |col|
        if col != nil
          str << col.to_s
        else
          str << ""
        end
      end
      str<< "\n"
    end
    puts str
  end

end
