require 'test_helper'

class TranscriptItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transcript_item = transcript_items(:one)
  end

  test "should get index" do
    get transcript_items_url
    assert_response :success
  end

  test "should create transcript_item" do
    assert_difference('TranscriptItem.count') do
      post transcript_items_url, params: { transcript_item: {  } }
    end

    assert_response 201
  end

  test "should show transcript_item" do
    get transcript_item_url(@transcript_item)
    assert_response :success
  end

  test "should update transcript_item" do
    patch transcript_item_url(@transcript_item), params: { transcript_item: {  } }
    assert_response 200
  end

  test "should destroy transcript_item" do
    assert_difference('TranscriptItem.count', -1) do
      delete transcript_item_url(@transcript_item)
    end

    assert_response 204
  end
end
