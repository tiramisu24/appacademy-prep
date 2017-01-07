require "byebug"
class Code
  PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow,
    "O" => :orange,
    "P" => :purple,
  }
    attr_accessor :pegs
    def initialize(pegs)
      @pegs = pegs
      #initilaize pegs
    end

    def self.parse(str)
      # debugger
      input = str.split("").map(&:upcase)
      unless self.valid_color?(input)
        raise Exception
        return "no such colors"
      end
      player_code = Code.new(input)
    end

    def self.random
      input = []
      color_keys = PEGS.keys
      4.times do |i|
          input << color_keys[rand(0..6)]
      end
      Code.new(input)
    end

    def self.valid_color?(arr)
      arr.each do |color|
        unless PEGS.keys.include?(color)
          return false
        end
      end
      return true
    end

    def [](guess)
      pegs[guess]
    end

    def exact_matches(guess)
      # debugger
      matches = 0
      @pegs.each_with_index do |color, idx|
        if color == guess[idx]
          matches +=1
        end
      end
      matches
    end

    def near_matches(guess)
      # debugger
      matches = 0
      pegs_copy = @pegs.clone
      guess.pegs.each_with_index do |color, idx|
        if pegs_copy.include?(color) && (color != pegs_copy[idx])
          matches +=1
          idx_remove = pegs_copy.index(color)
          pegs_copy[idx_remove] = nil
        end
      end
      matches
    end

    def == (guess)
      same = true
      @pegs.each_with_index do |color,idx|
        if color != guess[idx]
          same = false
        end
      end
      same
    end
end

class Game
  attr_reader :secret_code
  def initialize(code = Code.random)
    @secret_code = code
  end

  def get_guess(input = "BBBB")
    Code.parse(input)
  end

  def display_matches(code)
    puts "You got #{@secret_code.exact_matches(code)} exact matches!"
    puts "You got #{@secret_code.near_matches(code)} near matches!"
  end


end
