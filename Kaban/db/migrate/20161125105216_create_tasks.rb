class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.text :body
      t.integer :cost
      t.time :date
      t.string :location

      t.timestamps
    end
  end
end
