class Song < ApplicationRecord
    has_many :album_songs
    has_many :albums, through: :album_songs

    validates :name, presence: {message: "Debe tener nombre."}, length: {in: 3..20}
    validates :duration, numericality: true
    validates :genre, inclusion: {in: %w(Alternative-Rock Blues Classical Country Electronic Funk Heavy-Metal Hip-Hop Jazz Pop Reggae Soul Rock),
        message: "%{value} no es un genero valido."}, allow_nil: true
end
