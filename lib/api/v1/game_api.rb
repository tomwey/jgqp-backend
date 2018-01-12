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
          game = Game.find_by(code: params[:code])
          if game.blank?
            return render_error(4004, '不存在的游戏')
          end
          
          @update = GameUpdate.where(game_id: game.id, opened: true)
            .where('version >= ? and lower(os) = ?', params[:bv], params[:os].downcase)
            .order('version desc').first
          
          if @update.blank?
            return render_error(4004, '没有更新')
          end
          
          {
            packageUrl: @update.package_file.url,
            remoteManifestUrl: "http://47.104.163.199:8080/api/v1/game/update?code=#{params[:code]}&bv=#{params[:bv]}&os=#{params[:os]}",
            version: params[:bv],
            engineVersion: GameConfig.game_engine_version,
            assets: {},
            searchPaths: @update.search_paths.gsub(/\s+/, ',').split(',')
          }
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