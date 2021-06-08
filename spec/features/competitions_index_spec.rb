require 'rails_helper'

RSpec.describe 'Competition Index' do
  it 'shows all competitons names and link to each show page' do
    visit '/'
    comps = Competition.all
    comps.each do |c|
      expect(page).to have_content(c.name)
      expect(page).to have_link(c.name, href: "/#{c.id}")
    end
  end
end