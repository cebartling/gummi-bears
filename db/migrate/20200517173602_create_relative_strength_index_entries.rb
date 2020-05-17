class CreateRelativeStrengthIndexEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :relative_strength_index_entries, id: :uuid do |t|
      t.uuid :relative_strength_index_analytic_id, null: false
      t.timestamp :event_timestamp, null: false
      t.decimal :index_value, null: false
      t.timestamps
    end

    add_foreign_key :relative_strength_index_entries, :relative_strength_index_analytics
  end
end
