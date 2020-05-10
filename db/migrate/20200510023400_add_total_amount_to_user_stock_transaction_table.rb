class AddTotalAmountToUserStockTransactionTable < ActiveRecord::Migration[6.0]
  def change
    add_column :user_stock_transactions, :total_amount_in_cents, :integer, null: false, default: 0
  end
end
