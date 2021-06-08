require 'rails_helper'

RSpec.describe Player do
  describe 'relationships' do
    it {should belong_to :team}
  end

  describe "class methods" do
    it 'can calculate the players average age' do
      competition_3 = Competition.create!(name: 'Womens Regional', location: 'Denver', sport: 'track')
      competition_1 = Competition.create!(name: 'Kids Regional', location: 'Colorado Springs', sport: 'baseball')
      competition_2 = Competition.create!(name: 'Mens Regional', location: 'Louisville', sport: 'basketball')
      team_1 = competition_1.teams.create!(hometown: 'Leesburg', nickname: 'Rockets')
      team_2 = competition_1.teams.create!(hometown: 'Vicksburg', nickname: 'Titans')
      team_3 = competition_1.teams.create!(hometown: 'Atlanta', nickname: 'Braves')
      player_1 = team_1.players.create!(name: 'Billy', age: 10)
      player_2 = team_2.players.create!(name: 'George', age: 5)
      player_3 = team_3.players.create!(name: 'Billy', age: 15)

      expect(Player.average_age).to eq(10)
    end
  end
end
