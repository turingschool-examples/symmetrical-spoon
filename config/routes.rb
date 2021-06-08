Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/competitions/:id/teams/new', to: 'competitions#new_team'
  post '/competitions/:id/teams', to: 'competitions#create_team'

  resources :teams
  resources :competitions
end
