class AddSongToArtist < ActiveRecord::Migration[6.1]
  def change
    add_reference :artists, :song #, null: false, foreign_key: true
  end
end
