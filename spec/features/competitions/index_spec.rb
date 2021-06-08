require 'rails_helper'
RSpec.describe 'Competition Index Page' do
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
    # TeamCompetition.create!(competition: @competition1, team: @team1)
    # @competition1.teams << @team2
    # TeamCompetition.create!(competition: @competition2, team: @team3)
    # @competition2.teams << @team4
    visit "/competitions"
  end

  it 'displays names of all competitions, which links to that competition show page' do
    expect(page).to have_link "#{@competition1.name}"
    expect(page).to have_link "#{@competition2.name}"
    click_on "#{@competition1.name}"
    expect(page).to have_current_path("/competitions/#{@competition1.id}")
  end
end
