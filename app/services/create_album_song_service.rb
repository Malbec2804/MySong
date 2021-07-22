class CreateAlbumSongService
    attr_reader :album_id, :song_id
    attr_accessor :total_duration

    def initialize(album_id, song_id)
        @album_id = album_id
        @song_id = song_id
    end

    def call
        begin
            ActiveRecord::Base.transaction do
                album_find = Album.find_by id: @album_id
                raise StandardError, 'El Album no existe' unless album_find.present?

                AlbumSong.create(album_id: @album_id, song_id: @song_id) 
                
                @suma = Album.find(@album_id).total_duration + Song.find(@song_id).duration
                Album.find(@album_id).update(total_duration: @suma)
            end
        end
    end
end