Rails.application.routes.draw do
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
