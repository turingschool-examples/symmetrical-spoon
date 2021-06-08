require 'rails_helper'

RSpec.describe 'Competitions Show Page' do
  before :each do
    @competition1 = Competition.create!(name: "Men’s Regional", location: 'Louisville', sport: 'basketball')
    @team1 = @competition1.teams.create!(hometown: 'Leesburg', nickname: 'Rockets')
    @player1 = @team1.players.create!(name: 'Billy Bigshoes', age: 12)
    @player2 = @team1.players.create!(name: 'Billy Bigshoes', age: 15)
    @player3 = @team1.players.create!(name: 'Billy Bigshoes', age: 11)

    @team2 = @competition1.teams.create!(hometown: 'Knoxville', nickname: 'Wildcats')
    @player4 = @team1.players.create!(name: 'Billy Bigshoes', age: 13)
    @player5 = @team1.players.create!(name: 'Billy Bigshoes', age: 14)
    @player6 = @team1.players.create!(name: 'Billy Bigshoes', age: 10)

    visit competition_path(@competition1)
  end

  it "I see the competition's name, location, and sport" do
    expect(current_path).to eq(competition_path(@competition1))

    expect(page).to have_content(@competition1.name)
    expect(page).to have_content(@competition1.location)
    expect(page).to have_content(@competition1.sport)
  end

  it "I see the name and hometown of all teams in this competition" do
    expect(current_path).to eq(competition_path(@competition1))

    within("#team-#{@team1.id}") do
      expect(page).to have_content(@team1.nickname)
      expect(page).to have_content(@team1.hometown)
    end

    within("#team-#{@team2.id}") do
      expect(page).to have_content(@team2.nickname)
      expect(page).to have_content(@team2.hometown)
    end
  end

  it "I see the average age of all players in the competition" do
    expect(current_path).to eq(competition_path(@competition1))

    expect(page).to have_content(@competition1.average_player_age)
  end

  it "I see a link to register a new team" do
    expect(page).to have_link("Register New Team", href: new_competition_team_path(@competition1))
  end
end
