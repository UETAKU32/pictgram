Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "pages/help",   to: "pages#help"
  get "pages/link",   to: "pages#link"
  
  resources :users
  resources :topics
  
  get 'favorites/index'
  post '/favorites',  to: 'favorites#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
