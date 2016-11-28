class CreateTaskCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :task_categories do |t|
      t.belongs_to :task, index: true
      t.belongs_to :category, index: true
      t.timestamps
    end
  end
end
