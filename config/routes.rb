Rails.application.routes.draw do
  devise_for :users
  get 'resumes/index'
  root to: "resumes#index"
  resources :users, only: [:index, :edit, :update]
  resources :resumes, only: [:index, :new, :create, :show, :edit, :update]
end
