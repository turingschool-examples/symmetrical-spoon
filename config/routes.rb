Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/competitions', to: 'competitions#index'
  get '/competitions/:id/show', to: 'competitions#show'
  get '/competitions/:id/teams/new', to: 'teams#new'
  post '/competitions/:id/show', to: 'teams#create'
end
