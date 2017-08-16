class AddProfileToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :profile_id, :integer

    add_foreign_key :users, :profiles
  end
end
