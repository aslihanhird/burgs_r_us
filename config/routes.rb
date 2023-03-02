Rails.application.routes.draw do
  root to: "burgers#index"
  devise_for :users
  resources :burgers, only: %i[show new create edit update destroy] do
    resources :reviews, only: %i[new create destroy]
    resources :bookings, only: %i[create show]
  end

  resources :bookings, only: %i[index]

  get "bookings/:id/confirmed", to: "bookings#confirmed", as: "booking_confirmed"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
