require "test_helper"

class ArtistBalancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @artist_balance = artist_balances(:one)
  end

  test "should get index" do
    get artist_balances_url, as: :json
    assert_response :success
  end

  test "should create artist_balance" do
    assert_difference('ArtistBalance.count') do
      post artist_balances_url, params: { artist_balance: { artist_id: @artist_balance.artist_id, balance: @artist_balance.balance } }, as: :json
    end

    assert_response 201
  end

  test "should show artist_balance" do
    get artist_balance_url(@artist_balance), as: :json
    assert_response :success
  end

  test "should update artist_balance" do
    patch artist_balance_url(@artist_balance), params: { artist_balance: { artist_id: @artist_balance.artist_id, balance: @artist_balance.balance } }, as: :json
    assert_response 200
  end

  test "should destroy artist_balance" do
    assert_difference('ArtistBalance.count', -1) do
      delete artist_balance_url(@artist_balance), as: :json
    end

    assert_response 204
  end
end
