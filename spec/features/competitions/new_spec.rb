require 'rails_helper'

RSpec.describe 'the create new team form', type: :feature do
  before(:each) do
    @competition_1 = Competition.create!(name: 'Mens Regional', location: 'Louisville', sport: 'basketball')
    @competition_2 = Competition.create!(name: 'Northeast Invitational', location: 'New York', sport: 'pickleball')
    @team_1 = @competition_1.teams.create!(hometown: 'Leesburg', nickname: 'Rockets')
  end

  it 'has form to create new team' do
      visit "/competitions/#{@competition_1.id}/new_team"
      # binding.pry
      # save_and_open_page
    expect(page).to have_content('Register New Team')
    expect(find('form')).to have_content("Hometown")
    expect(find('form')).to have_content("Nickname")
    expect(page).to have_button("Register")
      click_on "Register"
    expect(current_path).to eq("/competitions/#{@competition_1.id}")
  end

  it "creates a new team" do
    visit "/competitions/#{@competition_1.id}/new_team"

    fill_in "Hometown", with: "#{@team_1.hometown}"
    fill_in "Nickname", with: "#{@team_1.nickname}"
      click_button "Register"
    expect(current_path).to eq("/competitions/#{@competition_1.id}")
    expect(page).to have_content("#{@team_1.nickname}")
  end
end
