class GameUpdate < ActiveRecord::Base
  validates :game_id, :version, :os, :search_paths, presence: true
  
  mount_uploader :package_file, AppFileUploader
end
