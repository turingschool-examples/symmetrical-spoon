require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'relationships' do
    it {should have_many :players}
    it {should have_many :competition_teams}
    it {should have_many(:competitions).through(:competition_teams)}
  end
  describe '.average_age' do
    it 'averages the age of the players on the team' do
      comp1 = Competition.create!(name: 'Chuck Stuff', location: 'Denver', sport: 'Axe Throwing')
      team1 = comp1.teams.create!(hometown: 'Denver', nickname: 'Team1')
      player1 = team1.players.create!(name: 'P1', age: 20)
      player3 = team1.players.create!(name: 'P3', age: 30)

      expect(team1.average_age).to eq(25)
    end
  end
end
