class RookPlayer
  def make_move(piece)
    direction = move_direction
    distance = move_distance

    new_pos = case direction
              when :up then vertical_move(piece, distance)
              when :right then horizontal_move(piece, distance)
              end

    puts "Moving Rook from #{piece.position} to #{new_pos}\n"\
      "Direction: #{direction}, Distance: #{distance}"
    piece.position = new_pos
  end

  private

  def move_direction
    rand(2) ? :up : :right
  end

  def move_distance
    rand(1..6) + rand(1..6)
  end

  def vertical_move(piece, distance)
    new_row = (piece.row.to_i + distance - 1) % 8 + 1
    piece.col + new_row.to_s
  end

  def horizontal_move(piece, distance)
    cols = %w[a b c d e f g h]
    curr_col_index = cols.index(piece.col)
    new_col_index = (curr_col_index + distance) % 8
    cols[new_col_index] + piece.row
  end
end
