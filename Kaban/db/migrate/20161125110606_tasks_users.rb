class TasksUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks_users, id: false  do |t|
      t.belongs_to :task, index:true
      t.belongs_to :user, index:true

    end
  end
end
