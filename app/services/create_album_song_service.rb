class CreateAlbumSongService
    attr_reader :album_id, :song_id

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

            end
        end
    end

end