class AudioSegmentsController < ApplicationController
  include FriendlyParams
  before_filter :authenticate
  before_action :set_audio_segment, only: [:show, :update, :destroy]

  # GET /audio_segments
  def index
    @audio_segments = AudioSegment.all

    render json: @audio_segments
  end

  # GET /audio_segments/1
  def show
    render json: @audio_segment
  end

  # POST /audio_segments
  def create
    @audio_segment = AudioSegment.new(@friendly_params)

    if @audio_segment.save
      render json: @audio_segment, status: :created, location: @audio_segment
    else
      render json: @audio_segment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /audio_segments/1
  def update
    if @audio_segment.update(@friendly_params)
      render json: @audio_segment
    else
      render json: @audio_segment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /audio_segments/1
  def destroy
    @audio_segment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audio_segment
      @audio_segment = AudioSegment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def audio_segment_params
      params.permit(:title, :url, :met_start, :met_end, :channel_id)
    end
end
