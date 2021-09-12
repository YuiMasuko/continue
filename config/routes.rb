Rails.application.routes.draw do
  resources :posts
  root 'groups#index'
  resources :groups do
    get 'invite', on: :member
    resources :assigns, only: [:create, :destroy]
  end

  devise_for :users
  resources :users, only: [:show]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
