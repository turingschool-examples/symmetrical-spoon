require 'rails_helper'

RSpec.describe 'caseompetition show page' do
  before(:each) do
    @game = Competition.create!(name: 'Mens Regional', location: 'Brooklyn', sport:'Basketball')
    @team_1 = @game.teams.create!(hometown: 'Park slope', nickname: 'Ford')
    @team_2 = @game.teams.create!(hometown: 'Bay ridge', nickname: 'Xavier')
  end

  it 'shows the competition teams' do
    visit "/competitions/#{@game.id}"

    expect(page).to have_content(@game.name)
    expect(page).to have_content(@game.location)
    expect(page).to have_content(@game.sport)
  end

  it 'shows the names of all the teams' do
    visit "/competitions/#{@game.id}"

    expect(page).to have_content(@team_1.hometown)
    expect(page).to have_content(@team_1.nickname)
    expect(page).to have_content(@team_2.hometown)
    expect(page).to have_content(@team_2.nickname)
  end

  it 'has a link to register a new team' do
    visit "/competitions/#{@game.id}"

    click_link 'Register Team'

    expect(current_path).to eq("/teams/new")
  end
end
