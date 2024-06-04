class CreateFacilities < ActiveRecord::Migration[7.1]
  def change
    create_table :facilities do |t|
      t.references :venue, null: false, foreign_key: true
      t.string :sport
      t.integer :capacity
      t.integer :price
      t.integer :duration
      t.integer :deposit_price
      t.timestamps
    end
  end
end
