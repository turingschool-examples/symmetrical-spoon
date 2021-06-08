require 'rails_helper'

RSpec.describe 'competition show page,' do
  before :all do
    @competition_1 = Competition.create!(name: 'World Cup Qualifier 1', location: "Paraguay", sport: "futbol")

    visit competition_path(@competition_1)
  end

  describe 'competition attributes,' do
    it 'lists competition name, location, sport' do
      within '#attributes' do
  
        expect(page).to have_content(@competition_1.name)
        expect(page).to have_content(@competition_1.location)
        expect(page).to have_content(@competition_1.sport)
      end
    end
  end
end
