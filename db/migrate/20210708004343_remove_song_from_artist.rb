class RemoveSongFromArtist < ActiveRecord::Migration[6.1]
  def change
    remove_reference :artists, :song, null: false, foreign_key: true
  end
end
