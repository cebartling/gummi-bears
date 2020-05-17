class CreateRelativeStrengthIndexAnalytics < ActiveRecord::Migration[6.0]
  def change
    create_table :relative_strength_index_analytics, id: :uuid do |t|
      t.uuid :stock_id, null: false
      t.integer :interval_type, null: false
      t.integer :series_type, null: false
      t.integer :time_period, null: false
      t.timestamps
    end

    add_foreign_key :relative_strength_index_analytics, :stocks

    add_index :relative_strength_index_analytics,
              [
                :stock_id,
                :interval_type,
                :series_type,
                :time_period
              ],
              name: 'relative_strength_index_analytics_unique_idx'
  end
end
