class DeviceType < ActiveRecord::Migration
  def up
		add_column :devices, :type, :integer
  end
end