class CreateSimpleMovingAverageEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :simple_moving_average_entries, id: :uuid do |t|
      t.uuid :simple_moving_average_analytic_id, null: false
      t.timestamp :event_timestamp, null: false
      t.integer :observation_value_in_cents, null: false
      t.timestamps
    end

    add_foreign_key :simple_moving_average_entries, :simple_moving_average_analytics
  end
end
