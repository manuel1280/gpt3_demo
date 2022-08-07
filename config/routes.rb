Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {registrations: 'registrations'}
  resources :tickets
  resources :home, only: [:index]
  resources :conversations, only: [:show] do
    collection do
      get :clean
    end
    resources :messages, only: [:create]
  end
  root "home#index"
end
