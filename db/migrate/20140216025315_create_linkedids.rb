class CreateLinkedids < ActiveRecord::Migration
  def change
    create_table :linkedids do |t|
      t.string :name
      t.string :provider
      t.string :uid
      t.integer :user_id
      t.string :token
      t.string :secret

      t.timestamps
    end
  end
end
