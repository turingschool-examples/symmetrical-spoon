require 'rails_helper'

RSpec.describe 'the competition show' do
  before(:each)do
    @competition_1 = Competition.create!(name: 'Mens Regional', location: 'Louisville', sport: 'basketball')
    @competition_2 = Competition.create!(name: 'Northeast Invitational', location: 'New York', sport: 'pickleball')
    @team_1 = @competition_1.teams.create!(hometown: 'Leesburg', nickname: 'Rockets')
    @team_2 = @competition_1.teams.create!(hometown: 'Houston', nickname: 'Jaguars')
    @team_3 = @competition_2.teams.create!(hometown: 'Denver', nickname: 'Nuggets')
    @player_1 = Player.create!(name: 'Billy Bigshoes', age: 12)
    @player_2 = Player.create!(name: 'Steph Curry', age: 24)
    @player_3 = Player.create!(name: 'Joe Schmoe', age: 30)
    @player_4 = Player.create!(name: 'Pat Smith', age: 38)
    @player_5 = Player.create!(name: 'Jamie Jones', age: 42)
    @player_6 = Player.create!(name: 'Jamie Jones', age: 20)

    TeamPlayer.create!(team: @team_1, player: @player_1)
    TeamPlayer.create!(team: @team_1, player: @player_2)
    TeamPlayer.create!(team: @team_1, player: @player_3)
    TeamPlayer.create!(team: @team_2, player: @player_4)
    TeamPlayer.create!(team: @team_2, player: @player_5)
    TeamPlayer.create!(team: @team_3, player: @player_6)

    visit "/competitions/#{@competition_1.id}"
  end

  it 'lists all the competition attributes, name, location, sport' do
    expect(page).to have_content(@competition_1.name)
    expect(page).to have_content(@competition_1.location)
    expect(page).to have_content(@competition_1.sport)
    expect(page).to_not have_content(@competition_2.name)
  end

  it 'lists all the competition teams nicknames, hometowns' do
    expect(page).to have_content(@competition_1.name)
    expect(page).to have_content(@team_1.hometown)
    expect(page).to have_content(@team_1.nickname)
    expect(page).to have_content(@team_2.hometown)
    expect(page).to have_content(@team_2.nickname)
    expect(page).to_not have_content(@team_3.hometown)
    expect(page).to_not have_content(@team_3.nickname)
  end

end

  # it 'has a list of all studio movie actors with no duplicates, only currently working' do
  #     visit "/studios/#{@studio_3.id}"
  #   expect(page).to have_content(@actor_2.name, count: 1)
  #   expect(page).to have_content(@actor_1.name, count: 1)
  #   expect(page).to_not have_content(@actor_3.name)
  # end
  #
  # it 'has a list of all studio movie actors with no duplicates, only currently working, ordered oldest to youngest' do
  #     visit "/studios/#{@studio_3.id}"
  #   expect(page.all(".actor")[0].text). to eq(@actor_2.name)
  #   expect(page.all(".actor")[1].text). to eq(@actor_1.name)
  #   expect(page).to_not have_content(@actor_3.name)
  # end

  # FROM show.html.erb
  # <h3>Studio Movies Actors</h3>
  # <% @studio.actors_list.each do |actor| %>
  #   <p class="actor">&emsp;<%= actor.name %></p><br/>
  # <% end %>

  # FROM movie show_spec
  # it 'has form to add an actor to the movie' do
  #   visit "/movies/#{@movie_1.id}"
  #
  #   expect(page).to_not have_content(@actor_2.name)
  #   fill_in :actor_id, with: @actor_2.id
  #   # fill_in :actor_name, with: @actor_2.name
  #   click_on "Add Actor to Movie"
  #
  #   expect(current_path).to eq("/movies/#{@movie_1.id}")
  #   expect(page).to have_content(@actor_2.name)
  # end

  # describe '.actors_list' do #'instance methods'
  #   it 'returns all currently working actors, for studio, ordered by age, desc, no duplicates' do
  #     expect(@studio_3.actors_list).to eq([@actor_2, @actor_1])
  #   end
  # end
