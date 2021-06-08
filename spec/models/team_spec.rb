require 'rails_helper'

RSpec.describe Team do
  describe 'relationships' do
    it {should have_many :players}
    it {should have_many :competition_teams}
    it {should have_many(:competitions).through(:competition_teams)}
  end

  it 'averages age' do
    team_1 = Team.create!(nick_name: "The Chompin' Beavers", home_town: "Beaver")
    player_1 = team_1.players.create!(name: "Joe", age: 30)
    player_2 = team_1.players.create!(name: "Mary", age: 40)
    player_3 = team_1.players.create!(name: "Susan", age: 50)

    expect(team_1.average_age).to eq(40)
  end
end
