class CreateGameRecharges < ActiveRecord::Migration
  def change
    create_table :game_recharges do |t|
      t.integer :game_id, null: false
      t.integer :uid, null: false # 用户ID
      t.integer :money, default: 0 # 单位为分
      t.integer :diamond, null: false
      t.string :recharge_desc, null: false
      t.string :recharge_man, null: false
      t.datetime :recharged_at

      t.timestamps null: false
    end
    add_index :game_recharges, :uid
    add_index :game_recharges, :game_id
  end
end
