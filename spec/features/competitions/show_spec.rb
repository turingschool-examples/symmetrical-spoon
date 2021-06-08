require 'rails_helper'

RSpec.describe 'competitions show page', type: :feature do
  before(:each) do
    @team1 = Team.create(name: 'Flying Tigers', nickname: 'Tiger Puffs', hometown: 'Syndey')
    @team2 = Team.create(name: 'Popping Pandas', nickname: 'Panda Players', hometown: 'Shanghai')
    @team3 = Team.create(name: 'Bubbling Sharks', nickname: 'Shark Attack', hometown: 'Cape Town')
    @team4 = Team.create(name: 'Lazy Llamas', nickname: 'Llama Life', hometown: 'Cuzco')
    @competition1 = Competition.create(name: 'Fight Club', location: 'NYC', sport: 'Boxing')
    @competition2 = Competition.create(name: 'Swimathon', location: 'Mexico City', sport: 'Swimming')
    @player1 = @team1.players.create(name: 'Bob', age: 20)
    @player2 = @team1.players.create(name: 'Sue', age: 40)
    @player3 = @team1.players.create(name: 'Frank', age: 30)
    @player4 = @team4.players.create(name: 'Joe', age: 25)
    @player5 = @team4.players.create(name: 'Sarah', age: 35)
    @player6 = @team4.players.create(name: 'Scott', age: 45)
    @competition_team1 = CompetitionTeam.create(competition: @competition1, team: @team1)
    @competition_team2 = CompetitionTeam.create(competition: @competition1, team: @team4)
    @competition_team3 = CompetitionTeam.create(competition: @competition2, team: @team2)
    @competition_team4 = CompetitionTeam.create(competition: @competition2, team: @team3)
  end

  describe 'page appearance' do
    it 'shows the competitions name, location, and sport' do
      visit "/competitions/#{@competition1.id}"

      expect(page).to have_content(@competition1.name)
      expect(page).to have_content(@competition1.location)
      expect(page).to have_content(@competition1.sport)
    end
    it 'shows the name and hometowns of each team in the competition' do
      visit "/competitions/#{@competition1.id}"

      expect(page).to have_content(@team1.name)
      expect(page).to have_content(@team1.hometown)
      expect(page).to have_content(@team4.name)
      expect(page).to have_content(@team4.hometown)
    end
    it 'shows the average age of all players in the competition' do
      visit "/competitions/#{@competition1.id}"

      expect(page).to have_content(32.5)
    end
  end

  describe 'page functionality' do
  end
end