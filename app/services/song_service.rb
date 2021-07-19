class SongService
    attr_reader :name, :duration, :genre

    def initialize(name, duration, genre)
        @name = name
        @duration = duration
        @genre = genre
    end

    def call
        begin
            ActiveRecord::Base.transaction do
                prev_song = Song.find_by name: @name
                raise StandardError, "La canción ya existe" if prev_song.present?
                
                Song.create(name: @name, duration: @duration, genre: @genre)
            end
        end
    end
end
