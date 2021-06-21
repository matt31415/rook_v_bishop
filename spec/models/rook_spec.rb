require 'rook'

RSpec.describe Rook do
  describe '#next_move' do
    it 'returns a hash with direction and distance' do
      move = Rook.new('a1').next_move
      expect(move.keys).to contain_exactly(:direction, :distance)
    end
  end
end
