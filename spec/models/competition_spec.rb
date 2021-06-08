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
        @player1 = Player.create(name:"Bode Miller", age:50)
        @player1 = Player.create(name:"Hermann Maier", age:100)
        @player1 = Player.create(name:"Aksel Lund Svindal", age:30)
        @bracket1 = Bracket.create(competition_id: @competition.id,team_id: @team1.id)
        @bracket2 = Bracket.create(competition_id: @competition.id,team_id: @team2.id)
      end
      it 'returns the teams in the competition' do
        comps = Competition.player_av_age(@competition.id)
        binding.pry
        expect(comps.av_age).to eq(60)
      end
    end
  end
end