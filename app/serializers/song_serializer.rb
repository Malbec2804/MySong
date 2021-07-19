class SongSerializer < ActiveModel::Serializer
  attributes :id, :name, :duration, :genre, :streams, :albums
  
end
