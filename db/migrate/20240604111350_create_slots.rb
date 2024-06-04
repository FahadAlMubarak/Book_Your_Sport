class CreateSlots < ActiveRecord::Migration[7.1]
  def change
    create_table :slots do |t|
      t.references :facility, null: false, foreign_key: true
      t.time :start_time
      t.time :end_time
      t.date :date
      t.string :status
      t.timestamps
    end
  end
end
