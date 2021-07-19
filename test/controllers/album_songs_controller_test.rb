require "test_helper"

class AlbumSongsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @album_song = album_songs(:one)
  end

  test "should get index" do
    get album_songs_url, as: :json
    assert_response :success
  end

  test "should create album_song" do
    assert_difference('AlbumSong.count') do
      post album_songs_url, params: { album_song: { album_id: @album_song.album_id, song_id: @album_song.song_id } }, as: :json
    end

    assert_response 201
  end

  test "should show album_song" do
    get album_song_url(@album_song), as: :json
    assert_response :success
  end

  test "should update album_song" do
    patch album_song_url(@album_song), params: { album_song: { album_id: @album_song.album_id, song_id: @album_song.song_id } }, as: :json
    assert_response 200
  end

  test "should destroy album_song" do
    assert_difference('AlbumSong.count', -1) do
      delete album_song_url(@album_song), as: :json
    end

    assert_response 204
  end
end
