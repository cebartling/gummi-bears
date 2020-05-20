class AddDataColumnToRelativeStrengthIndexAnalyticsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :relative_strength_index_analytics, :data, :jsonb, null: true
  end
end
