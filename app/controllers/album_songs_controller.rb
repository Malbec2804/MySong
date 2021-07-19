class AlbumSongsController < ApplicationController
  before_action :set_album_song, only: [:show, :update, :destroy]

  # GET /album_songs
  def index
    @album_songs = AlbumSong.all

    render json: @album_songs
  end

  # GET /album_songs/1
  def show
    render json: @album_song
  end

  # POST /album_songs
  def create
    @album_song = AlbumSong.new(album_song_params)

    if @album_song.save
      render json: @album_song, status: :created, location: @album_song
    else
      render json: @album_song.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /album_songs/1
  def update
    if @album_song.update(album_song_params)
      render json: @album_song
    else
      render json: @album_song.errors, status: :unprocessable_entity
    end
  end

  # DELETE /album_songs/1
  def destroy
    @album_song.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album_song
      @album_song = AlbumSong.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def album_song_params
      params.require(:album_song).permit(:album_id, :song_id)
    end
end
