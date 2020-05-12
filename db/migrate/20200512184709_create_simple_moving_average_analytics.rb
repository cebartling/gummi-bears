class CreateSimpleMovingAverageAnalytics < ActiveRecord::Migration[6.0]
  def change
    create_table :simple_moving_average_analytics, id: :uuid do |t|
      t.uuid :stock_id, null: false
      t.integer :interval_type, null: false
      t.integer :series_type, null: false
      t.integer :time_period, null: false
      t.timestamps
    end

    add_foreign_key :simple_moving_average_analytics, :stocks
  end
end
