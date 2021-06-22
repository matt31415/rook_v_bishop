require 'piece'

class Bishop < Piece
  def to_s
    'B'
  end

  def can_move_to?(destination)
    return false if destination == position

    dest_col, dest_row = destination.split(//)
    curr_col, curr_row = position.split(//)

    (dest_col.ord - curr_col.ord).abs == (dest_row.to_i - curr_row.to_i).abs
  end
end
