Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :products do
    resources :orders, only: %i[new create]
  end

  resources :orders, only: %i[show] do
    resources :reviews, only: %i[new create]
  end
end
