Rails.application.routes.draw do

  resources :orders, only: [:show, :index, :create, :destroy]
  resources :profiles
  devise_for :users, controllers: { registrations: "devise_override/registrations" }
  resources :listings

  get 'orders/:listing_id', to: 'orders#new'

  root "listings#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
