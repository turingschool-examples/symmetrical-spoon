require 'rails_helper'

RSpec.describe 'competition show page' do
  before :each do
    @comp_1 = Competition.create!(name: 'Show Me What You Got', location: 'Space', sport: 'Performance art')
    @comp_2 = Competition.create!(name: 'Intergalactic Baseball', location: 'The Milky Way', sport: 'Baseball')

    @team_1 = Team.create!(hometown: 'Froopyland', nickname: 'Rainbow Rivers')
    @team_2 = Team.create!(hometown: 'Earth', nickname: 'MeeSeeks')
    @team_3 = Team.create!(hometown: 'Dog Dimension', nickname: 'The Hydrants')

    @comp_1.teams << @team_1
    @comp_1.teams << @team_2

    @comp_2.teams << @team_2
    @comp_2.teams << @team_3

    @player_1 = Player.create!(name: "Morty Smith", age: 14, team_id: @team_1.id)
    @player_2 = Player.create!(name: "Rick Sanchez", age: 70, team_id: @team_1.id)
    @player_4 = Player.create!(name: "Summer Smith", age: 17, team_id: @team_2.id)
    @player_5 = Player.create!(name: "Beth Smith", age: 34, team_id: @team_2.id)
    @player_3 = Player.create!(name: "Jerry Smith", age: 40, team_id: @team_3.id)
  end

  it 'displays the competition details, incl. name, location, and sport' do
    visit "/competitions/#{@comp_1.id}"

    expect(page).to have_content @comp_1.name
    expect(page).to have_content @comp_1.location
    expect(page).to have_content @comp_1.sport
    expect(page).to_not have_content @comp_2.name
  end

  it 'displays the nickname and hometown of all teams in the comp' do
    visit "/competitions/#{@comp_1.id}"

    expect(page).to have_content @team_1.nickname
    expect(page).to have_content @team_1.hometown

    expect(page).to have_content @team_2.nickname
    expect(page).to have_content @team_2.hometown

    expect(page).to_not have_content @team_3.nickname
    expect(page).to_not have_content @team_3.hometown
  end

  it 'displays the avg age across all players in the comp' do
    visit "/competitions/#{@comp_1.id}"

    expect(page).to have_content 'Average player age: 34'
  end

  it 'has a link to add a team to the competition' do
    visit "/competitions/#{@comp_1.id}"

    click_button 'Register my team' 

    expect(current_path).to eq "/competitions/#{@comp_1.id}/competition_entries/new"
  end
end