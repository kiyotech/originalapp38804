Rails.application.routes.draw do
  devise_for :users
  get 'resumes/index'
  root to: "resumes#index"
  resources :users, only: [:index, :edit, :update]
  resources :resumes do
    resources :orders, only: [:index, :create, :show]
  end
end
