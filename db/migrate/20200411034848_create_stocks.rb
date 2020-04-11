class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks, id: :uuid do |t|
      t.string :name, null: false, limit: 100
      t.string :symbol, null: false, limit: 10

      t.timestamps
    end
  end
end
