class AddSecretTokentoLinkedId < ActiveRecord::Migration
  def change
    add_column :linked_ids, :token, :string
    add_column :linked_ids, :secret, :string
  end
end
