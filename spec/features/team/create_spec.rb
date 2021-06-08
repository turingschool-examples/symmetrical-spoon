require 'rails_helper'

RSpec.describe 'team creation' do
#   As a user
# When I visit a competition's show page
# Then I see a link to register a new team
# When I click this link
# Then I am taken to a new page where I see a form
# When I fill in this form with a team's hometown and nickname
# And I click submit
# Then I am redirected back to the competition's show page
# And I see the new team I created listed
  it 'has a link to register a new team' do
    comp1 = Competition.create!(name: 'Chuck Stuff', location: 'Denver', sport: 'Axe Throwing')

    visit "/competitions/#{comp1.id}/show"

    expect(page).to have_link('Register')

    click_on('Register')

    expect(current_path).to eq("/competitions/#{comp1.id}/teams/new")
  end

  it 'has a link to register a new team' do
    comp1 = Competition.create!(name: 'Chuck Stuff', location: 'Denver', sport: 'Axe Throwing')

    visit "/competitions/#{comp1.id}/teams/new"
    fill_in 'Hometown', with: 'Boulder'
    fill_in 'Nickname', with: 'Boulderers'
    
    click_button 'Submit'

    expect(current_path).to eq("/competitions/#{comp1.id}/show")
    expect(page).to have_content('Boulderers')
  end
end