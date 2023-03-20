Rails.application.routes.draw do
  root 'pages#home'  
  get '/users', to: 'users#index'
  resources :folders
  resources :pages
  get 'show_user/:id', to: 'users#show', as: 'show_user'
  get 'about', to: 'pages#about'

  namespace :admin do
    resources :users, only: [:edit, :update]do
    delete 'delete_user', on: :member
  end
  end

  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }


end
