require 'rails_helper'

RSpec.describe 'show' do
  it 'shows the competition' do
    competition_1 = Competition.create!(name: "Competition 1", location: "Denver", sport: "Basketball")

    visit "/competitions"
    click_link "Competition 1"

    expect(page).to have_content("Competition 1")
    expect(page).to have_content("Denver")
    expect(page).to have_content("Basketball")
  end

  it 'shows all the teams hometowns' do
    competition_1 = Competition.create!(name: "Competition 1", location: "Denver", sport: "Basketball")
    team_1 = Team.create!(hometown: "Leesburg", nickname: "The Lee's")
    team_2 = Team.create!(hometown: "Nashville", nickname: "The Nash Bash")

    competition_1.teams << team_1
    competition_1.teams << team_2

    visit "/competitions/#{competition_1.id}"

    expect(page).to have_content("Leesburg")
    expect(page).to have_content("Nashville")
  end

  it 'shows the average age of all players' do
    competition_1 = Competition.create!(name: "Competition 1", location: "Denver", sport: "Basketball")
    team_1 = competition_1.teams.create!(hometown: "Leesburg", nickname: "The Lee's")
    team_2 = competition_1.teams.create!(hometown: "Nashville", nickname: "The Nash Bash")
    team_1.players.create!(name: "John Johnson", age: 24)
    team_2.players.create!(name: "Derik Douglas", age: 26)

    competition_1.teams << team_1
    competition_1.teams << team_2

    visit "/competitions/#{competition_1.id}"

    expect(page).to have_content(25)
  end
end