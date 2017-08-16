Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  post "instruments/:id/rent", to: "rentals#create", as: "rent_instrument"
  resources :instruments
  resources :rentals
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
end
