Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :task_users
  resources :task_categories
  resources :admins
  resources :statuses
  resources :reviews
  resources :categories do
    resource :tasks
  end
  resources :tasks
  # config/routes.rb
  %w( 404 422 500 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

  match "profile" => "users#get_profile", :as => 'profile', via: "get"

  resources :users do
    resources :tasks
    post :assign_task, on: :collection
    get :assigned_tasks, on: :collection
  end

  resources :comments
  resources :messages
  root 'categories#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
