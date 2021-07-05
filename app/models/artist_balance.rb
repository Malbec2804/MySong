class ArtistBalance < ApplicationRecord
  belongs_to :artist
  validates :artist_id, numericality: {message: "%{value} Debe ser el ID de un Artista."}
  validates :balance, numericality: {message: "%{value} Debe ser un decimal."}
end
