Rails.application.routes.draw do
  devise_for :users
  resources :burgers, only: %i[show new create] do
    resources :reviews, only: %i[new create]
    resources :bookings, only: %i[new create show]
  end
  resources :bookings, only: %i[index]
  root to: "burgers#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
