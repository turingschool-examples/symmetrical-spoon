require 'rails_helper'

RSpec.describe Competition, type: :model do
  describe 'relationships' do
    it { should have_many(:teams) }
    # it { should have_many(:players).through(:teams) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
  end

  before(:each) do
    @competition_1 = Competition.create!(name: 'Mens Regional', location: 'Louisville', sport: 'basketball')
    @competition_2 = Competition.create!(name: 'Northeast Invitational', location: 'New York', sport: 'pickleball')
    @team_1 = @competition_1.teams.create!(hometown: 'Leesburg', nickname: 'Rockets')
    @team_2 = @competition_1.teams.create!(hometown: 'Houston', nickname: 'Jaguars')
    @player_1 = Player.create!(name: 'Billy Bigshoes', age: 12)
    @player_2 = Player.create!(name: 'Steph Curry', age: 24)
    @player_3 = Player.create!(name: 'Joe Schmoe', age: 30)
    @player_4 = Player.create!(name: 'Pat Smith', age: 38)
    @player_5 = Player.create!(name: 'Jamie Jones', age: 41)

    TeamPlayer.create!(team: @team_1, player: @player_1)
    TeamPlayer.create!(team: @team_1, player: @player_2)
    TeamPlayer.create!(team: @team_1, player: @player_3)
    TeamPlayer.create!(team: @team_2, player: @player_4)
    TeamPlayer.create!(team: @team_2, player: @player_5)
  end

  describe 'instance methods' do
    describe '.average_players_age' do
      it 'returns the competition average players age' do
        expect(@competition_1.average_players_age).to eq(29)
      end
    end
  end

  # describe 'class methods' do
  #   describe '#adoptable' do
  #     it 'returns adoptable pets' do
  #       expect(Pet.adoptable).to eq([@pet_1, @pet_2])
  #     end
  #   end
  # end
end
