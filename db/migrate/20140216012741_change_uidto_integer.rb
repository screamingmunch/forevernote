class ChangeUidtoInteger < ActiveRecord::Migration
  def change
    remove_column :linked_ids, :uid
    add_column :linked_ids, :uid, :integer
  end
end
