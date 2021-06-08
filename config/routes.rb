Rails.application.routes.draw do
  resources :competitions, only: [:index, :show] do
    resources :teams, only: [:index, :new, :create]
  end
end
