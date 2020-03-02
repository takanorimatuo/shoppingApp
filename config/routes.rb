Rails.application.routes.draw do
  devise_for :users
  root to: 'sells#index'
  get 'mypage' => 'mypage#index'
end
