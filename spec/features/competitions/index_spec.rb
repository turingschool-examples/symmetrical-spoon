require 'rails_helper'

RSpec.describe 'Competition Index Page' do

  #   User Story 1 - Competition Index
  #
  # As a user
  # When I visit the competion index
  # Then I see the names of all competitions
  # Each competition name links to its show page

  it '' do
    competition_1 = Competition.create!(name: 'Mens Regional', location: 'Louisville', sport: 'basketball')
    competition_2 = Competition.create!(name: 'Womens Regional', location: 'Louisville', sport: 'basketball')
    competition_3 = Competition.create!(name: 'Mens Volleyball', location: 'San Diego', sport: 'volleyball')
    visit "/competitions"
    # save_and_open_page
    expect(page).to have_button('Mens Regional')
    expect(page).to have_button('Womens Regional')
    expect(page).to have_button('Mens Volleyball')
    click_on('Mens Regional')
    expect(current_path).to eq( "/competitions/#{competition_1.id}")
  end


end
