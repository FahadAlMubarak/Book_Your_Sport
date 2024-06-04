class CreateVenues < ActiveRecord::Migration[7.1]
  def change
    create_table :venues do |t|

      t.timestamps
      t.string :name
      t.string :address
      t.text :description
      t.string :phone
      t.string :email
      t.text :socials
      t.time :opening_time
      t.time :closing_time
      t.references :user, null: false, foreign_key: true
    end
  end
end
