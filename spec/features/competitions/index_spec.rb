require 'rails_helper'
# User Story 1 - Competition Index

# As a user
# When I visit the competion index
# Then I see the names of all competitions
# Each competition name links to its show page

RSpec.describe 'competition index page' do
  describe 'display' do
    before :each do 
      indigo = Competition.create!(name: "Indigo League", location: "Louisville", sport:"rocket launching")
      scarlet = Competition.create!(name: "Scarlet League", location: "Denver", sport: "tap dancing")
      burgundy = Competition.create!(name: "Burgundy League", location: "Austin", sport: "extreme grilling")
    end

    it 'shows names of all competitions' do
      visit "/competitions"

      expect(page).to have_content("Indigo League")
      expect(page).to have_content("Scarlet League")
    end

    it 'links to each competition show page'
  end
end