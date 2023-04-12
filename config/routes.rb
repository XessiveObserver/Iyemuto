Rails.application.routes.draw do
  devise_for :publishers
  root "normal_pages#index"
  get 'normal_pages/index'
  get 'normal_pages/dashboard'
  resources :articles
end
