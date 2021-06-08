require 'rails_helper'

RSpec.describe 'Competitions Show' do
  before :each do
    @competition_1 = Competition.create!(name: 'Extreme Pogs', location: 'Thunder Dome', sport: 'Pogs')
    @competition_2 = Competition.create!(name: 'Snakes and Danger', location: 'Mount Everest', sport: 'Snakes and Ladders')
    @team_1 = Team.create!(hometown: 'Littleton', nickname: 'Murder Dogs')
      @team_1.players.create!(name: 'Suzy Jinkins', age: 12)
      @team_1.players.create!(name: 'Tim Jones', age: 11)
      CompetitionTeam.create!(team: @team_1, competition: @competition_1)
    @team_2 = Team.create!(hometown: 'London', nickname: 'Blood Hunters')
      @team_2.players.create!(name: 'Ditz Mark', age: 11)
      @team_2.players.create!(name: 'Sal Jones', age: 9)
      CompetitionTeam.create!(team: @team_2, competition: @competition_1)
    @team_3 = Team.create!(hometown: 'New York', nickname: 'Pony Princesses')
      @team_3.players.create!(name: 'Pete Lock', age: 11)
      @team_3.players.create!(name: 'Mark Ratter', age: 11)
      CompetitionTeam.create!(team: @team_3, competition: @competition_1)
    @team_4 = Team.create!(hometown: 'Smallville', nickname: 'End Bringers')
      @team_4.players.create!(name: 'Mitzy Marrie', age: 10)
      @team_4.players.create!(name: 'Sammy Simms', age: 9)
      CompetitionTeam.create!(team: @team_4, competition: @competition_2)

    visit "/competitions/#{@competition_1.id}"
  end
  describe 'visit' do
    it 'has the names of all competitions' do

      expect(page).to have_content('Extreme Pogs')
      expect(page).to have_content('Thunder Dome')
      expect(page).to have_content('Pogs')
      
    end
    it 'has the names and hometowns of all teams in the competition' do

      expect(page).to have_content('Murder Dogs')
      expect(page).to have_content('Littleton')
      expect(page).to have_content('Blood Hunters')
      expect(page).to have_content('London')
      expect(page).to have_content('Pony Princesses')
      expect(page).to have_content('New York')
      expect(page).to_not have_content('End Bringers')
      expect(page).to_not have_content('Smallville')

    end
  end
end
