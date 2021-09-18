Rails.application.routes.draw do
  root 'groups#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :groups do
    get 'invite', on: :member
    resources :assigns, only: [:create, :destroy]
    resources :posts do
      resources :comments, only: [:create, :destroy]
      collection do
        get 'search'
      end
    end
  end

  devise_for :users
  resources :users, only: [:show]
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
