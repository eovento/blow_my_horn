Rails.application.routes.draw do
  root to: 'pages#home'

  get 'users_profiles/profile/:id', to: "users_profiles#profile", as: "user_profile"
  get 'users_profiles/instruments/:id', to: "users_profiles#instruments", as: "list_user_instruments"
  get 'users_profiles/rentals/:id', to: "users_profiles#rentals", as: "list_user_rentals"
  



  mount Attachinary::Engine => "/attachinary"

  post "instruments/:id/rent", to: "rentals#create", as: "rent_instrument"
  resources :instruments
  resources :rentals
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end