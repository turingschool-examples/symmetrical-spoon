require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'relationships' do
    it { should have_and_belong_to_many :competitions }
    it { should have_many :players }
  end

  describe 'class method,' do
    describe '::sorted_teams_by_player_age' do
      it 'returns the list of all teams sorted by average player age in descending order' do
        team_1 = FactoryBot.create(:team)
        team_2 = FactoryBot.create(:team)
        team_3 = FactoryBot.create(:team)

        team_1.players << FactoryBot.create(:player, team: team_1, age: 10)
        team_1.players << FactoryBot.create(:player, team: team_1, age: 13)
        team_1.players << FactoryBot.create(:player, team: team_1, age: 15)

        team_2.players << FactoryBot.create(:player, team: team_2, age: 20)
        team_2.players << FactoryBot.create(:player, team: team_2, age: 22)
        team_2.players << FactoryBot.create(:player, team: team_2, age: 19)

        team_3.players << FactoryBot.create(:player, team: team_3, age: 18)
        team_3.players << FactoryBot.create(:player, team: team_3, age: 18)
        team_3.players << FactoryBot.create(:player, team: team_3, age: 19)

        teams = Team.sorted_teams_by_player_age.map(&:id)

        expected_result = [team_2.id, team_3.id, team_1.id]

        expect(teams).to eq expected_result
      end
    end
  end
end
