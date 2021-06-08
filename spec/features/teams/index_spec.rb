require 'rails_helper'

RSpec.describe 'Index page for all teams,' do
  before :each do
    @team_1 = FactoryBot.create(:team)
    @team_2 = FactoryBot.create(:team)
    @team_3 = FactoryBot.create(:team)

    @team_1.players << FactoryBot.create(:player, team: @team_1, age: 10)
    @team_1.players << FactoryBot.create(:player, team: @team_1, age: 13)
    @team_1.players << FactoryBot.create(:player, team: @team_1, age: 15)

    @team_2.players << FactoryBot.create(:player, team: @team_2, age: 20)
    @team_2.players << FactoryBot.create(:player, team: @team_2, age: 22)
    @team_2.players << FactoryBot.create(:player, team: @team_2, age: 19)

    @team_3.players << FactoryBot.create(:player, team: @team_3, age: 18)
    @team_3.players << FactoryBot.create(:player, team: @team_3, age: 18)
    @team_3.players << FactoryBot.create(:player, team: @team_3, age: 19)

    visit teams_path
  end

  describe 'team list,' do
    it 'shows the team nickname and the average player age for that team' do
      within '#team-list' do
        within 'thead' do
          expect(page).to have_content('Team Name')
          expect(page).to have_content('Average Team Age')
        end
        within 'tbody' do
          expect(find("#team-#{@team_2.id}")).to appear_before(find("#team-#{@team_3.id}"))
          expect(find("#team-#{@team_3.id}")).to appear_before(find("#team-#{@team_1.id}"))
        end

        within "#team-#{@team_1.id}" do
          expect(page).to have_content(@team_1.nickname)
          expect(page).to have_content("13")
        end

        within "#team-#{@team_2.id}" do
          expect(page).to have_content(@team_2.nickname)
          expect(page).to have_content("20")
        end

        within "#team-#{@team_3.id}" do
          expect(page).to have_content(@team_3.nickname)
          expect(page).to have_content("18")
        end
      end
    end
  end
end