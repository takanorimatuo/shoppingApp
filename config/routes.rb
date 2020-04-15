Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :mypage, only: [:index, :show]
  resources :users, only: [:new]
  resources :addresses, except: [:index, :show]
  resources :products do
    resources :buy, only: [:new, :create]
    collection do
      get :buy
    end
    member do
      post :pay
    end
  end
  resources :cards, except: [:show]
end
