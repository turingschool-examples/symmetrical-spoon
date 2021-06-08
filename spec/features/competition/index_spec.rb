require 'rails_helper'

RSpec.describe 'Competition index page' do
  before(:each) do
    @competition_1 = Competition.create!(name: "Men’s Regional", location: "Louisville", sport: "basketball")
    @competition_2 = Competition.create!(name: "Nationals", location: "Orlando", sport: "Cheer")
  end

  it "it shows the names of all competitions and links to their show page" do
    # User Story 1 - Competition Index
    # As a user
    # When I visit the competion index
    # Then I see the names of all competitions
    # Each competition name links to its show page
    visit "/competitions"
    expect(current_path).to eq("/competitions")

    expect(page).to have_content(@competition_1.name)
    expect(page).to have_link("#{@competition_1.name}")
    click_link("#{@competition_1.name}")
    expect(current_path).to eq("/competitions/#{@competition_1.id}")

    visit "/competitions"
    expect(page).to have_content(@competition_2.name)
    expect(page).to have_link("#{@competition_2.name}")
    click_link("#{@competition_2.name}")
    expect(current_path).to eq("/competitions/#{@competition_2.id}")
  end
end
