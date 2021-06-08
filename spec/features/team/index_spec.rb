require 'rails_helper'

RSpec.describe 'Team Index Page' do
  before :each do
    @comp_1 = Competition.create!(name: 'Bi-annual Annual Tourney', location: 'Arvada, CO', sport: 'Basketball')
    @comp_2 = Competition.create!(name: 'Tournament of Champions', location: 'Westminster, CO', sport: 'Football')
    @comp_3 = Competition.create!(name: 'Witt-Bowl', location: 'Lakewood, CO', sport: 'Soccer')
    @comp_4 = Competition.create!(name: 'M&Ms Regional', location: 'Golden, CO', sport: 'Tennis')
    @comp_5 = Competition.create!(name: 'Pickup Game', location: 'Aurora, CO', sport: 'Hockey')

    @team_1 = Team.create!(hometown: 'Arvada', nickname: 'Bulldogs')

    @player_1 = @team_1.players.create!(name: 'Roald', age: 21)
    @player_2 = @team_1.players.create!(name: 'Huey', age: 25)
    @player_3 = @team_1.players.create!(name: 'Marshall', age: 23)

    @team_2 = Team.create!(hometown: 'Golden', nickname: 'Frogs')

    @player_4 = @team_2.players.create!(name: 'Frank', age: 35)
    @player_5 = @team_2.players.create!(name: 'Big Rick', age: 22)
    @player_6 = @team_2.players.create!(name: 'Don', age: 40)

    @team_3 = Team.create!(hometown: 'Westminster', nickname: 'Penguins')

    @player_7 = @team_3.players.create!(name: 'Dale', age: 20)
    @player_8 = @team_3.players.create!(name: 'Bill', age: 22)
    @player_9 = @team_3.players.create!(name: 'Ray', age: 28)


    @team_4 = Team.create!(hometown: 'Fort Collins', nickname: 'Rapscallions')

    @player_10 = @team_4.players.create!(name: 'Phil', age: 23)
    @player_11 = @team_4.players.create!(name: 'Claudio', age: 22)
    @player_12 = @team_4.players.create!(name: 'Travis', age: 20)

    @team_5 = Team.create!(hometown: 'Commerce City', nickname: 'Larrys')

    @player_13 = @team_5.players.create!(name: 'Larry', age: 32)
    @player_14 = @team_5.players.create!(name: 'Larry', age: 21)
    @player_15 = @team_5.players.create!(name: 'Larry', age: 25)


    @team_comp_1 = TeamCompetition.create!(team_id: @team_1.id, competition_id: @comp_1.id)
    @team_comp_2 = TeamCompetition.create!(team_id: @team_2.id, competition_id: @comp_1.id)
    @team_comp_3 = TeamCompetition.create!(team_id: @team_3.id, competition_id: @comp_1.id)
    @team_comp_4 = TeamCompetition.create!(team_id: @team_4.id, competition_id: @comp_1.id)

    visit '/teams'
  end

#   As a user
# When I visit the team index
# Then I see the names of all teams
# And next to the team name I see the average age of its players
# And I see that all teams are sorted by this average age from highest to lowest
#
# (Note: you should not make a separate query for each team to calculate the average age)

  it 'shows the nickname of all teams' do
    expect(page).to have_content(@team_1.nickname)
    expect(page).to have_content(@team_2.nickname)
    expect(page).to have_content(@team_3.nickname)
    expect(page).to have_content(@team_4.nickname)
    expect(page).to have_content(@team_5.nickname)
  end
end
