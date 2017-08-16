class AddProfileToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :profile_id, :integer

    add_foreign_key :posts, :profiles
  end
end
