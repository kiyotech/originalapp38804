Rails.application.routes.draw do
  get 'resumes/index'
  root to: "resumes#index"
end
