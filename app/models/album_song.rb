class AlbumSong < ApplicationRecord
  belongs_to :album, required: true
  belongs_to :song, required: true

end
