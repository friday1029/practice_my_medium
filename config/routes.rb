Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations'
  }

  resources :stories do
    member do
      post :clap  # /stories/:id/clap
    end

    resources :comments, only: [:create]
  end

  resources :users, only: [] do
    member do
      post :follow #/users/:id/follow
    end
  end





  get '@:username/:story_id', to: 'pages#show', as: 'story_page'
  
  get '@:username', to: 'pages#user', as: 'user_page'

  get '/demo', to: 'pages#demo'

  root 'pages#index'
end
