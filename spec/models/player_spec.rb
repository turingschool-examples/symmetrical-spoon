require 'rails_helper'

RSpec.describe Player do
  describe 'relationships' do
    it {should belong_to :team}
  end

  # it 'averages age' do
  #   team_1 = Team.create!(nick_name: "The Chompin' Beavers", home_town: "Beaver")
  #   player_1 = team_1.players.create!(name: "Joe", age: 30)
  #   player_2 = team_1.players.create!(name: "Mary", age: 40)
  #   player_3 = team_1.players.create!(name: "Susan", age: 50)
  #
  #   expect(Player.average_age).to eq(40)
  # end
end
