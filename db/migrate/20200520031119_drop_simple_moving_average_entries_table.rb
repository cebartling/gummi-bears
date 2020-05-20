class DropSimpleMovingAverageEntriesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :simple_moving_average_entries
  end
end
