Rails.application.routes.draw do
  # root 'users#show'
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

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  resources :users, only: [:show]
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in'
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
