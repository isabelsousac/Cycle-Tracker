Rails.application.routes.draw do
  resources :users, :only => [:index, :create, :update]
  post '/login' => 'users#login'
  get '/profile' => 'users#user_profile'
  post '/setup' => 'setup#setup_user_cycle'

  resources :symptoms, :only => [:show, :update, :create, :delete]
  resources :period, :only => [:index, :show, :create, :update]
  resources :cycle, :only => [:show, :create, :update]
end