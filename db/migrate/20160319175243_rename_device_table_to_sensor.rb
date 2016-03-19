class RenameDeviceTableToSensor < ActiveRecord::Migration
  def change
    rename_table :devices, :sensors
  end
end
