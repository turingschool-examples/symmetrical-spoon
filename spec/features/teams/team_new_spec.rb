require 'rails_helper'

describe 'teams new' do
  before :each do
    @competition_1 = Competition.create!(name:'Tournament of Champions', location:'Harrisburg', sport:'Curling')
    @team_1 = @competition_1.teams.create!(hometown: 'Harrisburg', nickname: 'Senators')
    @team_2 = @competition_1.teams.create!(hometown: 'Farrisburg', nickname: 'Congressmen')
    @team_3 = @competition_1.teams.create!(hometown: 'Darrisburg', nickname: 'Embezzlers')
    @player_1 = @team_1.players.create!(name: 'Tim', age: 19)
    @player_2 = @team_1.players.create!(name: 'Lim', age: 49)
    @player_3 = @team_1.players.create!(name: 'Dim', age: 39)
    visit "/competitions/#{@competition_1.id}/teams/new"
  end
  it 'contains a form to create a new team' do
    expect(page).to have_field('Hometown')
    expect(page).to have_field('Nickname')
  end

  it 'clicking submit creates a new team' do
    fill_in 'Hometown', :with=> 'Pittsburgh'
    fill_in 'Nickname', :with=> 'Hornets'
    click_button 'Save'

    expect(current_path).to eq("/competitions/#{@competition_1.id}")
    expect(page).to have_content('Team name: Hornets')
    expect(page).to have_content('Team location: Pittsburgh')
  end
end