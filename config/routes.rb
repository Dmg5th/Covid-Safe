Rails.application.routes.draw do
  root to: 'sessions#welcome'
  resources :reviews
  resources :establishments
  resources :categories
  resources :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



end
