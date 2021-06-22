require 'bishop'

RSpec.describe Bishop do
  describe '#can_move_to?' do
    let(:bishop) { Bishop.new('c4') }

    it 'can move to a spot northeast' do
      expect(bishop.can_move_to?('a6')).to be_truthy
    end

    it 'can move to a spot northwest' do
      expect(bishop.can_move_to?('d5')).to be_truthy
    end

    it 'can move to a spot southeast' do
      expect(bishop.can_move_to?('b3')).to be_truthy
    end

    it 'can move to a spot southwest' do
      expect(bishop.can_move_to?('f1')).to be_truthy
    end

    it "can't stay in one place" do
      expect(bishop.can_move_to?('c4')).to be_falsey
    end

    it "can't move off the diagonal" do
      expect(bishop.can_move_to?('d6')).to be_falsey
    end
  end
end
