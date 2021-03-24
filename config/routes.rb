Rails.application.routes.draw do
  devise_for :users
  get 'cooks/index'
  root to: "cooks#index"
end
