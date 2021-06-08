require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'relationships' do
    it {should have_many :players}
    it {should have_many :registrations}
    it {should have_many(:competitions).through(:registrations)}
  end

  describe 'class methods' do
    it '.avg_player_age returns average player age on a collection of teams' do
      competition = Competition.create!(name: "Regionals", location: "Denver, CO", sport: "Soccer")

      team1 = competition.teams.create!(hometown: "Howell, NJ", nickname: "Howlers")
      team2 = competition.teams.create!(hometown: "Portland, OR", nickname: "Porters")

      player1 = team1.players.create!(name: "Leslie Knope", age: 32)
      player2 = team1.players.create!(name: "Ron Swanson", age: 43)
      player3 = team2.players.create!(name: "Tom Haverford", age: 28)

      expect(Team.avg_player_age.round(2)).to eq(34.33)
      expect(competition.teams.avg_player_age.round(2)).to eq(34.33)
    end
  end
end
