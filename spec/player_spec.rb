require 'player'

describe Player do
  subject(:a) { Player.new('A') }
  subject(:b) { Player.new('B') }

  describe '#name' do
    it 'returns the name' do
      expect(a.name).to eq('A')
    end
  end

  describe '#hit_points' do
    it 'returns the player\'s HP' do
      expect(a.hit_points).to eq described_class::DEFAULT_HP
    end
  end

  describe '#receive_damage' do
    it 'reduces the targets HP' do
      b.receive_damage
      expect(b.hit_points < described_class::DEFAULT_HP).to be true
    end
  end
end