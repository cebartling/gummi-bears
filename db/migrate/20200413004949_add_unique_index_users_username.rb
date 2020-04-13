class AddUniqueIndexUsersUsername < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :username, unique: true, name: 'username_unique_idx'
  end
end
