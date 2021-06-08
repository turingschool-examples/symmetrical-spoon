require 'rails_helper'

RSpec.describe 'competition index' do
  before :each do
    @comp_1 = Competition.create!(name: 'Show Me What You Got', location: 'Space', sport: 'Performance art')
    @comp_2 = Competition.create!(name: 'Intergalactic Baseball', location: 'The Milky Way', sport: 'Baseball')
    @comp_3 = Competition.create!(name: 'MeSeeks', location: 'Earth', sport: 'Unclear')
  end

  it 'lists the names of all competitions' do
    visit "/competitions"

    expect(page).to have_content @comp_1.name
    expect(page).to have_content @comp_2.name
    expect(page).to have_content @comp_3.name
  end

  it 'links to each competition show page'  do
    visit "/competitions"

    click_link 'Show Me What You Got'

    expect(current_path).to eq "/competitions/#{@comp_1.id}"
  end
end