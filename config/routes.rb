Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :competitions, only: [:index, :new, :show]
  # post '/competitions', to: 'competitions#create'
  get '/teams/new', to: 'teams#new'
  post '/teams', to: 'teams#create'
end
