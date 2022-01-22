Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :tickets
  resources :home, only: [:index]
  root "home#index"
end
