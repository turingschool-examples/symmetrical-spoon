require 'rails_helper'

RSpec.describe 'competitions', type: :model do
  before(:each) do
    @team1 = Team.create(name: 'Flying Tigers', nickname: 'Tiger Puffs', hometown: 'Syndey')
    @team4 = Team.create(name: 'Lazy Llamas', nickname: 'Llama Life', hometown: 'Cuzco')
    @competition1 = Competition.create(name: 'Fight Club', location: 'NYC', sport: 'Boxing')
    @player1 = @team1.players.create(name: 'Bob', age: 20)
    @player2 = @team1.players.create(name: 'Sue', age: 40)
    @player3 = @team1.players.create(name: 'Frank', age: 30)
    @player4 = @team4.players.create(name: 'Joe', age: 25)
    @player5 = @team4.players.create(name: 'Sarah', age: 35)
    @player6 = @team4.players.create(name: 'Scott', age: 45)
    @competition_team1 = CompetitionTeam.create(competition: @competition1, team: @team1)
    @competition_team2 = CompetitionTeam.create(competition: @competition1, team: @team4)
  end

  describe 'class methods' do
  end

  describe 'instance_methods' do
    describe '#average_player_age' do
      it 'returns the average age of all players in a competition' do
        expect(@competition1.average_player_age).to eq(32.5)
      end
    end
  end
end