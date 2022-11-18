Rails.application.routes.draw do
  root :to => "pages#home"

  resources :users, :only => [:new, :create, :edit, :update]
  resources :symptoms, :only => [:show, :update, :create, :delete]
  resources :period, :only => [:index, :show, :create, :update]
  resources :cycle 

  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'login' => 'sessions#destroy'
end
