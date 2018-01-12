class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name, null: false, default: ''
      t.string :icon
      t.string :bundle_id, null: false, default: ''
      t.string :code, null: false, default: ''
      t.string :intro

      t.timestamps null: false
    end
    add_index :games, :code, unique: true
    add_index :games, :bundle_id, unique: true
  end
end
