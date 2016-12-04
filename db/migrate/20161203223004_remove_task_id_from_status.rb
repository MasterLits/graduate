class RemoveTaskIdFromStatus < ActiveRecord::Migration[5.0]
  def change
    remove_column :statuses, :task_id
  end
end
