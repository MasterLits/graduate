class AddTitleToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :title, :string
  end
  end
