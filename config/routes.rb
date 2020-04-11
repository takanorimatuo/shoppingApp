Rails.application.routes.draw do
  root to: 'sells#index'
  get 'products' => 'products#index'
end
