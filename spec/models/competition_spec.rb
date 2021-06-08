require 'rails_helper'

RSpec.describe Competition, type: :model do
  describe 'relationships' do
    it { should have_and_belong_to_many :teams }
  end

  describe 'instance method,' do
    describe '#average_player_age' do
      it 'returns the average players in the competition' do
        comp_1 = FactoryBot.create(:competition)

        team_1 = FactoryBot.create(:team)
        comp_1.teams << team_1

        team_1.players << FactoryBot.create(:player, team: team_1, age: 10)
        team_1.players << FactoryBot.create(:player, team: team_1, age: 12)
        team_1.players << FactoryBot.create(:player, team: team_1, age: 13)

        expected_age = 11

        expect(comp_1.average_player_age).to eq expected_age
      end
    end
  end
  
end
