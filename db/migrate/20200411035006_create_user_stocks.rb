class CreateUserStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_stocks, id: :uuid do |t|
      t.uuid :user_id, null: false
      t.uuid :stock_id, null: false
      t.timestamps
    end

    add_foreign_key :user_stocks, :users
    add_foreign_key :user_stocks, :stocks
  end
end
