class Song < ApplicationRecord
    belongs_to :album
    validates :name, presence: {message: "Debe tener nombre."}, length: {in: 3..20}
    validates :duration, numericality: true
    validates :genre, inclusion: {in: %w(Alternative-Rock Blues Classical Country Electronic Funk Heavy-Metal Hip-Hop Jazz Pop Reggae Soul Rock),
        message: "%{value} no es un genero valido."}, allow_nil: true
end
