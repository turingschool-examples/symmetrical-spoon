require 'rails_helper'

RSpec.describe 'teams index page' do
  before(:each) do
    @team_1 = Team.create!(hometown: 'Team 1 Hometown', nickname: 'Team 1 Nickname')
    @team_2 = Team.create!(hometown: 'Team 2 Hometown', nickname: 'Team 2 Nickname')
    @team_3 = Team.create!(hometown: 'Team 3 Hometown', nickname: 'Team 3 Nickname')

    @player_1 = Player.create!(name: 'Player 1 Name', age: 22, team_id: @team_1.id)
    @player_2 = Player.create!(name: 'Player 2 Name', age: 24, team_id: @team_1.id)
    @player_3 = Player.create!(name: 'Player 3 Name', age: 28, team_id: @team_1.id)

    @player_4 = Player.create!(name: 'Player 4 Name', age: 26, team_id: @team_2.id)
    @player_5 = Player.create!(name: 'Player 5 Name', age: 29, team_id: @team_2.id)
    @player_6 = Player.create!(name: 'Player 6 Name', age: 27, team_id: @team_2.id)

    @player_7 = Player.create!(name: 'Player 7 Name', age: 23, team_id: @team_3.id)
    @player_8 = Player.create!(name: 'Player 8 Name', age: 21, team_id: @team_3.id)
    @player_9 = Player.create!(name: 'Player 9 Name', age: 25, team_id: @team_3.id)
  end

  it 'lists the names of all of the teams and each teams average player age' do
    visit '/teams'

    expect(page).to have_content(@team_1.nickname)
    expect(page).to have_content(@team_2.nickname)
    expect(page).to have_content(@team_3.nickname)

    expect(page).to have_content(@team_1.players_average_age)
    expect(page).to have_content(@team_2.players_average_age)
    expect(page).to have_content(@team_3.players_average_age)

  end

  it 'has the teams sorted by average age of players, highest to lowest' do
    expect(@team_2.players_average_age).to appear_before(@team_1.players_average_age)

    expect(@team_1.players_average_age).to appear_before(@team_3.players_average_age)
  end
end
