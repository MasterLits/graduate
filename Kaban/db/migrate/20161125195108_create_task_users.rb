class CreateTaskUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :task_users do |t|
      t.belongs_to :task, index: true
      t.belongs_to :user, index: true



      t.timestamps
    end
  end
end
