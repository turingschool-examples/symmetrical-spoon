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
      team3 = competition.teams.create!(hometown: "Anchorage, AK", nickname: "Anchors")

      player1 = team1.players.create!(name: "Leslie Knope", age: 32)
      player2 = team1.players.create!(name: "Ron Swanson", age: 43)
      player3 = team2.players.create!(name: "Tom Haverford", age: 28)

      expect(Team.avg_player_age.round(2)).to eq(34.33)
      expect(competition.teams.avg_player_age.round(2)).to eq(34.33)
    end

    it '.by_player_avg_age returns a list of teams sorted by and including player avg age' do
      competition = Competition.create!(name: "Regionals", location: "Denver, CO", sport: "Soccer")

      team1 = competition.teams.create!(hometown: "Howell, NJ", nickname: "Howlers")
      team2 = competition.teams.create!(hometown: "Portland, OR", nickname: "Porters")
      team3 = competition.teams.create!(hometown: "Anchorage, AK", nickname: "Anchors")

      player1 = team1.players.create!(name: "Leslie Knope", age: 32)
      player2 = team1.players.create!(name: "Ron Swanson", age: 43)
      player3 = team2.players.create!(name: "Tom Haverford", age: 28)

      expect(Team.by_player_avg_age.first.nickname).to eq(team3.nickname)
      expect(Team.by_player_avg_age.first.avg_age).to eq(nil)
      expect(Team.by_player_avg_age.second.nickname).to eq(team1.nickname)
      expect(Team.by_player_avg_age.second.avg_age).to eq(37.5)
      expect(Team.by_player_avg_age.last.nickname).to eq(team2.nickname)
      expect(Team.by_player_avg_age.last.avg_age).to eq(28)
    end
  end
end
