require 'rails_helper'

RSpec.describe 'competitions index page' do

  before(:each) do
    @competition_1 = Competition.create!(name: 'Competiton 1 Name', location: 'Competition 1 Location', sport: "Competition 1 Sport")
  end

  it 'has nickname, hometown, and submit fields in the new form' do
    visit "/competitions/#{@competition_1.id}/teams/new"

    expect(page).to have_content("Nickname:")
    expect(page).to have_content("Hometown:")
    expect(page).to have_button("Submit")
  end

end
