Rails.application.routes.draw do
  # ROUTES FOR BUSINESS LOGIC
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks'}
  resources :users

  # ROUTES FOR USER
  get 'photos/search'  
  get 'photos/create' 
  get 'photos/show', defaults: { format: 'json' }
  root to: 'photos#show'
end
