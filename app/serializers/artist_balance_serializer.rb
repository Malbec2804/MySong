class ArtistBalanceSerializer < ActiveModel::Serializer
  attributes :id, :balance
  has_one :artist
end
