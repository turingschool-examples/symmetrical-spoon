require 'rails_helper'

RSpec.describe 'competitions index page' do

  before(:each) do
    @competition_1 = Competition.create!(name: 'Competiton 1 Name', location: 'Competition 1 Location', sport: "Competition 1 Sport")

    @team_1 = Team.create!(hometown: 'Team 1 Hometown', nickname: 'Team 1 Nickname')
    @team_2 = Team.create!(hometown: 'Team 2 Hometown', nickname: 'Team 2 Nickname')
    @team_3 = Team.create!(hometown: 'Team 3 Hometown', nickname: 'Team 3 Nickname')

    @player_1 = Player.create!(name: 'Player 1 Name', age: 22, team_id: @team_1.id)
    @player_2 = Player.create!(name: 'Player 2 Name', age: 24, team_id: @team_1.id)
    @player_3 = Player.create!(name: 'Player 3 Name', age: 28, team_id: @team_1.id)

    @player_4 = Player.create!(name: 'Player 4 Name', age: 26, team_id: @team_2.id)
    @player_5 = Player.create!(name: 'Player 5 Name', age: 23, team_id: @team_2.id)
    @player_6 = Player.create!(name: 'Player 6 Name', age: 27, team_id: @team_2.id)

    @player_7 = Player.create!(name: 'Player 7 Name', age: 29, team_id: @team_3.id)
    @player_8 = Player.create!(name: 'Player 8 Name', age: 21, team_id: @team_3.id)
    @player_9 = Player.create!(name: 'Player 9 Name', age: 25, team_id: @team_3.id)

    @competition_1.teams << @team_1
    @competition_1.teams << @team_2
    @competition_1.teams << @team_3
  end

  it 'shows the competition name location and sport' do
    visit "/competitions/#{@competition_1.id}"

    expect(page).to have_content(@competition_1.name)
    expect(page).to have_content(@competition_1.location)
    expect(page).to have_content(@competition_1.sport)
  end

  it 'has the name and hometown of all teams in this competition' do
    visit "/competitions/#{@competition_1.id}"

    expect(page).to have_content(@team_1.hometown)
    expect(page).to have_content(@team_2.hometown)
    expect(page).to have_content(@team_3.hometown)

    expect(page).to have_content(@team_1.nickname)
    expect(page).to have_content(@team_2.nickname)
    expect(page).to have_content(@team_3.nickname)
  end

  it 'has the average age of all players in the competition' do
    visit "/competitions/#{@competition_1.id}"

    expect(page).to have_content("Average Age of Players in Competition:")
    within "#avg_age" do
      expect(page).to have_content("25")
    end
  end

  it 'has a link to register a new team which redirects to the new team page' do
    visit "/competitions/#{@competition_1.id}"

    expect(page).to have_link("Register New Team", href: "/competitions/#{@competition_1.id}/teams/new")

    click_link("Register New Team")

    expect(current_path).to eq("/competitions/#{@competition_1.id}/teams/new")
  end

  it 'updates show page with new teams after the form has been submitted' do
    visit "/competitions/#{@competition_1.id}/teams/new"

    fill_in("Nickname:", with: "Team 4 Nickname")
    fill_in("Hometown:", with: "Team 4 Hometown")

    click_button("Submit")

    expect(current_path).to eq("/competitions/#{@competition_1.id}")

    expect(page).to have_content("Team 4 Nickname")
    expect(page).to have_content("Team 4 Hometown")
  end
end
