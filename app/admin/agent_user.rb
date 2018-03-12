ActiveAdmin.register AgentUser do
  menu parent: 'agent', priority: 2, label: '代理商管理'
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :mobile, :level, :address, :earn_ratio, :parent_aid, :note
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
  column :uniq_id, sortable: false
  column :name, sortable: false
  column :level
  column :earnings do |o|
    o.format_money(o.earnings)
  end
  column :balance do |o|
    o.format_money(o.balance)
  end
  column :earn_ratio, sortable: false
  
  column :mobile, sortable: false
  column '直接上级代理商', sortable: false do |o|
    o.parent_id.blank? ? '' : link_to(o.parent.uniq_id, [:cpanel, o.parent])
  end
  column :created_at
  
  actions
end

form do |f|
  f.semantic_errors
  f.inputs '基本信息' do
    f.input :name
    f.input :mobile
    f.input :level, placeholder: '设置代理级别，一级代理填0，二级代理填1，依次类推；如果不填默认创建1级代理'
    f.input :parent_aid, as: :number, label: '直接上级代理ID'
    f.input :earn_ratio, placeholder: '40-15-5（如果不填，默认为代理配置里面设置的全局收益提成）', hint: '填入的值格式为：40-15-5，分别表示自己销售的提成比例为40%，下级销售我获得提成比例为15%，下下级销售我获得提成比例为5%；如果只支持两级分销，那么配置格式为：40-15；如果支持3级分销，那么格式为：40-15-5；依次类推。如果不填，默认为代理配置的值'
    f.input :address
    f.input :note, as: :text
  end
  
  actions
  
end

end
