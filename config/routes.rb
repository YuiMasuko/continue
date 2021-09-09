Rails.application.routes.draw do
  resources :groups do
    resources :assigns, only: %w(create destroy)
  end
  devise_for :users

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
