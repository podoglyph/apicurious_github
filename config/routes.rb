Rails.application.routes.draw do
  root 'dashboard#index'

  get '/auth/github/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#delete'

  resources :dashboard, only: [:index]
end
