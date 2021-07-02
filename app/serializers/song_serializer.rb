class SongSerializer < ActiveModel::Serializer
  attributes :id, :name, :duration, :genre, :streams
  belongs_to :albums
end
