class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :name, :biography
  belongs_to :song
end
