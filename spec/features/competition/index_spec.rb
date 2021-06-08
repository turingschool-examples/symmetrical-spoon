require 'rails_helper'

RSpec.describe 'Competition Index Page' do
  before :each do
    @comp_1 = Competition.create!(name: 'Bi-annual Annual Tourney', location: 'Arvada, CO', sport: 'Basketball')
    @comp_2 = Competition.create!(name: 'Tournament of Champions', location: 'Westminster, CO', sport: 'Football')
    @comp_3 = Competition.create!(name: 'Witt-Bowl', location: 'Lakewood, CO', sport: 'Soccer')
    @comp_4 = Competition.create!(name: 'M&Ms Regional', location: 'Golden, CO', sport: 'Tennis')
    @comp_5 = Competition.create!(name: 'Pickup Game', location: 'Aurora, CO', sport: 'Hockey')

    visit '/competitions'
  end

  it 'shows the names of all competitions' do
    expect(page).to have_content(@comp_1.name)
    expect(page).to have_content(@comp_2.name)
    expect(page).to have_content(@comp_3.name)
    expect(page).to have_content(@comp_4.name)
    expect(page).to have_content(@comp_5.name)
  end

  it 'links to the competitions show page' do
    click_on "#{@comp_1.name}"

    expect(current_path).to eq("/competitions/#{@comp_1.id}")
  end
end
