class UpdateTimeColumnOnBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :start_time, :time
    remove_column :bookings, :end_time, :time

    add_column :bookings, :start_time, :datetime
    add_column :bookings, :end_time, :datetime
  end
end
