# Towers of Hanoi
#
# Write a Towers of Hanoi game:
# http://en.wikipedia.org/wiki/Towers_of_hanoi
#
# In a class `TowersOfHanoi`, keep a `towers` instance variable that is an array
# of three arrays. Each subarray should represent a tower. Each tower should
# store integers representing the size of its discs. Expose this instance
# variable with an `attr_reader`.
#
# You'll want a `#play` method. In a loop, prompt the user using puts. Ask what
# pile to select a disc from. The pile should be the index of a tower in your
# `@towers` array. Use gets
# (http://andreacfm.com/2011/06/11/learning-ruby-gets-and-chomp.html) to get an
# answer. Similarly, find out which pile the user wants to move the disc to.
# Next, you'll want to do different things depending on whether or not the move
# is valid. Finally, if they have succeeded in moving all of the discs to
# another pile, they win! The loop should end.
#
# You'll want a `TowersOfHanoi#render` method. Don't spend too much time on
# this, just get it playable.
#
# Think about what other helper methods you might want. Here's a list of all the
# instance methods I had in my TowersOfHanoi class:
# * initialize
# * play
# * render
# * won?
# * valid_move?(from_tower, to_tower)
# * move(from_tower, to_tower)
#
# Make sure that the game works in the console. There are also some specs to
# keep you on the right track:
#
# ```bash
# bundle exec rspec spec/towers_of_hanoi_spec.rb
# ```
#
# Make sure to run bundle install first! The specs assume you've implemented the
# methods named above.
require  "byebug"
class TowersOfHanoi
attr_reader :towers
  def initialize
    @towers =[[3,2,1],[],[]]
  end

  def move (from, to)
      disc = @towers[from].pop
      @towers[to] << disc

  end

  def valid_move?(from, to)
    f_disc = @towers[from].last
    t_disc = @towers[to].last

    if f_disc == nil
      return false
    elsif t_disc == nil
      return true
    elsif f_disc > t_disc
      return false
    end
    true
  end

  def won?
    length = @towers.map(&:length)
    win_config1 = [0,3,0]
    win_config2 = [0,0,3]
    if length == win_config1 || length == win_config2
      return true
    end
    return false
  end

  def play
    until won?
      puts "from where?"
      from = gets.to_i
      puts "to where?"
      to = gets.to_i
      if from == 9 || to ==9
        break
      end
      if valid_move?(from,to)
        move(from,to)
      else
        puts "invalid"
      end
      display
    end
  end

  def render
    "Tower 0:" + @towers[0].join(" ") + "\n" +
    "Tower 1:" + @towers[1].join(" ") + "\n" +
    "Tower 2:" + @towers[2].join(" ") + "\n"
  end

  def display
    system('clear')
    puts render
  end

end

if $PROGRAM_NAME == __FILE__
  TowersOfHanoi.new().play
end
