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
      expect(page).to have_content(t.nickname.titleize)
      expect(page).to have_content(t.hometown)
    end
  end

  it 'shows the average age of all players in this competition' do
    competition = Competition.first
    visit "/#{competition.id}"
    expect(page).to have_content("Average Age of Players: #{competition.players.average(:age)}")
  end

  it 'adds new team to competition' do
    competition = Competition.first
    team = Team.create! attributes_for(:team)
    visit "/#{competition.id}"

    within 'form' do
      select team.name, from: 'teams'
      click_on 'commit'
    end

    expect(page).to have_current_path("/#{competition.id}")
    expect(page).to have_content(team.hometown)
    expect(page).to have_content(team.nickname.titleize)
  end
end