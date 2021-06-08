require 'rails_helper'

RSpec.describe 'Competition Show Page' do
  before :each do
    @comp_1 = Competition.create!(name: 'Bi-annual Annual Tourney', location: 'Arvada, CO', sport: 'Basketball')
    @comp_2 = Competition.create!(name: 'Tournament of Champions', location: 'Westminster, CO', sport: 'Football')
    @comp_3 = Competition.create!(name: 'Witt-Bowl', location: 'Lakewood, CO', sport: 'Soccer')
    @comp_4 = Competition.create!(name: 'M&Ms Regional', location: 'Golden, CO', sport: 'Tennis')
    @comp_5 = Competition.create!(name: 'Pickup Game', location: 'Aurora, CO', sport: 'Hockey')

    @team_1 = Team.create!(hometown: 'Arvada', nickname: 'Bulldogs')
    @team_2 = Team.create!(hometown: 'Golden', nickname: 'Frogs')
    @team_3 = Team.create!(hometown: 'Westminster', nickname: 'Penguins')
    @team_4 = Team.create!(hometown: 'Fort Collins', nickname: 'Rapscallions')
    @team_5 = Team.create!(hometown: 'Commerce City', nickname: 'Larrys')

    @team_comp_1 = TeamCompetition.create!(team_id: @team_1.id, competition_id: @comp_1.id)
    @team_comp_2 = TeamCompetition.create!(team_id: @team_2.id, competition_id: @comp_1.id)
    @team_comp_3 = TeamCompetition.create!(team_id: @team_3.id, competition_id: @comp_1.id)
    @team_comp_4 = TeamCompetition.create!(team_id: @team_4.id, competition_id: @comp_1.id)

    visit "/competitions/#{@comp_1.id}"
  end

#   User Story 2 - Competition Show Page
#
# As a user
# When I visit a competition's show page
# Then I see the competition's name, location, and sport
# And I see the name and hometown of all teams in this competition
# And I see the average age of all players in the competition

  it 'shows the competitions attributes' do
    expect(page).to have_content(@comp_1.name)
    expect(page).to have_content(@comp_1.location)
    expect(page).to have_content(@comp_1.sport)
    expect(page).to_not have_content(@comp_2.name)
  end

  it 'shows the name and hometown of all the teams in this competition' do
    expect(page).to have_content(@team_1.hometown)
    expect(page).to have_content(@team_1.nickname)
    expect(page).to have_content(@team_2.hometown)
    expect(page).to have_content(@team_3.nickname)
    expect(page).to_not have_content(@team_5.hometown)
    expect(page).to_not have_content(@team_5.nickname)
  end
end
