require 'chess_board'
require 'rook'
require 'bishop'

RSpec.describe ChessBoard do
  describe 'to_s' do
    it 'prints an empty board' do
      empty_board = <<~BOARD
        ---------------------------------
        |   |   |   |   |   |   |   |   |
        ---------------------------------
        |   |   |   |   |   |   |   |   |
        ---------------------------------
        |   |   |   |   |   |   |   |   |
        ---------------------------------
        |   |   |   |   |   |   |   |   |
        ---------------------------------
        |   |   |   |   |   |   |   |   |
        ---------------------------------
        |   |   |   |   |   |   |   |   |
        ---------------------------------
        |   |   |   |   |   |   |   |   |
        ---------------------------------
        |   |   |   |   |   |   |   |   |
        ---------------------------------
      BOARD
      expect(ChessBoard.new.to_s).to eq(empty_board)
    end

    it 'prints a board with pieces in place' do
      board_with_pieces = <<~BOARD
        ---------------------------------
        | B |   |   |   |   |   |   |   |
        ---------------------------------
        |   |   |   |   |   |   |   |   |
        ---------------------------------
        |   |   |   |   |   |   |   |   |
        ---------------------------------
        |   |   | R |   |   |   |   |   |
        ---------------------------------
        |   |   |   |   |   |   |   |   |
        ---------------------------------
        |   |   |   |   |   |   |   |   |
        ---------------------------------
        |   |   |   |   |   |   |   |   |
        ---------------------------------
        |   |   |   |   |   |   |   |   |
        ---------------------------------
      BOARD
      board = ChessBoard.new(
        Rook.new('c5'),
        Bishop.new('a8')
      )
      expect(board.to_s).to eq(board_with_pieces)
    end
  end
end
