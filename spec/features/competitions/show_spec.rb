require 'rails_helper'

RSpec.describe 'The show page for a competition,' do

  before :all do
    @comp_1 = FactoryBot.create(:competition)

    @team_1 = FactoryBot.create(:team)
    @team_2 = FactoryBot.create(:team)
    @comp_1.teams << @team_1 << @team_2

    @team_1.players << FactoryBot.create(:player, team: @team_1, age: 10)
    @team_1.players << FactoryBot.create(:player, team: @team_1, age: 12)
    @team_1.players << FactoryBot.create(:player, team: @team_1, age: 13)

    @team_2.players << FactoryBot.create(:player, team: @team_2, age: 14)
    @team_2.players << FactoryBot.create(:player, team: @team_2, age: 13)
    @team_2.players << FactoryBot.create(:player, team: @team_2, age: 10)
  end

  before :each do
    visit competition_path(@comp_1)
  end

  describe 'competition details,' do
    it 'shows the competition details' do
      within '#competition-details' do
        within 'thead' do
          expect(page).to have_content('Name')
          expect(page).to have_content('Location')
          expect(page).to have_content('Sport')
        end
        within 'tbody' do
          expect(page).to have_content(@comp_1.name)
          expect(page).to have_content(@comp_1.location)
          expect(page).to have_content(@comp_1.sport)
        end
      end
    end
  end

  describe 'team list,' do
    it 'shows the name and hometown of all the teams for this competition' do
      within '#teams-list' do
        within 'thead' do
          expect(page).to have_content('Team Name')
          expect(page).to have_content('Hometown')
        end
        within "#team-#{@team_1.id}" do
          expect(page).to have_content(@team_1.nickname)
          expect(page).to have_content(@team_1.hometown)
        end
        within "#team-#{@team_2.id}" do
          expect(page).to have_content(@team_2.nickname)
          expect(page).to have_content(@team_2.hometown)
        end
      end
    end
    it 'shows the average age of all players in competition' do
      within '#average-player-age' do
        expect(page).to have_content('Average Age for all Players: 12')
      end
    end
  end
end
