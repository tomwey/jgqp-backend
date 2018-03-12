class AddAgentUidToGameRecharges < ActiveRecord::Migration
  def change
    add_column :game_recharges, :agent_uid, :integer
    add_index :game_recharges, :agent_uid
  end
end
