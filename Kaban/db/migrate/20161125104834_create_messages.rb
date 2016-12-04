class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.belongs_to :user, index: true

      t.text :body

      t.timestamps
    end
  end
end
