require 'rails_helper'

RSpec.describe 'create new team' do
  it 'creates a new team' do
    @game = Competition.create!(name: 'Mens Regional', location: 'Brooklyn', sport:'Basketball')
    team = Team.create!(hometown: 'LES', nickname: 'LaSalle')
    visit "/competitions/#{@game.id}"

    click_link 'Register Team'

    visit "/teams/new"

    fill_in 'hometown', with: 'LES'
    fill_in 'nickname', with: 'LaSalle'

    click_on 'Submit'

    expect(current_path).to eq("/competitions/#{@game.id}")
    expect(page).to have_content('LES')
    expect(page).to have_content('LaSalle')
  end
end
