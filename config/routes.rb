Rails.application.routes.draw do
  devise_for :users
  get 'resumes/index'
  root to: "resumes#index"
end
