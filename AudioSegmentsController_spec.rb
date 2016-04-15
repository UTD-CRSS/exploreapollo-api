require "spec_helper"
RSpec.describe '.AudioSegmentsControllerTest' do
    before do
        @audio_segment = audio_segments.new(:one)
    end
    it "should get index" do
        get audio_segments_url
        expect(response).to respond_with_content_type(:json)

    end
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
