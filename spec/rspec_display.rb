require_relative '../lib/display.rb'

display = Display.new

RSpec.describe Display do
    describe '#make_board' do
        it 'Returns a board with numbers from 1 to 9' do
            expect(display.make_board).to eql([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
        end
    end
    describe '#get_players' do
        it 'Returns player 2 symbol' do
        expect(display.get_players('X')).to eql('O') 
       end
    end
end