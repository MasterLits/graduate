class TasksCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks_categories, id: false do |t|
      t.belongs_to :task, index:true
      t.belongs_to :category, index:true

    end
  end
end
