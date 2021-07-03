class Artist < ApplicationRecord
    belongs_to :song
    validates :name, presence: {message: "Debe tener nombre."}, length: {in: 3..30}
    validates :biography, presence: {message: "Debe tener una biografía copada."}, length: {in: 3..100}
end
