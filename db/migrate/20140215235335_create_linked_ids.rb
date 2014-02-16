class CreateLinkedIds < ActiveRecord::Migration
  def change
    create_table :linked_ids do |t|
      t.string :name
      t.string :provider
      t.string :uid
      t.integer :user_id

      t.timestamps
    end
  end
end
