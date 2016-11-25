class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
      t.belongs_to :task, index:true
      t.string :body

      t.timestamps
    end
  end
end
