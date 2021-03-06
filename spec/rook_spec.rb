require 'rook'

RSpec.describe Rook do
  describe '#can_move_to?' do
    let(:rook) { Rook.new('c4') }

    it 'can move to a spot on the same row' do
      expect(rook.can_move_to?('e4')).to be_truthy
    end

    it 'can move to a spot on the same column' do
      expect(rook.can_move_to?('c6')).to be_truthy
    end

    it "can't stay in one place" do
      expect(rook.can_move_to?('c4')).to be_falsey
    end

    it "can't move unless it's a straight line" do
      expect(rook.can_move_to?('d5')).to be_falsey
    end
  end
end
