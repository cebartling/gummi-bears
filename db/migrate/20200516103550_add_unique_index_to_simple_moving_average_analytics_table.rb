class AddUniqueIndexToSimpleMovingAverageAnalyticsTable < ActiveRecord::Migration[6.0]
  def change
    add_index :simple_moving_average_analytics, [:stock_id, :interval_type, :series_type, :time_period],
              name: 'simple_moving_average_analytics_unique_idx'
  end
end
