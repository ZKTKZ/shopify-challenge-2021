Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks'}
  # TODO: add namespace for versioning
  
  resources :users

  resources :photos, except: [:show, :edit, :update, :new]
  post '/photos/search' => 'photos#search' 

  root to: 'photos#index'
end
