Rails.application.routes.draw do
  namespace :admin do
    get '/show'
    get '/index'
    get '/create'
    get '/new'
    get '/update'
    get '/edit'
    get '/destroy'
  end
  get 'signalements/new'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root "articles#index"
  get '/article/:id/archived', to: "articles#archived", as: :archived_article
  get '/profil', to: "users#edit", as: :profil
  patch '/profil', to: "users#update"

  get '/login', to: "sessions#new", as: :new_session
  post '/login', to: "sessions#create"
  
  delete '/logout', to: "sessions#destroy", as: :destroy_session
  resources :articles do
    resources:comments
  end
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  scope 'admin', module: 'admin', as: 'admin' do
    resources :users, only: :index
    get 'users/passeditor/:id', to: "users#passeditor", as: :passeditor_users
    get 'users/passextern/:id', to: "users#passextern", as: :passextern_users
    delete 'users/:id/destroy', to: "users#destroy", as: :destroy_users
    
    get 'signalements/resolve'
    get 'signalements/show'
    get 'signalements/index'
  end

    
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
