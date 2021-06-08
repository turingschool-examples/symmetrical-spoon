require 'rails_helper'

RSpec.describe Competition, type: :model do
  describe 'relationships' do
    it { should have_many(:competition_teams) }
    it { should have_many(:teams).through(:competition_teams) }
  end

  describe 'instance methods' do
    before :each do
    @competition_1 = Competition.create!(name:'Tournament of Champions', location:'Harrisburg', sport:'Curling')
    @competition_2 = Competition.create!(name:'Tournament of People Who Are OK at Fencing', location:'Mechanicsburg', sport:'Fencing')
    @competition_3 = Competition.create!(name:'Boxathon', location:'Mckeesport', sport:'Boxing')
    @team_1 = @competition_1.teams.create!(hometown: 'Harrisburg', nickname: 'Senators')
    @team_2 = @competition_1.teams.create!(hometown: 'Farrisburg', nickname: 'Congressmen')
    @team_3 = @competition_1.teams.create!(hometown: 'Darrisburg', nickname: 'Embezzlers')
    @team_4 = @competition_2.teams.create!(hometown: 'Boston', nickname: 'Monkeys')
    @team_5 = @competition_2.teams.create!(hometown: 'Amherst', nickname: 'Zebras')
    @team_6 = @competition_2.teams.create!(hometown: 'Croydon', nickname: 'Elephants')
    @team_7 = @competition_3.teams.create!(hometown: 'San Jose', nickname: 'Tacos')
    @team_8 = @competition_3.teams.create!(hometown: 'San Cristobal', nickname: 'Enchiladas')
    @team_9 = @competition_3.teams.create!(hometown: 'San Jacinto', nickname: 'Pozole')
    @player_1 = @team_1.players.create!(name: 'Tim', age: 19)
    @player_2 = @team_1.players.create!(name: 'Lim', age: 49)
    @player_3 = @team_1.players.create!(name: 'Dim', age: 39)
    @player_4 = @team_2.players.create!(name: 'Fim', age: 29)
    @player_5 = @team_2.players.create!(name: 'Kim', age: 69)
    @player_6 = @team_2.players.create!(name: 'Bim', age: 89)
    @player_7 = @team_2.players.create!(name: 'Nim', age: 99)
    @player_8 = @team_3.players.create!(name: 'Mim', age: 79)
    @player_9 = @team_3.players.create!(name: 'Sim', age: 69) 
    @player_10 = @team_4.players.create!(name: 'Zim', age: 59)
    @player_11 = @team_5.players.create!(name: 'Pim', age: 49)
    @player_12 = @team_6.players.create!(name: 'Wim', age: 39)
    @player_13 = @team_7.players.create!(name: 'Him', age: 29)
    @player_14 = @team_8.players.create!(name: 'Jim', age: 19)
    @player_15 = @team_9.players.create!(name: 'Vim', age: 9)
    end
    describe 'player_age' do
      it 'returns average age of players in tournament' do
        expect(@competition_1.player_age.to_f.round(2)).to eq (35.67)
      end
    end
  end
end
