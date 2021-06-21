class ChessBoard
  BOARD_WIDTH = 8
  EMPTY_CELL = ' '.freeze

  def initialize(*pieces)
    @board = {}
    %w[a b c d e f g h].each do |col|
      (1..8).each do |row|
        @board["#{col}#{row}"] = nil
      end
    end
    pieces.each { |p| place_piece(p) }
  end

  def to_s
    board_str = horizontal_edge + "\n"
    [8, 7, 6, 5, 4, 3, 2, 1].each do |row|
      %w[a b c d e f g h].each do |col|
        board_str += "| #{piece_at(col, row)&.to_s || EMPTY_CELL} "
      end
      board_str += "|\n" + horizontal_edge + "\n"
    end

    board_str
  end

  private

  def horizontal_edge
    '-' * (BOARD_WIDTH * 4 + 1)
  end

  def board_row(row)
    '| ' + row.join(' | ') + ' |'
  end

  def piece_at(col, row)
    @board["#{col}#{row}"]
  end

  def place_piece(piece)
    @board[piece.position] = piece
  end
end
