require 'attack' 

describe Attack do
  let(:mock_target) { double :player, hit_points: 100 }

  describe '#attack' do
    it 'should reduce the targets HP' do
      allow(mock_target).to receive(:receive_damage) { 90 }
      expect(subject.attack(mock_target)).to eq(90)
    end
  end
end