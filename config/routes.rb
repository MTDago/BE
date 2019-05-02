Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  resources :listings
  resources :users
  resources :models
  resources :admins

  root "listings#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
