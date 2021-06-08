require 'rails_helper'

RSpec.describe 'Competition Show Page' do

  #   User Story 2 - Competition Show Page
  #
  # As a user
  # When I visit a competition's show page
  # Then I see the competition's name, location, and sport
  # And I see the name and hometown of all teams in this competition
  # And I see the average age of all players in the competition

  it 'Story 2' do
    competition_1 = Competition.create!(name: 'Mens Regional', location: 'Louisville', sport: 'basketball')
    hometown_1 = Hometown.create!(hometown: 'Leesburg', nickname: 'Rockets')
    hometown_2 = Hometown.create!(hometown: 'Denver', nickname: 'Nuggets')
    hometown_3 = Hometown.create!(hometown: 'Phoenix', nickname: 'Suns')

    player_1 = hometown_1.players.create!(name: 'Billy', age: 20)
    player_2 = hometown_1.players.create!(name: 'Sam', age: 22)

    player_3 = hometown_2.players.create!(name: 'Phil', age: 22)
    player_4 = hometown_2.players.create!(name: 'Tim', age: 24)

    player_5 = hometown_3.players.create!(name: 'Ralph', age: 26)
    player_6 = hometown_3.players.create!(name: 'Rick', age: 28)

    Event.create!(competition: competition_1, hometown: hometown_1)
    Event.create!(competition: competition_1, hometown: hometown_2)
    Event.create!(competition: competition_1, hometown: hometown_3)

    visit "/competitions/#{competition_1.id}"
    expect(page).to have_content('Mens Regional')
    expect(page).to have_content('Louisville')
    expect(page).to have_content('basketball')
    # save_and_open_page
    expect(page).to have_content(21)
    expect(page).to have_content(23)
    expect(page).to have_content(27)
  end

  #   As a user
  # When I visit a competition's show page
  # Then I see a link to register a new team
  # When I click this link
  # Then I am taken to a new page where I see a form
  # When I fill in this form with a team's hometown and nickname
  # And I click submit
  # Then I am redirected back to the competition's show page
  # And I see the new team I created listed

  it 'Story 3' do
    competition_1 = Competition.create!(name: 'Mens Regional', location: 'Louisville', sport: 'basketball')
    visit "/competitions/#{competition_1.id}"
    expect(page).to have_button("Add a New Team")
    click_on("Add a New Team")
    expect(current_path).to eq("/competitions/#{competition_1.id}/teams/new")
    fill_in('hometown', with: "Portland")
    fill_in('nickname', with: "Trail Blazers")
    click_on("Submit")
    expect(current_path).to eq("/competitions/#{competition_1.id}")
    expect(page).to have_content("Portland")
  end


end
