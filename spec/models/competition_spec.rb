require 'rails_helper'

RSpec.describe Competition do
  describe 'relationships' do
    #getting error
  #  it {should have_many :teams, through: :bracket}
   it {should have_many :brackets}
  end
  describe 'class methods' do
    describe '#teams_in_comp' do
      before(:each) do
        @competition = Competition.create!(name:'Kitzbühel', location:'Austria', sport:'downhill skiing')
        @team1 = Team.create(hometown:'Austria',nickname:"crazy skiers")
        @team2 = Team.create(hometown:'US',nickname:"skiers")
        @player1 = Player.create(name:"Bode Miller", age:50)
        @player1 = Player.create(name:"Hermann Maier", age:100)
        @player1 = Player.create(name:"Aksel Lund Svindal", age:30)
      end
      it 'returns the teams in the competition' do
        comps = Competition.teams_in_comp(@competition.id)
        binding.pry 
      end
    end
  end
end