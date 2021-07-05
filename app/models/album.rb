class Album < ApplicationRecord
    has_many :songs
    has_one :artist
    validates :name, presence: {message: "Debe tener nombre."}, length: {in: 3..20}
    validates :year, numericality: {message: "%{value} no es un año."}
    validates :total_duration, numericality: true, length: {in: 1..2}
end
