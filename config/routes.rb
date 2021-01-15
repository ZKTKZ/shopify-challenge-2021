Rails.application.routes.draw do
  # TODO: add namespace for versioning
  resources :photos, except: [:show, :edit, :update, :new]
  post '/photos/search' => 'photos#search' 
end
