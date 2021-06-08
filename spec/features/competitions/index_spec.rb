require 'rails_helper'

RSpec.describe 'Competition Index' do
  describe 'index page' do
    it 'can see the names of all competitions & links to show page' do
      # User Story 1 - Competition Index
      # As a user
      # When I visit the competion index
      # Then I see the names of all competitions
      # Each competition name links to its show page

      competition_3 = Competition.create!(name: 'Womens Regional', location: 'Denver', sport: 'track')
      competition_1 = Competition.create!(name: 'Kids Regional', location: 'Colorado Springs', sport: 'baseball')
      competition_2 = Competition.create!(name: 'Mens Regional', location: 'Louisville', sport: 'basketball')

      visit "/competitions"
      
      expect(page).to have_content(competition_1.name)
      expect(page).to have_content(competition_2.name)
      expect(page).to have_content(competition_3.name)
      expect(page).to have_link("#{competition_1.name}")
      expect(page).to have_link("#{competition_2.name}")
      expect(page).to have_link("#{competition_3.name}")
    end
  end
end
