Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :todos
  resources :users


  get '/about', to: 'pages#about'
  get '/help',  to: 'pages#help'

  get '/signup',    to: 'users#new'
  
  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  delete '/logout', to: 'session#destroy'

  root 'pages#home'
end
