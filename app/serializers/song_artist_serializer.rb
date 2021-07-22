class SongArtistSerializer < ActiveModel::Serializer
  attributes :id
  has_one :song
  has_one :artist
end
