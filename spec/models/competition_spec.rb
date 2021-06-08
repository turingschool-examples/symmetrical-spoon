require "rails_helper"

RSpec.describe Competition, type: :model do
   describe "relationships" do
      it {should have_many(:registrations)}
      it {should have_many(:teams).through(:registrations)}
   end

   before :each do
    @competition1 = Competition.create!(name: "The Big 5", location: "San Diego", sport: "Basketball")
    @competition2 = Competition.create!(name: "North American Cup", location: "San Antonio", sport: "Soccer")
    @team1 = Team.create!(hometown: "Denver", nickname: "Nugs")
    @team2 = Team.create!(hometown: "LA", nickname: "Lake Show")
    @team3 = Team.create!(hometown: "New York", nickname: "Knicks")
    @player1 = Player.create!(name: "Derrick Rose", age: 27, team_id: @team3.id)
    @player2 = Player.create!(name: "Julias Randall", age: 23, team_id: @team3.id)
    @player3 = Player.create!(name: "Lebron James", age: 37, team_id: @team2.id)
    @player4 = Player.create!(name: "Anthony Davis", age: 28, team_id: @team2.id)
    @player5 = Player.create!(name: "Jamall Murrau", age: 24, team_id: @team1.id)
    @player6 = Player.create!(name: "The Joker", age: 24, team_id: @team1.id)
    @registration1 = Registration.create!(team_id: @team1.id, competition_id:@competition1.id)
    @registration2 = Registration.create!(team_id: @team2.id, competition_id:@competition1.id)
    @registration3 = Registration.create!(team_id: @team3.id, competition_id:@competition2.id)
   end

   describe 'instance methods' do
     describe '#average_age' do
       it 'can find the average age for players in a competition' do
         expect(@competition1.average_age).to eq(0)
       end
     end
   end
end