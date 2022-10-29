Rails.application.routes.draw do
  
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
  resources :articles, only: [:show, :index] do
    resources :comments
  end
  get '/signalements/new/:comment', to: "signalements#new", as: :new_signalements
  post '/signalements/:id', to: "signalements#create", as: :signalements
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  scope 'admin', module: 'admin', as: 'admin' do
    resources :users, only: :index
    get 'users/passeditor/:id', to: "users#passeditor", as: :passeditor_users
    get 'users/passextern/:id', to: "users#passextern", as: :passextern_users
    delete 'users/:id/destroy', to: "users#destroy", as: :destroy_users 
    resources :signalements, only: [:show, :index, :destroy] do
      resources :comments, only: [:destroy, :show]
    end
    get 'signalements/resolve/:id', to: "signalements#resolve", as: :resolve_signalement
  end
  scope 'editor', module: 'editor', as: 'editor' do
    resources :tags
    resources :articles, except: [:index, :show]
    get '/article/:id/archived', to: "articles#archived", as: :archived_article
    get '/article/:id/actived', to: "articles#actived", as: :actived_article
  end
 

    
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
