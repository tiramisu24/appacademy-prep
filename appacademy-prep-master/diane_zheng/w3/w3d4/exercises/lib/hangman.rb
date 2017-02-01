# require "file"
require "byebug"
require "computer"
require "human"
class Hangman
  attr_reader :guesser, :referee, :board
  def initialize(players)
    @referee = players[:referee]
    @guesser = players[:guesser]
  end

  def setup
    length = (@referee.pick_secret_word)
    @guesser.register_secret_length(length)
    @board = Array.new(length)
  end

  def take_turn
    guess = @guesser.guess
    idx_guess = @referee.check_guess(guess)
    update_board(guess,idx_guess)
    @guesser.handle_response(guess)
  end

  def update_board(guess,idx_guess)
    if idx_guess == nil
      return
    end
    idx_guess.each do |idx|
      @board[idx] = guess
    end

  end

end
