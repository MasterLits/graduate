class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :user, index:true
      t.text :body

      t.timestamps
    end
  end
end
