class CreateSongArtistService
    attr_reader :song_id, :artist_id

    def initialize(song_id, artist_id)
        @song_id = song_id
        @artist_id = artist_id
    end

    def call
        begin
            ActiveRecord::Base.transaction do
                
                SongArtist.create!(song_id: @song_id, artist_id: @artist_id)
                
            end
        end
    end

end