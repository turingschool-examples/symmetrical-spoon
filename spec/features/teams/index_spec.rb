require 'rails_helper'

RSpec.describe 'team index' do
  before :each do
    @team_1 = Team.create!(hometown: 'Froopyland', nickname: 'Rainbow Rivers')
    @team_2 = Team.create!(hometown: 'Earth', nickname: 'MeeSeeks')
    @team_3 = Team.create!(hometown: 'Dog Dimension', nickname: 'The Hydrants')

    @player_1 = Player.create!(name: "Morty Smith", age: 14, team_id: @team_1.id)
    @player_2 = Player.create!(name: "Rick Sanchez", age: 70, team_id: @team_1.id)
    @player_4 = Player.create!(name: "Summer Smith", age: 17, team_id: @team_2.id)
    @player_5 = Player.create!(name: "Beth Smith", age: 34, team_id: @team_2.id)
    @player_3 = Player.create!(name: "Jerry Smith", age: 40, team_id: @team_3.id)
  end

  it 'displays the nicknames of all teams' do
    visit "/teams"

    expect(page).to have_content @team_1.nickname
    expect(page).to have_content @team_2.nickname
    expect(page).to have_content @team_2.nickname
  end

  it 'displays the average age of each team\'s players' do
    visit "/teams"

    within "div#team-#{@team_1.id}" do
      expect(page).to have_content 'Average player age: 42'
    end
    within "div#team-#{@team_2.id}" do
      expect(page).to have_content 'Average player age: 26'
    end
    within "div#team-#{@team_3.id}" do
      expect(page).to have_content 'Average player age: 40'
    end

    expect(@team_1.name).to appear_before(@team_3.name)
    expect(@team_3.name).to appear_before(@team_2.name)
  end
end