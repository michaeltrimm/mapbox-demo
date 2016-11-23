Rails.application.routes.draw do
  devise_for :users
  root 'map#index'
  resources :map
end
