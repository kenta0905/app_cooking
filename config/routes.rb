Rails.application.routes.draw do
  devise_for :users
  get 'cooks/index'
  root to: "cooks#index"
  resources :cooks do
    resources :comments, only: [:create]
  end
end
