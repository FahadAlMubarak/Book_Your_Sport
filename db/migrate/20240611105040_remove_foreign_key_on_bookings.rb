class RemoveForeignKeyOnBookings < ActiveRecord::Migration[7.1]
  def change
    remove_reference :bookings, :slot, foreign_key: true, index: false
  end
end
