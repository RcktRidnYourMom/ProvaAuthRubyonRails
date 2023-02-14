Rails.application.routes.draw do
  
  root "users#index"

  get '/login', to: 'sessions#new', as: 'login'
  post '/', to: 'users#create', as: 'sessions'
  delete '/sessions', to: 'sessions#destroy'


  resources :users, only:[:new, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


end
