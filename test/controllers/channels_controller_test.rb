require 'test_helper'

class ChannelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @channel = channels(:one)
  end

  test "should get index" do
    get channels_url
    assert_response :success
  end

  test "should create channel" do
    assert_difference('Channel.count') do
      post channels_url, params: { channel: {  } }
    end

    assert_response 201
  end

  test "should show channel" do
    get channel_url(@channel)
    assert_response :success
  end

  test "should update channel" do
    patch channel_url(@channel), params: { channel: {  } }
    assert_response 200
  end

  test "should destroy channel" do
    assert_difference('Channel.count', -1) do
      delete channel_url(@channel)
    end

    assert_response 204
  end
end
