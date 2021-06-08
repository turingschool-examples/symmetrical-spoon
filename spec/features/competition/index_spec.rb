require "rails_helper"

RSpec.describe "Competition index page", type: :feature do
   before :each do
      @competition1 = Competition.create!(name: "The Big 5", location: "San Diego", sport: "Basketball")
      @competition2 = Competition.create!(name: "North American Cup", location: "Denver", sport: "Soccer")

      visit '/competition'
   end
end

describe "user sees all compeition with a link to that show page" do
    it "displays all articles" do

        
        expect(current_path).to eq('/competition')
        expect(page).to have_content(@competition1.name)
        expect(page).to have_content(@competition2.name)
    end 

    it 'can click on the competition name and take it to the competitions show page' do
      
      click_on "#{@competition1.name}"

      expect(current_path).to eq("/competition/#{@competition1.name}")
    end
end