
feature 'Attacking' do
  scenario 'attack Player 2' do
    sign_in_and_play
    click_button('Standard Attack')
    expect(page).to have_content('A attacked B')
  end

  scenario 'attacked by Player 2' do
    sign_in_and_play
    click_button('Standard Attack')
    click_button('OK')
    click_button('Standard Attack')
    expect(page).to have_content('B attacked A')
  end

  scenario 'reduce Player 2\'s HP by up to 10' do
    sign_in_and_play
    click_button('Standard Attack')
    click_button('OK')
    expect(page).not_to have_content('B: 100')
  end

  scenario 'reduce Player 1\'s HP by up to 10' do
    sign_in_and_play
    click_button('Standard Attack')
    click_button('OK')
    click_button('Standard Attack')
    click_button('OK')
    expect(page).not_to have_content('A: 100HP')
  end
end