require 'rails_helper'

RSpec.describe 'A competition Show Page' do
  describe 'displays a competition show page' do
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

    it 'displays the competition attributes' do
      visit("/competitions/#{@competition_1.id}")

      expect(page).to have_content(@competition_1.name)
      expect(page).to have_content(@competition_1.location)
      expect(page).to have_content(@competition_1.sport)
      expect(page).to_not have_content(@competition_2.name)
      expect(page).to_not have_content(@competition_2.location)
      expect(page).to_not have_content(@competition_2.sport)
    end

    it 'displays all teams and attributes' do
      visit("/competitions/#{@competition_1.id}")
save_and_open_page
      expect(page).to have_content(@team_1.hometown)
      expect(page).to have_content(@team_1.nickname)
      expect(page).to have_content(@team_2.hometown)
      expect(page).to have_content(@team_2.nickname)
      expect(page).to have_content(@team_3.hometown)
      expect(page).to have_content(@team_3.nickname)
      expect(page).to_not have_content(@team_4.hometown)
      expect(page).to_not have_content(@team_4.nickname)
    end
  end
end
