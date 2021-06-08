require 'rails_helper'

RSpec.describe 'The new form of a team,' do
  before :each do
    @comp = FactoryBot.create(:competition)
    visit new_competition_team_path(@comp)
  end

  describe 'form,' do
    it 'has all the fields for a team' do
      within 'form' do
        expect(page).to have_field('team[nickname]')
        expect(page).to have_field('team[hometown]')
      end
    end

    it 'creates a new team and navigates back to the competition show page' do
      name = Faker::FunnyName.name
      hometown = Faker::Address.city
      within 'form' do
        fill_in 'team[nickname]', with: name
        fill_in 'team[hometown]', with: hometown
        click_button 'Register Team'
      end

      expect(current_path).to eq competition_path(@comp)

      within '#teams-list' do
        expect(page).to have_content(name)
        expect(page).to have_content(hometown)
      end
    end
  end
end
