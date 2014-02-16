class ChangeUidToInteger < ActiveRecord::Migration
  def change
    remove_column :linkedids, :uid
    add_column :linkedids, :uid, :integer

  end
end
