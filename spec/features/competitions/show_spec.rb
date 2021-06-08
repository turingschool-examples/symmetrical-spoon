require 'rails_helper'

RSpec.describe 'competition show page' do
  describe 'display' do
    before :each do 
      @indigo = Competition.create!(name: "Indigo League", location: "Louisville", sport:"rocket launching")
      @scarlet = Competition.create!(name: "Scarlet League", location: "Denver", sport: "tap dancing")
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
      @team_6 = Team.create!(hometown: "Water Level", nickname: "Aqua People")
      @nick = @team_5.players.create!(name: "Nick", age: 22)
      @rick = @team_5.players.create!(name: "Rick", age: 21)
      @pick = @team_5.players.create!(name: "Pick", age: 22)
      Registration.create!(competition: @scarlet, team: @team_6)
      @team_7 = Team.create!(nickname:"Washers", hometown: "Banksy")
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

    it 'lists all teams and their attributes' do
      visit "/competitions/#{@indigo.id}"

      expect(page).to have_content("#{@team_1.nickname}")
      expect(page).to have_content("#{@team_1.hometown}")
      expect(page).to have_content("#{@team_2.nickname}")
      expect(page).to have_content("#{@team_2.hometown}")
      expect(page).to have_content("#{@team_3.nickname}")
      expect(page).to have_content("#{@team_3.hometown}")
      expect(page).to have_content("#{@team_4.nickname}")
      expect(page).to have_content("#{@team_4.hometown}")
      expect(page).to have_content("#{@team_5.nickname}")
      expect(page).to have_content("#{@team_5.hometown}")
      expect(page).to_not have_content("#{@team_6.nickname}")
      expect(page).to_not have_content("#{@team_6.hometown}")
    end
    
    it 'lists all average age of all players in competition' do
      visit "/competitions/#{@indigo.id}"
      
      expect(page).to have_content("Average Age of All Players in Competition: 25.6")
    end

    it 'links to registration page for a new team' do
      visit "/competitions/#{@indigo.id}"
      
      expect(page).to_not have_content("#{@team_7.nickname}")
      expect(page).to_not have_content("#{@team_7.hometown}")

      click_on('Register New Team')

      expect(current_path).to eq("/competitions/#{@indigo.id}/registrations")
      
      fill_in 'Nickname', with: 'Washers'
      fill_in 'Hometown', with: 'Banksy'
      click_button 'Register Team'
      
      expect(page).to have_content("#{@team_7.nickname}")
      expect(page).to have_content("#{@team_7.hometown}")
      expect(page).to have_current_path("/competitions/#{@indigo.id}")
    end
  end
end