Rails.application.routes.draw do

  root to: 'toppages#index'
  
  get 'tasks/:id', to: 'tasks#show'
  put 'tasks/:id', to: 'tasks#update'
  delete 'tasks/:id', to: 'tasks#destroy'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  
  resources :users, only: [ :index, :show, :new, :create ]

  resources :tasks, only: [:new, :edit, :create, :update, :destroy]
  
  
end
