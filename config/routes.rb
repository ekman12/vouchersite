Rails.application.routes.draw do
  resources :vouchers, only: [:index, :new, :create]
  # resources :restaurants
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
