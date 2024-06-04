class CreateSharedBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :shared_bookings do |t|
      t.references :booking, null: false, foreign_key: true
      t.references :friend, null: false, foreign_key: true

      t.timestamps
    end
  end
end
