require 'rails_helper'

RSpec.describe 'competition index page,' do
  before :all do
    @competition_1 = Competition.create!(name: 'World Cup Qualifier 1', location: "Paraguay", sport: "futbol")
    @competition_2 = Competition.create!(name: 'World Cup Qualifier 2', location: "Argentina", sport: "futbol")
    @competition_3 = Competition.create!(name: 'World Cup Qualifier 3', location: "Colombia", sport: "futbol")


    visit "/competitions"
  end

  it 'displays the names of all competitions as a link to their show page' do
    save_and_open_page

    expect(page).to have_link(@competition_1.name)
    expect(page).to have_link(@competition_2.name)
    expect(page).to have_link(@competition_3.name)

    click_link(@competition_1.name)
    expect(current_path).to eq("/competitions/#{@competition_1.id}")
  end
end
