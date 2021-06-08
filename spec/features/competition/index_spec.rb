require 'rails_helper'

RSpec.describe 'competition index' do
  it 'shows competition names' do
    competition_1 = Competition.create!(name: "Basket Weavers Interstallar", location: "Mars", sport: "Basket Weaving")
    competition_2 = Competition.create!(name: "Speed Walkers West", location: "Denver", sport: "Speed Walking")

    visit "/competitions"

    expect(page).to have_link("#{competition_1.name}")
    expect(page).to have_link("#{competition_2.name}")
  end
end
