require 'rails_helper'

RSpec.describe 'Team Creation', type: :feature do
  describe 'new' do
    it 'renders a form to create a new team' do
      visit '/teams/new'

      expect(page).to have_field(:hometown)
      expect(page).to have_field(:nickname)
    end

    it 'has a hidden field for competition id' do
      visit '/teams/new'

      page.find_by_id("competition-id", visible: false)
    end
  end

  describe 'create' do
    it 'if competition_id is empty, creates a new team upon submission and redirects to teams index' do
      visit '/teams/new'
      fill_in :hometown, with: 'Muncie, Indiana'
      fill_in :nickname, with: 'Munchers'
      click_on "Create Team"

      expect(page).to have_current_path("/teams")
      expect(page).to have_content('Muncie, Indiana')
      expect(page).to have_content('Munchers')
    end

    it 'if competition_id is not empty, creates a new team and registration record' do
      competition = Competition.create!(name: "Regionals", location: "Denver, CO", sport: "Soccer")

      visit "/teams/new/?competition_id=#{competition.id}"
      fill_in :hometown, with: 'Muncie, Indiana'
      fill_in :nickname, with: 'Munchers'
      click_on "Create Team"

      expect(page).to have_current_path("/competitions/#{competition.id}")
      expect(page).to have_content('Muncie, Indiana')
      expect(page).to have_content('Munchers')
    end
  end
end
