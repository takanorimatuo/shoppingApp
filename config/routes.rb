Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :mypage, only: [:index, :show]
  resources :users, only: [:new]
  resources :addresses, except: [:index, :show]
  resources :products

end
