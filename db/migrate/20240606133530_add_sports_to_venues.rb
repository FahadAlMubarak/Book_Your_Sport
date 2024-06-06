class AddSportsToVenues < ActiveRecord::Migration[7.1]
  def change
    add_column :venues, :sports, :string
  end
end
