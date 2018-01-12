require 'rest-client'
class GameRecharge < ActiveRecord::Base
  validates :game_id, :uid, :money, :diamond, :recharge_desc, presence: true
  
  after_create :send_to_game_server
  def send_to_game_server
    
  end
  
  def money_val=(val)
    self.money = (val.to_f * 100).to_i
  end
  
  def money_val
    self.money / 100.0
  end
  
end
