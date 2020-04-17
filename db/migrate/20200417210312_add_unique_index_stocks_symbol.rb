class AddUniqueIndexStocksSymbol < ActiveRecord::Migration[6.0]
  def change
    add_index :stocks, :symbol, unique: true, name: 'symbol_unique_idx'
  end
end
