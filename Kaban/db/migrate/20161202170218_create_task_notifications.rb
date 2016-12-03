class CreateTaskNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :task_notifications do |t|
      t.belongs_to :task

      t.integer :creator_id, index: true
      t.integer :assigned_user_id

      t.datetime :created_at
    end

    add_index :task_notifications, [:task_id, :assigned_user_id], unique: true
  end
end
