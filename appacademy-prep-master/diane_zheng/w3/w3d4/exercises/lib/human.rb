require "hangman"
require "computer"
class HumanPlayer
  def pick_secret_word
    puts "Pick word"
    gets.chomp
  end

  def get_length
    puts "How long is the secret word"
    gets.chomp
  end

  def check_guess(guess)
    puts "Guessed #{guess}. Enter positions the letters occur at. ENTER if #{guess} is not in the word"

    gets.chomp.split(",")
  end

#player guessing
  def register_secret_length(length)
    puts "The word you are guessing is #{length} long"
  end

  def guess
    puts "Guess a letter"
    gets.chomp
  end

  def handle_response(guess, idx_guess)
    if idx_guess.empty?
      puts "#{guess} is not in the word"
    else
      puts "Found #{guess} at #{idx_guess}"
    end
  end
end
