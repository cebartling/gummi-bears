class AddTokenColumnToUserTable < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :auth_token, :string, null: true, limit: 255
    add_index :users, :auth_token, unique: true, name: 'auth_token_unique_idx'
  end
end
