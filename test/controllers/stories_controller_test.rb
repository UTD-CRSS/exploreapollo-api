require 'test_helper'

class StoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @story = stories(:one)
  end

  test "should get index" do
    get stories_url
    assert_response :success
  end

  test "should create story" do
    assert_difference('Story.count') do
      post stories_url, params: { story: {  } }
    end

    assert_response 201
  end

  test "should show story" do
    get story_url(@story)
    assert_response :success
  end

  test "should update story" do
    patch story_url(@story), params: { story: {  } }
    assert_response 200
  end

  test "should destroy story" do
    assert_difference('Story.count', -1) do
      delete story_url(@story)
    end

    assert_response 204
  end
end
