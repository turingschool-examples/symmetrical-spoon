require 'rails_helper'

RSpec.describe 'the competition index page' do
  # User Story 1 - Competition Index

# As a user
# When I visit the competion index
# Then I see the names of all competitions
# Each competition name links to its show page
  it 'shows the name of all the competitions' do
    comp1 = Competition.create!(name: 'Chuck Stuff', location: 'Denver', sport: 'Axe Throwing')
    comp2 = Competition.create!(name: 'Rowin for Freedom', location: 'Fort Collins', sport: 'Rowing')
    comp3 = Competition.create!(name: 'Baseball Stuff', location: 'Thornton', sport: 'Baseball')

    visit '/competitions'

    expect(page).to have_content(comp1.name)
    expect(page).to have_content(comp2.name)
    expect(page).to have_content(comp3.name)
  end
end
