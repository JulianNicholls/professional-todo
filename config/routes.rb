Rails.application.routes.draw do
  resources :todos
  resources :users

  get '/about', to: 'pages#about'
  get '/help',  to: 'pages#help'

  get '/signup',    to: 'users#new'

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'pages#home'
end
