Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: "registrations" }
  resources :task_users
  resources :statuses
  resources :task_categories
  resources :statuses, only: [:show,:create, :new]
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
    resources :comments
    resources :tasks
    post :assign_task, on: :collection
    get :assigned_tasks, on: :collection
    delete :delete_user_assigned_task, on: :collection
  end


  root 'categories#index'

  resources :task_notifications, only: %i{index show}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
