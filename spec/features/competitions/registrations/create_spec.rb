require 'rails_helper'

RSpec.describe 'registrations new page' do
  before :each do 
    @indigo = Competition.create!(name: "Indigo League", location: "Louisville", sport:"rocket launching")
    @team = Team.create!(nickname:"Washers", hometown: "Banksy")
  end

  describe 'Registration form for new team' do
    it 'renders new form' do
      visit "/competitions/#{@indigo.id}/registrations"

      expect(page).to have_content('Register New Team')
      expect(find('form')).to have_content('Nickname')
      expect(find('form')).to have_content('Hometown')
    end
  end

  describe 'create registration' do
    context 'given valid data' do
      it 'registers new team to competition ' do
        visit "/competitions/#{@indigo.id}/registrations"

        fill_in 'Nickname', with: 'Washers'
        fill_in 'Hometown', with: 'Banksy'
        click_button 'Register Team'

        expect(page).to have_current_path("/competitions/#{@indigo.id}")
        expect(page).to have_content('Washers')
        expect(page).to have_content('Banksy')
      end
    end
  end
end