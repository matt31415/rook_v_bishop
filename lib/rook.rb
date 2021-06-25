require 'piece'

class Rook < Piece
  def to_s
    'R'
  end

  def can_move_to?(destination)
    (destination[0] == col) ^ (destination[1] == row)
  end
end
