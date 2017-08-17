Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  get "instruments/:id/rent/confirm", to: "rentals#confirm", as: "confirm_rental"
  get "instruments/rent/error", to: "rentals#error", as: "rental_error"

  resources :instruments do
    resources :rentals, only: [:create]
  end

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
end
