require 'rails_helper'

RSpec.describe 'new team form' do
  before :each do
    @finals = Competition.create!(name: 'NBA Finals', location: 'Orlando', sport: 'Basketball')
  end


  it 'can create a new team with form' do
    visit "/competitions/#{@finals.id}/teams/new"

    fill_in "team_nickname", with: "The Heroes"
    fill_in "team_hometown", with: "Oregon"
    click_button "Create Team"
    expect(current_path).to eq"/competitions/#{@finals.id}" 
    expect(page).to have_content "The Heroes"
    expect(page).to have_content "Oregon"
  end
end
