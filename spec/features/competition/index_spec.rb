require 'rails_helper'

RSpec.describe 'Competitions Index' do
  before :each do
    @competition_1 = Competition.create!(name: 'Extreme Pogs', location: 'Thunder Dome', sport: 'Pogs')
      @team_1 = Team.create!(hometown: 'Littleton', nickname: 'Murder Dogs')
        @team_1.players.create!(name: 'Suzy Jinkins', age: 12)
        CompetitionTeam.create!(team: @team_1, competition: @competition_1)
    @competition_2 = Competition.create!(name: 'Snakes and Danger', location: 'Mount Everest', sport: 'Snakes and Ladders')
    @competition_3 = Competition.create!(name: 'Jack be Nimble', location: 'Mount Vesuveous', sport: 'Jacks')
  end
  describe 'visit' do
    it 'has the names of all competitions' do
      visit '/competitions'

      expect(page).to have_content('Extreme Pogs')
      expect(page).to have_content('Snakes and Danger')
      expect(page).to have_content('Jack be Nimble')
    end

    it 'has links to all competitions' do
      visit '/competitions'

      expect(page).to have_link('Extreme Pogs')
      expect(page).to have_link('Snakes and Danger')
      expect(page).to have_link('Jack be Nimble')

      click_link('Extreme Pogs')

      expect(page).to have_current_path("/competitions/#{@competition_1.id}")
    end
  end
end
