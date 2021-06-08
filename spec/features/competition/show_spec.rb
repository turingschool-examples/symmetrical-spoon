require 'rails_helper'

RSpec.describe 'Competitions Show page' do
  before(:each) do
    @competition = Competition.create!(name: 'Mens Basketball', location: 'Artic', sport: 'Basketball')
    
    @team_1 = @competition.teams.create!(hometown: 'Denver', nickname: 'Bullets')
    @team_2 = @competition.teams.create!(hometown: 'Jacksonville', nickname: 'Jags')
    
    @player_1 = @team_1.players.create!(name: 'Dee', age: 25)
    @player_2 = @team_1.players.create!(name: 'Saul', age: 32)
    @player_3 = @team_2.players.create!(name: 'Dairy', age: 12)
    @player_4 = @team_2.players.create!(name: 'Zeke', age: 22)
  end    

    #   User Story 2 - Competition Show Page

    # As a user
    # When I visit a competition's show page
    # Then I see the competition's name, location, and sport
    # And I see the name and hometown of all teams in this competition
    # And I see the average age of all players in the competition
  
  it 'visit the cometitions show page I see the attributes' do 
    visit competition_path(@competition)   

    expect(page).to have_content(@competition.name) 
    expect(page).to have_content(@competition.location)
    expect(page).to have_content(@competition.sport)
  end
end