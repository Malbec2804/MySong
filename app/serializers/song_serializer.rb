class SongSerializer < ActiveModel::Serializer
  attributes :id, :name, :duration, :genre, :streams
  has_many :artists
end
