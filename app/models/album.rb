class Album < ApplicationRecord
    has_many :album_songs
    has_many :songs, through: :album_songs
    
    #validates :name, presence: {message: "Debe tener nombre."}, length: {in: 3..20}
end
