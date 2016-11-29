class Task < ApplicationRecord
  has_many :comments
  has_many :statuses
  has_many :assigned_users_tasks
  has_many :assigned_users, :through => :assigned_users_tasks, source: :user
  belongs_to :user
  belongs_to :category
end
