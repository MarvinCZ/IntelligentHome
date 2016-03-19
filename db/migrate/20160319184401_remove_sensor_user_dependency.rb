class RemoveSensorUserDependency < ActiveRecord::Migration
  def change
    remove_column :sensors, "user_id"
    add_column :sensors, "device_id", :integer
    add_index :sensors, "device_id"
  end
end
