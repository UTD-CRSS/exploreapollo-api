class AudioChunksController < ApplicationController
  include FriendlyParams
  before_action :set_audio_chunk, only: [:show, :update, :destroy]

  # GET /audio_chunks
  def index
    @audio_chunks = AudioChunk.all

    render json: @audio_chunks
  end

  # GET /audio_chunks/1
  def show
    render json: @audio_chunk
  end

  # POST /audio_chunks
  def create
    @audio_chunk = AudioChunk.new(@friendly_params)

    if @audio_chunk.save
      render json: @audio_chunk, status: :created, location: @audio_chunk
    else
      render json: @audio_chunk.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /audio_chunks/1
  def update
    if @audio_chunk.update(@friendly_params)
      render json: @audio_chunk
    else
      render json: @audio_chunk.errors, status: :unprocessable_entity
    end
  end

  # DELETE /audio_chunks/1
  def destroy
    @audio_chunk.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audio_chunk
      @audio_chunk = AudioChunk.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def audio_chunk_params
      params.permit(:title, :url, :met_start, :met_end, :channel_id)
    end
end
