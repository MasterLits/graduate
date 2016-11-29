class RenameTaskUsersToAssignedUsersTasks < ActiveRecord::Migration[5.0]
  def change
    rename_table :task_users, :assigned_users_tasks
  end
end
