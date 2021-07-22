class SongsController < ApplicationController
  before_action :set_song, only: [:show, :update, :destroy]

  # GET /songs
  def index
    @songs = Song.all

    render json: @songs, each_serializer: SongSerializer #.to_json(only: [:name, :duration, :genre, :streams, :album_id])
  end

  # GET /songs/1
  def show
    render json: @song, serializer: SongSerializer
  end

  # POST /songs
  def create
    @song = SongService.new(song_params[:name], song_params[:duration], song_params[:genre], song_params[:album_ids], song_params[:nameart], song_params[:biography]).call
    if @song.save
      @albumsong = CreateAlbumSongService.new(song_params[:album_ids], @song.id).call
      @songart =  CreateSongArtistService.new(@song.id, Artist.last.id).call
      render json: @song, status: :created, location: @song
      else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /songs/1
  def update
    if @song.update(song_params)
      render json: @song
    else
      render json: @song.errors, status: :unprocessable_entity
    end
  end

  # DELETE /songs/1
  def destroy
    @song = DeleteSongService.new(@song.id, song_params[:album_ids]).call
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def song_params
      params.require(:song).permit(:name, :duration, :genre, :album_ids, :nameart, :biography)
    end
end
