ActiveAdmin.register GameRecharge do
  menu parent: 'game', priority: 8, label: '游戏充值'
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :game_id, :uid, :_money, :diamond, :recharge_desc
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
index do
  selectable_column
  column :uid
  column :_money
  column :diamond
  column :recharge_desc
  column :recharge_man
  column :recharged_at
  column 'at', :created_at
  
  actions
end

before_create do |o|
  o.recharge_man = current_admin_user.email
end

form do |f|
  f.semantic_errors
  f.inputs '基本信息' do
    f.input :uid
    f.input :game_id, as: :select, collection: Game.all.map { |g| [g.name, g.id] }
    f.input :_money, as: :number, label: '充值金额', placeholder: '单位为元'
    f.input :diamond
    f.input :recharge_desc
  end
  
  actions
  
end


end
