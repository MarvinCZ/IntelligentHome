class ChangeUsersSecretToIndex < ActiveRecord::Migration
  def change
		add_index :users, :secret,					unique:true
  end
end
