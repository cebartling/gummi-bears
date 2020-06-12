class AddCurrentPriceAndVolumeInfoToStock < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :current_price, :decimal, null: :true, precision: 12, scale: 4
    add_column :stocks, :open_price, :decimal, null: :true, precision: 12, scale: 4
    add_column :stocks, :high_price, :decimal, null: :true, precision: 12, scale: 4
    add_column :stocks, :low_price, :decimal, null: :true, precision: 12, scale: 4
    add_column :stocks, :previous_close_price, :decimal, null: :true, precision: 12, scale: 4
    add_column :stocks, :volume, :integer, null: :true
    add_column :stocks, :percent_change, :decimal, null: :true, precision: 12, scale: 4
    add_column :stocks, :price_change, :decimal, null: :true, precision: 12, scale: 4
    add_column :stocks, :latest_trading_date, :date, null: :true
  end
end
