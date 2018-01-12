ActiveAdmin.register Game do
  
  menu parent: 'game', priority: 2, label: '游戏基本信息'
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :icon, :intro, :bundle_id, :code
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

form do |f|
  f.semantic_errors
  f.inputs '基本信息' do
    f.input :name, placeholder:'坚果麻将'
    f.input :icon, hint: '图片格式为：jpg,jpeg,gif,png'
    f.input :bundle_id, placeholder:'com.kekestudio.jgmj', required: true
    f.input :code, placeholder:'jgmj'
    f.input :intro
  end
  actions
end

end
