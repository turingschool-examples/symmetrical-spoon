require 'rails_helper'

RSpec.describe 'competition show' do
  it 'links from index to competition show' do
    competition_1 = Competition.create!(name: "Basket Weavers Interstallar", location: "Mars", sport: "Basket Weaving")
    team_1 = Team.create!(nick_name: "The Chompin' Beavers", home_town: "Beaver")
    player_1 = team_1.players.create!(name: "Joe", age: 30)
    player_2 = team_1.players.create!(name: "Mary", age: 40)
    player_3 = team_1.players.create!(name: "Susan", age: 50)
    CompetitionTeam.create!(competition: competition_1, team: team_1)
    visit "/competitions"

    expect(page).to have_link("#{competition_1.name}")
    click_link "#{competition_1.name}"
    expect(current_path).to eq("/competitions/#{competition_1.id}")
    expect(page).to have_content("#{competition_1.name}")
    expect(page).to have_content("#{competition_1.location}")
    expect(page).to have_content("#{competition_1.sport}")
    expect(page).to have_content("#{team_1.nick_name}")
    expect(page).to have_content("#{team_1.home_town}")
    expect(page).to have_content("#{team_1.average_age}")
  end

  it 'can register a new team' do
    competition_1 = Competition.create!(name: "Basket Weavers Interstallar", location: "Mars", sport: "Basket Weaving")
    team_1 = Team.create!(nick_name: "The Chompin' Beavers", home_town: "Beaver")
    player_1 = team_1.players.create!(name: "Joe", age: 30)
    player_2 = team_1.players.create!(name: "Mary", age: 40)
    player_3 = team_1.players.create!(name: "Susan", age: 50)
    CompetitionTeam.create!(competition: competition_1, team: team_1)
    visit "/competitions/#{competition_1.id}"

    expect(page).to have_link("Register Team")
    click_link("Register Team") #Do the parens matter???
    expect(current_path). to eq("/competitions/#{competition_1.id}/teams/new")
    fill_in "Name", with: "New Team"
    fill_in "Home town", with: "New Home town"
    click_button "Save"
    expect(current_path).to eq("/competitions/#{competition_1.id}")
    expect(page).to have_content("New Team")
    expect(page).to have_content("New Home town")
  end
end
