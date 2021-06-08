#spec/models/competition_spec

require 'rails_helper'

RSpec.describe Competition do
  describe 'relationships' do
    it { should have_many(:registrations) }
    it { should have_many(:teams).through(:registrations) }
  end

  describe 'instance methods' do
    describe ".average_all_players_age"  do
      it "returns average of all players in competition" do
        @indigo = Competition.create!(name: "Indigo League", location: "Louisville", sport:"rocket launching")
        @team_1 = Team.create!(hometown: "Beverly Hills", nickname: "Barley")
        @jon = @team_1.players.create!(name: "Jon", age: 30)
        @yam = @team_1.players.create!(name: "Yam", age: 20)
        @mel = @team_1.players.create!(name: "Mel", age: 45)
        Registration.create!(competition: @indigo, team: @team_1)
        @team_2 = Team.create!(hometown: "Western Town", nickname: "Sunsets")
        @yor = @team_2.players.create!(name: "Yor", age: 15)
        @mor = @team_2.players.create!(name: "Mor", age: 20)
        @flor = @team_2.players.create!(name: "Flor", age: 45)
        Registration.create!(competition: @indigo, team: @team_2)
        @team_3 = Team.create!(hometown: "Eastern Town", nickname: "Sunrise")
        @max = @team_3.players.create!(name: "Max", age: 35)
        @chax = @team_3.players.create!(name: "Chax", age: 25)
        @flax = @team_3.players.create!(name: "Flax", age: 30)
        Registration.create!(competition: @indigo, team: @team_3)
        @team_4 = Team.create!(hometown: "Charming Village", nickname: "Magnolia")
        @hey = @team_4.players.create!(name: "Hey", age: 20)
        @bey = @team_4.players.create!(name: "Bey", age: 25)
        @chey = @team_4.players.create!(name: "Chey", age: 25)
        Registration.create!(competition: @indigo, team: @team_4)
        @team_5 = Team.create!(hometown: "Under the Bridge", nickname: "Rubyists")
        @hey = @team_5.players.create!(name: "Hey", age: 20)
        @bey = @team_5.players.create!(name: "Bey", age: 20)
        @chey = @team_5.players.create!(name: "Chey", age: 20)
        Registration.create!(competition: @indigo, team: @team_5)

        expect(@indigo.average_all_players_age.round(1)).to eq(26.3)
      end
    end
  end
end