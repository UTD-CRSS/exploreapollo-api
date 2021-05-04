require 'test_helper'

class AudioSegmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @audio_segment = audio_segments(:one)
  end

  test "should get index" do
    get audio_segments_url
    assert_response :success
  end

  test "should create audio_segment" do
    assert_difference('AudioSegment.count') do
      post audio_segments_url, params: { audio_segment: {  } }
    end

    assert_response 201
  end

  test "should show audio_segment" do
    get audio_segment_url(@audio_segment)
    assert_response :success
  end

  test "should update audio_segment" do
    patch audio_segment_url(@audio_segment), params: { audio_segment: {  } }
    assert_response 200
  end

  test "should destroy audio_segment" do
    assert_difference('AudioSegment.count', -1) do
      delete audio_segment_url(@audio_segment)
    end

    assert_response 204
  end
end
