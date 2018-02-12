Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'blogs#index'#deviceはログイン後、デフォルトでroot_pathにリダイレクトされる
  resources :blogs

  devise_for :users
  resources :users, :only => [:index, :show]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
