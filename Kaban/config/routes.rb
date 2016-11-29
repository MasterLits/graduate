Rails.application.routes.draw do

  get "root" => 'categories#index'

  devise_for :users
  resources :task_users
  resources :task_categories
  resources :admins
  resources :statuses
  resources :reviews
  resources :categories
  resources :tasks
  resources :users
  resources :comments
  resources :messages

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
