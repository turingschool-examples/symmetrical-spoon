require 'rails_helper'

RSpec.describe 'index' do
  before(:each) do
    @comp_1 = Competition.create!(name: 'Regional Cup', location: "Louville", sport: 'basketball')
    @comp_2 = Competition.create!(name: 'Premier Cup', location: 'Las Vegas', sport: 'basketball')

    visit "/competitions"
  end

  describe 'competitions info' do
    it 'it has competition names' do

      expect(page).to have_content(@comp_1.name)
      expect(page).to have_content(@comp_2.name)
    end
  end

  describe 'competitions link' do
    it 'it has competition links' do

      expect(page).to have_link(@comp_1.name)
      # click_link(@comp_1.name)
      # expect(current_path).to eq("/competitions/#{@comp_1.id}")

      expect(page).to have_link(@comp_2.name)
      # click_link(@comp_2.name)
      # expect(current_path).to eq("/competitions/#{@comp_2.id}")
    end
  end
end