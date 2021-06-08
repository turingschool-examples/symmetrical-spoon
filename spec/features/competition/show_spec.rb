require 'rails_helper'

RSpec.describe 'Competitions Show' do
  before :each do
    @competition_1 = Competition.create!(name: 'Extreme Pogs',
                                         location: 'Thunder Dome',
                                         sport: 'Pogs')
  end
  describe 'visit' do
    it 'has the names of all competitions' do
      visit "/competitions/#{@competition_1.id}"

      expect(page).to have_content('Extreme Pogs')
      expect(page).to have_content('Thunder Dome')
      expect(page).to have_content('Pogs')
    end
  end
end
