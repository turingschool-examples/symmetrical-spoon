require 'rails_helper'

RSpec.describe 'Competition Show' do
  describe 'show page' do
    it 'can see the attributes of the competition' do
      # User Story 2 - Competition Show Page
      # As a user
      # When I visit a competition's show page
      # Then I see the competition's name, location, and sport
      # And I see the name and hometown of all teams in this competition
      # And I see the average age of all players in the competition

      competition_3 = Competition.create!(name: 'Womens Regional', location: 'Denver', sport: 'track')
      competition_1 = Competition.create!(name: 'Kids Regional', location: 'Colorado Springs', sport: 'baseball')
      competition_2 = Competition.create!(name: 'Mens Regional', location: 'Louisville', sport: 'basketball')

      visit "/competitions/#{competition_1.id}"

      expect(page).to have_content(competition_1.name)
      expect(page).to have_content(competition_1.location)
      expect(page).to have_content(competition_1.sport)
    end

    it 'can see the name & hometown of all teams' do
      # User Story 2 - Competition Show Page
      # As a user
      # When I visit a competition's show page
      # Then I see the competition's name, location, and sport
      # And I see the name and hometown of all teams in this competition
      # And I see the average age of all players in the competition

      competition_3 = Competition.create!(name: 'Womens Regional', location: 'Denver', sport: 'track')
      competition_1 = Competition.create!(name: 'Kids Regional', location: 'Colorado Springs', sport: 'baseball')
      competition_2 = Competition.create!(name: 'Mens Regional', location: 'Louisville', sport: 'basketball')
      team_1 = competition_1.teams.create!(hometown: 'Leesburg', nickname: 'Rockets')
      team_2 = competition_1.teams.create!(hometown: 'Vicksburg', nickname: 'Titans')
      team_3 = competition_1.teams.create!(hometown: 'Atlanta', nickname: 'Braves')

      visit "/competitions/#{competition_1.id}"

      expect(page).to have_content(team_1.hometown)
      expect(page).to have_content(team_2.hometown)
      expect(page).to have_content(team_3.hometown)
      expect(page).to have_content(team_1.nickname)
      expect(page).to have_content(team_2.nickname)
      expect(page).to have_content(team_3.nickname)
    end

    it 'can see the average age of all players in the competition' do
      # User Story 2 - Competition Show Page
      # As a user
      # When I visit a competition's show page
      # Then I see the competition's name, location, and sport
      # And I see the name and hometown of all teams in this competition
      # And I see the average age of all players in the competition

      competition_3 = Competition.create!(name: 'Womens Regional', location: 'Denver', sport: 'track')
      competition_1 = Competition.create!(name: 'Kids Regional', location: 'Colorado Springs', sport: 'baseball')
      competition_2 = Competition.create!(name: 'Mens Regional', location: 'Louisville', sport: 'basketball')
      team_1 = competition_1.teams.create!(hometown: 'Leesburg', nickname: 'Rockets')
      team_2 = competition_1.teams.create!(hometown: 'Vicksburg', nickname: 'Titans')
      team_3 = competition_1.teams.create!(hometown: 'Atlanta', nickname: 'Braves')
      player_1 = team_1.players.create!(name: 'Billy', age: 10)
      player_2 = team_2.players.create!(name: 'George', age: 5)
      player_3 = team_3.players.create!(name: 'Billy', age: 15)

      visit "/competitions/#{competition_1.id}"

      expect(page).to have_content(competition_1.players.average_age)
    end

    it 'can see a link to register a new team' do
      # As a user
      # When I visit a competition's show page
      # Then I see a link to register a new team
      # When I click this link
      # Then I am taken to a new page where I see a form
      # When I fill in this form with a team's hometown and nickname
      # And I click submit
      # Then I am redirected back to the competition's show page
      # And I see the new team I created listed

      competition_3 = Competition.create!(name: 'Womens Regional', location: 'Denver', sport: 'track')
      competition_1 = Competition.create!(name: 'Kids Regional', location: 'Colorado Springs', sport: 'baseball')
      competition_2 = Competition.create!(name: 'Mens Regional', location: 'Louisville', sport: 'basketball')
      team_1 = competition_1.teams.create!(hometown: 'Leesburg', nickname: 'Rockets')
      team_2 = competition_1.teams.create!(hometown: 'Vicksburg', nickname: 'Titans')
      team_3 = competition_1.teams.create!(hometown: 'Atlanta', nickname: 'Braves')
      player_1 = team_1.players.create!(name: 'Billy', age: 10)
      player_2 = team_2.players.create!(name: 'George', age: 5)
      player_3 = team_3.players.create!(name: 'Billy', age: 15)

      visit "/competitions/#{competition_1.id}"

      expect(page).to have_link('Register New Team')
      click_link('Register New Team')

      expect(page).to have_current_path('/competitions/new')
    end

    it 'can fill in form & hit submit & get redirected to show page' do
      # As a user
      # When I visit a competition's show page
      # Then I see a link to register a new team
      # When I click this link
      # Then I am taken to a new page where I see a form
      # When I fill in this form with a team's hometown and nickname
      # And I click submit
      # Then I am redirected back to the competition's show page
      # And I see the new team I created listed

      competition_3 = Competition.create!(name: 'Womens Regional', location: 'Denver', sport: 'track')
      competition_1 = Competition.create!(name: 'Kids Regional', location: 'Colorado Springs', sport: 'baseball')
      competition_2 = Competition.create!(name: 'Mens Regional', location: 'Louisville', sport: 'basketball')
      team_1 = competition_1.teams.create!(hometown: 'Leesburg', nickname: 'Rockets')
      team_2 = competition_1.teams.create!(hometown: 'Vicksburg', nickname: 'Titans')
      team_3 = competition_1.teams.create!(hometown: 'Atlanta', nickname: 'Braves')
      player_1 = team_1.players.create!(name: 'Billy', age: 10)
      player_2 = team_2.players.create!(name: 'George', age: 5)
      player_3 = team_3.players.create!(name: 'Billy', age: 15)

      visit "/competitions/#{competition_1.id}"

      expect(page).to have_link('Register New Team')
      click_link('Register New Team')

      expect(page).to have_current_path('/competitions/new')

      fill_in :hometown, with: 'Baton Rouge'
      fill_in :nickname, with: 'Tigers'
      click_on 'Submit'

      expect(current_path).to eq("/competitions/#{competition_1.id}")
      expect(page).to have_content('Baton Rouge')
      expect(page).to have_content('Tigers')
    end
  end
end
