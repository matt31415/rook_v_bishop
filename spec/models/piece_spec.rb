require 'piece'

RSpec.describe Piece do
  describe 'validation' do
    let(:piece) { Piece.new('a1') }

    it 'allows valid positions' do
      piece.position = 'b5'
      expect(piece.position).to eq('b5')
    end

    it "doesn't allow invalid rows" do
      expect { piece.position = 'd9' }.to raise_error('Invalid position')
    end

    it "doesn't allow invalid columns" do
      expect { piece.position = 'h1' }.to raise_error('Invalid position')
    end

    it 'converts uppercase positions to lowercase' do
      piece.position = 'D3'
      expect(piece.position).to eq('d3')
    end
  end

  describe '#initialize' do
    it 'allows valid positions' do
      piece = Piece.new('a1')
      expect(piece.position).to eq('a1')
    end

    it "doesn't allow invalid positions" do
      expect { Piece.new('k9') }.to raise_error('Invalid position')
    end
  end
end
