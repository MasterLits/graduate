class AddCreatorIdToComments < ActiveRecord::Migration[5.0]
  def change

    add_column :comments, :creator_id, :integer
  end
end
