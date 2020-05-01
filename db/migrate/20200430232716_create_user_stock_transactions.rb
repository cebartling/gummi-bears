class CreateUserStockTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_stock_transactions, id: :uuid do |t|
      t.uuid :user_stock_id, null: false
      t.integer :transaction_type, null: false
      t.integer :price_in_cents, null: false
      t.integer :shares_count, null: false
      t.timestamp :transaction_timestamp, null: false
      t.timestamps
    end

    add_foreign_key :user_stock_transactions, :user_stocks
    add_index :user_stock_transactions, :transaction_type
    add_index :user_stock_transactions, :transaction_timestamp
  end
end
