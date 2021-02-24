require_relative '../lib/game_logic'

game_logic = Logic.new('X', 'O')
test_draw = [%w[X O X], %w[O X X], %w[O X O]]
test_unfinished = [%w[X O X], ['O', 5, 'X'], ['O', 'X', 9]]
test_win = [%w[X O X], %w[O X X], %w[O X X]]
test_winingmove = [%w[X O X], %w[O X X], ['O', 'X', 9]]
test_drawingmove = [%w[X O X], %w[O X X], ['O', 'X', 9]]

RSpec.describe game_logic do
  describe '#numeric?' do
    it 'Returns true if the entered number is an integer' do
      expect(game_logic.numeric?(1)).to eql(true)
    end

    it 'Returns false for anything else thats not an Integer' do
      expect(game_logic.numeric?('Pepeissmol')).to eql(false)
    end
  end

  describe '#check_draw' do
    it 'Returns true when the whole board if full' do
      expect(game_logic.check_draw(test_draw)).to eql(true)
    end

    it 'Returns false when the whole board is not filled' do
      expect(game_logic.check_draw(test_unfinished)).to eql(false)
    end
  end

  describe '#check_win' do
    it 'Returns nil if theres not win combination' do
      expect(game_logic.check_win(test_draw)).to eql(nil)
    end

    it 'Returns true if theres a win combination' do
      expect(game_logic.check_win(test_win)).to eql(true)
    end
  end

  describe '#check_status' do
    it 'Returns true if the array entered is a draw' do
      expect(game_logic.check_status(test_draw)).to eql(true)
    end

    it 'Returns true if the array entered is a win' do
      expect(game_logic.check_status(test_win)).to eql(true)
    end

    it 'Returns false if the array entered is unfinished' do
      expect(game_logic.check_status(test_unfinished)).to eql(false)
    end
  end

  describe 'player_won' do
    it 'Returns true if move is nil' do
      expect(game_logic.player_won(test_winingmove, nil, true)).to eql(true)
    end

    describe 'check_if_filled' do
      it 'Returns true if the position is filled' do
        expect(game_logic.check_if_filled(test_unfinished, 1)).to eql(true)
      end
      it 'Returns false if the position is not filled' do
        expect(game_logic.check_if_filled(test_unfinished, 5)).to eql(false)
      end
    end

    describe 'check_move' do
      it 'Returns false and the board if the move is not a ending move' do
        expect(game_logic.check_move(test_unfinished, 5, true)).to eql([false, [%w[X O X], %w[O X X], ['O', 'X', 9]]])
      end

      it 'Returns true and the board if the move is a ending move' do
        expect(game_logic.check_move(test_winingmove, 9, true)).to eql([true, [%w[X O X], %w[O X X], %w[O X X]]])
      end

      it 'Returns true and the board if the move is a drawing move' do
        expect(game_logic.check_move(test_drawingmove, '9', false)).to eql([true, [%w[X O X], %w[O X X], %w[O X O]]])
      end
    end

    it 'Returns the same as check_move is the move is not nil' do
      expect(game_logic.player_won(test_winingmove, 9, true)).to eql([true, [%w[X O X], %w[O X X], %w[O X X]]])
    end
  end
end
