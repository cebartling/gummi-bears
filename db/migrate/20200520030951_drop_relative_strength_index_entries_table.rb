class DropRelativeStrengthIndexEntriesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :relative_strength_index_entries
  end
end
