class ChangeUidInUsersToInterger < ActiveRecord::Migration
  def change
    remove_column :users, :uid
    add_column :users, :uid, :integer

  end
end
