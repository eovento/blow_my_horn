Rails.application.routes.draw do
  root to: 'pages#home'

  get 'users_profiles/profile/:id', to: "users_profiles#profile", as: "user_profile"
  get 'users_profiles/instruments/:id', to: "users_profiles#instruments", as: "list_user_instruments"
  get 'users_profiles/rentals/:id', to: "users_profiles#rentals", as: "list_user_rentals"
  



  mount Attachinary::Engine => "/attachinary"

  get "instruments/:id/rent/confirm", to: "rentals#confirm", as: "confirm_rental"
  get "instruments/rent/error", to: "rentals#error", as: "rental_error"

  resources :instruments do
    resources :rentals, only: [:create]
  end

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end