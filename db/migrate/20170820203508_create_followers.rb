class CreateFollowers < ActiveRecord::Migration[5.1]
  def change
    create_table :followers do |t|
      t.references :follower, index: true, null: false
      t.references :profile, index: true, null: false
    end

    add_index :followers, [ :follower_id, :profile_id ], :unique => true

    add_foreign_key :followers, :profiles, column: :follower_id
    add_foreign_key :followers, :profiles, column: :profile_id
  end
end
