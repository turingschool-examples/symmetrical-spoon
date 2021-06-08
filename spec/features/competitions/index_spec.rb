require 'rails_helper'

RSpec.describe 'Competition index page' do
  before(:each) do
    @comp_1 = Competition.create!(name: 'Mens regional', location: 'Brooklyn', sport:'Basketball')
    @comp_2 = Competition.create!(name: 'Hich School Classic', location: 'Bronx', sport:'Basketball')
  end

  it 'displays all the Competitions' do
    visit '/Competitions'

    within "#competition-#{@comp_1.id}" do
      expect(page).to have_content(@comp_1.name)
      expect(page).to have_content(@comp_1.location)
      expect(page).to have_content(@comp_1.sport)
    end

    within "#competition-#{@comp_2.id}" do
      expect(page).to have_content(@comp_2.name)
      expect(page).to have_content(@comp_2.location)
      expect(page).to have_content(@comp_2.sport)
    end
  end
end
