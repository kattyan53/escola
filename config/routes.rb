Rails.application.routes.draw do

  resources :official_accounts

  resources :comments
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'blogs#index'#deviceはログイン後、デフォルトでroot_pathにリダイレクトされる

  resources :blogs do
    resources :comments
  end

  devise_for :users
  resources :users, :only => [:index, :show]

  resources :tops, :only => [:index]

  resources :favorites, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  resources :users do
    member do
      get :following, :followers
      get 'user_profile', to: 'users#regist_profile'
      get 'users_post', to: 'users#posts'
      get 'users_favorite', to: 'users#favorites'
    end
  end
  resources :relationships, only: [:create, :destroy]

  end
