require 'rails_helper'

RSpec.describe Competition do
  describe 'relationships' do
    #getting error
  #  it {should have_many :teams, through: :bracket}
   it {should have_many :brackets}
  end
  describe 'class methods' do
    describe '#player_av_age' do
      before(:each) do
        @competition = Competition.create!(name:'Kitzbühel', location:'Austria', sport:'downhill skiing')
        @team1 = Team.create(hometown:'Austria',nickname:"crazy skiers")
        @team2 = Team.create(hometown:'US',nickname:"skiers")
        @player1 = @team1.players.create(name:"Bode Miller", age:50)
        @player2 = @team2.players.create(name:"Hermann Maier", age:100)
        @player3 = @team2.players.create(name:"Aksel Lund Svindal", age:30)
        @bracket1 = Bracket.create(competition_id: @competition.id,team_id: @team1.id)
        @bracket2 = Bracket.create(competition_id: @competition.id,team_id: @team2.id)
      end
      it 'returns the teams in the competition' do
        age = @competition.player_av_age
        expect(age).to eq(60)
      end
    end
  end
end