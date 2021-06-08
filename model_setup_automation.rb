first_model = 'no'
model_sing = 'team'
model_plural = 'teams'

#make model
Dir.chdir('app/models')
system "touch #{model_sing}.rb"
writer = File.write("#{model_sing}.rb",
"# app/models/#{model_sing}_controller.rb

class #{model_sing} < ApplicationRecord

end")

#make controller
Dir.chdir('..')
Dir.chdir("controllers")
system "touch #{model_plural}_controller.rb"
writer = File.write("#{model_plural}_controller.rb",
  "# app/controllers/#{model_sing}_controller.rb

class #{model_plural.capitalize}Controller < ApplicationController

  def index
    @#{model_plural} = #{model_sing.capitalize}.all
  end

  def show
  @#{model_sing} = #{model_sing.capitalize}.find(params[:id])
  end

end")
#make views
Dir.chdir('..')
Dir.chdir("views")
system "mkdir #{model_plural}"
Dir.chdir "#{model_plural}"
system "touch show.html.erb"
system "touch index.html.erb"

#make spec files
Dir.chdir('..')
Dir.chdir('..')
Dir.chdir('..')
Dir.chdir("spec")
if first_model == 'yes'
  system "mkdir features"
  system "mkdir models"
end
  Dir.chdir("features")
  system "mkdir #{model_plural}"
  Dir.chdir "#{model_plural}"

    #set up index_spec.rb
system "touch index_spec.rb"
writer = File.write("index_spec.rb",
"require 'rails_helper'

RSpec.describe '#{model_plural} index page', type: :feature do
  before(:each) do
  end

  describe 'page appearance' do
  end

  describe 'page functionality' do
  end
end")

    #set up show_spec.rb
    system "touch show_spec.rb"

writer = File.write("show_spec.rb",
"require 'rails_helper'

RSpec.describe '#{model_plural} show page', type: :feature do
  before(:each) do
  end

  describe 'page appearance' do
  end

  describe 'page functionality' do
  end
end")

  Dir.chdir('..')
  Dir.chdir('..')
  Dir.chdir "models"

  #set up model_spec.rb
  system "touch #{model_sing}_spec.rb"

writer = File.write("#{model_sing}_spec.rb",
"require 'rails_helper'

RSpec.describe '#{model_plural}', type: :model do
  before(:each) do
  end

  describe 'class methods' do
  end

  describe 'instance_methods' do
  end
end")
