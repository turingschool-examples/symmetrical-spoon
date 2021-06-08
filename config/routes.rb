Rails.application.routes.draw do
  get '/teams', to: 'teams#index'

  get '/competitions', to: 'competitions#index'
  get '/competitions/:id/new', to: 'team_competitions#new'
  get '/competitions/:id', to: 'competitions#show'
  post '/competitions/:id', to: 'team_competitions#create'
end
