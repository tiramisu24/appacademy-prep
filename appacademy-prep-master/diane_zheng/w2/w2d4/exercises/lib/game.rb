require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'
require "byebug"
class Game
  attr_reader :player_one, :player_two, :board, :cur_player
  def initialize (player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @board = Board.new
  end
  #
  def play_turn

    move = current_player.get_move
    board.place_mark(move, @current_player.mark)
    switch_players!
  end


  def current_player
    @current_player ||= @player_one
  end

  def switch_players!
    # debugger
    case @current_player
    when @player_one
      @current_player = player_two
    when @player_two
      @current_player = player_one
    end
  end

end
