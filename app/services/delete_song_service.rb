class DeleteSongService
    attr_accessor :album_id, :song_id, :total_duration

    def initialize(song_id, album_id)
        @song_id = song_id
        @album_id = album_id
    end

    def call
        @resta = Album.find(@album_id).total_duration - Song.find(@song_id).duration
                Album.find(@album_id).update(total_duration: @resta)
        AlbumSong.delete(@song_id)
        Song.find(@song_id).destroy
    end
end
