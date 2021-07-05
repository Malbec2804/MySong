class AlbumsSerializer < ActiveModel::Serializer
  attributes :id, :name, :year, :album_art, :total_duration, :cached_songs
  has_many :songs
  has_many :artist
end
