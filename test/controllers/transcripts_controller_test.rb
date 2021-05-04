require 'test_helper'

class TranscriptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transcript = transcripts(:one)
  end

  test "should get index" do
    get transcripts_url
    assert_response :success
  end

  test "should create transcript" do
    assert_difference('Transcript.count') do
      post transcripts_url, params: { transcript: {  } }
    end

    assert_response 201
  end

  test "should show transcript" do
    get transcript_url(@transcript)
    assert_response :success
  end

  test "should update transcript" do
    patch transcript_url(@transcript), params: { transcript: {  } }
    assert_response 200
  end

  test "should destroy transcript" do
    assert_difference('Transcript.count', -1) do
      delete transcript_url(@transcript)
    end

    assert_response 204
  end
end
