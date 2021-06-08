require 'rails_helper'
RSpec.describe 'Teams New Page' do
  before :each do
    @team1 = Team.create!(hometown: "Atlanta", nickname: "Aces")
    @competition1 = Competition.create!(name: "Batters Up", location: "Denver, CO", sport: "Baseball")
    @competition1.teams << @team1
    visit "/new_competition_team_path(#{@competition1})"
  end

  it 'displays form to fill out to add team to competition' do
    expect(current_path).to eq("/new_competition_team_path(#{@competition1})")
    expect(page).to have_field("Hometown")
    expect(page).to have_field("Nickname")
    expect(page).to have_button("Create Team")
    fill_in "Nickname", with: @team1.nickname
    fill_in "Hometown", with: @team1.hometown
    click_on "Create Team"

    expect(current_path).to eq(competition_path(@competition1, @team1.id + 1))
    expect(page).to have_content(@team1.nickname)
    expect(page).to have_content(@team1.hometown)
  end
end
