class ResizeUsersUsernameColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :username, :string, null: true, limit: 255
  end
end
