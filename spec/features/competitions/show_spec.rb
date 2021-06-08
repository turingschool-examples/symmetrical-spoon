require 'rails_helper'

RSpec.describe 'The show page for a competition,' do

  describe 'competition details,' do
    it 'shows the competition name'
    it 'shows the competition location'
    it 'shows the competition sport'
  end

  describe 'team list,' do
    it 'shows the name and hometown of all the teams for this competition'
    it 'shows the average age of all players in competition'
  end
end
