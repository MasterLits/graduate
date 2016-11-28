class TaskUser < ApplicationRecord
  belongs_to :task
  belongs_to :user
  #after_save :create_tasks
 #after_save :create_users
end
