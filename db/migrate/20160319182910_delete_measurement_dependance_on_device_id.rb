class DeleteMeasurementDependanceOnDeviceId < ActiveRecord::Migration
  def change
    remove_column :measurements, "device_id"
  end
end
