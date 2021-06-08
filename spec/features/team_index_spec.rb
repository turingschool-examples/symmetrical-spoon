require 'rails_helper'

RSpec.describe 'Team Index' do
  it 'shows all teams names' do
    visit '/teams'
    teams = Team.all
    teams.each do |t|
      expect(page).to have_content(t.name)
    end
  end

  it 'shows the average player age next to each team' do
    visit '/teams'
    teams = Team.all_with_average_age
    teams.each do |t|
      expect(page).to have_content("#{t.name} #{t.average_age}")
    end
    expect(teams[0].name).to appear_before(teams[1].name)
    expect(teams[1].name).to appear_before(teams[2].name)
  end
end