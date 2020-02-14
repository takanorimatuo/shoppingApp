Rails.application.routes.draw do
  root to: 'sells#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
end
