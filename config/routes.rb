Rails.application.routes.draw do
  devise_for :users
  resources :burgers, only: %i[index show new create] do
    resources :reviews, only: %i[new create]
    resources :bookings, only: %i[new create]
  end
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
