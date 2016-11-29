class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :category, index: true
      t.text :body
      t.integer :cost
      t.time :date
      t.string :location
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
