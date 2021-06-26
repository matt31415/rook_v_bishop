require 'rook'
require 'bishop'
require 'chess_board'
require 'rook_player'
require 'rook_v_bishop_game'

RSpec.describe Rook do
  describe '#play' do
    it 'returns rook win when clock runs out' do
      stationary_player = double('Player')
      allow(stationary_player).to receive(:make_move)

      game = RookVBishopGame.new(player: stationary_player)
      expect(game.play).to eq('Rook wins by running out the clock')
    end
  end

  it 'returns rook win when the rook captures the bishop' do
    rook = Rook.new('h1')
    lucky_player = double('Player')
    allow(lucky_player).to receive(:make_move) { rook.position = 'c3' }

    game = RookVBishopGame.new(player: lucky_player, rook: rook)
    expect(game.play).to eq('Rook wins by capturing bishop')
  end

  it 'returns bishop win when the rook can capture' do
    rook = Rook.new('h1')
    unlucky_player = double('Player')
    allow(unlucky_player).to receive(:make_move) { rook.position = 'e1' }

    game = RookVBishopGame.new(player: unlucky_player, rook: rook)
    expect(game.play).to eq('Bishop wins by capturing rook')
  end
end
