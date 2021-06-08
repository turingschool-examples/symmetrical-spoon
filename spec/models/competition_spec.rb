require 'rails_helper'

RSpec.describe Competition do
  describe 'relationships' do
    it { should have_many(:competition_teams).dependent(:destroy) }
    it { should have_many(:teams).through(:competition_teams) }
  end

  describe 'instance methods' do
    describe '.average_player_age' do
      before :each do
        @competition_1 = Competition.create!(name: 'Extreme Pogs', location: 'Thunder Dome', sport: 'Pogs')
      end
      it 'averages the ages of all players in a competion' do
        @team_1 = Team.create!(hometown: 'Littleton', nickname: 'Murder Dogs')
          @team_1.players.create!(name: 'Suzy Jinkins', age: 36)
          @team_1.players.create!(name: 'Tim Jones', age: 98)
          CompetitionTeam.create!(team: @team_1, competition: @competition_1)
        @team_2 = Team.create!(hometown: 'London', nickname: 'Blood Hunters')
          @team_2.players.create!(name: 'Ditz Mark', age: 11)
          @team_2.players.create!(name: 'Sal Jones', age: 56)
          CompetitionTeam.create!(team: @team_2, competition: @competition_1)

        expect(@competition_1.average_player_age).to eq(50.25)
      end
      it 'returns a string if no teams are competing' do
        expect(@competition_1.average_player_age).to eq('Add a team.')
      end
    end
  end
end
