Rails.application.routes.draw do
  root to: 'sells#index'
  get 'mypage' => 'mypage#index'
end
