Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/myproducts', to: 'pages#myproducts'

  # terms and conditions
  get '/terms', to: 'pages#terms'
  get '/refund', to: 'pages#refund'

  resources :products do
    resources :orders, only: %i[new create]
  end

  resources :orders, only: %i[index show create] do
    resources :reviews, only: %i[new create]
  end
end
