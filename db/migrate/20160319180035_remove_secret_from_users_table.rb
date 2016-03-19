class RemoveSecretFromUsersTable < ActiveRecord::Migration
  def change
    remove_column :users, :secret
  end
end
