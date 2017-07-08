Rails.application.routes.draw do
  root 'home#index'

  get '/auth/github/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#delete'

  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  get '/repos', to: 'repos#index', as: 'repos'
end
