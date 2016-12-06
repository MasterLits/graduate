class AssignedUsersTask < ApplicationRecord
  validates :task_id, uniqueness: { scope: :user_id }
  belongs_to :user
  belongs_to :task
end