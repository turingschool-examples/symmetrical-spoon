require 'rails_helper'

RSpec.describe 'Competition show page' do
  before(:each) do
    @competition_1 = Competition.create!(name: "Men’s Regional", location: "Louisville", sport: "basketball")
      @team_1 = @competition_1.teams.create!(hometown: "Leesburg", nickname: "Rockets")
        @player_1 = @team_1.players.create!(name: "Billy Bigshoes", age: 12)
        @player_2 = @team_1.players.create!(name: "Ricky Longhorn", age: 10)
        @player_3 = @team_1.players.create!(name: "Luke Rodger", age: 14)
      @team_2 = @competition_1.teams.create!(hometown: "Denver", nickname: "Dynos")
        @player_4 = @team_2.players.create!(name: "Molly Pappernickle", age: 12)

    @comp_team_1 = CompetitionTeam.create!(competition: @competition_1, team: @team_1)
    @comp_team_2 = CompetitionTeam.create!(competition: @competition_1, team: @team_2)

    @competition_2 = Competition.create!(name: "Nationals", location: "Orlando", sport: "Cheer")
      @team_3 = @competition_2.teams.create!(hometown: "Miami", nickname: "Fish")
        @player_5 = @team_3.players.create!(name: "Margo Marygoround", age: 12)
        @player_6 = @team_3.players.create!(name: "Tanya Fishsticks", age: 10)
  end

  # User Story 2 - Competition Show Page
  # As a user
  # When I visit a competition's show page
  # Then I see the competition's name, location, and sport
  # And I see the name and hometown of all teams in this competition
  # And I see the average age of all players in the competition

  it "it shows the name, location, and sport of the competition" do
    visit "/competitions/#{@competition_1.id}"
    expect(current_path).to eq("/competitions/#{@competition_1.id}")

    expect(page).to have_content(@competition_1.name)
    expect(page).to have_content(@competition_1.location)
    expect(page).to have_content(@competition_1.sport)
  end

  it "shows the name and hometown of all teams in this competition" do
    visit "/competitions/#{@competition_1.id}"
    expect(current_path).to eq("/competitions/#{@competition_1.id}")

    expect(page).to have_content(@competition_1.name)
    expect(page).to have_content(@team_1.nickname)
    expect(page).to have_content(@team_1.hometown)
    expect(page).to have_content(@team_2.nickname)
    expect(page).to have_content(@team_2.hometown)

    expect(page).to_not have_content(@competition_2.name)
    expect(page).to_not have_content(@team_3.nickname)
  end

  it "Shows the average age of all players in the competition" do
    @competition_1 = Competition.create!(name: "Men’s Regional", location: "Louisville", sport: "basketball")
      @team_1 = @competition_1.teams.create!(hometown: "Leesburg", nickname: "Rockets")
        @player_1 = @team_1.players.create!(name: "Billy Bigshoes", age: 12)
        @player_2 = @team_1.players.create!(name: "Ricky Longhorn", age: 10)
        @player_3 = @team_1.players.create!(name: "Luke Rodger", age: 14)
      @team_2 = @competition_1.teams.create!(hometown: "Denver", nickname: "Dynos")
        @player_4 = @team_2.players.create!(name: "Molly Pappernickle", age: 12)

    @comp_team_1 = CompetitionTeam.create!(competition: @competition_1, team: @team_1)
    @comp_team_2 = CompetitionTeam.create!(competition: @competition_1, team: @team_2)

    @competition_2 = Competition.create!(name: "Nationals", location: "Orlando", sport: "Cheer")
      @team_3 = @competition_2.teams.create!(hometown: "Miami", nickname: "Fish")
        @player_5 = @team_3.players.create!(name: "Margo Marygoround", age: 12)
        @player_6 = @team_3.players.create!(name: "Tanya Fishsticks", age: 10)

    visit "/competitions/#{@competition_1.id}"
    expect(current_path).to eq("/competitions/#{@competition_1.id}")

    expect(page).to have_content(@competition_1.name)
    expect(page).to have_content(@team_1.nickname)
    expect(page).to have_content(@team_1.hometown)
    expect(page).to have_content(@team_2.nickname)
    expect(page).to have_content(@team_2.hometown)
    expect(page).to have_content("Average player age: 12")

    expect(page).to_not have_content(@competition_2.name)
    expect(page).to_not have_content(@team_3.nickname)
    expect(page).to have_content("Average player age: 11")
  end
end
