class AgentUser < ActiveRecord::Base
  validates :name, presence: true
  
  belongs_to :parent, class_name: 'AgentUser', foreign_key: 'parent_id'
  
  AGENT_LEVELs = ['一级', '二级', '三级']
  
  before_create :generate_unique_id
  def generate_unique_id
    begin
      n = rand(10)
      if n == 0
        n = 8
      end
      self.uniq_id = (n.to_s + SecureRandom.random_number.to_s[2..6]).to_i
    end while self.class.exists?(:uniq_id => uniq_id)
  end
  
  def parent_aid=(val)
    self.parent_id = AgentUser.find_by(uniq_id: val).try(:id)
  end
  
  def parent_aid
    AgentUser.find_by(id: self.parent_id).try(:uniq_id)
  end
  
  def format_money(money)
    return '0.00' if money == 0
    money /= 100.00
    '%.2f' % money
  end
  
  def format_earn_ratio
    key = "L#{self.level}"
    ratio = self.earn_ratio.blank? ? AgentConfig.find_by(key: key).value : self.earn_ratio
    arr = ratio.split("-")
    
    temp = []
    arr.each_with_index do |val, index|
      temp << "#{AgentUser::AGENT_LEVELs[index]}提成#{val}%"
    end
    temp.join('；')
  end
end
