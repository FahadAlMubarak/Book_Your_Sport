class AddNameToFacilities < ActiveRecord::Migration[7.1]
  def change
    add_column :facilities, :name, :string
  end
end
