Rails.application.routes.draw do
  resources :users, :only => [:index, :create, :update]
  post '/login' => 'users#login'
  get '/profile' => 'users#user_profile'
  post '/setup' => 'setup#setup_user_cycle'

  post '/cycle/:id/symptoms' => "symptoms#create"
  get '/symptoms/:id' => "symptoms#show"
  put '/symptoms/:id' => "symptoms#update"
  delete '/cycle/:id/symptoms/:symptom_id' => "symptoms#delete"



  resources :period, :only => [:index, :show, :create, :update]
  resources :cycle, :only => [:show, :create, :update]
end