Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :competitions, only: [:index, :show] do
    resources :competition_entries, only: [:new, :create]
  end

  resources :teams, only: :index
end
