class CreateGameUpdates < ActiveRecord::Migration
  def change
    create_table :game_updates do |t|
      t.string :version, null: false, default: ''
      t.string :search_paths, null: false
      t.string :os, null: false
      t.integer :game_id, null: false
      t.string :package_file
      t.string :change_log

      t.timestamps null: false
    end
    add_index :game_updates, :game_id
    add_index :game_updates, :version, unique: true
    add_index :game_updates, :os
  end
end
