require 'rails_helper'

RSpec.describe 'competition index page' do

  before :each do
    @finals = Competition.create!(name: 'NBA Finals', location: 'Orlando', sport: 'Basketball')
    @world_cup = Competition.create!(name: 'The World Cup 2021', location: 'Berlin', sport: 'Soccer')
  end

  describe 'page appearance' do
    it 'lists each competition with a link' do
      visit "/competitions"

      expect(page).to have_content @finals.name
      expect(page).to have_content @world_cup.name
      click_link @finals.name
      expect(current_path).to eq "/competitions/#{@finals.id}"
    end
  end

end
