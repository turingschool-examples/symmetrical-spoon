require 'rails_helper'
describe 'actor show page' do 
  before(:each) do
    @competition = Competition.create!(name:'Kitzbühel', location:'Austria', sport:'downhill skiing')
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

    end
    # And I see the average age of all players in the competition
    it 'has the players average age' do 

    end

end