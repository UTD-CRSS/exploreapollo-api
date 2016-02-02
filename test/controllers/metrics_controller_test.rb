require 'test_helper'

class MetricsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @metric = metrics(:one)
  end

  test "should get index" do
    get metrics_url
    assert_response :success
  end

  test "should create metric" do
    assert_difference('Metric.count') do
      post metrics_url, params: { metric: { data: @metric.data, met_end: @metric.met_end, met_start: @metric.met_start, type: @metric.type } }
    end

    assert_response 201
  end

  test "should show metric" do
    get metric_url(@metric)
    assert_response :success
  end

  test "should update metric" do
    patch metric_url(@metric), params: { metric: { data: @metric.data, met_end: @metric.met_end, met_start: @metric.met_start, type: @metric.type } }
    assert_response 200
  end

  test "should destroy metric" do
    assert_difference('Metric.count', -1) do
      delete metric_url(@metric)
    end

    assert_response 204
  end
end
