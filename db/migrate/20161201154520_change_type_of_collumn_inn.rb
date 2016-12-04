class ChangeTypeOfCollumnInn < ActiveRecord::Migration[5.0]

    def change
      change_column  :users, :inn, :string
    end

end
