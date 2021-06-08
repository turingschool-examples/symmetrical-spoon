require 'rails_helper'

RSpec.describe Competition do
  describe 'relationships' do
    #getting error
  #  it {should have_many :teams, through: :bracket}
   it {should have_many :brackets}
  end
end