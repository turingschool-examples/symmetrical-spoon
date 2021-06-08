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
  it 'visit the cometitions show page I see the attributes' do 
    visit competition_path(@competition)   

    expect(page).to have_content(@competition.name) 
    expect(page).to have_content(@competition.location)
    expect(page).to have_content(@competition.sport)
  end

  it 'shows the name and hometown of all teams in competition' do
    visit competition_path(@competition)   
    
    expect(page).to have_content(@team_1.hometown)
    expect(page).to have_content(@team_1.nickname)
    
    expect(page).to have_content(@team_2.hometown)
    expect(page).to have_content(@team_2.nickname)
  end

  it 'shows the average age of all players in the competition' do
    visit competition_path(@competition)

    expect(page).to have_content('Average age of players')
    expect(page).to have_content(22)
  end

    #    As a user
    # When I visit a competition's show page
    # Then I see a link to register a new team
    # When I click this link
    # Then I am taken to a new page where I see a form
    # When I fill in this form with a team's hometown and nickname
    # And I click submit
    # Then I am redirected back to the competition's show page
    # And I see the new team I created listed
  it 'visit the show page I see a link to register a new team' do
    visit competition_path(@competition)

    expect(page).to have_content('Register a New Team')

    click_link 'Register a New Team'
    
    expect(current_path).to eq('/teams/new')

    fill_in 'Hometown', with: 'Miami'    
    fill_in 'Nickname', with: 'Heat'    

    click_button 'Submit'

    expect(current_path).to eq(competition_path(@competition))

    expect(page).to have_content('Miami')
    expect(page).to have_content('Heat')
  end
end