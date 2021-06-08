Rails.application.routes.draw do
  resources :competitions, only: [:index, :show] do
    resources :teams, only: [:new, :create]
  end
  # get '/competitions', to: 'competitions#index'
  # get '/competitions/:id', to: 'competitions#show'
end
