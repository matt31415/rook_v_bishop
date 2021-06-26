require 'rook_player'
require 'rook'

RSpec.describe RookPlayer do
  describe '#make_move' do
    let(:player) { RookPlayer.new }
    let(:piece) { Rook.new('d4') }

    it 'moves up without wrapping' do
      expect(player).to receive(:move_direction).and_return(:up)
      expect(player).to receive(:move_distance).and_return(3)

      player.make_move(piece)
      expect(piece.position).to eq('d7')
    end

    it 'moves right without wrapping' do
      expect(player).to receive(:move_direction).and_return(:right)
      expect(player).to receive(:move_distance).and_return(3)

      player.make_move(piece)
      expect(piece.position).to eq('g4')
    end

    it 'moves up with wrapping' do
      expect(player).to receive(:move_direction).and_return(:up)
      expect(player).to receive(:move_distance).and_return(5)

      player.make_move(piece)
      expect(piece.position).to eq('d1')
    end

    it 'moves right with wrapping' do
      expect(player).to receive(:move_direction).and_return(:right)
      expect(player).to receive(:move_distance).and_return(5)

      player.make_move(piece)
      expect(piece.position).to eq('a4')
    end

    it 'moves up with double wrapping' do
      piece.position = 'd8'
      expect(player).to receive(:move_direction).and_return(:up)
      expect(player).to receive(:move_distance).and_return(11)

      player.make_move(piece)
      expect(piece.position).to eq('d3')
    end

    it 'moves right with double wrapping' do
      piece.position = 'h4'
      expect(player).to receive(:move_direction).and_return(:right)
      expect(player).to receive(:move_distance).and_return(11)

      player.make_move(piece)
      expect(piece.position).to eq('c4')
    end
  end
end
