class AddDisplayNameToUsersModel < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :display_name, :string, null: false, limit: 255, default: 'No display name provided'
  end
end
