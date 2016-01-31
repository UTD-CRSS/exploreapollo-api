class StoriesController < ApplicationController
  include FriendlyParams
  before_action :set_story, only: [:show, :update, :destroy]

  # GET /stories
  def index
    @stories = Story.all

    render json: @stories
  end

  # GET /stories/1
  def show
    render json: @story, serializer: StoryItemSerializer
  end

  # POST /stories
  def create
    @story = Story.new(@friendly_params)
    if @story.save
      render json: @story, status: :created, location: @story
    else
      render json: @story.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stories/1
  def update
    if @story.update(@friendly_params)
      render json: @story
    else
      render json: @story.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stories/1
  def destroy
    @story.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def story_params
      params.permit(:title, :description, moment_ids: [])
    end

    alias_method :allowed_params, :story_params
end
