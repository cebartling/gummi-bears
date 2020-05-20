class AddDataColumnToSimpleMovingAverageAnalyticsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :simple_moving_average_analytics, :data, :jsonb, null: true
  end
end
