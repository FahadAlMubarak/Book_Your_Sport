class ChangeTimeToDateTime < ActiveRecord::Migration[7.1]
  def change
    remove_column :slots, :start_time
    remove_column :slots, :end_time
    add_column :slots, :start_time, :datetime
    add_column :slots, :end_time, :datetime
  end
end
