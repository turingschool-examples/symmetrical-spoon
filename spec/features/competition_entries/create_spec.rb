require 'rails_helper'

RSpec.describe 'register for competition page' do
  it 'can add a team to the competition' do
    comp_1 = Competition.create!(name: 'Show Me What You Got', location: 'Space', sport: 'Performance art')
    team_1 = Team.create!(hometown: 'Froopyland', nickname: 'Rainbow Rivers')
    team_2 = Team.create!(hometown: 'Earth', nickname: 'MeeSeeks')
    team_3 = Team.create!(hometown: 'Dog Dimension', nickname: 'The Hydrants')

    comp_1.teams << team_1
    comp_1.teams << team_2

    player_1 = Player.create!(name: "Morty Smith", age: 14, team_id: team_1.id)
    player_2 = Player.create!(name: "Rick Sanchez", age: 70, team_id: team_1.id)
    player_4 = Player.create!(name: "Summer Smith", age: 17, team_id: team_2.id)
    player_5 = Player.create!(name: "Beth Smith", age: 34, team_id: team_2.id)
    player_3 = Player.create!(name: "Jerry Smith", age: 40, team_id: team_3.id)

    visit "/competitions/#{comp_1.id}/competition_entries/new"

    fill_in :nickname, with: 'The Hydrants'
    fill_in :hometown, with: 'Dog Dimension'
    click_button 'Register'

    expect(current_path).to eq "/competitions/#{comp_1.id}"
    expect(page).to have_content team_3.nickname
    expect(page).to have_content team_3.hometown
    expect(page).to have_content 'Average player age: 35'
  end
end