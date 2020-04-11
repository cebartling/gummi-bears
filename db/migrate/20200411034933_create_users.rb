class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :first_name, null: false, limit: 40
      t.string :last_name, null: false, limit: 50
      t.string :username, null: false, limit: 30

      t.timestamps
    end
  end
end
