class AlbumSongSerializer < ActiveModel::Serializer
  attributes :id
  has_one :album
  has_one :song
end
