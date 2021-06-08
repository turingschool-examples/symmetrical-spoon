require 'rails_helper'

RSpec.describe 'Team creation' do
  before :each do
    @competition_1 = Competition.create!(name: 'Extreme Pogs', location: 'Thunder Dome', sport: 'Pogs')
    visit "/competitions/#{@competition_1.id}"
  end
  describe 'reaching the new page' do
    it 'is added through a competion show page' do
      click_button('Add Team')

      expect(page).to have_current_path("/teams/new?competition_id=#{@competition_1.id}")
    end
  end
  describe 'creating a team' do
    it 'has a happy path' do
      click_button('Add Team')

      fill_in 'team_nickname', with: 'Bloody Rabbits'
      fill_in 'team_location', with: 'Fort Collins'
      click_button('Add Team')

      expect(page).to have_current_path("/competitions/#{@competition_1.id}")
      expect(page).to have_content('Bloody Rabbits')
      expect(page).to have_content('Fort Collins')
    end
    it 'has a sad path' do
      click_button('Add Team')
      click_button('Add Team')

      expect(page).to have_content("Error: Nickname can't be blank and Hometown can't be blank")
    end
  end
end
