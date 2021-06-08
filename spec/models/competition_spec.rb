require 'rails_helper'

RSpec.describe Competition do
  before(:each) do
    @competition_1 = Competition.create!(name: 'Competiton 1 Name', location: 'Competition 1 Location', sport: "Competition 1 Sport")

    @team_1 = Team.create!(hometown: 'Team 1 Hometown', nickname: 'Team 1 Nickname')
    @team_2 = Team.create!(hometown: 'Team 2 Hometown', nickname: 'Team 2 Nickname')
    @team_3 = Team.create!(hometown: 'Team 3 Hometown', nickname: 'Team 3 Nickname')

    @player_1 = Player.create!(name: 'Player 1 Name', age: 22, team_id: @team_1.id)
    @player_2 = Player.create!(name: 'Player 2 Name', age: 24, team_id: @team_1.id)
    @player_3 = Player.create!(name: 'Player 3 Name', age: 28, team_id: @team_1.id)

    @player_4 = Player.create!(name: 'Player 4 Name', age: 26, team_id: @team_2.id)
    @player_5 = Player.create!(name: 'Player 5 Name', age: 23, team_id: @team_2.id)
    @player_6 = Player.create!(name: 'Player 6 Name', age: 27, team_id: @team_2.id)

    @player_7 = Player.create!(name: 'Player 7 Name', age: 29, team_id: @team_3.id)
    @player_8 = Player.create!(name: 'Player 8 Name', age: 21, team_id: @team_3.id)
    @player_9 = Player.create!(name: 'Player 9 Name', age: 25, team_id: @team_3.id)

    @competition_1.teams << @team_1
    @competition_1.teams << @team_2
    @competition_1.teams << @team_3
  end

  describe 'relationships' do
    it { should have_many(:team_competitions) }
    it { should have_many(:teams).through(:team_competitions) }
  end

  describe 'instance methods' do
    describe '#players_average_age' do
      it 'can take the average of a single competitions players ages' do
        expect(@competition_1.players_average_age).to eq(25)
      end
    end
  end
end
