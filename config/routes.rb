Rails.application.routes.draw do
  resources :vouchers, only: [:show, :new, :create]
  resources :restaurants, only: [:index, :show]
  devise_for :users
  # root to: 'pages#home'
  root to: "restaurants#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
