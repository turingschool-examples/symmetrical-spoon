require 'rails_helper'

RSpec.describe 'Team Creation', type: :feature do
  describe 'new' do
    it 'renders a form to create a new team' do
      competition = Competition.create!(name: "Regionals", location: "Denver, CO", sport: "Soccer")

      visit "/competitions/#{competition.id}/teams/new"

      expect(page).to have_field('Hometown')
      expect(page).to have_field('Nickname')
    end

    it 'has a hidden field for competition id' do
      competition = Competition.create!(name: "Regionals", location: "Denver, CO", sport: "Soccer")

      visit "/competitions/#{competition.id}/teams/new"

      find_field(:team_competition_id, type: :hidden)
    end
  end

  describe 'create' do
    it 'if competition_id is empty, creates a new team upon submission and redirects to teams index' do
      visit '/teams/new'
      fill_in 'Hometown', with: 'Muncie, Indiana'
      fill_in 'Nickname', with: 'Munchers'
      click_on "Create Team"

      expect(page).to have_current_path("/teams")
      expect(page).to have_content('Munchers')
    end

    it 'if competition_id is not empty, creates a new team and registration record' do
      competition = Competition.create!(name: "Regionals", location: "Denver, CO", sport: "Soccer")

      visit "/competitions/#{competition.id}/teams/new"

      fill_in 'Hometown', with: 'Muncie, Indiana'
      fill_in 'Nickname', with: 'Munchers'
      click_on "Create Team"

      expect(page).to have_current_path("/competitions/#{competition.id}")
      expect(page).to have_content('Muncie, Indiana')
      expect(page).to have_content('Munchers')
    end
  end
end
