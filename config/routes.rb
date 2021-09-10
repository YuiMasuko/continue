Rails.application.routes.draw do
  root 'groups#index'
  resources :groups do
    resources :assigns, only: [:create, :destroy]
  end
  devise_for :users

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
