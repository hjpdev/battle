
feature 'Allows players to enter & see their names' do
  scenario 'Allows players to enter & see their names' do
    sign_in_and_play
    expect(page).to have_content 'A vs. B'
  end
end