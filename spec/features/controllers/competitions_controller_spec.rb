require 'rails_helper'

RSpec.describe 'competition section of site' do

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

  describe 'index page' do
    it 'lists each competition with a link' do
      visit "/competitions"

      expect(page).to have_content @finals.name
      expect(page).to have_content @world_cup.name
      click_link @finals.name
      expect(current_path).to eq "/competitions/#{@finals.id}"
    end

  end

  describe 'show page' do
    it 'has info about competition' do
      visit "/competitions/#{@finals.id}"

      expect(page).to have_content @finals.name
      expect(page).to have_content @finals.location
      expect(page).to have_content @finals.sport
    end

    it 'lists info about teams and player age' do
      visit "/competitions/#{@finals.id}"

      exp_avg = ((@player_1.age + @player_2.age +
                 @player_3.age + @player_4.age) / 4.0)
      expect(page).to have_content @team_1.hometown
      expect(page).to have_content @team_1.nickname
      expect(page).to have_content @team_2.hometown
      expect(page).to have_content @team_2.nickname
      expect(page).to have_content exp_avg
    end
  end

end
