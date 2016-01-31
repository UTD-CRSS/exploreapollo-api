class ChannelsController < ApplicationController
  include FriendlyParams
  before_action :set_channel, only: [:show, :update, :destroy]

  # GET /channels
  def index
    @channels = Channel.all

    render json: @channels, each_serializer: ChannelShortSerializer
  end

  # GET /channels/1
  def show
    render json: @channel
  end

  # POST /channels
  def create
    @channel = Channel.new(@friendly_params)

    if @channel.save
      render json: @channel, status: :created, location: @channel
    else
      render json: @channel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /channels/1
  def update
    if @channel.update(@friendly_params)
      render json: @channel
    else
      render json: @channel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /channels/1
  def destroy
    @channel.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def channel_params
      params.permit(:title, :description, :mission_id, transcript_part_ids: [], channel_chunk_ids:[])
    end
    alias_method :allowed_params, :channel_params
end
