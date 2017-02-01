require "byebug"
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){Array.new}
    place_stones
  end

  def place_stones
    empty_cups = [6,13]
    stone = "stone".to_sym
    4.times do |i|
      @cups.each_with_index do |el,idx|
        el << stone unless empty_cups.include?(idx)
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1,14)
  end

  def make_move(start_pos, current_player_name)
    side = (current_player_name == @name1) ? "a" : "b"
    stones = @cups[start_pos]
    @cups[start_pos] = []
    i = 1 + start_pos
    until stones.empty?
      if i > 12 && side == "a"
        i = i-12
      elsif i > 13 && side =="b"
        i = 6 + i -13
      end

      @cups[i] << stones.pop
      i +=1
    end
    if [6,13].include?(i-1)
      next_turn(i-1)
    end

    if @cups[i-1].length == 1
      return :prompt
    elsif @cups[i-1].length <1
      return :switch
    end
    return (i-1) if @cups[i-1].length > 1


  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 13
      make_move(7,@name2)
    else
      make_move(1, @name1)
    end

    render

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?

    @cups[0..5].flatten.empty? || @cups[7..12].flatten.empty?

  end

  def winner
    return :draw if @cup[6] == @cup[13]
    return @name1 if @cup[6].length == 6
    return @name2 if @cup[13].length == 6
  end
end
