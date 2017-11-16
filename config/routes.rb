Rails.application.routes.draw do
  devise_for :specialists
  devise_for :clients, controllers: { omniauth_callbacks: 'clients/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :specialists, only: [ :index, :show ]
  get 'clients/booking'
end
