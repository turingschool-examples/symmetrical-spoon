require 'rails_helper'

RSpec.describe Team do
  describe 'relationships' do
    it {should have_many :players}
    it {should have_many(:competition_entries).dependent(:destroy)}
    it {should have_many(:competitions).through(:competition_entries)}
  end

  describe 'class methods' do
    before :each do
      @team_1 = Team.create!(hometown: 'Froopyland', nickname: 'Rainbow Rivers')
      @team_2 = Team.create!(hometown: 'Earth', nickname: 'MeeSeeks')
      @team_3 = Team.create!(hometown: 'Dog Dimension', nickname: 'The Hydrants')
  
      @player_1 = Player.create!(name: "Morty Smith", age: 14, team_id: @team_1.id)
      @player_2 = Player.create!(name: "Rick Sanchez", age: 70, team_id: @team_1.id)
      @player_4 = Player.create!(name: "Summer Smith", age: 17, team_id: @team_2.id)
      @player_5 = Player.create!(name: "Beth Smith", age: 34, team_id: @team_2.id)
      @player_3 = Player.create!(name: "Jerry Smith", age: 40, team_id: @team_3.id)
    end

    describe '.by_avg_age' do
      it 'returns a list of teams and avg age listed from highest to lowest' do
        expect(Team.by_avg_age.first.nickname).to eq @team_1.nickname
        expect(Team.by_avg_age.first.avg_age.round).to eq 42
        expect(Team.by_avg_age.second.nickname).to eq @team_3.nickname
        expect(Team.by_avg_age.second.avg_age.round).to eq 40
        expect(Team.by_avg_age.third.nickname).to eq @team_2.nickname
        expect(Team.by_avg_age.third.avg_age.round).to eq 26
      end
    end
  end
end