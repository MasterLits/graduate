class Task < ApplicationRecord
  has_many :comments
  has_many :statuses
  has_many :task_categories
  has_many :categories, :through => :task_categories
  has_many :task_users
  has_many :users, :through => :task_users

end
