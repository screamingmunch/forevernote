class CreateJounrals < ActiveRecord::Migration
  def change
    create_table :jounrals do |t|
      t.string :name
      t.string :guid
      t.integer :user_id

      t.timestamps
    end
  end
end
