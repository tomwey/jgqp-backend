class AddOpenedToGameUpdates < ActiveRecord::Migration
  def change
    add_column :game_updates, :opened, :boolean, default: false
  end
end
