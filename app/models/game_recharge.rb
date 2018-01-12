require 'rest-client'
class GameRecharge < ActiveRecord::Base
  validates :game_id, :uid, :money, :_money, :diamond, :recharge_desc, presence: true
  
  after_create :send_to_game_server
  def send_to_game_server
    
  end
  
  def _money=(val)
    self.money = (val * 100).to_i
  end
  
  def _money
    self.money / 100.0
  end
  
end
