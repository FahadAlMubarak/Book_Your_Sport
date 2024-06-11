class AddColumnsToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :checkout_session_id, :string
    add_monetize :bookings, :deposit_price, currency: { present: false }
  end
end
