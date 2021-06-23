require 'piece'

class Bishop < Piece
  def to_s
    'B'
  end

  def can_move_to?(destination)
    return false if destination == position

    dest_col, dest_row = destination.split(//)

    (dest_col.ord - col.ord).abs == (dest_row.to_i - row.to_i).abs
  end
end
