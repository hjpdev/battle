feature 'Game Over' do
  context 'When Player 1 reaches 0HP first' do
    scenario 'Player 1 loses' do
      sign_in_and_play
      attack_and_confirm
      subject.instance_variable_set(:@hit_points, 1)
      click_button('Standard Attack')
      expect(page).to have_content('A loses...')
    end
  end
end