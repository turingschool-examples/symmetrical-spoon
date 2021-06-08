require 'rails_helper'

RSpec.describe 'registrations new page' do
  before :each do 
    @indigo = Competition.create!(name: "Indigo League", location: "Louisville", sport:"rocket launching")
  end

  describe 'Registration form for new team' do
    it 'renders new form' do
      visit "/competitions/#{@indigo.id}/registrations/new"

      expect(page).to have_content('New Pet')
      expect(find('form')).to have_content('Name')
      expect(find('form')).to have_content('Breed')
      expect(find('form')).to have_content('Age')
      expect(find('form')).to have_content('Adoptable')
    end
  end

  describe 'create registration' do
    context 'given valid data' do
      it 'registers new team to competition ' do
        visit "/competitions/#{@indigo.id}/registrations/new"

        fill_in 'Hometown', with: 'Braintree'
        fill_in 'Nickname', with: 'Bumblebee'
        click_button 'Register Team'
        expect(page).to have_current_path("/competitions/#{@competition.id}")
        expect(page).to have_content('Bumblebee')
        expect(page).to have_content('Braintree')
      end
    end

    # context 'given invalid data' do
    #   it 're-renders the new form' do
    #     visit "/shelters/#{@shelter.id}/pets/new"

    #     click_button 'Save'
    #     expect(page).to have_current_path("/shelters/#{@shelter.id}/pets/new")
    #     expect(page).to have_content("Error: Name can't be blank, Age can't be blank, Age is not a number")
    #   end
    # end
  end
end