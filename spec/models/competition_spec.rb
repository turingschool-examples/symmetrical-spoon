require 'rails_helper'

RSpec.describe Competition do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :location }
    it { should validate_presence_of :sport }
  end

  describe 'relationships' do
    it { should have_many :tourneys }
    it { should have_many(:teams).through(:tourneys) }
  end

  before(:each) do
    @competition_1 = Competition.create!(name: "Women's Regional", location: "Louiseville", sport: "Basketball")
    @competition_2 = Competition.create!(name: "Men's Regional", location: "Wichita", sport: "Baseball")

    @team_1 = Team.create!(hometown: 'Small Town', nickname: 'Warriors')
    @player_1 = @team_1.players.create!(name: 'Mary', age: 12)
    @player_2 = @team_1.players.create!(name: 'May', age: 10)
    @player_3 = @team_1.players.create!(name: 'Megan', age: 14)

    @team_2 = Team.create!(hometown: 'Medium Town', nickname: 'Atlantis')
    @player_4 = @team_2.players.create!(name: 'Lisa', age: 9)
    @player_5 = @team_2.players.create!(name: 'Lori', age: 8)
    @player_6 = @team_2.players.create!(name: 'Lindsey', age: 11)

    @team_3 = Team.create!(hometown: 'Large Town', nickname: 'Badgers')
    @player_7 = @team_3.players.create!(name: 'Sally', age: 7)
    @player_8 = @team_3.players.create!(name: 'Sami', age: 9)
    @player_9 = @team_3.players.create!(name: 'Suzie', age: 14)

    @team_4 = Team.create(hometown: 'Fairplay', nickname: 'Anteaters')
    @player_10 = @team_4.players.create!(name: 'Thomas', age: 13)
    @player_11 = @team_4.players.create!(name: 'George', age: 15)

    Tourney.create!(competition_id: @competition_1.id, team_id: @team_1.id)
    Tourney.create!(competition_id: @competition_1.id, team_id: @team_2.id)
    Tourney.create!(competition_id: @competition_1.id, team_id: @team_3.id)
    Tourney.create!(competition_id: @competition_2.id, team_id: @team_4.id)
  end

  describe '#average_age' do
    it 'calculates average age within a competition' do
      expect(@competition_1.average_age.round(1)).to eq(10.4)
    end
  end
end
