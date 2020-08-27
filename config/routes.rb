Rails.application.routes.draw do
  devise_for :users, controllers:{
    registrations: 'users/registrations'
  }

  namespace :api do
    post :upload_image, to: 'utils#upload_image'
    resources :stories, only: [] do
      member do
        post :clap  # /stories/:id/clap
        post :bookmark #/stories/:id/bookmark
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
