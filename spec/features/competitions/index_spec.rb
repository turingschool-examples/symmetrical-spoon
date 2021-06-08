require 'rails_helper'

RSpec.describe 'index' do
  it 'shows all the names of the competitions' do
    competition_1 = Competition.create!(name: "Competition 1", location: "Denver", sport: "Basketball")
    competition_2 = Competition.create!(name: "Competition 2", location: "Boulder", sport: "Football")

    visit '/competitions'
    save_and_open_page

    expect(page).to have_content("Competition 1")
    expect(page).to have_content("Competition 2")
  end
end
