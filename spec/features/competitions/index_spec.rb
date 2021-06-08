require 'rails_helper'

RSpec.describe 'competitions index page', type: :feature do
  before(:each) do
    @competition1 = Competition.create(name: 'Fight Club', location: 'NYC', sport: 'Boxing')
    @competition2 = Competition.create(name: 'Swimathon', location: 'Mexico City', sport: 'Swimming')
  end

  describe 'page appearance' do
    it 'shows you the name of each competition' do
      visit '/competitions'

      expect(page).to have_content(@competition1.name)
      expect(page).to have_content(@competition2.name)
    end
  end

  describe 'page functionality' do
    # xit 'the name of each competition listed links to its show page' do
    #   visit '/competitions'

    #   expect(page).to have_link(@competition1.name)
    #   expect(page).to have_link(@competition2.name)

    #   click_link ("#{@competition1.name}", match: :first)

    #   expect(current_path).to eq("/competitions/#{@competition1.id}")
    # end
  end
end