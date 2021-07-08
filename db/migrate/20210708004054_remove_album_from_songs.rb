class RemoveAlbumFromSongs < ActiveRecord::Migration[6.1]
  def change
    remove_reference :songs, :album, null: false, foreign_key: true
  end
end
