require 'rails_helper'

RSpec.describe 'Teams Index', type: :feature do
  before :each do
    @team1 = Team.create!(hometown: "Howell, NJ", nickname: "Howlers")
    @team2 = Team.create!(hometown: "Portland, OR", nickname: "Porters")
    @team3 = Team.create!(hometown: "Anchorage, AK", nickname: "Anchors")

    @player1 = @team1.players.create!(name: "Leslie Knope", age: 32)
    @player2 = @team1.players.create!(name: "Ron Swanson", age: 43)
    @player3 = @team2.players.create!(name: "Tom Haverford", age: 28)
    @player4 = @team2.players.create!(name: "April Ludgate", age: 22)
    @player5 = @team3.players.create!(name: "Andy Dwyer", age: 29)
    @player6 = @team3.players.create!(name: "Anne Perkins", age: 31)

    visit "/teams"
  end

  it 'Shows the names of all teams' do
    expect(page).to have_content(@team1.nickname)
    expect(page).to have_content(@team2.nickname)
    expect(page).to have_content(@team3.nickname)
  end

  it 'Shows the average age of players for each team' do
    within("#team-#{@team1.id}") do
      expect(page).to have_content(37.5)
    end
    within("#team-#{@team2.id}") do
      expect(page).to have_content(25)
    end
    within("#team-#{@team3.id}") do
      expect(page).to have_content(30)
    end
  end

  it 'Sorts teams by average age of players from highest to lowest' do
    expect(@team1.nickname).to appear_before(@team3.nickname)
    expect(@team3.nickname).to appear_before(@team2.nickname)
  end
end
