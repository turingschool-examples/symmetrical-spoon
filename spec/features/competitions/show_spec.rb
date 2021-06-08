require 'rails_helper'

RSpec.describe 'Competition Show page', type: :feature do
  before :each do
    @competition = Competition.create!(name: "Regionals", location: "Denver, CO", sport: "Soccer")

    @team1 = @competition.teams.create!(hometown: "Howell, NJ", nickname: "Howlers")
    @team2 = @competition.teams.create!(hometown: "Portland, OR", nickname: "Porters")
    @team3 = @competition.teams.create!(hometown: "Anchorage, AK", nickname: "Anchors")

    @player1 = @team1.players.create!(name: "Leslie Knope", age: 32)
    @player2 = @team1.players.create!(name: "Ron Swanson", age: 43)
    @player3 = @team2.players.create!(name: "Tom Haverford", age: 28)
    @player4 = @team2.players.create!(name: "April Ludgate", age: 22)
    @player5 = @team3.players.create!(name: "Andy Dwyer", age: 29)
    @player6 = @team3.players.create!(name: "Anne Perkins", age: 31)

    visit "/competitions/#{@competition.id}"
  end

  it 'shows competition name, location, sport' do
    expect(page).to have_content(@competition.name)
    expect(page).to have_content(@competition.location)
    expect(page).to have_content(@competition.sport)
  end

  it 'shows the name and hometown of all teams in the competition' do
    expect(page).to have_content(@team1.hometown)
    expect(page).to have_content(@team1.nickname)
    expect(page).to have_content(@team2.hometown)
    expect(page).to have_content(@team2.nickname)
    expect(page).to have_content(@team3.hometown)
    expect(page).to have_content(@team3.nickname)
  end

  it 'shows the average age of all players in the competition' do
    expect(page).to have_content("Average age of all players: 30.83")
  end
end
