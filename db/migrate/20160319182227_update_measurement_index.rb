class UpdateMeasurementIndex < ActiveRecord::Migration
  def change
    add_column :measurements, :sensor_id, :integer
    remove_index :measurements, "device_id"
    add_index :measurements, "sensor_id"
  end
end
