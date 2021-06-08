require 'rails_helper'

RSpec.describe Competition, type: :model do
  describe "relationships" do
    it {should have_many :team_competitions}
    it {should have_many(:teams).through(:team_competitions)}
  end

    before :each do
      @team1 = Team.create!(hometown: "Atlanta", nickname: "Aces")
      @team2 = Team.create!(hometown: "Boston", nickname: "Batters")
      @team3 = Team.create!(hometown: "Chicago", nickname: "Kickers")
      @team4 = Team.create!(hometown: "Detroit", nickname: "Touchdowners")
      @player1 = @team1.players.create!(name: "Abe", age: 22)
      @player2 = @team1.players.create!(name: "Ben", age: 24)
      @player3 = @team2.players.create!(name: "Cal", age: 26)
      @player4 = @team2.players.create!(name: "Dez", age: 28)
      @player5 = @team3.players.create!(name: "Eff", age: 30)
      @player6 = @team3.players.create!(name: "Fez", age: 32)
      @player7 = @team4.players.create!(name: "Guy", age: 34)
      @player8 = @team4.players.create!(name: "Hal", age: 36)
      @competition1 = Competition.create!(name: "Batters Up", location: "Denver, CO", sport: "Baseball")
      @competition2 = Competition.create!(name: "Touch Down Town", location: "Seattle, WA", sport: "Football")
      @competition1.teams << @team1
      @competition1.teams << @team2
      @competition2.teams << @team3
      @competition2.teams << @team4
    end

  describe "instance methods" do
    it "#avg_player_age" do
      expect(@competition1.avg_player_age).to eq(25)
    end
  end
end
