class ChangeIndexForGameUpdate < ActiveRecord::Migration
  def change
    remove_index :game_updates, :version
    add_index :game_updates, :version
  end
end
