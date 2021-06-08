require 'rails_helper'

RSpec.describe 'Competition Index Page' do
  describe 'displays all competitions' do
    before(:each) do
      @competition_1 = Competition.create!(name: "Women's Regional", location: "Louiseville", sport: "Basketball")
      @competition_2 = Competition.create!(name: "Men's Regional", location: "Wichita", sport: "Baseball")
      @competition_3 = Competition.create!(name: "Junior West Coast", location: "Portland", sport: "Swimming")
    end

    it 'shows list of names of competitions' do
      visit('/competitions')

      expect(page).to have_content("Women's Regional")
      expect(page).to have_content("Men's Regional")
      expect(page).to have_content("Junior West Coast")
    end

    it 'has links to each competitions show page' do
      visit('/competitions')
save_and_open_page
      expect(page).to have_link(@competition_1.name)
      expect(page).to have_link(@competition_2.name)
      expect(page).to have_link(@competition_3.name)
    end
  end
end
