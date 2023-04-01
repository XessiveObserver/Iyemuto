Rails.application.routes.draw do
  devise_for :publishers
  get 'normal_pages/index'
  get 'normal_pages/dashboard'
  root "normal_pages#index"
  resources :articles
end
