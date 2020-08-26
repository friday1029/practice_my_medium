Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations'
  }

  namespace :api do
    resources :stories, only: [] do
      member do
        post :clap  # /stories/:id/clap
      end
    end

    resources :users, only: [] do
      member do
        post :follow #/users/:id/follow
      end
    end
  end

  
  resources :stories do
    resources :comments, only: [:create]
  end






  get '@:username/:story_id', to: 'pages#show', as: 'story_page'
  
  get '@:username', to: 'pages#user', as: 'user_page'

  get '/demo', to: 'pages#demo'

  root 'pages#index'
end
