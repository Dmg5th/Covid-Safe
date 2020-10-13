Rails.application.routes.draw do
  root to: 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  get '/auth/google_oauth2/callback' => 'sessions#omniauth' 
  
  resources :reviews
  resources :establishments do 
    resources :reviews, only: [:new, :index]
  end 
  resources :categories
  resources :users, only: [:index, :new, :create, :show]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



end
