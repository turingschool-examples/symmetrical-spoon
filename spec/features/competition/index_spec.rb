require 'rails_helper'
describe 'actor show page' do 
  before(:each) do
    @competition = Competition.create!(name:'Kitzbühel', location:'Austria', sport:'downhill skiing')
  end
  # User Story 1 - Competition Index

  # As a user
  # When I visit the competion index
  # Then I see the names of all competitions
  # Each competition name links to its show page
  it 'shows the names of all competitions and each name is a link to the show page' do
    visit "/competitions"
    expect(page).to have_link(@competition.name)
    click_on(@competition.name)
    expect(current_path).to eq "/competitions/#{@competition.id}"
  end


end
