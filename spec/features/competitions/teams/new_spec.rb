require 'rails_helper'

RSpec.describe 'competitions index page' do

  before(:each) do
    @competition_1 = Competition.create!(name: 'Competiton 1 Name', location: 'Competition 1 Location', sport: "Competition 1 Sport")
  end

  it 'has nickname, hometown, and submit fields in the new form' do
    visit "/competitons/#{@competition_1.id}/teams/new"

    expect(page).to have_css('nickname')
    expect(page).to have_content("Nickname:")

    expect(page).to have_css('hometown')
    expect(page).to have_content("Hometown:")

    expect(page).to have_button("Submit")
    expect(page).to have_content("Submit")
  end

end
