Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root "articles#index"
  
  get '/profil', to: "users#edit", as: :profil
  patch '/profil', to: "users#update"

  get '/login', to: "sessions#new", as: :new_session
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy", as: :destroy_session
  resources :articles do
    resources:comments
  end
  resources :users
  resources :sessions, only: [:new, :create]
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
