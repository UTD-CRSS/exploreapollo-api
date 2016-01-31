require 'test_helper'

class AudioChunksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @audio_chunk = audio_chunks(:one)
  end

  test "should get index" do
    get audio_chunks_url
    assert_response :success
  end

  test "should create audio_chunk" do
    assert_difference('AudioChunk.count') do
      post audio_chunks_url, params: { audio_chunk: {  } }
    end

    assert_response 201
  end

  test "should show audio_chunk" do
    get audio_chunk_url(@audio_chunk)
    assert_response :success
  end

  test "should update audio_chunk" do
    patch audio_chunk_url(@audio_chunk), params: { audio_chunk: {  } }
    assert_response 200
  end

  test "should destroy audio_chunk" do
    assert_difference('AudioChunk.count', -1) do
      delete audio_chunk_url(@audio_chunk)
    end

    assert_response 204
  end
end
