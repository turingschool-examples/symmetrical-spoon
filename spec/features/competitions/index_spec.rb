require 'rails_helper'

RSpec.describe 'competitions index page' do

  before(:each) do
    @competition_1 = Competition.create!(name: 'Competiton 1 Name', location: 'Competition 1 Location', sport: "Competition 1 Sport")
    @competition_2 = Competition.create!(name: 'Competiton 2 Name', location: 'Competition 2 Location', sport: "Competition 2 Sport")
    @competition_3 = Competition.create!(name: 'Competiton 3 Name', location: 'Competition 3 Location', sport: "Competition 3 Sport")
  end

  it 'shows the names of all competitions' do
    visit "/competitions"

    expect(page).to have_content(@competition_1.name)
    expect(page).to have_content(@competition_2.name)
    expect(page).to have_content(@competition_3.name)
  end

  it 'has a link to each competitions show page via the name' do
    visit "/competitions"

    expect(page).to have_link(@competition_1.name, href: "/competitions/#{@competition_1.id}")

    click_link(@competition_1.name)

    expect(current_path).to eq("/competitons/#{@competition_1.id}")
  end
end
