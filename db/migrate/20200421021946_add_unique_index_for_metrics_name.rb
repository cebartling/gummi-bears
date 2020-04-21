class AddUniqueIndexForMetricsName < ActiveRecord::Migration[6.0]
  def change
    add_index :metrics, :name, unique: true, name: 'name_unique_idx'
  end
end
