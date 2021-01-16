Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks'}
  # TODO: add namespace for versioning
  resources :photos, except: [:show, :edit, :update, :new]
  post '/photos/search' => 'photos#search' 
  
  root 'photos#index'
end
