class CreateGameConfigs < ActiveRecord::Migration
  def change
    create_table :game_configs do |t|
      t.string :key, null: false, default: ''
      t.string :value, null: false, default: ''
      t.string :description

      t.timestamps null: false
    end
    add_index :game_configs, :key, unique: true 
  end
end
