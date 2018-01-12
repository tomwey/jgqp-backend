# require 'rest-client'
module API
  module V1
    class GameAPI < Grape::API
      
      resource :game, desc: '游戏相关接口' do
        desc '获取游戏更新配置'
        params do
          requires :code, type: String, desc: '某个游戏代号, 例如：jgmj'
          requires :bv,   type: String, desc: '当前版本'
          requires :os,   type: String, desc: '平台，ios或android' 
        end
        get :update do
          
        end # end update
        
        desc '获取游戏服务器信息'
        params do
          requires :code, type: String, desc: '某个游戏代号'
          requires :bv,   type: String, desc: '当前版本'
          requires :os,   type: String, desc: '平台，ios或android' 
        end
        get :server do
          { cname: GameConfig.server_cname, ip: GameConfig.server_ip, ports: GameConfig.server_ports }
        end # end server
        
      end # end resource
      
    end # end class
  end
end