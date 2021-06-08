require 'rails_helper'

RSpec.describe Team do
  describe 'relationships' do
    it {should have_many :players}
    #getting error 
    #it {should have_many :competitions, through: :brackets}
    it {should have_many :brackets}
  end
end