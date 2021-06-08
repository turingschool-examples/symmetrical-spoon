require 'rails_helper'

RSpec.describe 'Competition' do
  before(:each) do
    @competition_1 = Competition.create!(name: 'Mens Basketball', location: 'Artic', sport: 'Basketball')
    @competition_2 = Competition.create!(name: 'Womans Basketball', location: 'Denver', sport: 'Basketball')
  end
  
  #   User Story 1 - Competition Index
  it 'has an index of all competition names' do 
    visit '/competitions'

    expect(page).to have_content('Competitions')

    expect(page).to have_link(@competition_1.name)

    click_link "Mens Basketball"

    expect(current_path).to eq("/competitions/#{@competition_1.id}")
  end
end