Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks'}
  # TODO: add namespace for versioning
  
  resources :users

  get 'photos/search' => 'photos#search' 
  get 'photos/create' => 'photos#create'
  resources :photos, only: [:show], format: 'json'


  root to: 'photos#show'
end
