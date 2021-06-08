require 'rails_helper'

RSpec.describe Player do
  before :each do
    @team_1 = Team.create!(hometown: 'Burgess, PA', nickname: 'The Giants')
    @team_2 = Team.create!(hometown: 'San Diego, CA', nickname: 'Salamanders')
    @player_1 = @team_1.players.create!(name: "Henry", age: 13)
    @player_2 = @team_1.players.create!(name: "Bob", age: 11)
    @player_3 = @team_2.players.create!(name: "Gilfoyle", age: 16)
    @player_4 = @team_2.players.create!(name: "Damian", age: 22)
  end

  describe 'relationships' do
    it {should belong_to :team}
  end

  describe 'class methods' do
    it '::average_age' do
      exp_avg = ((@player_1.age + @player_2.age +
                 @player_3.age + @player_4.age) / 4.0)
      expect(Player.average_age).to eq exp_avg
    end
  end

end
