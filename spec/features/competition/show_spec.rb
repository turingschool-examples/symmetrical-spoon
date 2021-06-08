require 'rails_helper'
describe 'actor show page' do 
  before(:each) do
    @competition = Competition.create!(name:'Kitzbühel', location:'Austria', sport:'downhill skiing')
    @team1 = Team.create(hometown:'Austria',nickname:"crazy skiers")
    @team2 = Team.create(hometown:'US',nickname:"skiers")
    @player1 = @team1.players.create(name:"Bode Miller", age:50)
    @player2 = @team2.players.create(name:"Hermann Maier", age:100)
    @player3 = @team2.players.create(name:"Aksel Lund Svindal", age:30)
    @bracket1 = Bracket.create(competition_id: @competition.id,team_id: @team1.id)
    @bracket2 = Bracket.create(competition_id: @competition.id,team_id: @team2.id)
    visit "/competitions/#{@competition.id}"

  end

    # User Story 2 - Competition Show Page

    # As a user
    # When I visit a competition's show page
    # Then I see the competition's name, location, and sport

    it 'has the competitions information' do 
      expect(page).to have_content(@competition.name)
      expect(page).to have_content(@competition.location)
      expect(page).to have_content(@competition.sport)
    end
    # And I see the name and hometown of all teams in this competition
    it 'has the competitions teams participating info' do 
      expect(page).to have_content(@team1.hometown)
      expect(page).to have_content(@team1.nickname)
      expect(page).to have_content(@team2.hometown)
      expect(page).to have_content(@team2.nickname)
    end
    # And I see the average age of all players in the competition
    it 'has the players average age' do 
      expect(page).to have_content("Average age: 60")
    end

    #     As a user
    # When I visit a competition's show page
    # Then I see a link to register a new team
    # When I click this link

    # Then I am redirected back to the competition's show page
    # And I see the new team I created listed

    it 'has a link to register new team, send to form' do
      expect(page).to have_link("add team")
      click_on ("add team")
      expect(current_path).to eq "/competitions/#{@competition.id}/teams/new"
    end
    
    # Then I am taken to a new page where I see a form
    # When I fill in this form with a team's hometown and nickname
    # And I click submit

    it 'has a form to add a team, fill and submit is redirected to comp page with new team' do
      click_on ("add team")
      fill_in 'hometown', with: 'Ontario, CA'
      fill_in 'nickname', with: 'Canadiens eh'
      click_on "commit"
      expect(current_path).to eq "/competitions/#{@competition.id}"
    end

end