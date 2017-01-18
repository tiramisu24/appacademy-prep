require "byebug"
require_relative "board"
require_relative "player"
class Board
  attr_accessor :grid

  def initialize(grid = self.class.default_grid)
    @grid = grid
  end

  def self.default_grid
    @grid = Array.new(10){Array.new(10)}
  end

  def count
    total = 0
    @grid.each do |row|
      row.each do |col|
        if col == :s
          total +=1
        end
      end
    end
    total
  end

  def empty?(position = nil)
    if position == nil
      return empty_board?
    end
    row = position[0]
    col = position [1]
    empty = true
    if @grid[row][col] != nil
      empty = false
    end
    empty
  end

  def empty_board?
    @grid.each do |row|
      row.each do |col|
        if col == :s
          return false
        end
      end
    end
    return true
  end

  def full?
    @grid.each do |row|
      row.each do |col|
        if col == nil
          return false
        end
      end
    end
    return true
  end

  def place_random_ship
    if full?
      raise Exception
    end
    row = rand(0...@grid.length)
    col = rand(0...@grid.length)
    placed = false
    unless placed
      if empty?([row,col])
        @grid[row][col] = :s
        placed = true
      end
    end
  end

  def won?
    @grid.each do |row|
      row.each do |col|
        if col == :s
          return false
        end
      end
    end
    return true
  end

  def [](arr)
    @grid[arr[0]][arr[1]]
  end
  def []=(arr, val)
    @grid[arr[0]][arr[1]] = val
  end
end
