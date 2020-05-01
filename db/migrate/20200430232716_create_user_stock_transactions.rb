class CreateUserStockTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_stock_transactions, id: :uuid do |t|
      t.uuid :user_stock_id, null: false
      t.integer :price_in_cents, null: false
      t.integer :shares_count, null: false
      t.timestamp :transaction_timestamp, null: false
      t.timestamps
    end



    # add_column :user_stock_transactions,
    #            :transaction_type,
    #            :investment_transaction_type,
    #            null: false

    add_foreign_key :user_stock_transactions, :user_stocks

    # add_index :user_stock_transactions, :transaction_type
  end
end