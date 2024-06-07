class AddBookedToSlots < ActiveRecord::Migration[7.1]
  def change
    add_column :slots, :booked, :boolean, default: false, null: false
  end
end
