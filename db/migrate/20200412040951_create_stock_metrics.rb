class CreateStockMetrics < ActiveRecord::Migration[6.0]
  def change
    create_table :stock_metrics, id: :uuid do |t|
      t.uuid :metric_id, null: false
      t.uuid :stock_id, null: false
      t.timestamps
    end

    add_foreign_key :stock_metrics, :metrics
    add_foreign_key :stock_metrics, :stocks
  end
end
