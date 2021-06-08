require 'rails_helper'

RSpec.describe 'the competitions index' do
  before(:each)do
    @competition_1 = Competition.create!(name: 'Mens Regional', location: 'Louisville', sport: 'basketball')
    @competition_2 = Competition.create!(name: 'Northeast Invitational', location: 'New York', sport: 'pickleball')
    @competition_3 = Competition.create!(name: 'Rocky Mountain Showdown', location: 'Aurora', sport: 'football')

    visit "/competitions"
  end

  it 'lists all the competition names' do
    expect(page).to have_content(@competition_1.name)
    expect(page).to have_content(@competition_2.name)
    expect(page).to have_content(@competition_3.name)
  end

  it 'displays a link to each competition' do
    expect(page).to have_content(@competition_1.name)
    expect(page).to have_link(@competition_1.name)

    click_link("Delete #{pet_1.name}")

    expect(page).to have_current_path("/competitions/#{@competition_1.id}")
  end

  # it 'only lists adoptable pets' do
  #   visit "/pets"
  #
  #   expect(page).to_not have_content(pet_3.name)
  # end
  #
  # it 'displays a link to edit each pet' do
  #   visit '/pets'
  #
  #   expect(page).to have_content("Edit #{pet_1.name}")
  #   expect(page).to have_content("Edit #{pet_2.name}")
  #
  #   click_link("Edit #{pet_1.name}")
  #
  #   expect(page).to have_current_path("/pets/#{pet_1.id}/edit")
  # end


#   it "allows the user to delete a pet" do
#   click_on("Delete #{pet.name}")
#
#   expect(page).to have_current_path('/pets')
#   expect(page).to_not have_content(pet.name)
# end

end
