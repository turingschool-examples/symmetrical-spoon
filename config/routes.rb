Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :competitions, only: [:index, :show] 
    # resources :registrations, only: [:new, :create]
  
  resources :teams, only: [:index]

  get "/competitions/:competition_id/registrations", to: "registrations#new" 
  post "/competitions/:competition_id", to: "registrations#create"

end
