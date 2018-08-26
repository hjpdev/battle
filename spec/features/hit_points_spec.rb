
feature 'View HP' do
  scenario 'Allows P1 to see P2\'s HP' do
    sign_in_and_play
    expect(page).to have_content('B: 100HP')
  end

  scenario 'Allows P2 to see P1\'s HP' do
      sign_in_and_play
      expect(page).to have_content('A: 100HP')
  end
end