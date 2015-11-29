require 'tictactoe'
include Tictactoe

describe Tictactoe do
  let(:player) {Player.new('Tom', 'X')}
  
  context 'Player' do
    it 'has a name' do
      expect(player.name).to eq 'Tom'
    end

    it 'has a figure assigned'

  end
end
