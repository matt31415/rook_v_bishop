# Architecture notes:
# - The state of the game is stored as a list of pieces with each
#   piece maintaining its own state
# - The board exists only to make printing easy but does not contain
#   state or logic
# - The game logic (whose turn it is, if the game is over, etc)
#   lives in the game object
# - The player is responsible for making moves

require 'rook'
require 'bishop'
require 'rook_player'
require 'chess_board'

class RookVBishopGame
  def initialize(
    rook: Rook.new('h1'),
    bishop: Bishop.new('c3'),
    player: RookPlayer.new
  )
    @rook = rook
    @bishop = bishop
    @player = player
    @turn = 1
  end

  def play(max_turns: 15)
    print_board

    loop do
      puts "\n" + '-' * 10 + " Turn: #{@turn} " + '-' * 10
      move_rook
      print_board
      @turn += 1

      return 'Rook wins by running out the clock' if end_of_game?(max_turns)
      return 'Rook wins by capturing bishop' if rook_captures_bishop?
      return 'Bishop wins by capturing rook' if bishop_captures_rook?
    end
  end

  private

  def move_rook
    @player.make_move(@rook)
  end

  def print_board
    puts ChessBoard.new(@rook, @bishop)
  end

  def end_of_game?(max_turns)
    @turn > max_turns
  end

  def rook_captures_bishop?
    @bishop.position == @rook.position
  end

  def bishop_captures_rook?
    @bishop.can_move_to?(@rook.position)
  end
end
