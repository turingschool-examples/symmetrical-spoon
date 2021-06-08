require 'rails_helper'

RSpec.describe Competition do
  before :each do
    @finals = Competition.create!(name: 'NBA Finals', location: 'Orlando', sport: 'Basketball')
    @world_cup = Competition.create!(name: 'The World Cup 2021', location: 'Berlin', sport: 'Soccer')
    @team_1 = Team.create!(hometown: 'Burgess, PA', nickname: 'The Giants')
    @team_2 = Team.create!(hometown: 'San Diego, CA', nickname: 'Salamanders')
    @finals.teams << @team_1
    @finals.teams << @team_2
    @player_1 = @team_1.players.create!(name: "Henry", age: 13)
    @player_2 = @team_1.players.create!(name: "Bob", age: 11)
    @player_3 = @team_2.players.create!(name: "Gilfoyle", age: 16)
    @player_4 = @team_2.players.create!(name: "Damian", age: 22)
  end

  describe 'relationships' do
    it {should have_many :teams_in_plays}
    it {should have_many(:teams).through(:teams_in_plays)}
  end

  describe 'instance methods' do
    it 'returns average age of competitors' do
      exp_avg = ((@player_1.age + @player_2.age +
                 @player_3.age + @player_4.age) / 4.0)
      expect(@finals.avg_age).to eq exp_avg
    end
  end
end
