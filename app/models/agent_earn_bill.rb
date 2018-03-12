class AgentEarnBill < ActiveRecord::Base
  validates :agent_user_id, :money, :earn_ratio, presence: true
  before_create :generate_uniq_id
  def generate_uniq_id
    begin
      self.uniq_id = Time.now.to_s(:number)[2,6] + (Time.now.to_i - Date.today.to_time.to_i).to_s + Time.now.nsec.to_s[0,6]
    end while self.class.exists?(:uniq_id => uniq_id)
  end
  
  def format_money(money)
    return '0.00' if money == 0
    money /= 100.00
    '%.2f' % money
  end
end
