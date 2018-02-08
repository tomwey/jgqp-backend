class AddFileMd5ToGameUpdates < ActiveRecord::Migration
  def change
    add_column :game_updates, :file_md5, :string
  end
end
