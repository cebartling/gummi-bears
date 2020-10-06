class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications, id: :uuid do |t|
      t.uuid :user_id, null: false
      t.string :message, null: false, limit: 4096
      t.boolean :read, null: false, default: false
      t.timestamp :notification_timestamp, null: false
      t.timestamps
    end

    add_foreign_key :notifications, :users
    add_index :notifications, :notification_timestamp
  end
end
