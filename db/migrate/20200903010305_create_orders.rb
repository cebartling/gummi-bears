class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders, id: :uuid do |t|
      t.uuid :user_stock_id, null: false
      t.integer :transaction_type, null: false
      t.integer :price_in_cents, null: false
      t.integer :shares_count, null: false
      t.integer :total_amount_in_cents, null: false, default: 0
      t.timestamp :order_timestamp, null: false
      t.timestamps
    end

    add_foreign_key :orders, :user_stocks
    add_index :orders, :transaction_type
    add_index :orders, :order_timestamp
  end
end
