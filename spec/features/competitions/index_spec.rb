require 'rails_helper'

RSpec.describe "The index page for competitions" do
  before :each do
    @comp1 = FactoryBot.create(:competition)
    @comp2 = FactoryBot.create(:competition)
    @comp3 = FactoryBot.create(:competition)

    visit competitions_path
  end

  describe 'list of competitions,' do
    it 'shows all the competitions with their name as a link' do
      within '#competitions-list' do
        expect(page).to have_link(@comp1.name, href: competition_path(@comp1))
        expect(page).to have_link(@comp2.name, href: competition_path(@comp2))
        expect(page).to have_link(@comp3.name, href: competition_path(@comp3))
      end
    end

    it 'the name link navigates to the show page for that competition' do
      within '#competitions-list' do
        click_link @comp1.name
      end
      expect(current_path).to eq competition_path(@comp1)
    end
  end
end
