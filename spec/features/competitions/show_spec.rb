require 'rails_helper'

RSpec.describe 'show' do
  before(:each) do
  @comp_1 = Competition.create!(name: 'Regional Cup', location: "Louville", sport: 'basketball')
  @comp_2 = Competition.create!(name: 'Premier Cup', location: 'Las Vegas', sport: 'basketball')

  @team_1 = Team.create!(hometown: 'Leesburg', nickname: 'Rockets')
  @team_2 = Team.create!(hometown: 'Pitt', nickname: 'Pirates')
  @team_3 = Team.create!(hometown: 'Seattle', nickname: 'Sharks')

  @player_1 = @team_1.players.create!(name: 'Billy Russo', age: 12)
  @player_2 = @team_1.players.create!(name: 'Alex Free', age: 11)
  @player_3 = @team_1.players.create!(name: 'Bob Hill', age: 14)
  @player_4 = @team_2.players.create!(name: 'Joe Bean', age: 10)
  @player_5 = @team_2.players.create!(name: 'Jane Doe', age: 13)
  @player_6 = @team_3.players.create!(name: 'John Dow', age: 15)
  @player_7 = @team_3.players.create!(name: 'Jo Deed', age: 12)

  TeamCompetition.create!(team_id: @team_1.id, competition_id: @comp_1.id)
  TeamCompetition.create!(team_id: @team_2.id, competition_id: @comp_1.id)
  TeamCompetition.create!(team_id: @team_2.id, competition_id: @comp_2.id)
  TeamCompetition.create!(team_id: @team_3.id, competition_id: @comp_2.id)
  end

  describe 'competitions info' do
    it 'it has competition names, location, sport' do

    visit "/competitions/#{@comp_1.id}"
      expect(page).to have_content(@comp_1.name)
      expect(page).to have_content(@comp_1.location)
      expect(page).to have_content(@comp_1.sport)

    visit "/competitions/#{@comp_2.id}"
      expect(page).to have_content(@comp_2.name)
      expect(page).to have_content(@comp_2.location)
      expect(page).to have_content(@comp_2.sport)
    end
  end

  describe 'competitions teams info' do
    it 'it has competition teams names, hometowns' do

    visit "/competitions/#{@comp_1.id}"
      expect(page).to have_content(@team_1.nickname)
      expect(page).to have_content(@team_1.hometown)
      expect(page).to have_content(@team_2.nickname)
      expect(page).to have_content(@team_2.hometown)

    visit "/competitions/#{@comp_2.id}"
      expect(page).to have_content(@team_2.nickname)
      expect(page).to have_content(@team_2.hometown)
      expect(page).to have_content(@team_3.nickname)
      expect(page).to have_content(@team_3.hometown)
    end
  end

  describe 'competitions teams players info' do
    it 'it has competition teams players average age' do

    visit "/competitions/#{@comp_1.id}"
      expect(page).to have_content('Average Player Age:')

    visit "/competitions/#{@comp_2.id}"
      expect(page).to have_content('Average Player Age:')
    end
  end

  describe 'link to register new team' do
    it 'has new team link' do

    visit "/competitions/#{@comp_1.id}"
      expect(page).to have_link('Register New Team')

    visit "/competitions/#{@comp_2.id}"
      expect(page).to have_link('Register New Team')
    end
  end
end