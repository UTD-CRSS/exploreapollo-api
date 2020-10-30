require 'test_helper'

class MediaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @media = media(:one)
  end

  test "should get index" do
    get media_index_url
    assert_response :success
  end

  test "should create media" do
    assert_difference('Media.count') do
      post media_index_url, params: { media: {  } }
    end

    assert_response 201
  end

  test "should show media" do
    get media_url(@media)
    assert_response :success
  end

  test "should update media" do
    patch media_url(@media), params: { media: {  } }
    assert_response 200
  end

  test "should destroy media" do
    assert_difference('Media.count', -1) do
      delete media_url(@media)
    end

    assert_response 204
  end
end
