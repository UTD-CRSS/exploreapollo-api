require 'test_helper'

class MediaAttachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @media_attachment = media_attachments(:one)
  end

  test "should get index" do
    get media_attachments_url
    assert_response :success
  end

  test "should create media_attachment" do
    assert_difference('MediaAttachment.count') do
      post media_attachments_url, params: { media_attachment: {  } }
    end

    assert_response 201
  end

  test "should show media_attachment" do
    get media_attachment_url(@media_attachment)
    assert_response :success
  end

  test "should update media_attachment" do
    patch media_attachment_url(@media_attachment), params: { media_attachment: {  } }
    assert_response 200
  end

  test "should destroy media_attachment" do
    assert_difference('MediaAttachment.count', -1) do
      delete media_attachment_url(@media_attachment)
    end

    assert_response 204
  end
end
