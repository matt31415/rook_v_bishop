require 'piece'

class Rook < Piece
  def to_s
    'R'
  end

  def next_move
    {
      direction: move_direction,
      distance: move_distance
    }
  end

  def can_move_to?(destination)
    (destination[0] == position[0]) ^ (destination[1] == position[1])
  end

  private

  def move_direction
    rand(2) ? :up : :right
  end

  def move_distance
    rand(1..6)
  end
end
