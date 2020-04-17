class AddUniqueIndexUserStocksUserAndStock < ActiveRecord::Migration[6.0]
  def change
    add_index :user_stocks, [:user_id, :stock_id], unique: true, name: 'user_id_stock_id_unique_idx'
  end
end

