require 'test_helper'

class MomentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @moment = moments(:one)
  end

  test "should get index" do
    get moments_url
    assert_response :success
  end

  test "should create moment" do
    assert_difference('Moment.count') do
      post moments_url, params: { moment: {  } }
    end

    assert_response 201
  end

  test "should show moment" do
    get moment_url(@moment)
    assert_response :success
  end

  test "should update moment" do
    patch moment_url(@moment), params: { moment: {  } }
    assert_response 200
  end

  test "should destroy moment" do
    assert_difference('Moment.count', -1) do
      delete moment_url(@moment)
    end

    assert_response 204
  end
end
