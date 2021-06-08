require 'rails_helper'

RSpec.describe 'the competitions index' do
  before(:each)do
    @competition_1 = Competition.create!(name: 'Mens Regional', location: 'Louisville', sport: 'basketball')
    @competition_2 = Competition.create!(name: 'Northeast Invitational', location: 'New York', sport: 'pickleball')
    @competition_3 = Competition.create!(name: 'Rocky Mountain Showdown', location: 'Aurora', sport: 'football')

    visit "/competitions"
  end

  it 'lists all the competition names' do
    expect(page).to have_content(@competition_1.name)
    expect(page).to have_content(@competition_2.name)
    expect(page).to have_content(@competition_3.name)
  end

  it 'displays a link to each competition' do
    expect(page).to have_content(@competition_1.name)
    expect(page).to have_link(@competition_1.name)

    click_link(@competition_1.name)

    expect(page).to have_current_path("/competitions/#{@competition_1.id}")
    expect(page).to_not have_current_path("/competitions")
  end
end
