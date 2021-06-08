require 'rails_helper'

RSpec.describe 'competitions index page' do
  before :each do
    @blue = Competition.create!(name: 'Blue National', location: 'Tacoma', sport: 'Skateboarding')
    @hilly = Competition.create!(name: 'Hilly Ride', location: 'Bend', sport: 'Downhill Skiiing')
    @walk = Competition.create!(name: 'Walk till ya drop', location: 'Irvine', sport: 'Speed Walking')

    visit competitions_path
  end

  describe 'competitions names' do
    it 'can list all the competitions names and each name is a link to the competition show page' do

      expect(page). to have_link("#{@blue.name}", href: "/competitions/#{@blue.id}")
      expect(page). to have_link("#{@hilly.name}", href: "/competitions/#{@hilly.id}")
      expect(page). to have_link("#{@walk.name}", href: "/competitions/#{@walk.id}")

    end
  end
end
