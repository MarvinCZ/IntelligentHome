class AddUniqueIdToSensor < ActiveRecord::Migration
  def change
    add_column :sensors, :uid, :integer
  end
end
