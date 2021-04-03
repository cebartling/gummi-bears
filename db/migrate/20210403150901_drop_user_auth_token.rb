class DropUserAuthToken < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :auth_token
  end
end
