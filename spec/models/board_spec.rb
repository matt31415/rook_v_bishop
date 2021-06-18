require 'board'

RSpec.describe Board do
  it 'prints an empty board' do
    expect(Board.new.to_s).to eq('hello world')
  end
end
