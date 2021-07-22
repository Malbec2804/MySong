class SongService
    attr_reader :name, :duration, :genre, :album_ids, :name, :biography, :song_id, :artist_id

    def initialize(name, duration, genre, album_ids, name_art, biography)
        @name = name
        @duration = duration
        @genre = genre
        @album_ids = album_ids
        @name_art = name_art
        @biography = biography
    end

    def call
        begin
            ActiveRecord::Base.transaction do
                prev_song = Song.find_by name: @name
                    raise StandardError, "La canción ya existe" if prev_song.present?
                album_find = Album.find_by id: @album_ids
                    raise StandardError, 'El Album no existe' unless album_find.present?
                Song.create(name: @name, duration: @duration, genre: @genre)
                Artist.create(name: @name_art,biography: @biography)
            end
        end
    end
end
