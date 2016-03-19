class AddSecretToUsers < ActiveRecord::Migration
  def up
		add_column :users, :secret, :integer
  end
end
