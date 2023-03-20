Rails.application.routes.draw do
  root 'pages#home'
  resources :pages
  devise_for :users, controllers:{
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }


end
