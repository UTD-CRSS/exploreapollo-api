class TranscriptItemsController < ApplicationController
  include FriendlyParams
  before_action :set_transcript_item, only: [:show, :update, :destroy]

  # GET /transcript_items
  def index
    @transcript_items = TranscriptItem.all

    render json: @transcript_items, each_serializer: TranscriptSerializer
  end

  # GET /transcript_items/1
  def show
    render json: @transcript_item
  end

  # POST /transcript_items
  def create
    @transcript_item = TranscriptItem.new(@friendly_params)

    if @transcript_item.save
      render json: @transcript_item, status: :created, location: @transcript_item
    else
      render json: @transcript_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transcript_items/1
  def update
    if @transcript_item.update(@friendly_params)
      render json: @transcript_item
    else
      render json: @transcript_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transcript_items/1
  def destroy
    @transcript_item.destroy
  end

  def search
    render json: TranscriptItem.ransack(text_cont: params[:q]).result
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transcript_item
      @transcript_item = TranscriptItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transcript_item_params
      params.permit(:id, :text, :met_start, :met_end, :person_id, :channel_id)
    end
end
