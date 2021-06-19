class Board
  BOARD_WIDTH = 8
  BOARD_HEIGHT = 8
  EMPTY_CELL = ' '

  def initialize(*pieces)
    @rows = Array.new(BOARD_WIDTH)
    @rows.map! { Array.new(BOARD_HEIGHT, EMPTY_CELL) }
  end

  def to_s
    board_str = horizontal_edge + "\n"
    @rows.each do |row|
      board_str += board_row(row) + "\n"
      board_str += horizontal_edge + "\n"
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
end
