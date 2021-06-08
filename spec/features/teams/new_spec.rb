require 'rails_helper'

RSpec.describe 'Teams New Page' do
  before :each do
    @competition1 = Competition.create!(name: "Men’s Regional", location: 'Louisville', sport: 'basketball')
    # Team to be added
    @team1 = @competition1.teams.create!(hometown: 'Boston', nickname: "Bee's")

    visit new_competition_team_path(@competition1)
  end

  it 'I can add a new team to this Competition' do
    expect(current_path).to eq(new_competition_team_path(@competition1))
    expect(page).to have_field('Nickname')
    expect(page).to have_field('Hometown')
    expect(page).to have_button('Create Team')
    expect(page).to_not have_content(@team1.nickname)
    expect(page).to_not have_content(@team1.hometown)

    fill_in 'Nickname', with: @team1.nickname
    fill_in 'Hometown', with: @team1.hometown
    click_on 'Create Team'

    expect(current_path).to eq(competition_path(@competition1, @team1.id + 1))
    expect(page).to have_content(@team1.nickname)
    expect(page).to have_content(@team1.hometown)
  end
end
