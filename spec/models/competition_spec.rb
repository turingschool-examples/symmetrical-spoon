require 'rails_helper'

RSpec.describe Competition, type: :model do
  describe "relationships" do
    it {should have_many :competition_teams}
    it {should have_many(:teams).through(:competition_teams)}
  end

  describe '#hometowns' do
    it 'shows returns the teams hometowns' do
      competition_1 = Competition.create!(name: "Competition 1", location: "Denver", sport: "Basketball")
      team_1 = competition_1.teams.create!(hometown: "Leesburg", nickname: "The Lee's")
      team_2 = competition_1.teams.create!(hometown: "Nashville", nickname: "The Nash Bash")

      competition_1.teams << team_1
      competition_1.teams << team_2


      expect(Competition.hometowns(competition_1)).to eq(["Leesburg", "Nashville"])
    end
  end

  describe 'average_age' do
    it 'returns the average age for all the players in the competition' do
      competition_1 = Competition.create!(name: "Competition 1", location: "Denver", sport: "Basketball")
      team_1 = competition_1.teams.create!(hometown: "Leesburg", nickname: "The Lee's")
      team_2 = competition_1.teams.create!(hometown: "Nashville", nickname: "The Nash Bash")
      team_1.players.create!(name: "John Johnson", age: 24)
      team_2.players.create!(name: "Derik Douglas", age: 26)

      competition_1.teams << team_1
      competition_1.teams << team_2

      expect(Competition.average_age(competition_1)).to eq(25)
    end
  end
end