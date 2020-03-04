Rails.application.routes.draw do
  root to: 'sells#index'
  resources :mypage
end
