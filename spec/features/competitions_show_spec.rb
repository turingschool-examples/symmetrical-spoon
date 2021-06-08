require 'rails_helper'

RSpec.describe 'Competitions Show' do
  it 'shows all info for a competition' do
    competition = Competition.first
    visit "/#{competition.id}"
    expect(page).to have_content(competition.name)
    expect(page).to have_content(competition.location)
    expect(page).to have_content(competition.sport)
  end

  it 'shows all hometowns for teams in this competition' do
    competition = Competition.first
    teams = competition.teams
    visit "/#{competition.id}"
    teams.each do |t|
      expect(page).to have_content(t.nickname)
      expect(page).to have_content(t.hometown)
    end
  end

  it 'shows the average age of all players in this competition' do
    competition = Competition.first
    visit "/#{competition.id}"
    expect(page).to have_content("Average Age of Players: #{competition.players.average(:age)}")
  end
end