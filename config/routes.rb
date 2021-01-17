Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks'}
  # TODO: add namespace for versioning
  
  resources :users

  resources :photos, only: [:index, :show], format: 'json'
  get '/photos/search' => 'photos#search' 

  root to: 'photos#show'
end
