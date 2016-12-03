class TaskNotification < ApplicationRecord
  validates :task_id, uniqueness: { scope: :assigned_user_id }

  belongs_to :task
  belongs_to :assigned_user, class_name: 'User'
end