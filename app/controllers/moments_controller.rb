class MomentsController < ApplicationController
  before_action :set_moment, only: [:show, :update, :destroy]

  # GET /moments
  def index
    @moments = Moment.all

    render json: @moments
  end

  # GET /moments/1
  def show
    render json: @moment
  end

  # # POST /moments
  # def create
  #   @moment = Moment.new(moment_params)

  #   if @moment.save
  #     render json: @moment, status: :created, location: @moment
  #   else
  #     render json: @moment.errors, status: :unprocessable_entity
  #   end
  # end

  # # PATCH/PUT /moments/1
  # def update
  #   if @moment.update(moment_params)
  #     render json: @moment
  #   else
  #     render json: @moment.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /moments/1
  # def destroy
  #   @moment.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moment
      @moment = Moment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def moment_params
      params.fetch(:moment, {})
    end
end
