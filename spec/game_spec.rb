require 'game'

describe Game do
  subject(:game) { described_class.new(player1, player2) }
  subject(:finished_game) { described_class.new(dead_player, player2) }
  let(:player1) { double :player, hit_points: 100 }
  let(:player2) { double :player, hit_points: 100 }
  let(:dead_player) { double :player, hit_points: 0 }

  describe '#player1' do
    it 'retrieves the first player' do
      expect(game.player1).to eq(player1)
    end
  end

  describe '#player2' do
    it 'retrieves the second player' do
      expect(game.player2).to eq(player2)
    end
  end

  describe '#current_turn' do
    it 'starts as player1' do
      expect(game.current_turn).to eq player1
    end

    it 'switches the turn' do
      game.switch_turns
      expect(game.current_turn).to eq player2
    end
  end

  describe '#opponent of' do
    it 'returns the opponent of the player' do
      expect(game.opponent_of(player1)).to eq player2
      expect(game.opponent_of(player2)).to eq player1
    end
  end

  describe '#game_over?' do
    it 'returns false if neither player has zero HP' do
      expect(game.game_over?).to be false
    end

    it 'returns true if at least one player is at 0HP' do
      expect(finished_game.game_over?).to be true
    end
  end

  describe '#loser' do
    it 'returns the player who fell to 0HP first' do
      expect(finished_game.loser).to eq dead_player
    end
  end
end