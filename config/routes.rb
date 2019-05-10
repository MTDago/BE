Rails.application.routes.draw do

  resources :profiles
  devise_for :users, controllers: { registrations: "devise_override/registrations" }
  resources :listings

  get 'order/:id', to: 'order#show'
  post 'order/:listing_id', to: 'order#new'

  root "listings#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
