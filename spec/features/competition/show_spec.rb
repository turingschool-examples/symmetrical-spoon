require 'rails_helper'

RSpec.describe 'competition show' do
  it 'links from index to competition show' do
    competition_1 = Competition.create!(name: "Basket Weavers Interstallar", location: "Mars", sport: "Basket Weaving")
    team_1 = Team.create!(nick_name: "The Chompin' Beavers", home_town: "Beaver")
    CompetitionTeam.create!(competition: competition_1, team: team_1)
    visit "/competitions"

    expect(page).to have_link("#{competition_1.name}")
    click_link "#{competition_1.name}"
    expect(current_path).to eq("/competitions/#{competition_1.id}")
    expect(page).to have_content("#{competition_1.name}")
    expect(page).to have_content("#{competition_1.location}")
    expect(page).to have_content("#{competition_1.sport}")
    expect(page).to have_content("#{team_1.nick_name}")
    expect(page).to have_content("#{team_1.home_town}")
  end
end
