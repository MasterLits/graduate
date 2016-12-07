class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :login
      t.string :password
      t.string :role
      t.string :photo
      t.string :tel
      t.string :email

      t.timestamps
    end
  end
end
