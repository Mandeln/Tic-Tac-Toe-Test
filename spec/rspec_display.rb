require_relative '../lib/display'


RSpec.describe Display do
  let(:display) { Display.new }

  describe '#make_board' do
    it 'Returns a board with numbers from 1 to 9' do
      expect(display.make_board).to eql([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
    end
    it 'Doesnt return an empty board' do
      expect(display.make_board).not_to eql([['', '', ''], ['', '', ''], ['', '', '']])
    end
  end
  describe '#get_players' do
    it 'Returns player 2 symbol' do
      expect(display.get_players('X')).to eql('O')
    end
    it 'Doesnt return player 1 symbol' do
      expect(display.get_players('X')).not_to eql('X')
    end
  end
end
