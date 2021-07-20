class SongService
    attr_reader :name, :duration, :genre, :album_ids

    def initialize(name, duration, genre, album_ids)
        @name = name
        @duration = duration
        @genre = genre
        @album_ids = album_ids
    end

    def call
        begin
            ActiveRecord::Base.transaction do
                prev_song = Song.find_by name: @name
                    raise StandardError, "La canción ya existe" if prev_song.present?
                album_find = Album.find_by id: @album_ids
                    raise StandardError, 'El Album no existe' unless album_find.present?
                Song.create(name: @name, duration: @duration, genre: @genre)
            end
        end
    end
end
