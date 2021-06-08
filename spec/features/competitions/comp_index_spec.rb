require 'rails_helper'

describe 'competitions index' do
  before :each do
    @competition_1 = Competition.create!(name:'Tournament of Champions', location:'Harrisburg', sport:'Curling')
    @competition_2 = Competition.create!(name:'Tournament of People Who Are OK at Fencing', location:'Mechanicsburg', sport:'Fencing')
    @competition_3 = Competition.create!(name:'Boxathon', location:'Mckeesport', sport:'Boxing')
    visit "/competitions"
  end

  it 'displays all competitions names' do
    expect(current_path).to eq("/competitions")
    expect(page).to have_content('Tournament of Champions')
    expect(page).to have_content('Tournament of People Who Are OK at Fencing')
    expect(page).to have_content('Boxathon')
  end
end