require 'rails_helper'

RSpec.describe 'teams', type: :model do

  describe 'class methods' do
    describe '#order_by_average_age' do
      it 'sorts the teams by average age' do
        team1 = Team.create(name: 'Flying Tigers', nickname: 'Tiger Puffs', hometown: 'Syndey')
        team2 = Team.create(name: 'Popping Pandas', nickname: 'Panda Players', hometown: 'Shanghai')
        team3 = Team.create(name: 'Bubbling Sharks', nickname: 'Shark Attack', hometown: 'Cape Town')
        team4 = Team.create(name: 'Lazy Llamas', nickname: 'Llama Life', hometown: 'Cuzco')
        competition1 = Competition.create(name: 'Fight Club', location: 'NYC', sport: 'Boxing')
        competition2 = Competition.create(name: 'Swimathon', location: 'Mexico City', sport: 'Swimming')
        player1 = team1.players.create(name: 'Bob', age: 20)
        player2 = team1.players.create(name: 'Sue', age: 40)
        player3 = team1.players.create(name: 'Frank', age: 30)
        player4 = team4.players.create(name: 'Joe', age: 25)
        player5 = team4.players.create(name: 'Sarah', age: 35)
        player6 = team4.players.create(name: 'Scott', age: 45)
        competition_team1 = CompetitionTeam.create(competition: competition1, team: team1)
        competition_team2 = CompetitionTeam.create(competition: competition1, team: team4)
        competition_team3 = CompetitionTeam.create(competition: competition2, team: team2)
        competition_team4 = CompetitionTeam.create(competition: competition2, team: team3)

        result = Team.order_by_average_player_age
        expect(result.first.name).to eq('Flying Tigers')
        expect(result.first.avg_age).to eq(0.3e2)
      end
    end
  end

  describe 'instance_methods' do
  end
end