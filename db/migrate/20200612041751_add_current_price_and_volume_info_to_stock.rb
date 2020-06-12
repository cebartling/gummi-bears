class AddCurrentPriceAndVolumeInfoToStock < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks, :current_price_in_cents, :integer, null: :true
    add_column :stocks, :volume, :integer, null: :true
    add_column :stocks, :percent_change, :decimal, null: :true, precision: 12, scale: 4
    add_column :stocks, :price_change_in_cents, :integer, null: :true
    add_column :stocks, :latest_trading_date, :date, null: :true
  end
end
