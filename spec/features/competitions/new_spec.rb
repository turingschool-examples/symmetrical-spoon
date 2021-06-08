require 'rails_helper'

RSpec.describe 'create new team' do
  it 'creates a new team' do
    visit "/competitions/#{@game.id}"

    click_link 'Register Team'

    expect(current_path).to eq("/competitions/#{@game.id}/new")

    fill_in 'Hometown', with: 'LES'
    fill_in 'Nickname', with: 'LaSalle'

    click_on 'Submit'

    expect(current_path).to eq("/competitions/#{@game.id}")
    expect(page).to have_content('LES')
    expect(page).to have_content('LaSalle')
  end
end
