class MediaController < ApplicationController
  include FriendlyParams
  before_action :set_media, only: [:show, :update, :destroy]

  # GET /media
  def index
    @media = Media.all

    render json: @media
  end

  # GET /media/1
  def show
    render json: @media
  end

  # POST /media
  def create
    @media = Media.new(@friendly_params)

    if @media.save
      render json: @media, status: :created, location: media_url(@media)
    else
      render json: @media.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /media/1
  def update
    if @media.update(@friendly_params)
      render json: @media
    else
      render json: @media.errors, status: :unprocessable_entity
    end
  end

  # DELETE /media/1
  def destroy
    @media.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_media
      @media = Media.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def media_params
      params.permit(:url, :title, :description, :mission_id, :caption, :alt_text, :type)
    end
end
