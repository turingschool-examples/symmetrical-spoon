require 'rails_helper'


RSpec.describe 'Competitions Index', type: :feature do
  before :each do
    @comp1 = Competition.create!(name: "Regionals", location: "Denver, CO", sport: "Soccer")
    @comp2 = Competition.create!(name: "Nationals", location: "Washington, DC", sport: "Football")
    @comp3 = Competition.create!(name: "International", location: "Singapore", sport: "Field Hockey")
    @comp4 = Competition.create!(name: "North American", location: "Vancouver, BC", sport: "Foosball")

    visit '/competitions'
  end

  it 'shows the names of all competitions' do
    expect(page).to have_content(@comp1.name)
    expect(page).to have_content(@comp2.name)
    expect(page).to have_content(@comp3.name)
    expect(page).to have_content(@comp4.name)
  end

  it 'links each competition name to the show page' do
    expect(page).to have_link(@comp1.name, :href => "/competitions/#{@comp1.id}")
    expect(page).to have_link(@comp2.name, :href => "/competitions/#{@comp2.id}")
    expect(page).to have_link(@comp3.name, :href => "/competitions/#{@comp3.id}")
    expect(page).to have_link(@comp4.name, :href => "/competitions/#{@comp4.id}")
  end
end
