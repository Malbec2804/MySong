class SongArtist < ApplicationRecord
  belongs_to :song, required: true
  belongs_to :artist, required: true
end
