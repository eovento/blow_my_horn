Rails.application.routes.draw do
  get 'instruments/index'

  get 'instruments/show'

  get 'instruments/new'

  get 'instruments/create'

  get 'instruments/edit'

  get 'instruments/update'

  get 'instruments/destroy'

  root to: 'pages#home'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
