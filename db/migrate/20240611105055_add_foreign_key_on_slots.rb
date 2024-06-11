class AddForeignKeyOnSlots < ActiveRecord::Migration[7.1]
  def change
    add_reference :slots, :booking, foreign_key: true
  end
end
