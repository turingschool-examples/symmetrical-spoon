require 'rails_helper'

RSpec.describe 'the competition show page' do
  # User Story 2 - Competition Show Page
  it 'shows the competition attributes' do
    comp1 = Competition.create!(name: 'Chuck Stuff', location: 'Denver', sport: 'Axe Throwing')
    team1 = comp1.teams.create!(hometown: 'Denver', nickname: 'Team1')
    team2 = comp1.teams.create!(hometown: 'Drake', nickname: 'Team2')
    player1 = team1.players.create!(name: 'P1', age: 20)
    player2 = team2.players.create!(name: 'P2', age: 50)
    player3 = team1.players.create!(name: 'P3', age: 30)
    player4 = team2.players.create!(name: 'P4', age: 40)

    visit "/competitions/#{comp1.id}/show"

    # Then I see the competition's name, location, and sport
    expect(page).to have_content(comp1.name)
    expect(page).to have_content(comp1.location)
    expect(page).to have_content(comp1.sport)
    # And I see the name and hometown of all teams in this competition
    expect(page).to have_content(team1.nickname)
    expect(page).to have_content(team1.hometown)
    expect(page).to have_content(team2.nickname)
    expect(page).to have_content(team2.hometown)
    # And I see the average age of all players in the competition
    expect(page).to have_content(team1.average_age)
    expect(page).to have_content(team2.average_age)
  end
end
