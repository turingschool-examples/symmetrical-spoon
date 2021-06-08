require 'rails_helper'

# User Story 2 - Competition Show Page

# As a user
# When I visit a competition's show page
# Then I see the competition's name, location, and sport
# And I see the name and hometown of all teams in this competition
# And I see the average age of all players in the competition

RSpec.describe 'competition show page' do
  describe 'display' do
    before :each do 
      @indigo = Competition.create!(name: "Indigo League", location: "Louisville", sport:"rocket launching")
      @scarlet = Competition.create!(name: "Scarlet League", location: "Denver", sport: "tap dancing")
      @team_1 = Team.create!(hometown: "Beverly Hills", nickname: "Barley")
      @jon = @team_1.players.create!(name: "Jon", age: 32)
      @yam = @team_1.players.create!(name: "Yam", age: 22)
      @mel = @team_1.players.create!(name: "Mel", age: 45)
      Registration.create!(competition: @indigo, team: @team_1)
      @team_2 = Team.create!(hometown: "Western Town", nickname: "Sunsets")
      @yor = @team_2.players.create!(name: "Yor", age: 13)
      @mor = @team_2.players.create!(name: "Mor", age: 21)
      @flor = @team_2.players.create!(name: "Flor", age: 44)
      Registration.create!(competition: @indigo, team: @team_2)
      @team_3 = Team.create!(hometown: "Eastern Town", nickname: "Sunrise")
      @max = @team_3.players.create!(name: "Max", age: 33)
      @chax = @team_3.players.create!(name: "Chax", age: 26)
      @flax = @team_3.players.create!(name: "Flax", age: 30)
      Registration.create!(competition: @indigo, team: @team_3)
      @team_4 = Team.create!(hometown: "Charming Village", nickname: "Magnolia")
      @hey = @team_4.players.create!(name: "Hey", age: 23)
      @bey = @team_4.players.create!(name: "Bey", age: 24)
      @chey = @team_4.players.create!(name: "Chey", age: 25)
      Registration.create!(competition: @indigo, team: @team_4)
      @team_5 = Team.create!(hometown: "Under the Bridge", nickname: "Rubyists")
      @hey = @team_5.players.create!(name: "Hey", age: 22)
      @bey = @team_5.players.create!(name: "Bey", age: 21)
      @chey = @team_5.players.create!(name: "Chey", age: 22)
      Registration.create!(competition: @indigo, team: @team_5)
      @team_6 = Team.create!(hometown: "Water Level", nickname: "Aqua People")
      @nick = @team_5.players.create!(name: "Nick", age: 22)
      @rick = @team_5.players.create!(name: "Rick", age: 21)
      @pick = @team_5.players.create!(name: "Pick", age: 22)
      Registration.create!(competition: @scarlet, team: @team_6)
    end

    it 'shows name of competition and attributes' do
      visit "/competitions/#{@indigo.id}"
     
      expect(page).to have_content("Indigo League")
      expect(page).to have_content("Louisville")
      expect(page).to have_content("rocket launching")
     
      expect(page).to_not have_content("Scarlet League")
      expect(page).to_not have_content("Denver")
      expect(page).to_not have_content("tap dancing")
    end

    it 'lists all teams and their attributes'
    
    it 'lists all average age of all players in competition'
  end
end