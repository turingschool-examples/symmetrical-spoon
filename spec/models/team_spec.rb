require 'rails_helper'

RSpec.describe Team do
  describe 'realtionships' do
    it {should have_many(:players)}
    it {should have_many(:team_competitions)}
    it {should have_many(:competitions).through(:team_competitions)}
  end

  describe 'validations' do
    it {should validate_presence_of(:hometown)}
    it {should validate_presence_of(:nickname)}
  end

  describe 'class methods' do
    before :each do
      @team_1 = Team.create!(hometown: 'Arvada', nickname: 'Bulldogs')

      @player_1 = @team_1.players.create!(name: 'Roald', age: 21)
      @player_2 = @team_1.players.create!(name: 'Huey', age: 25)
      @player_3 = @team_1.players.create!(name: 'Marshall', age: 23)

      @team_2 = Team.create!(hometown: 'Golden', nickname: 'Frogs')

      @player_4 = @team_2.players.create!(name: 'Frank', age: 35)
      @player_5 = @team_2.players.create!(name: 'Big Rick', age: 22)
      @player_6 = @team_2.players.create!(name: 'Don', age: 40)

      @team_3 = Team.create!(hometown: 'Westminster', nickname: 'Penguins')

      @player_7 = @team_3.players.create!(name: 'Dale', age: 20)
      @player_8 = @team_3.players.create!(name: 'Bill', age: 22)
      @player_9 = @team_3.players.create!(name: 'Ray', age: 28)


      @team_4 = Team.create!(hometown: 'Fort Collins', nickname: 'Rapscallions')

      @player_10 = @team_4.players.create!(name: 'Phil', age: 23)
      @player_11 = @team_4.players.create!(name: 'Claudio', age: 22)
      @player_12 = @team_4.players.create!(name: 'Travis', age: 20)

      @team_5 = Team.create!(hometown: 'Commerce City', nickname: 'Larrys')

      @player_13 = @team_5.players.create!(name: 'Larry', age: 32)
      @player_14 = @team_5.players.create!(name: 'Larry', age: 21)
      @player_15 = @team_5.players.create!(name: 'Larry', age: 25)
    end

    describe '#avg_age_sorted_desc' do
      it 'gets the average age for each team and sorts them by highest average first' do
        expect(Team.avg_age_sorted_desc).to eq([@team_2, @team_5, @team_3, @team_1, @team_4])
      end
    end

    describe 'find_team_by_name_and_hometown' do
      it 'returns an instance of a team matching the given data' do
        expect(Team.find_team_by_name_and_hometown('Penguins', 'Westminster')).to eq(@team_3)
      end
    end
  end
end
