Rails.application.routes.draw do
  root to: 'sells#index'
  get 'products' => 'products#index'
  devise_for :users
  root to: 'users#index'
  resources :mypage, only: [:index, :show]
  resources :users, only: [:new]
  resources :addresses, except: [:index, :show]

  resources :products
  resources :buy, only: [:new, :create]
end
