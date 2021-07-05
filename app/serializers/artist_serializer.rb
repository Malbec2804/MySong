class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :biography
  belongs_to :song
  belongs_to :album
end
