require "hangman"
require "human"
class ComputerPlayer
  attr_reader :secret_word
  attr_accessor :guess, :candidate_words, :dictionary
  def file_dict(filename)
    ComputerPlayer.new(File.readlines(filename))
  end

  def initialize(dictionary)
    @dictionary = dictionary
    # @guess_letter = ("a".."z").to_a
    @candidate_words = @dictionary

  end
  def pick_secret_word
    pick = rand(0...@dictionary.length)
    @secret_word = @dictionary[pick]
    @secret_word.length
  end

  def check_guess(guess)
    found_letters = []
    @secret_word.each_char.with_index do |letter, idx|
      found_letters << idx if letter == guess
    end
    found_letters
  end

  def update_candidate_words(response, idx_arr)
    if idx_arr.empty?
      @candidate_words.each_with_index do |word, idx|
        if word.include?(response)
          @candidate_words[idx] = nil
        end
      end
    end

    @candidate_words.each_with_index do |word, word_idx|
      idx_arr.each do |idx|
        if word[idx] != response
          @candidate_words[word_idx] = nil
        end
      end
    end
    @candidate_words.compact!
  end

  def register_secret_length(len)
    guess_word_length = len
    @candidate_words = []
    @dictionary.each do |word|
      @candidate_words << word if word.length == len
    end
  end

  def handle_response(response, response_idx)
    update_candidate_words(response, response_idx)
    @guess = guess

  end

  def guess(board = [])
    letter_count = {}
    @candidate_words.each do |word|
      word.each_char do |char|
        if !board.include?(char) && letter_count.include?(char)
          letter_count[char] +=1
        else
          letter_count[char] =0
        end
      end
    end
    most_common = letter_count.values.sort[-1]
    guess = letter_count.key(most_common)
    #narrow candidate words down.pick letter based on prequency?
    # guess = @guess_letter.sample
  end

end
