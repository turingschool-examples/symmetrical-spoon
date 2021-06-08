require 'rails_helper'

RSpec.describe Competition, type: :model do
  describe 'relationships' do
    it { should have_many(:team_competitions) }
    it { should have_many(:teams).through(:team_competitions) }
    it { should have_many(:players).through(:teams) }
  end

  before :each do
    @competition1 = Competition.create!(name: "Men’s Regional", location: 'Louisville', sport: 'basketball')
    @team1 = @competition1.teams.create!(hometown: 'Leesburg', nickname: 'Rockets')
    @player1 = @team1.players.create!(name: 'Billy Bigshoes', age: 12)
    @player2 = @team1.players.create!(name: 'Billy Bigshoes', age: 15)
    @player3 = @team1.players.create!(name: 'Billy Bigshoes', age: 11)

    @team2 = @competition1.teams.create!(hometown: 'Knoxville', nickname: 'Wildcats')
    @player4 = @team1.players.create!(name: 'Billy Bigshoes', age: 13)
    @player5 = @team1.players.create!(name: 'Billy Bigshoes', age: 14)
    @player6 = @team1.players.create!(name: 'Billy Bigshoes', age: 13)
  end

  describe 'instance methods' do
    describe '#average_player_age' do
      it "Should return the average age of all players in the competition" do
        expect(@competition1.average_player_age).to eq(13)

        expect(@competition1.average_player_age).to_not eq(14)
      end
    end
  end
end
