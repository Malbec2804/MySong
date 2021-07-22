class Artist < ApplicationRecord
    has_many :song_artists
    has_many :songs, through: :song_artists
    
    validates :name, presence: {message: "Debe tener nombre."}, length: {in: 3..30}
    validates :biography, presence: {message: "Debe tener una biografía copada."}, length: {in: 3..100}
end
