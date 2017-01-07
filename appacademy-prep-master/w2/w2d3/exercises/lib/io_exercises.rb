# require "random"
# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.
def guessing_game
  number = rand(1..101)
  count = 0
  correct = false
  unless correct
    puts "guess a number"
    guess = gets.to_i
    count +=1

    case guess <=> number
    when -1
      puts "#{guess} is too low"
    when 1
      puts "#{guess} is too high"
    when 0
      puts "Correct"
      correct = true
    end
  end
  puts "You guessed #{count} times"

end

def file_reader(filename)


  File.open("{filename}-shuffled.txt") do |file|
    File.open(filename).readlines.shuffle do |line|
      file.puts line
    end
  end

end
