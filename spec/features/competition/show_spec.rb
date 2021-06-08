require "rails_helper"

RSpec.describe "Competition index page", type: :feature do
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

      visit "/competitions/#{@competition1.id}"
   end

  describe "Visit a competition show page and see the comepetition name, loaction, sport along with the name and hometown of all the teams and average age of all the players" do
    it 'can see the name, location, and sport of the competition' do

      expect(page).to have_content(@competition1.name)
      expect(page).to have_content(@competition1.location)
      expect(page).to have_content(@competition1.sport)
      expect(page).to_not have_content(@competition2.name)
      expect(page).to_not have_content(@competition2.location)
      expect(page).to_not have_content(@competition2.sport)
    end
    
    it 'can see the name and the hometown of all the teams in the competition' do

      expect(page).to have_content(@team2.nickname)
      expect(page).to have_content(@team1.nickname)
      expect(page).to have_content(@team1.hometown)
      expect(page).to have_content(@team2.hometown)
      expect(page).to_not have_content(@team3.nickname)
      expect(page).to_not have_content(@team3.hometown)
    end
  end
end