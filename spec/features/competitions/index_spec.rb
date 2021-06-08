require 'rails_helper'

RSpec.describe 'Competions Index Page' do
  before :each do
    @competition1 = Competition.create!(name: "Men’s Regional", location: 'Louisville', sport: 'basketball')
    @team1 = @competition1.teams.create!(hometown: 'Leesburg', nickname: 'Rockets')
    @player1 = @team1.players.create!(name: 'Billy Bigshoes', age: 12)
    @player2 = @team1.players.create!(name: 'Billy Bigshoes', age: 15)
    @player3 = @team1.players.create!(name: 'Billy Bigshoes', age: 11)

    @team2 = @competition1.teams.create!(hometown: 'Knoxville', nickname: 'Wildcats')
    @player4 = @team1.players.create!(name: 'Billy Bigshoes', age: 13)
    @player5 = @team1.players.create!(name: 'Billy Bigshoes', age: 14)
    @player6 = @team1.players.create!(name: 'Billy Bigshoes', age: 10)

    visit competitions_path
  end

  it 'I see the names of all competitions' do
    expect(current_path).to eq(competitions_path)

    within("#competition-#{@competition1.id}") do
      expect(page).to have_link(@competition1.name)
    end
  end

  it "Each competition name links to its show page" do
    expect(current_path).to eq(competitions_path)
    expect(page).to have_link(@competition1.name, href: competition_path(@competition1) )

    click_link "#{@competition1.name}"

    expect(current_path).to eq(competition_path(@competition1))
    expect(page).to_not have_link(@competition1.name, href: competition_path(@competition1) )
  end
end
