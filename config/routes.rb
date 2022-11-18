Rails.application.routes.draw do
  resources :users
  resources :symptoms, :only => [:show, :update, :create, :delete]
  resources :period, :only => [:index, :show, :create, :update]
  resources :cycle 
end
