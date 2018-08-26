describe 'Switch turns' do
  context 'seeing the current turn' do
    scenario 'at the start of the game' do
      sign_in_and_play
      expect(page).to have_content("A's turn.")
     end

     scenario 'after first player attacks' do
      sign_in_and_play
      click_button('Standard Attack')
      click_button('OK')
      expect(page).not_to have_content("A's turn.")
      expect(page).to have_content("B's turn.")
     end
  end
end