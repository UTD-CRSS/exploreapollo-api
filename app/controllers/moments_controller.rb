class MomentsController < ApplicationController
  before_action :set_moment, only: [:show, :update, :destroy, :audio]

  # GET /moments
  def index
    @moments = Moment.all

    render json: @moments
  end

  # GET /moments/1
  def show
    render json: @moment
  end

  # Redirect to moment audio
  def audio
    redirect_to @moment.cached_audio_url
  end

  # POST /moments
  def create
    @moment = Moment.new(moment_params)
    check_links
    if @moment.save
      render json: @moment, status: :created, location: @moment
    else
      render json: @moment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /moments/1
  def update
    check_links
    if @moment.update(moment_params)
      render json: @moment
    else
      render json: @moment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /moments/1
  def destroy
    @moment.destroy
  end

  private
    def check_links
      if params.key?("channels")
        ids = []
        params["channels"].each do |chan|
          ids << Channel.friendly.find(chan).id
        end
        @moment.channel_ids = ids
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_moment
      @moment = Moment.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def moment_params
      params.require(:moment).permit(:title, :description, :met_start, :met_end, channels: [])
    end
end
