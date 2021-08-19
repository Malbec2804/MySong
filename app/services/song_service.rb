class SongService
    attr_reader :name, :duration, :genre, :album_ids, :name, :biography, :song_id, :artist_id

    def initialize(name, duration, genre, album_ids, artists)
        @name = name
        @duration = duration
        @genre = genre
        @album_ids = album_ids
        @artists = artists
    end

    def call
        begin
            ActiveRecord::Base.transaction do
                
                @song = Song.create!(name: @name, duration: @duration, genre: @genre)
                @nameart = @artists[0]['nameart']
                @biography = @artists[0]['biography']
                @artist = Artist.create!(name: @nameart, biography: @biography)

                @albumsong = CreateAlbumSongService.new(album_ids, @song.id).call
                @songart =  CreateSongArtistService.new(@song.id, Artist.last.id).call
                Album.find(Album.last.id).update_column(:cached_songs, {Song.last.id => {name: Song.last.name, duration: Song.last.duration, genre: Song.last.genre, artist: Artist.last.name}})
                
                @song
            end
        end
    end
end
