class Album < ApplicationRecord
    has_many :songs
    has_one :artist
    validates :name, presence: {message: "Debe tener nombre."}, length: {in: 3..20}
end
