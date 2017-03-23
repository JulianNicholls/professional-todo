Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :todos

  get '/about', to: 'pages#about'
  get '/help',  to: 'pages#help'

  root 'pages#home'

end
